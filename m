From: naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH RESEND v2 1/2] efuse: Imagination Technologies Generic eFuse Controller
Date: Sat, 22 Nov 2014 08:24:32 +0530
Message-ID: <1416624873-7823-2-git-send-email-Naidu.Tellapati@gmail.com>
References: <1416624873-7823-1-git-send-email-Naidu.Tellapati@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416624873-7823-1-git-send-email-Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

The Pistachio SoC from Imagination Technologies includes a generic eFuse
Controller which exposes the status of 128 EFUSE bits to the external world.

Signed-off-by: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/img/Makefile         |   1 +
 drivers/soc/img/fuse/Kconfig     |   9 ++
 drivers/soc/img/fuse/Makefile    |   1 +
 drivers/soc/img/fuse/img-efuse.c | 192 +++++++++++++++++++++++++++++++++++++++
 include/soc/img/img-efuse.h      |  15 +++
 7 files changed, 220 insertions(+)
 create mode 100644 drivers/soc/img/Makefile
 create mode 100644 drivers/soc/img/fuse/Kconfig
 create mode 100644 drivers/soc/img/fuse/Makefile
 create mode 100644 drivers/soc/img/fuse/img-efuse.c
 create mode 100644 include/soc/img/img-efuse.h

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 76d6bd4..b699082 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -1,5 +1,6 @@
 menu "SOC (System On Chip) specific Drivers"
 
+source "drivers/soc/img/fuse/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/ti/Kconfig"
 source "drivers/soc/versatile/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 063113d..eed9585 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -2,6 +2,7 @@
 # Makefile for the Linux Kernel SOC specific device drivers.
 #
 
+obj-$(CONFIG_SOC_IMG)		+= img/
 obj-$(CONFIG_ARCH_QCOM)		+= qcom/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-$(CONFIG_SOC_TI)		+= ti/
diff --git a/drivers/soc/img/Makefile b/drivers/soc/img/Makefile
new file mode 100644
index 0000000..f33a89f
--- /dev/null
+++ b/drivers/soc/img/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SOC_IMG)	+= fuse/
diff --git a/drivers/soc/img/fuse/Kconfig b/drivers/soc/img/fuse/Kconfig
new file mode 100644
index 0000000..7810ea3
--- /dev/null
+++ b/drivers/soc/img/fuse/Kconfig
@@ -0,0 +1,9 @@
+config IMG_EFUSE
+	tristate "Imagination Technologies Generic eFuse driver"
+	depends on HAS_IOMEM
+	help
+	  Imagination Technologies Generic eFuse driver which exposes the status
+	  of 128 EFUSE bits.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called img-efuse.
diff --git a/drivers/soc/img/fuse/Makefile b/drivers/soc/img/fuse/Makefile
new file mode 100644
index 0000000..e873dc0
--- /dev/null
+++ b/drivers/soc/img/fuse/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_IMG_EFUSE)	+= img-efuse.o
diff --git a/drivers/soc/img/fuse/img-efuse.c b/drivers/soc/img/fuse/img-efuse.c
new file mode 100644
index 0000000..de08b64
--- /dev/null
+++ b/drivers/soc/img/fuse/img-efuse.c
@@ -0,0 +1,192 @@
+/*
+ * Imagination Technologies Generic eFuse driver
+ *
+ * Copyright (c) 2014 Imagination Technologies Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * Based on drivers/misc/eeprom/sunxi_sid.c Copyright (c) 2013 Oliver Schinagl
+ */
+#include <linux/clk.h>
+#include <linux/compiler.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include <soc/img/img-efuse.h>
+
+#define DRV_NAME	"img-efuse"
+
+struct img_efuse {
+	void __iomem *base;
+	unsigned int size;
+	struct clk *osc_clk;
+	struct clk *sys_clk;
+};
+
+struct img_efuse *efuse_dev;
+
+static u8 img_efuse_read_byte(const unsigned int offset)
+{
+	u32 data;
+
+	if (offset >= efuse_dev->size)
+		return 0;
+
+	data = readl(efuse_dev->base + round_down(offset, 4));
+	data >>= (offset % 4) * 8;
+
+	return data; /* Only return the last byte */
+}
+
+int img_efuse_readl(unsigned int offset, u32 *value)
+{
+	if (!efuse_dev || IS_ERR(efuse_dev->base))
+		return -ENODEV;
+
+	if ((offset > (efuse_dev->size - 4)) || (offset % 4 != 0))
+		return -EINVAL;
+
+	*value = readl(efuse_dev->base + offset);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(img_efuse_readl);
+
+static ssize_t img_efuse_read(struct file *fd, struct kobject *kobj,
+			      struct bin_attribute *attr, char *buf,
+			      loff_t pos, size_t size)
+{
+	int i;
+	struct platform_device *pdev;
+	struct img_efuse *efuse;
+
+	pdev = to_platform_device(kobj_to_dev(kobj));
+	efuse = platform_get_drvdata(pdev);
+
+	if (pos < 0 || pos >= efuse->size)
+		return 0;
+
+	if (size > efuse->size - pos)
+		size = efuse->size - pos;
+
+	for (i = 0; i < size; i++)
+		buf[i] = img_efuse_read_byte(pos + i);
+
+	return i;
+}
+
+static struct bin_attribute img_efuse_bin_attr = {
+	.attr = { .name = "efuse", .mode = S_IRUGO, },
+	.read = img_efuse_read,
+};
+
+static int img_efuse_remove(struct platform_device *pdev)
+{
+	struct img_efuse *efuse;
+
+	efuse = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(efuse->osc_clk);
+	clk_disable_unprepare(efuse->sys_clk);
+
+	device_remove_bin_file(&pdev->dev, &img_efuse_bin_attr);
+
+	return 0;
+}
+
+static const struct of_device_id img_efuse_of_match[] = {
+	{ .compatible = "img,efuse", .data = (void *)16},
+	{/* sentinel */},
+};
+MODULE_DEVICE_TABLE(of, img_efuse_of_match);
+
+static int img_efuse_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct resource *res;
+	const struct of_device_id *of_dev_id;
+
+	efuse_dev = devm_kzalloc(&pdev->dev, sizeof(struct img_efuse *),
+				 GFP_KERNEL);
+	if (!efuse_dev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	efuse_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(efuse_dev->base))
+		return PTR_ERR(efuse_dev->base);
+
+	of_dev_id = of_match_device(img_efuse_of_match, &pdev->dev);
+	if (!of_dev_id)
+		return -ENODEV;
+	efuse_dev->size = (int)of_dev_id->data;
+
+	efuse_dev->sys_clk = devm_clk_get(&pdev->dev, "sys");
+	if (IS_ERR(efuse_dev->sys_clk)) {
+		dev_err(&pdev->dev, "failed to get system clock");
+		return PTR_ERR(efuse_dev->sys_clk);
+	}
+
+	efuse_dev->osc_clk = devm_clk_get(&pdev->dev, "osc");
+	if (IS_ERR(efuse_dev->osc_clk)) {
+		dev_err(&pdev->dev, "failed to get oscillator clock");
+		return PTR_ERR(efuse_dev->osc_clk);
+	}
+
+	ret = clk_prepare_enable(efuse_dev->sys_clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not enable system clock.\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(efuse_dev->osc_clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not enable oscillator clock.\n");
+		goto disable_sysclk;
+	}
+
+	platform_set_drvdata(pdev, efuse_dev);
+
+	img_efuse_bin_attr.size = efuse_dev->size;
+	if (device_create_bin_file(&pdev->dev, &img_efuse_bin_attr)) {
+		ret = -ENODEV;
+		goto disable_oscclk;
+	}
+
+	return 0;
+
+disable_oscclk:
+	clk_disable_unprepare(efuse_dev->osc_clk);
+disable_sysclk:
+	clk_disable_unprepare(efuse_dev->sys_clk);
+	return ret;
+}
+
+static struct platform_driver img_efuse_driver = {
+	.probe = img_efuse_probe,
+	.remove = img_efuse_remove,
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = img_efuse_of_match,
+	},
+};
+module_platform_driver(img_efuse_driver);
+
+MODULE_AUTHOR("Arul Ramasamy<Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>");
+MODULE_AUTHOR("Jude Abraham<Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("Imagination Technologies Generic eFuse driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/soc/img/img-efuse.h b/include/soc/img/img-efuse.h
new file mode 100644
index 0000000..64bf4ad
--- /dev/null
+++ b/include/soc/img/img-efuse.h
@@ -0,0 +1,15 @@
+/*
+ * Imagination Technologies Generic eFuse driver
+ *
+ * Copyright (C) 2014 Imagination Technologies Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __IMG_EFUSE_H
+#define __IMG_EFUSE_H
+
+int img_efuse_readl(unsigned int offset, u32 *value);
+
+#endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
