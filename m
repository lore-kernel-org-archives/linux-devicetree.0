From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] phy: renesas: rcar-gen3-usb2-clksel: Add R-Car Gen3 USB 2.0 clock selector PHY
Date: Thu, 15 Jun 2017 20:34:22 +0900
Message-ID: <1497526462-9179-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

USB 2.0 PHY of R-Car Gen3 can change the clock source from an oscillator
to an external clock via a register. So, this patch adds support
the clock source selector as a generic PHY driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest linux-phy.git / next branch
 (commit id = 787f24543c4a599e5d9d311a3fce839ce87bbff0)

 I'm not sure this driver ss OK or not as a generic phy driver.
 So, I send this patch as RFC.

 .../bindings/phy/rcar-gen3-phy-usb2-clksel.txt     |  58 +++++++++
 drivers/phy/renesas/Kconfig                        |   8 ++
 drivers/phy/renesas/Makefile                       |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c    | 129 +++++++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
 create mode 100644 drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
new file mode 100644
index 0000000..71b2f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2-clksel.txt
@@ -0,0 +1,58 @@
+* Renesas R-Car generation 3 USB 2.0 clock selector PHY
+
+This file provides information on what the device node for the R-Car generation
+3 USB 2.0 clock selector PHY contains.
+
+If you connect an external clock to the USB_EXTAL pin, you can use the
+"renesas,usb_extal_only" property for it.
+If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
+is not needed because this is default setting.
+
+Case 1: An external clock connects to R-Car SoC
+	+----------+   +--- R-Car ---------------------+
+	|External  |---|USB_EXTAL ---> all usb channels|
+	|clock     |   |USB_XTAL                       |
+	+----------+   +-------------------------------+
+In this case, we need this driver with "usb-extal-only" property.
+
+Case 2: An oscillator connects to R-Car SoC
+	+----------+   +--- R-Car ---------------------+
+	|Oscillator|---|USB_EXTAL -+-> all usb channels|
+	|          |---|USB_XTAL --+                   |
+	+----------+   +-------------------------------+
+In this case, we don't need this selector.
+
+Required properties:
+- compatible: "renesas,r8a7795-usb2-clksel-phy" if the device is a part of an
+	      R8A7795 SoC.
+	      "renesas,r8a7796-usb2-clksel-phy" if the device is a part of an
+	      R8A7796 SoC.
+
+	      When compatible with the generic version, nodes must list the
+	      SoC-specific version corresponding to the platform first
+	      followed by the generic version.
+
+- reg: offset and length of the USB 2.0 clock selector register block.
+- clocks: clock phandle and specifier pair(s).
+- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+
+Optional properties:
+- renesas,usb-extal-only: to connect a clock generator to USB_EXTAL pin.
+
+Example (R-Car H3):
+
+	usb2_clksel_phy: usb-phy@e6590630 {
+		compatible = "renesas,r8a7795-usb2-clksel-phy",
+			     "renesas,rcar-gen3-usb2-clksel-phy";
+		reg = <0 0xe6590630 0 0x02>;
+		clocks = <&cpg CPG_MOD 703>;
+		renesas,usb-extal-only;
+	};
+
+	&ehci0 {
+		/* We should set usb2_clksel_phy into the first phys prop */
+		phys = <&usb2_clksel_phy>, <&usb2_phy0>;
+		phy-names = "usb_clk", "usb";
+
+		status = "okay";
+	};
diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index cb09245..a3b511b 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -16,6 +16,14 @@ config PHY_RCAR_GEN3_USB2
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
 
+config PHY_RCAR_GEN3_USB2_CLKSEL
+	tristate "Renesas R-Car generation 3 USB 2.0 clock selector PHY driver"
+	depends on ARCH_RENESAS
+	select GENERIC_PHY
+	help
+	  Support for USB 2.0 clock selector PHY found on Renesas R-Car
+	  generation 3 SoCs.
+
 config PHY_RCAR_GEN3_USB3
 	tristate "Renesas R-Car generation 3 USB 3.0 PHY driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
index 8b60259..26175b7 100644
--- a/drivers/phy/renesas/Makefile
+++ b/drivers/phy/renesas/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
+obj-$(CONFIG_PHY_RCAR_GEN3_USB2_CLKSEL)	+= phy-rcar-gen3-usb2-clksel.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c b/drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c
new file mode 100644
index 0000000..e0e41c9
--- /dev/null
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2-clksel.c
@@ -0,0 +1,129 @@
+/*
+ * Renesas R-Car Gen3 for USB2.0 clock selector PHY driver
+ *
+ * Copyright (C) 2017 Renesas Electronics Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define USB20_CLKSET0		0x00
+#define CLKSET0_INTCLK_EN	BIT(11)
+#define CLKSET0_PRIVATE		BIT(0)
+#define CLKSET0_EXTAL_ONLY	(CLKSET0_INTCLK_EN | CLKSET0_PRIVATE)
+
+struct rcar_gen3_usb2_clksel {
+	void __iomem *base;
+	struct phy *phy;
+	bool usb_extal_only;
+};
+
+static int rcar_gen3_usb2_clksel_init(struct phy *p)
+{
+	struct rcar_gen3_usb2_clksel *r = phy_get_drvdata(p);
+	u16 val = readw(r->base + USB20_CLKSET0);
+
+	dev_vdbg(&r->phy->dev, "%s: %d, %04x\n", __func__, r->usb_extal_only,
+		 val);
+
+	if (r->usb_extal_only && val != CLKSET0_EXTAL_ONLY)
+		writew(CLKSET0_EXTAL_ONLY, r->base + USB20_CLKSET0);
+
+	return 0;
+}
+
+static const struct phy_ops rcar_gen3_usb2_clksel_ops = {
+	.init		= rcar_gen3_usb2_clksel_init,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id rcar_gen3_usb2_clksel_match_table[] = {
+	{ .compatible = "renesas,rcar-gen3-usb2-clksel-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rcar_gen3_usb2_clksel_match_table);
+
+static int rcar_gen3_usb2_clksel_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rcar_gen3_usb2_clksel *r;
+	struct phy_provider *provider;
+	struct resource *res;
+	int ret = 0;
+
+	if (!dev->of_node) {
+		dev_err(dev, "This driver needs device tree\n");
+		return -EINVAL;
+	}
+
+	r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	r->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(r->base))
+		return PTR_ERR(r->base);
+
+	/*
+	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
+	 * And then, phy-core will manage runtime pm for this device.
+	 */
+	pm_runtime_enable(dev);
+
+	r->phy = devm_phy_create(dev, NULL, &rcar_gen3_usb2_clksel_ops);
+	if (IS_ERR(r->phy)) {
+		dev_err(dev, "Failed to create USB 2.0 clock selector PHY\n");
+		ret = PTR_ERR(r->phy);
+		goto error;
+	}
+
+	r->usb_extal_only = of_property_read_bool(dev->of_node,
+						"renesas,usb-extal-only");
+
+	platform_set_drvdata(pdev, r);
+	phy_set_drvdata(r->phy, r);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(dev, "Failed to register PHY provider\n");
+		ret = PTR_ERR(provider);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_usb2_clksel_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+};
+
+static struct platform_driver rcar_gen3_usb2_clksel_driver = {
+	.driver = {
+		.name		= "phy_rcar_gen3_usb2_clksel",
+		.of_match_table	= rcar_gen3_usb2_clksel_match_table,
+	},
+	.probe	= rcar_gen3_usb2_clksel_probe,
+	.remove = rcar_gen3_usb2_clksel_remove,
+};
+module_platform_driver(rcar_gen3_usb2_clksel_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas R-Car Gen3 USB 2.0 clock selector PHY");
+MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
-- 
1.9.1
