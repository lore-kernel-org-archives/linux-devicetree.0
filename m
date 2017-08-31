From: Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH V2] clk: qcom: Add spmi_pmic clock divider support
Date: Thu, 31 Aug 2017 16:11:30 +0530
Message-ID: <1504176090-11544-1-git-send-email-tirupath@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, tirupath@codeaurora.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Clkdiv module provides a clock output on the PMIC with CXO as
the source. This clock can be routed through PMIC GPIOs. Add
a device driver to configure this clkdiv module.

Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
---
 .../bindings/clock/clk-spmi-pmic-div.txt           |  49 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-spmi-pmic-div.c               | 327 +++++++++++++++++++++
 include/dt-bindings/clock/spmi_pmic_clk_div.h      |  21 ++
 5 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
 create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
 create mode 100644 include/dt-bindings/clock/spmi_pmic_clk_div.h

diff --git a/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
new file mode 100644
index 0000000..48cb2f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
@@ -0,0 +1,49 @@
+Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
+
+clkdiv configures the clock frequency of a set of outputs on the PMIC.
+These clocks are typically wired through alternate functions on
+gpio pins.
+
+=======================
+Supported Properties
+=======================
+
+- compatible
+	Usage:      required
+	Value type: <string>
+	Definition: should be "qcom,spmi-pmic-clkdiv".
+
+- reg
+	Usage:      required
+	Value type: <prop-encoded-array>
+	Definition: Addresses and sizes for the memory of this CLKDIV
+		    peripheral.
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the xo clock.
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "xo".
+
+=======
+Example
+=======
+
+pm8998_clk_divs: qcom,clkdiv@0 {
+	compatible = "qcom,spmi-pmic-clkdiv";
+	reg = <0x5b00 0x300>;
+	#clock-cells = <1>;
+	clocks = <&xo_board>;
+	clock-names = "xo";
+
+	assigned-clocks = <&pm8998_clk_divs CLKDIV1>,
+			  <&pm8998_clk_divs CLKDIV2>,
+			  <&pm8998_clk_divs CLKDIV3>;
+	assigned-clock-rates = <9600000>,
+			       <9600000>,
+			       <9600000>;
+};
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9f6c278..af5e489 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -196,3 +196,12 @@ config MSM_MMCC_8996
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
+
+config CLOCK_SPMI_PMIC_DIV
+	tristate "spmi pmic clkdiv driver"
+	depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
+	help
+	  This driver supports the clkdiv functionality on the Qualcomm
+	  Technologies, Inc. SPMI PMIC. It configures the frequency of
+	  clkdiv outputs on the PMIC. These clocks are typically wired
+	  through alternate functions on gpio pins.
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 3f3aff2..ee8c91c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -15,6 +15,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_CLOCK_SPMI_PMIC_DIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
new file mode 100644
index 0000000..24461fb
--- /dev/null
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -0,0 +1,327 @@
+/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <dt-bindings/clock/spmi_pmic_clk_div.h>
+
+#define REG_DIV_CTL1			0x43
+#define DIV_CTL1_DIV_FACTOR_MASK	GENMASK(2, 0)
+
+#define REG_EN_CTL			0x46
+#define REG_EN_MASK			BIT(7)
+#define REG_EN_SET			BIT(7)
+
+#define ENABLE_DELAY_NS(cxo_ns, div)	((2 + 3 * div) * cxo_ns)
+#define DISABLE_DELAY_NS(cxo_ns, div)	((3 * div) * cxo_ns)
+
+#define CLK_SPMI_PMIC_DIV_OFFSET	1
+
+#define CLKDIV_XO_DIV_1_0		0
+#define CLKDIV_XO_DIV_1			1
+#define CLKDIV_XO_DIV_2			2
+#define CLKDIV_XO_DIV_4			3
+#define CLKDIV_XO_DIV_8			4
+#define CLKDIV_XO_DIV_16		5
+#define CLKDIV_XO_DIV_32		6
+#define CLKDIV_XO_DIV_64		7
+#define CLKDIV_MAX_ALLOWED		8
+
+struct clkdiv {
+	struct regmap		*regmap;
+	u16			base;
+
+	/* clock properties */
+	struct clk_hw		hw;
+	unsigned int		div_factor;
+	unsigned int		cxo_period_ns;
+};
+
+struct spmi_pmic_div_clk_cc {
+	struct clk_hw	**div_clks;
+	int		nclks;
+};
+
+static inline struct clkdiv *to_clkdiv(struct clk_hw *hw)
+{
+	return container_of(hw, struct clkdiv, hw);
+}
+
+static inline unsigned int div_factor_to_div(unsigned int div_factor)
+{
+	if (div_factor == CLKDIV_XO_DIV_1_0)
+		return 1;
+
+	return 1 << (div_factor - CLK_SPMI_PMIC_DIV_OFFSET);
+}
+
+static inline unsigned int div_to_div_factor(unsigned int div)
+{
+	return ilog2(div) + CLK_SPMI_PMIC_DIV_OFFSET;
+}
+
+static bool is_spmi_pmic_clkdiv_enabled(struct clkdiv *clkdiv)
+{
+	unsigned int val = 0;
+
+	regmap_read(clkdiv->regmap, clkdiv->base + REG_EN_CTL,
+			 &val);
+	return ((val & REG_EN_MASK) == REG_EN_SET) ? true : false;
+}
+
+static int spmi_pmic_clkdiv_set_enable_state(struct clkdiv *clkdiv,
+			bool enable_state)
+{
+	int rc;
+
+	rc = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_EN_CTL,
+				REG_EN_MASK,
+				(enable_state == true) ? REG_EN_SET : 0);
+	if (rc)
+		return rc;
+
+	if (enable_state == true)
+		ndelay(ENABLE_DELAY_NS(clkdiv->cxo_period_ns,
+				div_factor_to_div(clkdiv->div_factor)));
+	else
+		ndelay(DISABLE_DELAY_NS(clkdiv->cxo_period_ns,
+				div_factor_to_div(clkdiv->div_factor)));
+
+	return rc;
+}
+
+static int spmi_pmic_clkdiv_config_freq_div(struct clkdiv *clkdiv,
+			unsigned int div)
+{
+	unsigned int div_factor;
+	bool enabled;
+	int rc;
+
+	div_factor = div_to_div_factor(div);
+	if (div_factor <= 0 || div_factor >= CLKDIV_MAX_ALLOWED)
+		return -EINVAL;
+
+	enabled = is_spmi_pmic_clkdiv_enabled(clkdiv);
+	if (enabled) {
+		rc = spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
+		if (rc)
+			return rc;
+	}
+
+	rc = regmap_update_bits(clkdiv->regmap,
+				clkdiv->base + REG_DIV_CTL1,
+				DIV_CTL1_DIV_FACTOR_MASK, div_factor);
+	if (rc)
+		return rc;
+
+	clkdiv->div_factor = div_factor;
+
+	if (enabled)
+		rc = spmi_pmic_clkdiv_set_enable_state(clkdiv, true);
+
+	return rc;
+}
+
+static int clk_spmi_pmic_div_enable(struct clk_hw *hw)
+{
+	struct clkdiv *clkdiv = to_clkdiv(hw);
+
+	return spmi_pmic_clkdiv_set_enable_state(clkdiv, true);
+}
+
+static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
+{
+	struct clkdiv *clkdiv = to_clkdiv(hw);
+
+	spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
+}
+
+static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *parent_rate)
+{
+	unsigned long new_rate;
+	unsigned int div, div_factor;
+
+	div = DIV_ROUND_UP(*parent_rate, rate);
+	div_factor = div_to_div_factor(div);
+	if (div_factor >= CLKDIV_MAX_ALLOWED)
+		div_factor = CLKDIV_MAX_ALLOWED - 1;
+	new_rate = *parent_rate / div_factor_to_div(div_factor);
+
+	return new_rate;
+}
+
+static unsigned long clk_spmi_pmic_div_recalc_rate(struct clk_hw *hw,
+			unsigned long parent_rate)
+{
+	struct clkdiv *clkdiv = to_clkdiv(hw);
+	unsigned long rate;
+
+	rate = parent_rate / div_factor_to_div(clkdiv->div_factor);
+
+	return rate;
+}
+
+static int clk_spmi_pmic_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long parent_rate)
+{
+	struct clkdiv *clkdiv = to_clkdiv(hw);
+	int rc = 0;
+
+	rc = spmi_pmic_clkdiv_config_freq_div(clkdiv, parent_rate / rate);
+
+	return rc;
+}
+
+static const struct clk_ops clk_spmi_pmic_div_ops = {
+	.enable = clk_spmi_pmic_div_enable,
+	.disable = clk_spmi_pmic_div_disable,
+	.set_rate = clk_spmi_pmic_div_set_rate,
+	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
+	.round_rate = clk_spmi_pmic_div_round_rate,
+};
+
+static struct clk_hw *spmi_pmic_div_clk_hw_get(struct of_phandle_args *clkspec,
+				      void *data)
+{
+	struct spmi_pmic_div_clk_cc *clk_cc = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= clk_cc->nclks) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_cc->div_clks[idx];
+}
+
+#define SPMI_PMIC_DIV_CLK_ADDRESS_RANGE	0x100
+#define SPMI_PMIC_DIV_CLK_ID_OFFSET	1
+
+static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
+{
+	struct spmi_pmic_div_clk_cc *clk_cc;
+	struct clk_init_data init = {0};
+	struct clkdiv *clkdiv;
+	struct clk *cxo;
+	struct regmap *regmap;
+	struct device *dev = &pdev->dev;
+	const char *parent_name;
+	int nclks, i, rc, cxo_hz;
+	u32 reg[2], start, size;
+
+	rc = of_property_read_u32_array(dev->of_node, "reg", reg, 2);
+	if (rc < 0) {
+		dev_err(dev, "reg property reading failed\n");
+		return rc;
+	}
+	start = reg[0];
+	size = reg[1];
+
+	nclks = size / SPMI_PMIC_DIV_CLK_ADDRESS_RANGE;
+	if (nclks == 0) {
+		dev_err(dev, "no div clocks assigned\n");
+		return -ENODEV;
+	}
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap) {
+		dev_err(dev, "Couldn't get parent's regmap\n");
+		return -EINVAL;
+	}
+
+	clkdiv = devm_kcalloc(dev, nclks, sizeof(*clkdiv), GFP_KERNEL);
+	if (!clkdiv)
+		return -ENOMEM;
+
+	clk_cc = devm_kzalloc(&pdev->dev, sizeof(*clk_cc), GFP_KERNEL);
+	if (!clk_cc)
+		return -ENOMEM;
+
+	clk_cc->div_clks = devm_kcalloc(&pdev->dev, nclks,
+					sizeof(*clk_cc->div_clks), GFP_KERNEL);
+	if (!clk_cc->div_clks)
+		return -ENOMEM;
+
+	/* Read parent clock rate */
+	cxo = of_clk_get(dev->of_node, 0);
+	if (IS_ERR(cxo)) {
+		rc = PTR_ERR(cxo);
+		if (rc != -EPROBE_DEFER)
+			dev_err(dev, "failed to get xo clock");
+		return rc;
+	}
+	cxo_hz = clk_get_rate(cxo);
+	clk_put(cxo);
+
+	parent_name = of_clk_get_parent_name(dev->of_node, 0);
+	if (!parent_name) {
+		dev_err(dev, "missing parent clock\n");
+		return -ENODEV;
+	}
+	dev_dbg(dev, "parent is: %s\n", parent_name);
+
+	init.parent_names = &parent_name;
+	init.num_parents = parent_name ? 1 : 0;
+	init.ops = &clk_spmi_pmic_div_ops;
+	init.flags = 0;
+
+	for (i = 0; i < nclks; i++) {
+		clkdiv[i].base = start + i * SPMI_PMIC_DIV_CLK_ADDRESS_RANGE;
+		clkdiv[i].regmap = regmap;
+		clkdiv[i].cxo_period_ns = NSEC_PER_SEC / cxo_hz;
+		init.name = kasprintf(GFP_KERNEL, "div_clk%d",
+				     i + SPMI_PMIC_DIV_CLK_ID_OFFSET);
+		clkdiv[i].hw.init = &init;
+		rc = devm_clk_hw_register(dev, &clkdiv[i].hw);
+		if (rc)
+			return rc;
+
+		clk_cc->div_clks[i] = &clkdiv[i].hw;
+		kfree(init.name); /* clock framework made a copy of the name */
+	}
+
+	clk_cc->nclks = nclks;
+	rc = of_clk_add_hw_provider(pdev->dev.of_node, spmi_pmic_div_clk_hw_get,
+				    clk_cc);
+	return rc;
+}
+
+static const struct of_device_id spmi_pmic_clkdiv_match_table[] = {
+	{ .compatible = "qcom,spmi-pmic-clkdiv" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, spmi_pmic_clkdiv_match_table);
+
+static struct platform_driver spmi_pmic_clkdiv_driver = {
+	.driver		= {
+		.name	= "qcom,spmi-pmic-clkdiv",
+		.of_match_table = spmi_pmic_clkdiv_match_table,
+	},
+	.probe		= spmi_pmic_clkdiv_probe,
+};
+module_platform_driver(spmi_pmic_clkdiv_driver);
+
+MODULE_DESCRIPTION("spmi pmic clkdiv driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/dt-bindings/clock/spmi_pmic_clk_div.h b/include/dt-bindings/clock/spmi_pmic_clk_div.h
new file mode 100644
index 0000000..25d035d
--- /dev/null
+++ b/include/dt-bindings/clock/spmi_pmic_clk_div.h
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_SPMI_PMIC_CLK_DIV_H
+#define _DT_BINDINGS_SPMI_PMIC_CLK_DIV_H
+
+#define CLKDIV1		0
+#define CLKDIV2		1
+#define CLKDIV3		2
+
+#endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
