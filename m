From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Sat, 27 Apr 2019 23:04:56 +0100
Message-ID: <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Implements an platform driver that matches with xlnx,
sd-fec-1.1 device tree node and registers as a character
device, including:
- SD-FEC driver binds to sdfec DT node.
- creates and initialise an initial driver dev structure.
- add the driver in Linux build and Kconfig.

Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
---
 drivers/misc/Kconfig             |  12 +++
 drivers/misc/Makefile            |   1 +
 drivers/misc/xilinx_sdfec.c      | 215 +++++++++++++++++++++++++++++++++++++++
 include/uapi/misc/xilinx_sdfec.h |  42 ++++++++
 4 files changed, 270 insertions(+)
 create mode 100644 drivers/misc/xilinx_sdfec.c
 create mode 100644 include/uapi/misc/xilinx_sdfec.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 3209ee0..1a1fe9c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -528,6 +528,18 @@ config PCI_ENDPOINT_TEST
            Enable this configuration option to enable the host side test driver
            for PCI Endpoint.
 
+config XILINX_SDFEC
+	tristate "Xilinx SDFEC 16"
+	help
+	  This option enables support for the Xilinx SDFEC (Soft Decision
+	  Forward Error Correction) driver. This enables a char driver
+	  for the SDFEC.
+
+	  You may select this driver if your design instantiates the
+	  SDFEC(16nm) hardened block. To compile this as a module choose M.
+
+	  If unsure, say N.
+
 config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c362395..ee31140c 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
 obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
 obj-$(CONFIG_SRAM)		+= sram.o
 obj-$(CONFIG_SRAM_EXEC)		+= sram-exec.o
+obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-y				+= mic/
 obj-$(CONFIG_GENWQE)		+= genwqe/
 obj-$(CONFIG_ECHO)		+= echo/
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
new file mode 100644
index 0000000..278754b
--- /dev/null
+++ b/drivers/misc/xilinx_sdfec.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx SDFEC
+ *
+ * Copyright (C) 2016 - 2017 Xilinx, Inc.
+ *
+ * Description:
+ * This driver is developed for SDFEC16 (Soft Decision FEC 16nm)
+ * IP. It exposes a char device interface in sysfs and supports file
+ * operations like  open(), close() and ioctl().
+ */
+
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/spinlock.h>
+#include <linux/clk.h>
+
+#include <uapi/misc/xilinx_sdfec.h>
+
+#define DRIVER_NAME "xilinx_sdfec"
+#define DRIVER_VERSION "0.3"
+#define DRIVER_MAX_DEV BIT(MINORBITS)
+
+static struct class *xsdfec_class;
+static atomic_t xsdfec_ndevs = ATOMIC_INIT(0);
+static dev_t xsdfec_devt;
+
+/**
+ * struct xsdfec_dev - Driver data for SDFEC
+ * @regs: device physical base address
+ * @dev: pointer to device struct
+ * @config: Configuration of the SDFEC device
+ * @open_count: Count of char device being opened
+ * @xsdfec_cdev: Character device handle
+ * @irq_lock: Driver spinlock
+ *
+ * This structure contains necessary state for SDFEC driver to operate
+ */
+struct xsdfec_dev {
+	void __iomem *regs;
+	struct device *dev;
+	struct xsdfec_config config;
+	atomic_t open_count;
+	struct cdev xsdfec_cdev;
+	/* Spinlock to protect state_updated and stats_updated */
+	spinlock_t irq_lock;
+};
+
+static const struct file_operations xsdfec_fops = {
+	.owner = THIS_MODULE,
+};
+
+static int xsdfec_probe(struct platform_device *pdev)
+{
+	struct xsdfec_dev *xsdfec;
+	struct device *dev;
+	struct device *dev_create;
+	struct resource *res;
+	int err;
+
+	xsdfec = devm_kzalloc(&pdev->dev, sizeof(*xsdfec), GFP_KERNEL);
+	if (!xsdfec)
+		return -ENOMEM;
+
+	xsdfec->dev = &pdev->dev;
+	xsdfec->config.fec_id = atomic_read(&xsdfec_ndevs);
+	spin_lock_init(&xsdfec->irq_lock);
+
+	dev = xsdfec->dev;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	xsdfec->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(xsdfec->regs)) {
+		dev_err(dev, "Unable to map resource");
+		err = PTR_ERR(xsdfec->regs);
+		goto err_xsdfec_dev;
+	}
+
+	/* Save driver private data */
+	platform_set_drvdata(pdev, xsdfec);
+
+	cdev_init(&xsdfec->xsdfec_cdev, &xsdfec_fops);
+	xsdfec->xsdfec_cdev.owner = THIS_MODULE;
+	err = cdev_add(&xsdfec->xsdfec_cdev,
+		       MKDEV(MAJOR(xsdfec_devt), xsdfec->config.fec_id), 1);
+	if (err < 0) {
+		dev_err(dev, "cdev_add failed");
+		err = -EIO;
+		goto err_xsdfec_dev;
+	}
+
+	if (!xsdfec_class) {
+		err = -EIO;
+		dev_err(dev, "xsdfec class not created correctly");
+		goto err_xsdfec_cdev;
+	}
+
+	dev_create =
+		device_create(xsdfec_class, dev,
+			      MKDEV(MAJOR(xsdfec_devt), xsdfec->config.fec_id),
+			      xsdfec, "xsdfec%d", xsdfec->config.fec_id);
+	if (IS_ERR(dev_create)) {
+		dev_err(dev, "unable to create device");
+		err = PTR_ERR(dev_create);
+		goto err_xsdfec_cdev;
+	}
+
+	atomic_set(&xsdfec->open_count, 1);
+	dev_info(dev, "XSDFEC%d Probe Successful", xsdfec->config.fec_id);
+	atomic_inc(&xsdfec_ndevs);
+	return 0;
+
+	/* Failure cleanup */
+err_xsdfec_cdev:
+	cdev_del(&xsdfec->xsdfec_cdev);
+err_xsdfec_dev:
+	return err;
+}
+
+static int xsdfec_remove(struct platform_device *pdev)
+{
+	struct xsdfec_dev *xsdfec;
+	struct device *dev = &pdev->dev;
+
+	xsdfec = platform_get_drvdata(pdev);
+	if (!xsdfec)
+		return -ENODEV;
+
+	if (!xsdfec_class) {
+		dev_err(dev, "xsdfec_class is NULL");
+		return -EIO;
+	}
+
+	device_destroy(xsdfec_class,
+		       MKDEV(MAJOR(xsdfec_devt), xsdfec->config.fec_id));
+	cdev_del(&xsdfec->xsdfec_cdev);
+	atomic_dec(&xsdfec_ndevs);
+	return 0;
+}
+
+static const struct of_device_id xsdfec_of_match[] = {
+	{
+		.compatible = "xlnx,sd-fec-1.1",
+	},
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, xsdfec_of_match);
+
+static struct platform_driver xsdfec_driver = {
+	.driver = {
+		.name = "xilinx-sdfec",
+		.of_match_table = xsdfec_of_match,
+	},
+	.probe = xsdfec_probe,
+	.remove =  xsdfec_remove,
+};
+
+static int __init xsdfec_init_mod(void)
+{
+	int err;
+
+	xsdfec_class = class_create(THIS_MODULE, DRIVER_NAME);
+	if (IS_ERR(xsdfec_class)) {
+		err = PTR_ERR(xsdfec_class);
+		pr_err("%s : Unable to register xsdfec class", __func__);
+		return err;
+	}
+
+	err = alloc_chrdev_region(&xsdfec_devt, 0, DRIVER_MAX_DEV, DRIVER_NAME);
+	if (err < 0) {
+		pr_err("%s : Unable to get major number", __func__);
+		goto err_xsdfec_class;
+	}
+
+	err = platform_driver_register(&xsdfec_driver);
+	if (err < 0) {
+		pr_err("%s Unabled to register %s driver", __func__,
+		       DRIVER_NAME);
+		goto err_xsdfec_drv;
+	}
+	return 0;
+
+	/* Error Path */
+err_xsdfec_drv:
+	unregister_chrdev_region(xsdfec_devt, DRIVER_MAX_DEV);
+err_xsdfec_class:
+	class_destroy(xsdfec_class);
+	return err;
+}
+
+static void __exit xsdfec_cleanup_mod(void)
+{
+	platform_driver_unregister(&xsdfec_driver);
+	unregister_chrdev_region(xsdfec_devt, DRIVER_MAX_DEV);
+	class_destroy(xsdfec_class);
+	xsdfec_class = NULL;
+}
+
+module_init(xsdfec_init_mod);
+module_exit(xsdfec_cleanup_mod);
+
+MODULE_AUTHOR("Xilinx, Inc");
+MODULE_DESCRIPTION("Xilinx SD-FEC16 Driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(DRIVER_VERSION);
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
new file mode 100644
index 0000000..ba577fa
--- /dev/null
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Xilinx SD-FEC
+ *
+ * Copyright (C) 2016 - 2017 Xilinx, Inc.
+ *
+ * Description:
+ * This driver is developed for SDFEC16 IP. It provides a char device
+ * in sysfs and supports file operations like open(), close() and ioctl().
+ */
+#ifndef __XILINX_SDFEC_H__
+#define __XILINX_SDFEC_H__
+
+/**
+ * enum xsdfec_state - State.
+ * @XSDFEC_INIT: Driver is initialized.
+ * @XSDFEC_STARTED: Driver is started.
+ * @XSDFEC_STOPPED: Driver is stopped.
+ * @XSDFEC_NEEDS_RESET: Driver needs to be reset.
+ * @XSDFEC_PL_RECONFIGURE: Programmable Logic needs to be recofigured.
+ *
+ * This enum is used to indicate the state of the driver.
+ */
+enum xsdfec_state {
+	XSDFEC_INIT = 0,
+	XSDFEC_STARTED,
+	XSDFEC_STOPPED,
+	XSDFEC_NEEDS_RESET,
+	XSDFEC_PL_RECONFIGURE,
+};
+
+/**
+ * struct xsdfec_config - Configuration of SD-FEC core.
+ * @fec_id: ID of SD-FEC instance. ID is limited to the number of active
+ *          SD-FEC's in the FPGA and is related to the driver instance
+ *          Minor number.
+ */
+struct xsdfec_config {
+	__s32 fec_id;
+};
+
+#endif /* __XILINX_SDFEC_H__ */
-- 
2.7.4
