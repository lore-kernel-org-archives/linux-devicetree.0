From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [RFC 3/3] soc: qcom: rfsa driver
Date: Sat, 22 Apr 2017 10:35:19 -0700
Message-ID: <20170422173519.5782-3-bjorn.andersson@linaro.org>
References: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170422173519.5782-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The rfsa driver is used for allocating and exposing regions of shared
memory with remote processors for the purpose of exchanging sector-data
between the remote filesystem service and its clients.

It provides accessors for the properties needed by the user space remote
filesystem implementation through sysfs and a character device that can be used
to read and write the requested chunks of data.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/Kconfig  |   8 ++
 drivers/soc/qcom/Makefile |   1 +
 drivers/soc/qcom/rfsa.c   | 261 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/soc/qcom/rfsa.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9fca977ef18d..788a63cd430e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -24,6 +24,14 @@ config QCOM_PM
 	  modes. It interface with various system drivers to put the cores in
 	  low power modes.
 
+config QCOM_RFSA
+	tristate "Qualcomm Remote Filesystem Access driver"
+	help
+	  The Qualcomm remote filesystem access driver is used for allocating
+	  and exposing regions of shared memory with remote processors for the
+	  purpose of exchanging sector-data between the remote filesystem
+	  service and its clients.
+
 config QCOM_SMEM
 	tristate "Qualcomm Shared Memory Manager (SMEM)"
 	depends on ARCH_QCOM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 414f0de274fa..d1bbc791ddc0 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_PM)	+=	spm.o
+obj-$(CONFIG_QCOM_RFSA)	+=	rfsa.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
 obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
diff --git a/drivers/soc/qcom/rfsa.c b/drivers/soc/qcom/rfsa.c
new file mode 100644
index 000000000000..1b79976dad9d
--- /dev/null
+++ b/drivers/soc/qcom/rfsa.c
@@ -0,0 +1,261 @@
+/*
+ * Copyright (c) 2017 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/cdev.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/of_fdt.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/io.h>
+
+#define QCOM_RFSA_DEV_MAX	(MINORMASK + 1)
+
+static dev_t qcom_rfsa_major;
+
+struct qcom_rfsa {
+	struct device dev;
+	struct cdev cdev;
+
+	void *base;
+	phys_addr_t addr;
+	phys_addr_t size;
+
+	unsigned int client_id;
+};
+
+static ssize_t qcom_rfsa_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf);
+
+static DEVICE_ATTR(phys_addr, 0400, qcom_rfsa_show, NULL);
+static DEVICE_ATTR(size, 0400, qcom_rfsa_show, NULL);
+static DEVICE_ATTR(client_id, 0400, qcom_rfsa_show, NULL);
+
+static ssize_t qcom_rfsa_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct qcom_rfsa *rfsa = container_of(dev, struct qcom_rfsa, dev);
+
+	if (attr == &dev_attr_phys_addr)
+		return sprintf(buf, "%pa\n", &rfsa->addr);
+	if (attr == &dev_attr_size)
+		return sprintf(buf, "%pa\n", &rfsa->size);
+	if (attr == &dev_attr_client_id)
+		return sprintf(buf, "%d\n", rfsa->client_id);
+
+	return -EINVAL;
+}
+
+static struct attribute *qcom_rfsa_attrs[] = {
+	&dev_attr_phys_addr.attr,
+	&dev_attr_size.attr,
+	&dev_attr_client_id.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(qcom_rfsa);
+
+static int qcom_rfsa_open(struct inode *inode, struct file *filp)
+{
+	struct qcom_rfsa *rfsa = container_of(inode->i_cdev, struct qcom_rfsa, cdev);
+
+	get_device(&rfsa->dev);
+	filp->private_data = rfsa;
+
+	return 0;
+}
+static ssize_t qcom_rfsa_read(struct file *filp,
+			      char __user *buf, size_t count, loff_t *f_pos)
+{
+	struct qcom_rfsa *rfsa = filp->private_data;
+
+	if (*f_pos >= rfsa->size)
+		return 0;
+
+	if (*f_pos + count >= rfsa->size)
+		count = rfsa->size - *f_pos;
+
+	if (copy_to_user(buf, rfsa->base + *f_pos, count))
+		return -EFAULT;
+
+	*f_pos += count;
+	return count;
+}
+
+static ssize_t qcom_rfsa_write(struct file *filp,
+			       const char __user *buf, size_t count,
+			       loff_t *f_pos)
+{
+	struct qcom_rfsa *rfsa = filp->private_data;
+
+	if (*f_pos >= rfsa->size)
+		return 0;
+
+	if (*f_pos + count >= rfsa->size)
+		count = rfsa->size - *f_pos;
+
+	if (copy_from_user(rfsa->base + *f_pos, buf, count))
+		return -EFAULT;
+
+	*f_pos += count;
+	return count;
+}
+
+static int qcom_rfsa_release(struct inode *inode, struct file *filp)
+{
+	struct qcom_rfsa *rfsa = filp->private_data;
+
+	put_device(&rfsa->dev);
+
+	return 0;
+}
+
+static const struct file_operations qcom_rfsa_fops = {
+	.owner = THIS_MODULE,
+	.open = qcom_rfsa_open,
+	.read = qcom_rfsa_read,
+	.write = qcom_rfsa_write,
+	.release = qcom_rfsa_release,
+	.llseek = default_llseek,
+};
+
+static void qcom_rfsa_release_device(struct device *dev)
+{
+	struct qcom_rfsa *rfsa = container_of(dev, struct qcom_rfsa, dev);
+
+	kfree(rfsa);
+}
+
+static int qcom_rfsa_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct reserved_mem *rmem;
+	struct qcom_rfsa *rfsa;
+	u32 client_id;
+	int ret;
+
+	rmem = of_get_reserved_mem_by_idx(node, 0);
+	if (!rmem) {
+		dev_err(&pdev->dev, "failed to acquire memory region\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(node, "qcom,client-id", &client_id);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to parse \"qcom,client-id\"\n");
+		return ret;
+
+	}
+
+	rfsa = kzalloc(sizeof(*rfsa), GFP_KERNEL);
+	if (!rfsa)
+		return -ENOMEM;
+
+	rfsa->addr = rmem->base;
+	rfsa->client_id = client_id;
+	rfsa->size = rmem->size;
+
+	device_initialize(&rfsa->dev);
+	rfsa->dev.parent = &pdev->dev;
+	rfsa->dev.groups = qcom_rfsa_groups;
+
+	cdev_init(&rfsa->cdev, &qcom_rfsa_fops);
+	rfsa->cdev.owner = THIS_MODULE;
+
+	dev_set_name(&rfsa->dev, "qcom_rfsa%d", client_id);
+	rfsa->dev.id = client_id;
+	rfsa->dev.devt = MKDEV(MAJOR(qcom_rfsa_major), client_id);
+
+	ret = cdev_device_add(&rfsa->cdev, &rfsa->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add cdev: %d\n", ret);
+		put_device(&rfsa->dev);
+		return ret;
+	}
+
+	rfsa->dev.release = qcom_rfsa_release_device;
+
+	rfsa->base = devm_memremap(&rfsa->dev, rfsa->addr, rfsa->size, MEMREMAP_WC);
+	if (IS_ERR(rfsa->base)) {
+		dev_err(&pdev->dev, "failed to remap rfsa region\n");
+
+		device_del(&rfsa->dev);
+		put_device(&rfsa->dev);
+
+		return PTR_ERR(rfsa->base);
+	}
+
+	dev_set_drvdata(&pdev->dev, rfsa);
+
+	return 0;
+}
+
+static int qcom_rfsa_remove(struct platform_device *pdev)
+{
+	struct qcom_rfsa *rfsa = dev_get_drvdata(&pdev->dev);
+
+	cdev_del(&rfsa->cdev);
+	device_del(&rfsa->dev);
+	put_device(&rfsa->dev);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_rfsa_of_match[] = {
+	{ .compatible = "qcom,rfsa" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_rfsa_of_match);
+
+static struct platform_driver qcom_rfsa_driver = {
+	.probe = qcom_rfsa_probe,
+	.remove = qcom_rfsa_remove,
+	.driver  = {
+		.name  = "qcom_rfsa",
+		.of_match_table = qcom_rfsa_of_match,
+	},
+};
+
+static int qcom_rfsa_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&qcom_rfsa_major, 0, QCOM_RFSA_DEV_MAX,
+				  "qcom_rfsa");
+	if (ret < 0) {
+		pr_err("qcom_rfsa: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = platform_driver_register(&qcom_rfsa_driver);
+	if (ret < 0) {
+		pr_err("qcom_rfsa: failed to register rfsa driver\n");
+		unregister_chrdev_region(qcom_rfsa_major, QCOM_RFSA_DEV_MAX);
+	}
+
+	return ret;
+}
+module_init(qcom_rfsa_init);
+
+static void qcom_rfsa_exit(void)
+{
+	platform_driver_unregister(&qcom_rfsa_driver);
+	unregister_chrdev_region(qcom_rfsa_major, QCOM_RFSA_DEV_MAX);
+}
+module_exit(qcom_rfsa_exit);
-- 
2.12.0
