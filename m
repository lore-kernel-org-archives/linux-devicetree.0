Return-Path: <SRS0=NsZW=QG=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v7 5/6] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
Date: Wed, 30 Jan 2019 11:41:27 +0000
Message-ID: <20190130114128.21083-5-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

The Lochnagar can take several input clocks from the host system,
provides several of its own clock sources, and provides extensive
routing options for those clocks to be supplied to the attached
CODEC/Amp device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v6.

Thanks,
Charles

 drivers/clk/Kconfig         |   7 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-lochnagar.c | 340 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 drivers/clk/clk-lochnagar.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e5b2fe80eab43..a5cb8f923674d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -219,6 +219,13 @@ config COMMON_CLK_XGENE
 	---help---
 	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
 
+config COMMON_CLK_LOCHNAGAR
+	tristate "Cirrus Logic Lochnagar clock driver"
+	depends on MFD_LOCHNAGAR
+	help
+	  This driver supports the clocking features of the Cirrus Logic
+	  Lochnagar audio development board.
+
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8a9440a975004..7101d3da5efdb 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
+obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
new file mode 100644
index 0000000000000..ced832e82f46b
--- /dev/null
+++ b/drivers/clk/clk-lochnagar.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Lochnagar clock control
+ *
+ * Copyright (c) 2017-2018 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.cirrus.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/lochnagar.h>
+#include <linux/mfd/lochnagar1_regs.h>
+#include <linux/mfd/lochnagar2_regs.h>
+
+#include <dt-bindings/clk/lochnagar.h>
+
+#define LOCHNAGAR_NUM_CLOCKS	(LOCHNAGAR_SPDIF_CLKOUT + 1)
+
+struct lochnagar_clk {
+	const char * const name;
+	struct clk_hw hw;
+
+	struct lochnagar_clk_priv *priv;
+
+	u16 cfg_reg;
+	u16 ena_mask;
+
+	u16 src_reg;
+	u16 src_mask;
+};
+
+struct lochnagar_clk_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	enum lochnagar_type type;
+
+	const char **parents;
+	unsigned int nparents;
+
+	struct lochnagar_clk lclks[LOCHNAGAR_NUM_CLOCKS];
+};
+
+static const char * const lochnagar1_clk_parents[] = {
+	"ln-none",
+	"ln-spdif-mclk",
+	"ln-psia1-mclk",
+	"ln-psia2-mclk",
+	"ln-cdc-clkout",
+	"ln-dsp-clkout",
+	"ln-pmic-32k",
+	"ln-gf-mclk1",
+	"ln-gf-mclk3",
+	"ln-gf-mclk2",
+	"ln-gf-mclk4",
+};
+
+static const char * const lochnagar2_clk_parents[] = {
+	"ln-none",
+	"ln-cdc-clkout",
+	"ln-dsp-clkout",
+	"ln-pmic-32k",
+	"ln-spdif-mclk",
+	"ln-clk-12m",
+	"ln-clk-11m",
+	"ln-clk-24m",
+	"ln-clk-22m",
+	"ln-clk-8m",
+	"ln-usb-clk-24m",
+	"ln-gf-mclk1",
+	"ln-gf-mclk3",
+	"ln-gf-mclk2",
+	"ln-psia1-mclk",
+	"ln-psia2-mclk",
+	"ln-spdif-clkout",
+	"ln-adat-mclk",
+	"ln-usb-clk-12m",
+};
+
+#define LN1_CLK(ID, NAME, REG) \
+	[LOCHNAGAR_##ID] = { \
+		.name = NAME, \
+		.cfg_reg = LOCHNAGAR1_##REG, \
+		.ena_mask = LOCHNAGAR1_##ID##_ENA_MASK, \
+		.src_reg = LOCHNAGAR1_##ID##_SEL, \
+		.src_mask = LOCHNAGAR1_SRC_MASK, \
+	}
+
+#define LN2_CLK(ID, NAME) \
+	[LOCHNAGAR_##ID] = { \
+		.name = NAME, \
+		.cfg_reg = LOCHNAGAR2_##ID##_CTRL, \
+		.src_reg = LOCHNAGAR2_##ID##_CTRL, \
+		.ena_mask = LOCHNAGAR2_CLK_ENA_MASK, \
+		.src_mask = LOCHNAGAR2_CLK_SRC_MASK, \
+	}
+
+static const struct lochnagar_clk lochnagar1_clks[LOCHNAGAR_NUM_CLOCKS] = {
+	LN1_CLK(CDC_MCLK1,      "ln-cdc-mclk1",  CDC_AIF_CTRL2),
+	LN1_CLK(CDC_MCLK2,      "ln-cdc-mclk2",  CDC_AIF_CTRL2),
+	LN1_CLK(DSP_CLKIN,      "ln-dsp-clkin",  DSP_AIF),
+	LN1_CLK(GF_CLKOUT1,     "ln-gf-clkout1", GF_AIF1),
+};
+
+static const struct lochnagar_clk lochnagar2_clks[LOCHNAGAR_NUM_CLOCKS] = {
+	LN2_CLK(CDC_MCLK1,      "ln-cdc-mclk1"),
+	LN2_CLK(CDC_MCLK2,      "ln-cdc-mclk2"),
+	LN2_CLK(DSP_CLKIN,      "ln-dsp-clkin"),
+	LN2_CLK(GF_CLKOUT1,     "ln-gf-clkout1"),
+	LN2_CLK(GF_CLKOUT2,     "ln-gf-clkout2"),
+	LN2_CLK(PSIA1_MCLK,     "ln-psia1-mclk"),
+	LN2_CLK(PSIA2_MCLK,     "ln-psia2-mclk"),
+	LN2_CLK(SPDIF_MCLK,     "ln-spdif-mclk"),
+	LN2_CLK(ADAT_MCLK,      "ln-adat-mclk"),
+	LN2_CLK(SOUNDCARD_MCLK, "ln-soundcard-mclk"),
+};
+
+static inline struct lochnagar_clk *lochnagar_hw_to_lclk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lochnagar_clk, hw);
+}
+
+static int lochnagar_clk_prepare(struct clk_hw *hw)
+{
+	struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
+	struct lochnagar_clk_priv *priv = lclk->priv;
+	struct regmap *regmap = priv->regmap;
+	int ret;
+
+	ret = regmap_update_bits(regmap, lclk->cfg_reg,
+				 lclk->ena_mask, lclk->ena_mask);
+	if (ret < 0)
+		dev_dbg(priv->dev, "Failed to prepare %s: %d\n",
+			lclk->name, ret);
+
+	return ret;
+}
+
+static void lochnagar_clk_unprepare(struct clk_hw *hw)
+{
+	struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
+	struct lochnagar_clk_priv *priv = lclk->priv;
+	struct regmap *regmap = priv->regmap;
+	int ret;
+
+	ret = regmap_update_bits(regmap, lclk->cfg_reg, lclk->ena_mask, 0);
+	if (ret < 0)
+		dev_dbg(priv->dev, "Failed to unprepare %s: %d\n",
+			lclk->name, ret);
+}
+
+static int lochnagar_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
+	struct lochnagar_clk_priv *priv = lclk->priv;
+	struct regmap *regmap = priv->regmap;
+	int ret;
+
+	ret = regmap_update_bits(regmap, lclk->src_reg, lclk->src_mask, index);
+	if (ret < 0)
+		dev_dbg(priv->dev, "Failed to reparent %s: %d\n",
+			lclk->name, ret);
+
+	return ret;
+}
+
+static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
+{
+	struct lochnagar_clk *lclk = lochnagar_hw_to_lclk(hw);
+	struct lochnagar_clk_priv *priv = lclk->priv;
+	struct regmap *regmap = priv->regmap;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, lclk->src_reg, &val);
+	if (ret < 0) {
+		dev_dbg(priv->dev, "Failed to read parent of %s: %d\n",
+			lclk->name, ret);
+		return priv->nparents;
+	}
+
+	val &= lclk->src_mask;
+
+	return val;
+}
+
+static const struct clk_ops lochnagar_clk_ops = {
+	.prepare = lochnagar_clk_prepare,
+	.unprepare = lochnagar_clk_unprepare,
+	.set_parent = lochnagar_clk_set_parent,
+	.get_parent = lochnagar_clk_get_parent,
+};
+
+static int lochnagar_init_parents(struct lochnagar_clk_priv *priv)
+{
+	struct device_node *np = priv->dev->of_node;
+	int i, j;
+
+	switch (priv->type) {
+	case LOCHNAGAR1:
+		memcpy(priv->lclks, lochnagar1_clks, sizeof(lochnagar1_clks));
+
+		priv->nparents = ARRAY_SIZE(lochnagar1_clk_parents);
+		priv->parents = devm_kmemdup(priv->dev, lochnagar1_clk_parents,
+					     sizeof(lochnagar1_clk_parents),
+					     GFP_KERNEL);
+		break;
+	case LOCHNAGAR2:
+		memcpy(priv->lclks, lochnagar2_clks, sizeof(lochnagar2_clks));
+
+		priv->nparents = ARRAY_SIZE(lochnagar2_clk_parents);
+		priv->parents = devm_kmemdup(priv->dev, lochnagar2_clk_parents,
+					     sizeof(lochnagar2_clk_parents),
+					     GFP_KERNEL);
+		break;
+	default:
+		dev_err(priv->dev, "Unknown Lochnagar type: %d\n", priv->type);
+		return -EINVAL;
+	}
+
+	if (!priv->parents)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->nparents; i++) {
+		j = of_property_match_string(np, "clock-names",
+					     priv->parents[i]);
+		if (j >= 0)
+			priv->parents[i] = of_clk_get_parent_name(np, j);
+	}
+
+	return 0;
+}
+
+static struct clk_hw *
+lochnagar_of_clk_hw_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct lochnagar_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= ARRAY_SIZE(priv->lclks)) {
+		dev_err(priv->dev, "Invalid index %u\n", idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &priv->lclks[idx].hw;
+}
+
+static int lochnagar_init_clks(struct lochnagar_clk_priv *priv)
+{
+	struct clk_init_data clk_init = {
+		.ops = &lochnagar_clk_ops,
+		.parent_names = priv->parents,
+		.num_parents = priv->nparents,
+	};
+	struct lochnagar_clk *lclk;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(priv->lclks); i++) {
+		lclk = &priv->lclks[i];
+
+		if (!lclk->name)
+			continue;
+
+		clk_init.name = lclk->name;
+
+		lclk->priv = priv;
+		lclk->hw.init = &clk_init;
+
+		ret = devm_clk_hw_register(priv->dev, &lclk->hw);
+		if (ret) {
+			dev_err(priv->dev, "Failed to register %s: %d\n",
+				lclk->name, ret);
+			return ret;
+		}
+	}
+
+	ret = devm_of_clk_add_hw_provider(priv->dev, lochnagar_of_clk_hw_get,
+					  priv);
+	if (ret < 0)
+		dev_err(priv->dev, "Failed to register provider: %d\n", ret);
+
+	return ret;
+}
+
+static const struct of_device_id lochnagar_of_match[] = {
+	{ .compatible = "cirrus,lochnagar1-clk", .data = (void *)LOCHNAGAR1 },
+	{ .compatible = "cirrus,lochnagar2-clk", .data = (void *)LOCHNAGAR2 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lochnagar_of_match);
+
+static int lochnagar_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lochnagar_clk_priv *priv;
+	const struct of_device_id *of_id;
+	int ret;
+
+	of_id = of_match_device(lochnagar_of_match, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	priv->type = (enum lochnagar_type)of_id->data;
+
+	ret = lochnagar_init_parents(priv);
+	if (ret)
+		return ret;
+
+	ret = lochnagar_init_clks(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct platform_driver lochnagar_clk_driver = {
+	.driver = {
+		.name = "lochnagar-clk",
+		.of_match_table = lochnagar_of_match,
+	},
+	.probe = lochnagar_clk_probe,
+};
+module_platform_driver(lochnagar_clk_driver);
+
+MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
+MODULE_DESCRIPTION("Clock driver for Cirrus Logic Lochnagar Board");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0
