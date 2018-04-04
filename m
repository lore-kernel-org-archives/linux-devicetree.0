Return-Path: <SRS0=7jN8=GZ=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
Date: Wed, 4 Apr 2018 22:31:26 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This PHY is still mostly undocumented -- the only documented registers
exist on R-Car V3H (R8A77980) SoC  where this PHY stays in a powered-down
state after a reset and thus  we must power it on for PCIe to work...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'next' branch of Kishon's 'linux-phy.git' repo.

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt |   32 ++
 drivers/phy/renesas/Kconfig                                  |    7 
 drivers/phy/renesas/Makefile                                 |    1 
 drivers/phy/renesas/phy-rcar-gen3-pcie.c                     |  158 +++++++++++
 4 files changed, 198 insertions(+)

Index: linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
===================================================================
--- /dev/null
+++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
@@ -0,0 +1,32 @@
+* Renesas R-Car generation 3 PCIe PHY
+
+This file provides information on what the device node for the R-Car
+generation 3 PCIe PHY contains.
+
+Required properties:
+- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of R8A77980
+	      SoC.
+	      "renesas,rcar-gen3-pcie-phy" for a generic R-Car Gen3 compatible
+	      device.
+
+	      When compatible with the generic version, nodes must list the
+	      SoC-specific version corresponding to the platform first
+	      followed by the generic version.
+
+- reg: offset and length of the register block.
+- clocks: clock phandle and specifier pair.
+- power-domains: power domain phandle and specifier pair.
+- resets: reset phandle and specifier pair.
+- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+
+Example (R-Car V3H):
+
+	pcie-phy@e65d0000 {
+		compatible = "renesas,r8a77980-pcie-phy",
+			     "renesas,rcar-gen3-pcie-phy";
+		reg = <0 0xe65d0000 0 0x8000>;
+		#phy-cells = <0>;
+		clocks = <&cpg CPG_MOD 319>;
+		power-domains = <&sysc 32>;
+		resets = <&cpg 319>;
+	};
Index: linux-phy/drivers/phy/renesas/Kconfig
===================================================================
--- linux-phy.orig/drivers/phy/renesas/Kconfig
+++ linux-phy/drivers/phy/renesas/Kconfig
@@ -8,6 +8,13 @@ config PHY_RCAR_GEN2
 	help
 	  Support for USB PHY found on Renesas R-Car generation 2 SoCs.
 
+config PHY_RCAR_GEN3_PCIE
+	tristate "Renesas R-Car generation 3 PCIe PHY driver"
+	depends on ARCH_RENESAS
+	select GENERIC_PHY
+	help
+	  Support for the PCIe PHY found on Renesas R-Car generation 3 SoCs.
+
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on ARCH_RENESAS
Index: linux-phy/drivers/phy/renesas/Makefile
===================================================================
--- linux-phy.orig/drivers/phy/renesas/Makefile
+++ linux-phy/drivers/phy/renesas/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
+obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
Index: linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
===================================================================
--- /dev/null
+++ linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas R-Car Gen2 PHY driver
+ *
+ * Copyright (C) 2018 Cogent Embedded, Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define PHY_CTRL		0x4000		/* R8A77980 only */
+
+/* PHY control register (PHY_CTRL) */
+#define PHY_CTRL_PHY_PWDN	0x00000004
+
+struct rcar_gen3_phy {
+	struct phy *phy;
+	spinlock_t lock;
+	void __iomem *base;
+};
+
+static void rcar_gen3_phy_pcie_modify_reg(struct phy *p, unsigned int reg,
+					  u32 clear, u32 set)
+{
+	struct rcar_gen3_phy *phy = phy_get_drvdata(p);
+	void __iomem *base = phy->base;
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&phy->lock, flags);
+
+	value = readl(base + reg);
+	value &= ~clear;
+	value |= set;
+	writel(value, base + reg);
+
+	spin_unlock_irqrestore(&phy->lock, flags);
+}
+
+static int r8a77980_phy_pcie_power_on(struct phy *p)
+{
+	/* Power on the PCIe PHY */
+	rcar_gen3_phy_pcie_modify_reg(p, PHY_CTRL, PHY_CTRL_PHY_PWDN, 0);
+
+	return 0;
+}
+
+static int r8a77980_phy_pcie_power_off(struct phy *p)
+{
+	/* Power off the PCIe PHY */
+	rcar_gen3_phy_pcie_modify_reg(p, PHY_CTRL, 0, PHY_CTRL_PHY_PWDN);
+
+	return 0;
+}
+
+static const struct phy_ops rcar_gen3_phy_pcie_ops = {
+	.owner		= THIS_MODULE,
+};
+
+static const struct phy_ops r8a77980_phy_pcie_ops = {
+	.power_on	= r8a77980_phy_pcie_power_on,
+	.power_off	= r8a77980_phy_pcie_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id rcar_gen3_phy_pcie_match_table[] = {
+	{ .compatible = "renesas,r8a77980-pcie-phy",
+	  .data = &r8a77980_phy_pcie_ops },
+	{ .compatible = "renesas,rcar-gen3-pcie-phy" },
+	{ .data = &rcar_gen3_phy_pcie_ops },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rcar_gen3_phy_pcie_match_table);
+
+static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct rcar_gen3_phy *phy;
+	struct resource *res;
+	void __iomem *base;
+	int error;
+
+	if (!dev->of_node) {
+		dev_err(dev,
+			"This driver must only be instantiated from the device tree\n");
+		return -EINVAL;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	spin_lock_init(&phy->lock);
+
+	phy->base = base;
+
+	/*
+	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
+	 * And then, phy-core will manage runtime pm for this device.
+	 */
+	pm_runtime_enable(dev);
+
+	phy->phy = devm_phy_create(dev, NULL, of_device_get_match_data(dev));
+	if (IS_ERR(phy->phy)) {
+		dev_err(dev, "Failed to create PCIe PHY\n");
+		error = PTR_ERR(phy->phy);
+		goto error;
+	}
+	phy_set_drvdata(phy->phy, phy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider)) {
+		dev_err(dev, "Failed to register PHY provider\n");
+		error = PTR_ERR(provider);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_disable(dev);
+
+	return error;
+}
+
+static int rcar_gen3_phy_pcie_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+};
+
+static struct platform_driver rcar_gen3_phy_driver = {
+	.driver = {
+		.name		= "phy_rcar_gen3_pcie",
+		.of_match_table	= rcar_gen3_phy_pcie_match_table,
+	},
+	.probe	= rcar_gen3_phy_pcie_probe,
+	.remove = rcar_gen3_phy_pcie_remove,
+};
+
+module_platform_driver(rcar_gen3_phy_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas R-Car Gen3 PCIe PHY");
+MODULE_AUTHOR("Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>");
