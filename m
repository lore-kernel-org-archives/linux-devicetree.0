From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v3 5/5] phy: ti: am654-serdes: Support all clksel values
Date: Mon, 25 Mar 2019 13:38:15 +0530
Message-ID: <20190325080815.6056-6-kishon@ti.com>
References: <20190325080815.6056-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325080815.6056-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Roger Quadros <rogerq@ti.com>

Add support to select all 16 CLKSEL combinations that are shown in
"SerDes Reference Clock Distribution" in AM65 TRM.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/phy/ti/phy-am654-serdes.c | 134 +++++++++++++++++++-----------
 1 file changed, 84 insertions(+), 50 deletions(-)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index dfbd2d48503d..f2d8d9b043cb 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -2,7 +2,7 @@
 /**
  * PCIe SERDES driver for AM654x SoC
  *
- * Copyright (C) 2018 Texas Instruments
+ * Copyright (C) 2018 - 2019 Texas Instruments
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
@@ -76,13 +76,14 @@
 
 #define SERDES_NUM_CLOCKS	3
 
+#define AM654_SERDES_CTRL_CLKSEL_MASK	GENMASK(7, 4)
+#define AM654_SERDES_CTRL_CLKSEL_SHIFT	4
+
 struct serdes_am654_clk_mux {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
 	unsigned int	reg;
-	int		*table;
-	u32		mask;
-	u8		shift;
+	int		clk_id;
 	struct clk_init_data clk_data;
 };
 
@@ -269,31 +270,52 @@ static const struct phy_ops ops = {
 	.owner		= THIS_MODULE,
 };
 
+#define SERDES_NUM_MUX_COMBINATIONS 16
+
+#define LICLK 0
+#define EXT_REFCLK 1
+#define RICLK 2
+
+static const int
+serdes_am654_mux_table[SERDES_NUM_MUX_COMBINATIONS][SERDES_NUM_CLOCKS] = {
+	/*
+	 * Each combination maps to one of
+	 * "Figure 12-1986. SerDes Reference Clock Distribution"
+	 * in TRM.
+	 */
+	 /* Parent of CMU refclk, Left output, Right output
+	  * either of EXT_REFCLK, LICLK, RICLK
+	  */
+	{ EXT_REFCLK, EXT_REFCLK, EXT_REFCLK },	/* 0000 */
+	{ RICLK, EXT_REFCLK, EXT_REFCLK },	/* 0001 */
+	{ EXT_REFCLK, RICLK, LICLK },		/* 0010 */
+	{ RICLK, RICLK, EXT_REFCLK },		/* 0011 */
+	{ LICLK, EXT_REFCLK, EXT_REFCLK },	/* 0100 */
+	{ EXT_REFCLK, EXT_REFCLK, EXT_REFCLK },	/* 0101 */
+	{ LICLK, RICLK, LICLK },		/* 0110 */
+	{ EXT_REFCLK, RICLK, LICLK },		/* 0111 */
+	{ EXT_REFCLK, EXT_REFCLK, LICLK },	/* 1000 */
+	{ RICLK, EXT_REFCLK, LICLK },		/* 1001 */
+	{ EXT_REFCLK, RICLK, EXT_REFCLK },	/* 1010 */
+	{ RICLK, RICLK, EXT_REFCLK },		/* 1011 */
+	{ LICLK, EXT_REFCLK, LICLK },		/* 1100 */
+	{ EXT_REFCLK, EXT_REFCLK, LICLK },	/* 1101 */
+	{ LICLK, RICLK, EXT_REFCLK },		/* 1110 */
+	{ EXT_REFCLK, RICLK, EXT_REFCLK },	/* 1111 */
+};
+
 static u8 serdes_am654_clk_mux_get_parent(struct clk_hw *hw)
 {
 	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
-	unsigned int num_parents = clk_hw_get_num_parents(hw);
 	struct regmap *regmap = mux->regmap;
 	unsigned int reg = mux->reg;
 	unsigned int val;
-	int i;
 
 	regmap_read(regmap, reg, &val);
-	val >>= mux->shift;
-	val &= mux->mask;
-
-	for (i = 0; i < num_parents; i++)
-		if (mux->table[i] == val)
-			return i;
-
-	/*
-	 * No parent? This should never happen!
-	 * Verify if we set a valid parent in serdes_am654_clk_register()
-	 */
-	WARN(1, "Failed to find the parent of %s clock\n", hw->init->name);
+	val &= AM654_SERDES_CTRL_CLKSEL_MASK;
+	val >>= AM654_SERDES_CTRL_CLKSEL_SHIFT;
 
-	/* Make the parent lookup to fail */
-	return num_parents;
+	return serdes_am654_mux_table[val][mux->clk_id];
 }
 
 static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
@@ -301,16 +323,52 @@ static int serdes_am654_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct serdes_am654_clk_mux *mux = to_serdes_am654_clk_mux(hw);
 	struct regmap *regmap = mux->regmap;
 	unsigned int reg = mux->reg;
-	int val;
+	int clk_id = mux->clk_id;
+	int parents[SERDES_NUM_CLOCKS];
+	const int *p;
+	u32 val;
+	int found, i;
 	int ret;
 
-	val = mux->table[index];
+	/* get existing setting */
+	regmap_read(regmap, reg, &val);
+	val &= AM654_SERDES_CTRL_CLKSEL_MASK;
+	val >>= AM654_SERDES_CTRL_CLKSEL_SHIFT;
+
+	for (i = 0; i < SERDES_NUM_CLOCKS; i++)
+		parents[i] = serdes_am654_mux_table[val][i];
+
+	/* change parent of this clock. others left intact */
+	parents[clk_id] = index;
+
+	/* Find the match */
+	for (val = 0; val < SERDES_NUM_MUX_COMBINATIONS; val++) {
+		p = serdes_am654_mux_table[val];
+		found = 1;
+		for (i = 0; i < SERDES_NUM_CLOCKS; i++) {
+			if (parents[i] != p[i]) {
+				found = 0;
+				break;
+			}
+		}
+
+		if (found)
+			break;
+	}
 
-	if (val == -1)
+	if (!found) {
+		/*
+		 * This can never happen, unless we missed
+		 * a valid combination in serdes_am654_mux_table.
+		 */
+		WARN(1, "Failed to find the parent of %s clock\n",
+		     hw->init->name);
 		return -EINVAL;
+	}
 
-	val <<= mux->shift;
-	ret = regmap_update_bits(regmap, reg, mux->mask << mux->shift, val);
+	val <<= AM654_SERDES_CTRL_CLKSEL_SHIFT;
+	ret = regmap_update_bits(regmap, reg, AM654_SERDES_CTRL_CLKSEL_MASK,
+				 val);
 
 	return ret;
 }
@@ -320,21 +378,6 @@ static const struct clk_ops serdes_am654_clk_mux_ops = {
 	.get_parent = serdes_am654_clk_mux_get_parent,
 };
 
-static int mux_table[SERDES_NUM_CLOCKS][3] = {
-	/*
-	 * The entries represent values for selecting between
-	 * {left input, external reference clock, right input}
-	 * Only one of Left Output or Right Output should be used since
-	 * both left and right output clock uses the same bits and modifying
-	 * one clock will impact the other.
-	 */
-	{ BIT(2),               0, BIT(0) }, /* Mux of CMU refclk */
-	{     -1,          BIT(3), BIT(1) }, /* Mux of Left Output */
-	{ BIT(1), BIT(3) | BIT(1),     -1 }, /* Mux of Right Output */
-};
-
-static int mux_mask[SERDES_NUM_CLOCKS] = { 0x5, 0xa, 0xa };
-
 static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 				     const char *clock_name, int clock_num)
 {
@@ -394,20 +437,11 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	init->num_parents = num_parents;
 	init->name = clock_name;
 
-	mux->table = mux_table[clock_num];
 	mux->regmap = regmap;
 	mux->reg = reg;
-	mux->shift = 4;
-	mux->mask = mux_mask[clock_num];
+	mux->clk_id = clock_num;
 	mux->hw.init = init;
 
-	/*
-	 * setup a sane default so get_parent() call evaluates
-	 * to a valid parent. Index 1 is the safest choice as
-	 * the default as it is valid value for all of serdes's
-	 * output clocks.
-	 */
-	serdes_am654_clk_mux_set_parent(&mux->hw, 1);
 	clk = devm_clk_register(dev, &mux->hw);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-- 
2.17.1
