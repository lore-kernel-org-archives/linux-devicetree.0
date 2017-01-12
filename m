From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 11:29:09 +1100
Message-ID: <20170112002910.3650-4-cyrilbur@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112002910.3650-1-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver exposes a reserved chunk of BMC ram to userspace as well as
an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
This allows for a communication channel between the BMC and the host

Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/misc/Kconfig                 |   9 ++
 drivers/misc/Makefile                |   1 +
 drivers/misc/aspeed-lpc-ctrl.c       | 269 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h |  25 ++++
 4 files changed, 304 insertions(+)
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 64971baf11fa..8696627ce9d2 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -766,6 +766,15 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+config ASPEED_LPC_CTRL
+	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	bool "Build a driver to control the BMC to HOST LPC bus"
+	default "y"
+	---help---
+	  Provides a driver to control BMC to HOST LPC mappings through
+	  ioctl()s, the driver aso provides a read/write interface to a BMC ram
+	  region where host LPC can be buffered.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 31983366090a..de1925a9c80b 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 
 lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
 lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o
diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
new file mode 100644
index 000000000000..36ab718681a5
--- /dev/null
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -0,0 +1,269 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+
+#include <linux/aspeed-lpc-ctrl.h>
+
+#define DEVICE_NAME	"aspeed-lpc-ctrl"
+
+#define HICR7 0x8
+#define HICR8 0xc
+
+struct lpc_ctrl {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	phys_addr_t		base;
+	resource_size_t		size;
+	uint32_t		pnor_size;
+	uint32_t		pnor_base;
+};
+
+static atomic_t lpc_ctrl_open_count = ATOMIC_INIT(0);
+
+static struct lpc_ctrl *file_lpc_ctrl(struct file *file)
+{
+	return container_of(file->private_data, struct lpc_ctrl, miscdev);
+}
+
+static int lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+
+	if (vma->vm_pgoff + vsize > lpc_ctrl->base + lpc_ctrl->size)
+		return -EINVAL;
+
+	/* Other checks? */
+
+	if (remap_pfn_range(vma, vma->vm_start,
+		(lpc_ctrl->base >> PAGE_SHIFT) + vma->vm_pgoff,
+		vsize, vma->vm_page_prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int lpc_ctrl_open(struct inode *inode, struct file *file)
+{
+	if (atomic_inc_return(&lpc_ctrl_open_count) == 1)
+		return 0;
+
+	atomic_dec(&lpc_ctrl_open_count);
+	return -EBUSY;
+}
+
+static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	return -EPERM;
+}
+
+static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	return -EPERM;
+}
+
+static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
+		unsigned long param)
+{
+	long rc;
+	struct lpc_mapping map;
+	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
+	void __user *p = (void __user *)param;
+
+	switch (cmd) {
+	case LPC_CTRL_IOCTL_SIZE:
+		return copy_to_user(p, &lpc_ctrl->size,
+			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
+	case LPC_CTRL_IOCTL_MAP:
+		if (copy_from_user(&map, p, sizeof(map)))
+			return -EFAULT;
+
+
+		/*
+		 * The top half of HICR7 is the MSB of the BMC address of the
+		 * mapping.
+		 * The bottom half of HICR7 is the MSB of the HOST LPC
+		 * firmware space address of the mapping.
+		 *
+		 * The 1 bits in the top of half of HICR8 represent the bits
+		 * (in the requested address) that should be ignored and
+		 * replaced with those from the top half of HICR7.
+		 * The 1 bits in the bottom half of HICR8 represent the bits
+		 * (in the requested address) that should be kept and pass
+		 * into the BMC address space.
+		 */
+
+		rc = regmap_write(lpc_ctrl->regmap, HICR7,
+				(lpc_ctrl->base | (map.hostaddr >> 16)));
+		if (rc)
+			return rc;
+
+		rc = regmap_write(lpc_ctrl->regmap, HICR8,
+			(~(map.size - 1)) | ((map.size >> 16) - 1));
+		return rc;
+	case LPC_CTRL_IOCTL_UNMAP:
+		/*
+		 * The top nibble in host lpc addresses references which
+		 * firmware space, use space zero hence the & 0x0fff
+		 */
+
+		rc = regmap_write(lpc_ctrl->regmap, HICR7,
+			lpc_ctrl->pnor_base | (((-lpc_ctrl->pnor_size) >> 16) & 0x0fff));
+		if (rc)
+			return rc;
+
+		rc = regmap_write(lpc_ctrl->regmap, HICR8,
+			(~(lpc_ctrl->pnor_size - 1)) | ((lpc_ctrl->pnor_size >> 16) - 1));
+		return rc;
+	}
+
+	return -EINVAL;
+}
+
+static int lpc_ctrl_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&lpc_ctrl_open_count);
+	return 0;
+}
+
+static const struct file_operations lpc_ctrl_fops = {
+	.owner		= THIS_MODULE,
+	.mmap		= lpc_ctrl_mmap,
+	.open		= lpc_ctrl_open,
+	.read		= lpc_ctrl_read,
+	.write		= lpc_ctrl_write,
+	.release	= lpc_ctrl_release,
+	.unlocked_ioctl	= lpc_ctrl_ioctl,
+};
+
+static int lpc_ctrl_probe(struct platform_device *pdev)
+{
+	struct lpc_ctrl *lpc_ctrl;
+	struct device *dev;
+	struct device_node *node;
+	struct resource resm;
+	int rc;
+
+	if (!pdev || !pdev->dev.of_node)
+		return -ENODEV;
+
+	dev = &pdev->dev;
+
+	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
+	if (!lpc_ctrl)
+		return -ENOMEM;
+
+	node = of_parse_phandle(dev->of_node, "flash", 0);
+	if (!node) {
+		dev_err(dev, "Didn't find host pnor flash node\n");
+		rc = -ENODEV;
+		goto out;
+	}
+
+	rc = of_property_read_u32_index(node, "reg", 3,
+			&lpc_ctrl->pnor_size);
+	if (rc)
+		return rc;
+	rc = of_property_read_u32_index(node, "reg", 2,
+			&lpc_ctrl->pnor_base);
+	if (rc)
+		return rc;
+
+	dev_info(dev, "Host PNOR base: 0x%08x size: 0x%08x\n",
+		lpc_ctrl->pnor_base, lpc_ctrl->pnor_size);
+
+	dev_set_drvdata(&pdev->dev, lpc_ctrl);
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_err(dev, "Didn't find reserved memory\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = of_address_to_resource(node, 0, &resm);
+	of_node_put(node);
+	if (rc) {
+		dev_err(dev, "Could address to resource\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	lpc_ctrl->size = resource_size(&resm);
+	lpc_ctrl->base = resm.start;
+
+	lpc_ctrl->regmap = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(lpc_ctrl->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		rc = -ENODEV;
+		goto out;
+	}
+
+	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_ctrl->miscdev.name = DEVICE_NAME;
+	lpc_ctrl->miscdev.fops = &lpc_ctrl_fops;
+	lpc_ctrl->miscdev.parent = dev;
+	rc = misc_register(&lpc_ctrl->miscdev);
+	if (rc)
+		dev_err(dev, "Unable to register device\n");
+	else
+		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
+			lpc_ctrl->base, lpc_ctrl->size);
+
+out:
+	return rc;
+}
+
+static int lpc_ctrl_remove(struct platform_device *pdev)
+{
+	struct lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&lpc_ctrl->miscdev);
+	lpc_ctrl = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id lpc_ctrl_match[] = {
+	{ .compatible = "aspeed,ast2400-lpc-ctrl" },
+	{ },
+};
+
+static struct platform_driver lpc_ctrl_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = lpc_ctrl_match,
+	},
+	.probe = lpc_ctrl_probe,
+	.remove = lpc_ctrl_remove,
+};
+
+module_platform_driver(lpc_ctrl_driver);
+
+MODULE_DEVICE_TABLE(of, lpc_ctrl_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("Linux device interface to control LPC bus");
diff --git a/include/uapi/linux/aspeed-lpc-ctrl.h b/include/uapi/linux/aspeed-lpc-ctrl.h
new file mode 100644
index 000000000000..c5f1caf827ac
--- /dev/null
+++ b/include/uapi/linux/aspeed-lpc-ctrl.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef _UAPI_LINUX_LPC_CTRL_H
+#define _UAPI_LINUX_LPC_CTRL_H
+
+#include <linux/ioctl.h>
+
+struct lpc_mapping {
+	uint32_t hostaddr;
+	uint32_t size;
+};
+
+#define __LPC_CTRL_IOCTL_MAGIC	0xb2
+#define LPC_CTRL_IOCTL_SIZE	_IOR(__LPC_CTRL_IOCTL_MAGIC, 0x00, uint32_t)
+#define LPC_CTRL_IOCTL_MAP	_IOW(__LPC_CTRL_IOCTL_MAGIC, 0x01, struct lpc_mapping)
+#define LPC_CTRL_IOCTL_UNMAP	_IO(__LPC_CTRL_IOCTL_MAGIC, 0x02)
+
+#endif /* _UAPI_LINUX_LPC_CTRL_H */
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
