From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH] phy: nop: Add a new phy driver for No-Op transceiver
Date: Tue,  4 Oct 2016 16:13:37 +0530
Message-ID: <1475577817-28500-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vivek.gautam@codeaurora.org, Felipe Balbi <balbi@kernel.org>
List-Id: devicetree@vger.kernel.org

No-Op phy transceiver can be used on platforms that have
controllers which themselves provide PHY functionality and
there's no separate PHY controller available.

This driver provides a basic skeleton for a nop-phy driver.
This can be further extended to add required features.

Inspired by phy-generic driver in drivers/usb/phy.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Felipe Balbi <balbi@kernel.org>
---

Hi Kishon, Felipe,

This patch has been lying in my tree for sometime.
This introduces a skeletal nop-phy driver based on generic
phy framework.
I mainly use this driver when I have only one phy driver available
for testing for a controller that uses more than one phy.

But this can be further extended to add any feature support for
controllers that don't have a separate PHY controller and that
themselves provide the PHY functionality, a purpose similar
to what drivers/usb/phy/phy-generic.c driver serves.

Do you think we have a requirement for such a driver in the generic
phy layer? I hope this driver can do some good.
Let me know your comments on this.

Thanks
Vivek

 Documentation/devicetree/bindings/phy/phy-nop.txt |  22 +++
 drivers/phy/Kconfig                               |  10 ++
 drivers/phy/Makefile                              |   1 +
 drivers/phy/phy-nop.c                             | 193 ++++++++++++++++++++++
 4 files changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-nop.txt
 create mode 100644 drivers/phy/phy-nop.c

diff --git a/Documentation/devicetree/bindings/phy/phy-nop.txt b/Documentation/devicetree/bindings/phy/phy-nop.txt
new file mode 100644
index 0000000..6cb6779
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-nop.txt
@@ -0,0 +1,22 @@
+Generic No-Op PHY
+-----------------
+
+Required properties:
+ - compatible: compatible list, contains "phy-nop".
+ - #phy-cells: must be 0.
+
+Optional properties:
+ - clocks: a list of phandles and clock-specifier pairs,
+	   one for each entry in clock-names.
+ - clock-names: must be "main_clk" for phy core clock,
+			"ref_clk" for phy reference clk.
+ - resets: a list of phandles and reset controller specifier pairs,
+	   one for each entry in reset-names.
+ - reset-names: must be	"phy" for reset of phy block.
+ - vdd-supply: Phandle to a regulator supply to PHY core block.
+
+Example:
+	phy_nop: phy_nop {
+		compatible = "phy-nop";
+		#phy-cells = <0>;
+	};
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index fe00f91..1923c4f 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -489,4 +489,14 @@ config PHY_NS2_PCIE
 	help
 	  Enable this to support the Broadcom Northstar2 PCIe PHY.
 	  If unsure, say N.
+
+config PHY_NOP
+	tristate "No-Operation PHY transceiver driver"
+	depends on OF || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Enable this to support the generic no-operation PHY
+	  transeiver. This driver can be used with consumers
+	  requiring a no-op phy for few of the handlers.
+
 endmenu
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a534cf5..d6e0e60 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_CYGNUS_PCIE)		+= phy-bcm-cygnus-pcie.o
 obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_PHY_NS2_PCIE)		+= phy-bcm-ns2-pcie.o
+obj-$(CONFIG_PHY_NOP)			+= phy-nop.o
diff --git a/drivers/phy/phy-nop.c b/drivers/phy/phy-nop.c
new file mode 100644
index 0000000..cab01a1
--- /dev/null
+++ b/drivers/phy/phy-nop.c
@@ -0,0 +1,193 @@
+/*
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+/**
+ * struct phy_nop:- structure holding NOP PHY attributes.
+ *
+ * @dev: pointer to device.
+ * @phy: pointer to generic phy.
+ * @clk: pointer to phy clock.
+ * @refclk: pointer to phy reference clock.
+ * @vdd: vdd supply to the phy core block.
+ * @rst: pointer to reset controller for the phy block.
+ */
+struct phy_nop {
+	struct device *dev;
+	struct phy *phy;
+	struct clk *clk;
+	struct clk *refclk;
+	struct regulator *vdd;
+	struct reset_control *rst;
+};
+
+static int phy_nop_poweron(struct phy *generic_phy)
+{
+	struct phy_nop *phy = phy_get_drvdata(generic_phy);
+	int ret = 0;
+
+	if (phy->vdd) {
+		ret = regulator_enable(phy->vdd);
+		if (ret) {
+			dev_err(phy->dev, "vdd enable failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (phy->clk) {
+		ret = clk_prepare_enable(phy->clk);
+		if (ret) {
+			dev_err(phy->dev, "main clk enable failed: %d\n", ret);
+			goto err_clk;
+		}
+	}
+
+	if (phy->refclk) {
+		ret = clk_prepare_enable(phy->refclk);
+		if (ret) {
+			dev_err(phy->dev, "ref clk enable failed: %d\n", ret);
+			goto err_refclk;
+		}
+	}
+
+	if (phy->rst) {
+		ret = reset_control_deassert(phy->rst);
+		if (ret) {
+			dev_err(phy->dev, "phy reset deassert failed\n");
+			goto err_rst;
+		}
+	}
+
+	return 0;
+
+err_rst:
+	clk_disable_unprepare(phy->refclk);
+err_refclk:
+	clk_disable_unprepare(phy->clk);
+err_clk:
+	regulator_disable(phy->vdd);
+	return ret;
+}
+
+static int phy_nop_poweroff(struct phy *generic_phy)
+{
+	struct phy_nop *phy = phy_get_drvdata(generic_phy);
+
+	if (phy->rst)
+		reset_control_assert(phy->rst);
+
+	if (phy->clk)
+		clk_disable_unprepare(phy->clk);
+	if (phy->refclk)
+		clk_disable_unprepare(phy->refclk);
+
+	if (phy->vdd)
+		regulator_disable(phy->vdd);
+
+	return 0;
+}
+
+static const struct phy_ops phy_nop_gen_ops = {
+	.power_on	= phy_nop_poweron,
+	.power_off	= phy_nop_poweroff,
+	.owner		= THIS_MODULE,
+};
+
+static int phy_nop_probe(struct platform_device *pdev)
+{
+	struct phy_nop *phy;
+	struct phy *generic_phy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	int ret = 0;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+	phy->dev = dev;
+
+	/* XXX: Do we need to request any clocks ? */
+	phy->clk = devm_clk_get(dev, "main_clk");
+	if (IS_ERR(phy->clk)) {
+		dev_dbg(dev, "failed to get main_clk: %ld\n",
+						PTR_ERR(phy->clk));
+		phy->clk = NULL;
+	}
+	phy->refclk = devm_clk_get(dev, "ref_clk");
+	if (IS_ERR(phy->refclk)) {
+		dev_dbg(dev, "failed to get ref_clk: %ld\n",
+						PTR_ERR(phy->refclk));
+		phy->refclk = NULL;
+	}
+
+	/* XXX: Do we need to request any regulators ? */
+	phy->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(phy->vdd)) {
+		dev_dbg(dev, "failed to get vdd for phy: %ld\n",
+						PTR_ERR(phy->vdd));
+		phy->vdd = NULL;
+	}
+
+	/* XXX: Do we need to request any phy-reset ? */
+	phy->rst = devm_reset_control_get(dev, "phy");
+	if (IS_ERR(phy->rst)) {
+		dev_dbg(dev, "failed to get phy core reset: %ld\n",
+						PTR_ERR(phy->rst));
+		phy->rst = NULL;
+	}
+
+	generic_phy = devm_phy_create(dev, NULL, &phy_nop_gen_ops);
+	if (IS_ERR(generic_phy)) {
+		ret = PTR_ERR(generic_phy);
+		dev_err(dev, "failed to create generic phy %d\n", ret);
+		return ret;
+	}
+	phy->phy = generic_phy;
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		dev_err(dev, "failed to register phy %d\n", ret);
+	}
+
+	return ret;
+}
+
+static const struct of_device_id phy_nop_id_table[] = {
+	{
+		.compatible = "phy-nop",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, phy_nop_id_table);
+
+static struct platform_driver phy_nop_driver = {
+	.probe		= phy_nop_probe,
+	.driver = {
+		.name	= "phy_nop",
+		.of_match_table = of_match_ptr(phy_nop_id_table),
+	},
+};
+
+module_platform_driver(phy_nop_driver);
+
+MODULE_DESCRIPTION("Generic No-op PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
