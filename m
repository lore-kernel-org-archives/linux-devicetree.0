From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY
Date: Wed, 28 Jun 2017 15:28:35 +0900
Message-ID: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

R-Car USB 2.0 controller can change the clock source from an oscillator
to an external clock via a register. So, this patch adds support
the clock source selector as a clock driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the renesas-drivers.git /
renesas-drivers-2017-06-27-v4.12-rc7 tag.

 Changes from v1:
  - Change this driver as a clock driver from a generic phy driver.
    https://patchwork.kernel.org/patch/9788697/
  - Remove "RFC" tag.

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  54 ++++++
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c          | 205 +++++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 drivers/clk/renesas/rcar-usb2-clock-sel.c

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
new file mode 100644
index 0000000..75ccafc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -0,0 +1,54 @@
+* Renesas R-Car USB 2.0 clock selector
+
+This file provides information on what the device node for the R-Car USB 2.0
+clock selector.
+
+If you connect an external clock to the USB_EXTAL pin only, you should set
+the clock rate to "usb_extal" node only.
+If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
+is not needed because this is default setting. (Of course, you can set the
+clock rates to both "usb_extal" and "usb_xtal" nodes.
+
+Case 1: An external clock connects to R-Car SoC
+        +----------+   +--- R-Car ---------------------+
+        |External  |---|USB_EXTAL ---> all usb channels|
+        |clock     |   |USB_XTAL                       |
+        +----------+   +-------------------------------+
+In this case, we need this driver with "usb_extal" clock.
+
+Case 2: An oscillator connects to R-Car SoC
+        +----------+   +--- R-Car ---------------------+
+        |Oscillator|---|USB_EXTAL -+-> all usb channels|
+        |          |---|USB_XTAL --+                   |
+        +----------+   +-------------------------------+
+In this case, we don't need this selector.
+
+Required properties:
+- compatible: "renesas,r8a7795-rcar-usb2-clock-sel" if the device is a part of
+	      an R8A7795 SoC.
+              "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
+	      an R8A7796 SoC.
+              "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
+              compatible device.
+
+              When compatible with the generic version, nodes must list the
+              SoC-specific version corresponding to the platform first
+              followed by the generic version.
+
+- reg: offset and length of the USB 2.0 clock selector register block.
+- clocks: A list of phandles and specifier pairs.
+- clock-names: Name of the clocks.
+ - The functional clock must be "ehci_ohci"
+ - The USB_EXTAL clock pin must be "usb_extal"
+ - The USB_XTAL clock pin must be "usb_xtal"
+- #clock-cells: Must be 0
+
+Exxample (R-Car H3):
+
+        usb2_clksel: clock-controller@e6590630 {
+                compatible = "renesas,r8a77950-rcar-usb2-clock-sel",
+                             "renesas,rcar-gen3-usb2-clock-sel";
+                reg = <0 0xe6590630 0 0x02>;
+                clocks = <&cpg CPG_MOD 703>, <&usb_extal>, <&usb_xtal>;
+                clock-names = "ehci_ohci", "usb_extal", "usb_xtal";
+        };
diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 78d1df9..094df5c 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -114,6 +114,11 @@ config CLK_RCAR_GEN3_CPG
 	bool
 	select CLK_RENESAS_CPG_MSSR
 
+config CLK_RCAR_USB2_CLOCK_SEL
+	bool "Renesas R-Car USB2 clock selector support"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	help
+	  This is a driver for R-Car USB2 clock selector
 
 # Generic
 config CLK_RENESAS_CPG_MSSR
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 02d0412..4eec85b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 obj-$(CONFIG_CLK_RCAR_GEN2)		+= clk-rcar-gen2.o
 obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+= rcar-gen2-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
+obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 
 # Generic
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
new file mode 100644
index 0000000..b48b2fc
--- /dev/null
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -0,0 +1,205 @@
+/*
+ * Renesas R-Car USB2.0 clock selector
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ *
+ * Based on renesas-cpg-mssr.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+
+#define USB20_CLKSET0		0x00
+#define CLKSET0_INTCLK_EN	BIT(11)
+#define CLKSET0_PRIVATE		BIT(0)
+#define CLKSET0_EXTAL_ONLY	(CLKSET0_INTCLK_EN | CLKSET0_PRIVATE)
+
+struct usb2_clock_sel_priv {
+	void __iomem *base;
+	struct clk_hw hw;
+	struct clk *ehci_clk;
+	bool extal;
+	bool xtal;
+};
+#define to_priv(_hw)	container_of(_hw, struct usb2_clock_sel_priv, hw)
+
+static void usb2_clock_sel_enable_extal_only(struct usb2_clock_sel_priv *priv)
+{
+	u16 val = readw(priv->base + USB20_CLKSET0);
+
+	pr_debug("%s: enter %d %d %x\n", __func__,
+		 priv->extal, priv->xtal, val);
+
+	if (priv->extal && !priv->xtal && val != CLKSET0_EXTAL_ONLY)
+		writew(CLKSET0_EXTAL_ONLY, priv->base + USB20_CLKSET0);
+}
+
+static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
+{
+	if (priv->extal && !priv->xtal)
+		writew(CLKSET0_PRIVATE, priv->base + USB20_CLKSET0);
+}
+
+static int usb2_clock_sel_enable(struct clk_hw *hw)
+{
+	usb2_clock_sel_enable_extal_only(to_priv(hw));
+
+	return 0;
+}
+
+static void usb2_clock_sel_disable(struct clk_hw *hw)
+{
+	usb2_clock_sel_disable_extal_only(to_priv(hw));
+}
+
+/*
+ * This module seems a mux, but this driver assumes a gate because
+ * ehci/ohci platform drivers don't support clk_set_parent() for now.
+ * If this driver acts as a gate, ehci/ohci-platform drivers don't need
+ * any modification.
+ */
+static const struct clk_ops usb2_clock_sel_clock_ops = {
+	.enable = usb2_clock_sel_enable,
+	.disable = usb2_clock_sel_disable,
+};
+
+static const struct of_device_id rcar_usb2_clock_sel_match[] = {
+	{ .compatible = "renesas,rcar-gen3-usb2-clock-sel" },
+	{ }
+};
+
+static int rcar_usb2_clock_sel_suspend(struct device *dev)
+{
+	struct usb2_clock_sel_priv *priv = dev_get_drvdata(dev);
+
+	usb2_clock_sel_disable_extal_only(priv);
+	clk_disable_unprepare(priv->ehci_clk);
+
+	return 0;
+}
+
+static int rcar_usb2_clock_sel_resume(struct device *dev)
+{
+	struct usb2_clock_sel_priv *priv = dev_get_drvdata(dev);
+	int error;
+
+	error = clk_prepare_enable(priv->ehci_clk);
+	if (error)
+		return error;
+	usb2_clock_sel_enable_extal_only(priv);
+
+	return 0;
+}
+
+static int rcar_usb2_clock_sel_remove(struct platform_device *pdev)
+{
+	struct usb2_clock_sel_priv *priv = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(priv->ehci_clk);
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_hw_unregister(&priv->hw);
+
+	return 0;
+}
+
+static int __init rcar_usb2_clock_sel_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct usb2_clock_sel_priv *priv;
+	struct resource *res;
+	struct clk *clk;
+	struct clk_init_data init;
+	int error;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->ehci_clk = devm_clk_get(dev, "ehci_ohci");
+	if (!IS_ERR(priv->ehci_clk)) {
+		error = clk_prepare_enable(priv->ehci_clk);
+		if (error)
+			return error;
+	}
+
+	clk = devm_clk_get(dev, "usb_extal");
+	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
+		priv->extal = !!clk_get_rate(clk);
+		clk_disable_unprepare(clk);
+	}
+	clk = devm_clk_get(dev, "usb_xtal");
+	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
+		priv->xtal = !!clk_get_rate(clk);
+		clk_disable_unprepare(clk);
+	}
+
+	if (!priv->extal && !priv->extal) {
+		dev_err(dev, "This driver needs usb_extal or usb_xtal\n");
+		return -ENOENT;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	dev_set_drvdata(dev, priv);
+
+	init.name = "rcar_usb2_clock_sel";
+	init.ops = &usb2_clock_sel_clock_ops;
+	init.flags = CLK_IS_BASIC;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+	priv->hw.init = &init;
+
+	clk = clk_register(NULL, &priv->hw);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	error = of_clk_add_provider(np, of_clk_src_simple_get, clk);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static const struct dev_pm_ops rcar_usb2_clock_sel_pm_ops = {
+	.suspend	= rcar_usb2_clock_sel_suspend,
+	.resume		= rcar_usb2_clock_sel_resume,
+};
+
+static struct platform_driver rcar_usb2_clock_sel_driver = {
+	.driver		= {
+		.name	= "rcar-usb2-clock-sel",
+		.pm	= &rcar_usb2_clock_sel_pm_ops,
+		.of_match_table = rcar_usb2_clock_sel_match,
+	},
+	.remove		= rcar_usb2_clock_sel_remove,
+};
+
+static int __init rcar_usb2_clock_sel_init(void)
+{
+	return platform_driver_probe(&rcar_usb2_clock_sel_driver,
+				     rcar_usb2_clock_sel_probe);
+}
+
+/* Since this driver needs other ccf drivers, this uses subsys_initcall_sync */
+subsys_initcall_sync(rcar_usb2_clock_sel_init);
+
+MODULE_DESCRIPTION("Renesas R-Car USB2 clock selector Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1

