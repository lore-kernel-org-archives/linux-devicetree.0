From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Fri,  7 Dec 2018 10:55:58 +0100
Message-ID: <1544176558-7946-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

Driver to control the Synopsys SS PHY 1.0.0 implemeneted in QCS404

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original code.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/Kconfig           |  11 ++
 drivers/phy/qualcomm/Makefile          |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c | 340 +++++++++++++++++++++++++++++++++
 3 files changed, 352 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c7b5ee8..35a5a67 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -92,3 +92,14 @@ config PHY_QCOM_USB_HS_SNPS_28NM
 	  Enable this to support the Synopsys 28nm Femto USB PHY on Qualcomm
 	  chips. This driver supports the high-speed PHY which is usually
 	  paired with either the ChipIdea or Synopsys DWC3 USB IPs on MSM SOCs.
+
+config PHY_QCOM_USB_SS
+	tristate "Qualcomm USB SS PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
+	select GENERIC_PHY
+	help
+	  Enable this to support the Super-Speed USB transceiver on Qualcomm
+	  chips. This driver supports the PHY which uses the QSCRATCH-based
+	  register set for its control sequences, normally paired with newer
+	  DWC3-based Super-Speed controllers on Qualcomm SoCs.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index dc238d9..7149261 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_USB_HS_SNPS_28NM)	+= phy-qcom-usb-hs-snsp-28nm.o
+obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
new file mode 100644
index 0000000..7b6a55e
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2012-2014,2017 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#define PHY_CTRL0			0x6C
+#define PHY_CTRL1			0x70
+#define PHY_CTRL2			0x74
+#define PHY_CTRL4			0x7C
+
+/* PHY_CTRL bits */
+#define REF_PHY_EN			BIT(0)
+#define LANE0_PWR_ON			BIT(2)
+#define SWI_PCS_CLK_SEL			BIT(4)
+#define TST_PWR_DOWN			BIT(4)
+#define PHY_RESET			BIT(7)
+
+enum phy_vdd_level { LEVEL_NONE, LEVEL_MIN, LEVEL_MAX, LEVEL_NUM, };
+
+struct ssphy_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct reset_control *reset_com;
+	struct reset_control *reset_phy;
+	struct clk *clk_ref;
+	struct clk *clk_phy;
+	struct clk *clk_pipe;
+	struct regulator *vdda1p8;
+	struct regulator *vbus;
+	struct regulator *vdd;
+	unsigned int vdd_levels[LEVEL_NUM];
+};
+
+static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u32 val)
+{
+	writel((readl(addr) & ~mask) | val, addr);
+}
+
+static int qcom_ssphy_config_vdd(struct ssphy_priv *priv,
+				 enum phy_vdd_level level)
+{
+	return regulator_set_voltage(priv->vdd,
+				     priv->vdd_levels[level],
+				     priv->vdd_levels[LEVEL_MAX]);
+}
+
+static int qcom_ssphy_ldo_enable(struct ssphy_priv *priv)
+{
+	int ret;
+
+	ret = regulator_set_load(priv->vdda1p8, 23000);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to set regulator1p8 load\n");
+		return ret;
+	}
+
+	ret = regulator_set_voltage(priv->vdda1p8, 1800000, 1800000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set regulator1p8 voltage\n");
+		goto put_vdda1p8_lpm;
+	}
+
+	ret = regulator_enable(priv->vdda1p8);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable regulator1p8\n");
+		goto unset_vdda1p8;
+	}
+
+	return ret;
+
+	/* rollback regulator changes */
+
+unset_vdda1p8:
+	regulator_set_voltage(priv->vdda1p8, 0, 1800000);
+
+put_vdda1p8_lpm:
+	regulator_set_load(priv->vdda1p8, 0);
+
+	return ret;
+}
+
+static void qcom_ssphy_ldo_disable(struct ssphy_priv *priv)
+{
+	regulator_disable(priv->vdda1p8);
+	regulator_set_voltage(priv->vdda1p8, 0, 1800000);
+	regulator_set_load(priv->vdda1p8, 0);
+}
+
+static int qcom_ssphy_power_on(struct phy *phy)
+{
+	struct ssphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	if (!priv->vbus)
+		goto config;
+
+	ret = regulator_enable(priv->vbus);
+	if (ret)
+		return ret;
+config:
+	ret = qcom_ssphy_config_vdd(priv, LEVEL_MIN);
+	if (ret) {
+		dev_err(priv->dev, "Failed to config vdd on\n");
+		goto err;
+	}
+
+	ret = qcom_ssphy_ldo_enable(priv);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable LDO\n");
+		goto err1;
+	}
+
+	ret = clk_prepare_enable(priv->clk_ref);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable the reference clock\n");
+		goto err1;
+	}
+
+	ret = clk_prepare_enable(priv->clk_phy);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable the phy clock\n");
+		goto err2;
+	}
+
+	ret = clk_prepare_enable(priv->clk_pipe);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable the pipe clock\n");
+		goto err3;
+	}
+
+	if (priv->reset_com && priv->reset_phy) {
+		ret = reset_control_assert(priv->reset_com);
+		if (ret) {
+			dev_err(priv->dev, "Failed to assert reset com\n");
+			goto err4;
+		}
+
+		ret = reset_control_assert(priv->reset_phy);
+		if (ret) {
+			dev_err(priv->dev, "Failed to assert reset phy\n");
+			goto err4;
+		}
+
+		usleep_range(10, 20);
+
+		ret = reset_control_deassert(priv->reset_com);
+		if (ret) {
+			dev_err(priv->dev, "Failed to deassert reset com\n");
+			goto err4;
+		}
+
+		ret = reset_control_deassert(priv->reset_phy);
+		if (ret) {
+			dev_err(priv->dev, "Failed to deassert reset phy\n");
+			goto err4;
+		}
+
+		goto power_on;
+	}
+
+	qcom_ssphy_updatel(priv->base + PHY_CTRL1, PHY_RESET, PHY_RESET);
+	usleep_range(10, 20);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL1, PHY_RESET, 0);
+
+power_on:
+	writeb(SWI_PCS_CLK_SEL, priv->base + PHY_CTRL0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, LANE0_PWR_ON);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, REF_PHY_EN);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, 0);
+
+	return 0;
+
+err4:
+	clk_disable_unprepare(priv->clk_ref);
+err3:
+	clk_disable_unprepare(priv->clk_phy);
+err2:
+	clk_disable_unprepare(priv->clk_ref);
+err1:
+	qcom_ssphy_config_vdd(priv, LEVEL_NONE);
+err:
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
+	return ret;
+}
+
+static int qcom_ssphy_power_off(struct phy *phy)
+{
+	struct ssphy_priv *priv = phy_get_drvdata(phy);
+
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, 0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, 0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, TST_PWR_DOWN);
+
+	clk_disable_unprepare(priv->clk_pipe);
+	clk_disable_unprepare(priv->clk_phy);
+	clk_disable_unprepare(priv->clk_ref);
+
+	qcom_ssphy_ldo_disable(priv);
+	qcom_ssphy_config_vdd(priv, LEVEL_NONE);
+
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_ssphy_ops = {
+	.power_off = qcom_ssphy_power_off,
+	.power_on = qcom_ssphy_power_on,
+	.owner = THIS_MODULE,
+};
+
+static int qcom_ssphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct ssphy_priv *priv;
+	struct resource *res;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct ssphy_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk_ref = devm_clk_get(dev, "ref");
+	if (IS_ERR(priv->clk_ref)) {
+		dev_err(dev, "Failed to get the reference clock\n");
+		return PTR_ERR(priv->clk_ref);
+	}
+
+	priv->clk_phy = devm_clk_get(dev, "phy");
+	if (IS_ERR(priv->clk_phy)) {
+		dev_err(dev, "Failed to get the phy clock\n");
+		return PTR_ERR(priv->clk_phy);
+	}
+
+	priv->clk_pipe = devm_clk_get(dev, "pipe");
+	if (IS_ERR(priv->clk_pipe)) {
+		dev_err(dev, "Failed to get the pipe clock\n");
+		return PTR_ERR(priv->clk_pipe);
+	}
+
+	priv->reset_com = devm_reset_control_get_optional(dev, "com");
+	if (IS_ERR(priv->reset_com)) {
+		dev_err(dev, "Failed to get reset control com\n");
+		return PTR_ERR(priv->reset_com);
+	}
+
+	if (priv->reset_com) {
+		/* if reset_com is present, reset_phy is no longer optional */
+		priv->reset_phy = devm_reset_control_get(dev, "phy");
+		if (IS_ERR(priv->reset_phy)) {
+			dev_err(dev, "Failed to get reset control phy\n");
+			return PTR_ERR(priv->reset_phy);
+		}
+	}
+
+	priv->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(priv->vdd)) {
+		dev_err(dev, "Failed to get the vdd regulator\n");
+		return PTR_ERR(priv->vdd);
+	}
+
+	priv->vdda1p8 = devm_regulator_get(dev, "vdda1p8");
+	if (IS_ERR(priv->vdda1p8)) {
+		dev_err(dev, "Failed to get the vdda1p8 regulator\n");
+		return PTR_ERR(priv->vdda1p8);
+	}
+
+	ret = of_property_read_u32_array(dev->of_node,
+					 "qcom,vdd-voltage-level",
+					 priv->vdd_levels,
+					 ARRAY_SIZE(priv->vdd_levels));
+	if (ret) {
+		dev_err(dev, "Failed to read qcom,vdd-voltage-level\n");
+		return ret;
+	}
+
+	priv->vbus = devm_regulator_get_optional(dev, "vbus");
+	if (IS_ERR(priv->vbus)) {
+		if (PTR_ERR(priv->vbus) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		priv->vbus = NULL;
+	}
+
+	phy = devm_phy_create(dev, dev->of_node, &qcom_ssphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "Failed to create the ss phy\n");
+		return PTR_ERR(phy);
+	}
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id qcom_ssphy_match[] = {
+	{ .compatible = "qcom,usb-ssphy", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_ssphy_match);
+
+static struct platform_driver qcom_ssphy_driver = {
+	.probe		= qcom_ssphy_probe,
+	.driver = {
+		.name	= "qcom_usb_ssphy",
+		.of_match_table = qcom_ssphy_match,
+	},
+};
+module_platform_driver(qcom_ssphy_driver);
+
+MODULE_DESCRIPTION("Qualcomm Super-Speed USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
