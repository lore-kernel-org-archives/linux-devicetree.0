From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 2/2] usb: phy: Add platform driver support for ULPI PHYs
Date: Wed, 23 Sep 2015 18:24:33 +0530
Message-ID: <1443012873-13757-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Based on board design USB controller needs explicit software
access to ULPI PHY for controlling VBUS. This patch adds platform
driver support for generic ULPI PHYs and provides a USB2 PHY device
to controllers.

Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/Kconfig             |   12 +++
 drivers/usb/phy/Makefile            |    1 +
 drivers/usb/phy/phy-platform-ulpi.c |  143 +++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+), 0 deletions(-)
 create mode 100644 drivers/usb/phy/phy-platform-ulpi.c

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 7d3beee..2956ad4 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -201,6 +201,18 @@ config USB_RCAR_PHY
 	  To compile this driver as a module, choose M here: the
 	  module will be called phy-rcar-usb.
 
+config USB_PLATFORM_ULPI_PHY
+	tristate "Platform driver support for ULPI PHYs"
+	depends on ARCH_ZYNQ || COMPILE_TEST
+	select USB_PHY
+	select USB_ULPI_VIEWPORT
+	help
+	  Say Y here to add support for the Platform driver for ULPI PHYs.
+	  This adds platform driver support for all generic ULPI PHYs and is
+	  typically used if usb controller driver needs explicit access to PHY.
+	  
+	  To compile this driver as a module, choose M here.
+
 config USB_ULPI
 	bool "Generic ULPI Transceiver Driver"
 	depends on ARM || ARM64
diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
index 19c0dcc..8431b6b 100644
--- a/drivers/usb/phy/Makefile
+++ b/drivers/usb/phy/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_USB_QCOM_8X16_PHY)	+= phy-qcom-8x16-usb.o
 obj-$(CONFIG_USB_MV_OTG)		+= phy-mv-usb.o
 obj-$(CONFIG_USB_MXS_PHY)		+= phy-mxs-usb.o
 obj-$(CONFIG_USB_RCAR_PHY)		+= phy-rcar-usb.o
+obj-$(CONFIG_USB_PLATFORM_ULPI_PHY)	+= phy-platform-ulpi.o
 obj-$(CONFIG_USB_ULPI)			+= phy-ulpi.o
 obj-$(CONFIG_USB_ULPI_VIEWPORT)		+= phy-ulpi-viewport.o
 obj-$(CONFIG_KEYSTONE_USB_PHY)		+= phy-keystone.o
diff --git a/drivers/usb/phy/phy-platform-ulpi.c b/drivers/usb/phy/phy-platform-ulpi.c
new file mode 100644
index 0000000..fb89363
--- /dev/null
+++ b/drivers/usb/phy/phy-platform-ulpi.c
@@ -0,0 +1,143 @@
+/*
+ * Platform driver for generic ULPI PHYs.
+ *
+ * Copyright (C) 2015 Xilinx, Inc.
+ *
+ * Author: Subbaraya Sundeep <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it
+ * and/or modify it under the terms of the GNU General Public
+ * License as published by the Free Software Foundation;
+ * either version 2 of the License, or (at your option) any
+ * later version.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/usb/ulpi.h>
+#include <linux/usb/phy.h>
+
+/**
+ * struct ulpi_phy - The ULPI PHY
+ * @usb_phy: pointer to usb phy
+ * @regs: base address of USB controller to which PHY is connected
+ * @vp_offset: ulpi viewport register offset of USB controller
+ * @flags: initial required settings of PHY
+ */
+
+struct ulpi_phy {
+	struct usb_phy	*usb_phy;
+	void __iomem *regs;
+	unsigned int vp_offset;
+	unsigned int flags;
+};
+
+/**
+ * usbphy_set_vbus - Sets VBUS by writing to PHY.
+ * @phy: pointer to PHY
+ * @on: 1 - turn on VBUS
+ *	0 - turn off VBUS
+ * Return: 0 for success and error value on failure
+ */
+static int usbphy_set_vbus(struct usb_phy *phy, int on)
+{
+	unsigned int flags = usb_phy_io_read(phy, ULPI_OTG_CTRL);
+
+	flags &= ~(ULPI_OTG_CTRL_DRVVBUS | ULPI_OTG_CTRL_DRVVBUS_EXT);
+
+	if (on) {
+		if (phy->flags & ULPI_OTG_DRVVBUS)
+			flags |= ULPI_OTG_CTRL_DRVVBUS;
+
+		if (phy->flags & ULPI_OTG_DRVVBUS_EXT)
+			flags |= ULPI_OTG_CTRL_DRVVBUS_EXT;
+	}
+
+	return usb_phy_io_write(phy, flags, ULPI_OTG_CTRL);
+}
+
+/**
+ * ulpi_phy_probe - The device probe function for driver initialization.
+ * @pdev: pointer to the platform device structure.
+ *
+ * Return: 0 for success and error value on failure
+ */
+static int ulpi_phy_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource *res;
+	struct ulpi_phy *uphy;
+	bool flag;
+	int ret;
+
+	uphy = devm_kzalloc(&pdev->dev, sizeof(*uphy), GFP_KERNEL);
+	if (!uphy)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	uphy->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (IS_ERR(uphy->regs))
+		return PTR_ERR(uphy->regs);
+
+	ret = of_property_read_u32(np, "view-port", &uphy->vp_offset);
+	if (IS_ERR(uphy->regs)) {
+		dev_err(&pdev->dev, "view-port register not specified\n");
+		return PTR_ERR(uphy->regs);
+	}
+
+	flag = of_property_read_bool(np, "drv-vbus");
+	if (flag)
+		uphy->flags |= ULPI_OTG_DRVVBUS | ULPI_OTG_DRVVBUS_EXT;
+
+	uphy->usb_phy = otg_ulpi_create(&ulpi_viewport_access_ops, uphy->flags);
+
+	uphy->usb_phy->set_vbus	= usbphy_set_vbus;
+
+	uphy->usb_phy->dev = &pdev->dev;
+
+	uphy->usb_phy->io_priv = uphy->regs + uphy->vp_offset;
+
+	ret = usb_add_phy_dev(uphy->usb_phy);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ulpi_phy_remove - Releases the resources allocated during the initialization.
+ * @pdev: pointer to the platform device structure.
+ *
+ * Return: 0 always
+ */
+static int ulpi_phy_remove(struct platform_device *pdev)
+{
+	struct ulpi_phy *uphy = platform_get_drvdata(pdev);
+
+	usb_remove_phy(uphy->usb_phy);
+
+	return 0;
+}
+
+/* Match table for of_platform binding */
+static const struct of_device_id ulpi_phy_table[] = {
+	{ .compatible = "ulpi-phy" },
+	{ /* end of list */},
+};
+MODULE_DEVICE_TABLE(of, ulpi_phy_table);
+
+static struct platform_driver ulpi_phy_driver = {
+	.probe		= ulpi_phy_probe,
+	.remove		= ulpi_phy_remove,
+	.driver		= {
+		.name	= "ulpi-platform-phy",
+		.of_match_table = of_match_ptr(ulpi_phy_table),
+	},
+};
+module_platform_driver(ulpi_phy_driver);
+
+MODULE_DESCRIPTION("ULPI PHY platform driver");
+MODULE_AUTHOR("Xilinx, Inc");
+MODULE_LICENSE("GPL v2");
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
