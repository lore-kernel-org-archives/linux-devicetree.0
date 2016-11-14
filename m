From: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/2] drivers: usb: phy: Add qoriq usb 3.0 phy driver support
Date: Mon, 14 Nov 2016 10:56:54 +0530
Message-ID: <1479101215-26954-2-git-send-email-sriram.dash@nxp.com>
References: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479101215-26954-1-git-send-email-sriram.dash-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds qoriq usb 3.0 phy driver support for LS1043A platform.
Describes the qoriq usb 2.0 phy driver binding, currently used
for LS1043A platform.

Signed-off-by: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-qoriq-usb3.txt     |  36 ++++
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qoriq-usb3.c                       | 202 +++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
 create mode 100644 drivers/phy/phy-qoriq-usb3.c

diff --git a/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
new file mode 100644
index 0000000..d934c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
@@ -0,0 +1,36 @@
+Driver for Freescale USB 3.0 PHY
+
+Required properties:
+
+- compatible :	fsl,qoriq-usb3-phy
+- reg :		register mappings for Parameter Configuration Register
+		and Phy base offset.
+- reg-names :	"param_ctrl" and "phy_base"
+- phy_type :	For multi port host USB controllers, should be one of
+		"ulpi", or "serial". For dual role USB controllers,
+		should be one of "ulpi", "utmi", "utmi_wide", or "serial".
+
+Example:
+		usbphy0: usb3-phy@084F0000 {
+                        compatible = "fsl,qoriq-usb3-phy";
+                        reg = <0x0 0x01570070 0x0 0xC>, <0x0 0x084F0000 0x0 0x5000>;
+                        reg-names = "param_ctrl", "phy_base";
+                        #phy-cells = <0>;
+                        phy_type = "utmi";
+                };
+
+                usbphy1: usb3-phy@08500000 {
+                        compatible = "fsl,qoriq-usb3-phy";
+                        reg = <0x0 0x0157007C 0x0 0xC>, <0x0 0x08500000 0x0 0x5000>;
+                        reg-names = "param_ctrl", "phy_base";
+                        #phy-cells = <0>;
+                        phy_type = "utmi";
+                };
+
+                usbphy2: usb3-phy@08510000 {
+                        compatible = "fsl,qoriq-usb3-phy";
+                        reg = <0x0 0x01570088 0x0 0xC>, <0x0 0x08510000 0x0 0x5000>;
+                        reg-names = "param_ctrl", "phy_base";
+                        #phy-cells = <0>;
+                        phy_type = "utmi";
+                };
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index fe00f91..4caa91c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -489,4 +489,12 @@ config PHY_NS2_PCIE
 	help
 	  Enable this to support the Broadcom Northstar2 PCIe PHY.
 	  If unsure, say N.
+
+config PHY_QORIQ_USB3
+	tristate "Freescale QorIQ USB 3.0 PHY driver"
+	depends on ARCH_LAYERSCAPE
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB3.0 PHY on the QorIQ SoC.
 endmenu
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a534cf5..a47ee36b 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_CYGNUS_PCIE)		+= phy-bcm-cygnus-pcie.o
 obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_PHY_NS2_PCIE)		+= phy-bcm-ns2-pcie.o
+obj-$(CONFIG_PHY_QORIQ_USB3)            += phy-qoriq-usb3.o
diff --git a/drivers/phy/phy-qoriq-usb3.c b/drivers/phy/phy-qoriq-usb3.c
new file mode 100644
index 0000000..5255089
--- /dev/null
+++ b/drivers/phy/phy-qoriq-usb3.c
@@ -0,0 +1,202 @@
+/*
+ * Freescale QorIQ USB3 phy driver
+ *
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * Author: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/phy/phy.h>
+#include <linux/usb/phy.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/usb/of.h>
+#include <linux/regmap.h>
+
+
+/* Parameter control */
+#define USB3PRM1CR		0x000
+#define USB3PRM1CR_VAL		0x27672b2a
+
+/*
+ * struct qoriq_usb3_phy - driver data for USB 3.0 PHY
+ * @dev: pointer to device instance of this platform device
+ * @param_ctrl: usb3 phy parameter control register base
+ * @phy_base: usb3 phy register memory base
+ * @has_erratum_flag: keeps track of erratum applicable on device
+ */
+struct qoriq_usb3_phy {
+	struct device *dev;
+	void __iomem *param_ctrl;
+	void __iomem *phy_base;
+	u32 has_erratum_flag;
+};
+
+static inline u32 qoriq_usb3_phy_readl(void __iomem *addr, u32 offset)
+{
+	return __raw_readl(addr + offset);
+}
+
+static inline void qoriq_usb3_phy_writel(void __iomem *addr, u32 offset,
+	u32 data)
+{
+	__raw_writel(data, addr + offset);
+}
+
+/*
+ * Erratum A008751
+ * SCFG USB3PRM1CR has incorrect default value
+ * SCFG USB3PRM1CR reset value should be 32'h27672B2A instead of 32'h25E72B2A.
+ */
+static void erratum_a008751(struct qoriq_usb3_phy *phy)
+{
+	qoriq_usb3_phy_writel(phy->param_ctrl, USB3PRM1CR,
+				USB3PRM1CR_VAL);
+}
+
+/*
+ * qoriq_usb3_phy_erratum - List of phy erratum
+ * @qoriq_phy_erratum - erratum application
+ * @compat - comapt string for erratum
+ */
+
+struct qoriq_usb3_phy_erratum {
+	void (*qoriq_phy_erratum)(struct qoriq_usb3_phy *phy);
+	char *compat;
+};
+
+/* Erratum list */
+struct qoriq_usb3_phy_erratum  phy_erratum_tbl[] = {
+	{&erratum_a008751, "fsl,usb-erratum-a008751"},
+	/* Add init time erratum here */
+};
+
+static int qoriq_usb3_phy_init(struct phy *x)
+{
+	struct qoriq_usb3_phy *phy = phy_get_drvdata(x);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(phy_erratum_tbl); i++)
+		if (phy->has_erratum_flag & 1 << i)
+			phy_erratum_tbl[i].qoriq_phy_erratum(phy);
+	return 0;
+}
+
+static const struct phy_ops ops = {
+	.init		= qoriq_usb3_phy_init,
+	.owner		= THIS_MODULE,
+};
+
+static int qoriq_usb3_phy_probe(struct platform_device *pdev)
+{
+	struct qoriq_usb3_phy *phy;
+	struct phy *generic_phy;
+	struct phy_provider *phy_provider;
+	const struct of_device_id *of_id;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	int i, ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+	phy->dev = dev;
+
+	of_id = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_id) {
+		dev_err(dev, "failed to get device match\n");
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "param_ctrl");
+	if (!res) {
+		dev_err(dev, "failed to get param_ctrl memory\n");
+		ret = -ENOENT;
+		goto err_out;
+	}
+
+	phy->param_ctrl = devm_ioremap_resource(dev, res);
+	if (!phy->param_ctrl) {
+		dev_err(dev, "failed to remap param_ctrl memory\n");
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy_base");
+	if (!res) {
+		dev_err(dev, "failed to get phy_base memory\n");
+		ret = -ENOENT;
+		goto err_out;
+	}
+
+	phy->phy_base = devm_ioremap_resource(dev, res);
+	if (!phy->phy_base) {
+		dev_err(dev, "failed to remap phy_base memory\n");
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	phy->has_erratum_flag = 0;
+	for (i = 0; i < ARRAY_SIZE(phy_erratum_tbl); i++)
+		phy->has_erratum_flag |= device_property_read_bool(dev,
+						phy_erratum_tbl[i].compat) << i;
+
+	platform_set_drvdata(pdev, phy);
+
+	generic_phy = devm_phy_create(dev, NULL, &ops);
+	if (IS_ERR(generic_phy))
+		return PTR_ERR(generic_phy);
+
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	return 0;
+err_out:
+	return ret;
+}
+
+static const struct of_device_id qoriq_usb3_phy_dt_ids[] = {
+	{
+		.compatible = "fsl,qoriq-usb3-phy"
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, qoriq_usb3_phy_dt_ids);
+
+static struct platform_driver qoriq_usb3_phy_driver = {
+	.probe		= qoriq_usb3_phy_probe,
+	.driver		= {
+		.name	= "qoriq_usb3_phy",
+		.of_match_table = qoriq_usb3_phy_dt_ids,
+	},
+};
+
+module_platform_driver(qoriq_usb3_phy_driver);
+
+MODULE_ALIAS("platform:qoriq_usb3_phy");
+MODULE_AUTHOR("Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>");
+MODULE_DESCRIPTION("Freescale QorIQ USB3 phy driver");
+MODULE_LICENSE("GPL v2");
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
