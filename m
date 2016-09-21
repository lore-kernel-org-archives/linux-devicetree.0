From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 1/7] clk: qcom: ipq4019: Added the clock nodes and operations for pll
Date: Wed, 21 Sep 2016 17:51:46 +0530
Message-ID: <1474460512-31994-2-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current ipq4019 clock driver registered the PLL clocks and
dividers as fixed clock. These fixed clock needs to be removed
from driver probe function and same need to be registered with
clock framework. These PLL clocks should be programmed only
once and the same are being programmed already by the boot
loader so the set rate operation is not required for these
clocks. Only the rate can be calculated by clock operations
in clock driver file so this patch adds the same.

The PLL takes the reference clock from XO and generates the
intermediate VCO frequency. This VCO frequency will be divided
down by different PLL internal dividers. Some of the PLL
internal dividers are fixed while other are programmable.

This patch does the following changes.
1. Operation for calculating PLL intermediate VCO frequency by
   reading the reference clock divider and feedback divider from
   register. Since VCO frequency falls outside the limit of
   unsigned long for IPQ4019, so this operation will return the
   VCO frequency in kHz.

2. Operation for calculating the internal PLL divider clock
   frequency. Clock Divider node should give either fixed
   divider value or divider table(maps the register divider
   value to actual divider value).

3. Adds and registers clock nodes for VCO(APPS DDR PLL and FE
   PLL) and PLL internal dividers(SDCC, FEPLL 500 MHz, FEPLL
   200 MHz, FEPLL 125 MHz, FEPLL 125 MHz with delay,
   programmable WCSS 2G and 5G).

4. Changes the regmap limit from 0x2dffff to 0x2ffff for
   supporting the PLL registers read.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 292 ++++++++++++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   9 +
 2 files changed, 290 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 3cd1af0..9251457 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -28,6 +28,16 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "clk-regmap-divider.h"
+
+#define to_clk_regmap_div(_hw) container_of(to_clk_regmap(_hw),\
+					struct clk_regmap_div, clkr)
+
+#define to_clk_pll_div(_hw) container_of((to_clk_regmap_div(_hw)),\
+						struct clk_pll_div, cdiv)
+
+#define to_clk_pll_vco(_hw) container_of((to_clk_regmap_div(_hw)),\
+						struct clk_pll_vco, cdiv)
 
 enum {
 	P_XO,
@@ -40,6 +50,35 @@ enum {
 	P_DDRPLLAPSS,
 };
 
+/*
+ * struct clk_pll_vco - vco feedback divider corresponds to PLL_DIV register
+ * @fdbkdiv_shift: lowest bit for FDBKDIV
+ * @fdbkdiv_width: number of bits in FDBKDIV
+ * @cdiv: divider values for PLL_DIV
+ */
+struct clk_pll_vco {
+	u32 fdbkdiv_shift;
+	u32 fdbkdiv_width;
+	struct clk_regmap_div cdiv;
+};
+
+/*
+ * struct clk_pll_div - clk divider corresponds to PLL_DIV register
+ * @fixed_div: fixed divider value if divider is fixed
+ * @parent_map: map from software's parent index to hardware's src_sel field
+ * @cdiv: divider values for PLL_DIV
+ * @div_table: mapping for actual divider value to register divider value
+ *             in case of non fixed divider
+ * @freq_tbl: frequency table
+ */
+struct clk_pll_div {
+	u32 fixed_div;
+	const u8 *parent_map;
+	struct clk_regmap_div cdiv;
+	const struct clk_div_table *div_table;
+	const struct freq_tbl *freq_tbl;
+};
+
 static struct parent_map gcc_xo_200_500_map[] = {
 	{ P_XO, 0 },
 	{ P_FEPLL200, 1 },
@@ -1155,6 +1194,238 @@ static struct clk_branch gcc_wcss5g_rtc_clk = {
 	},
 };
 
+/*
+ * Calculates the rate from parent rate and divider and round the rate
+ * in MHz. This function takes the parent rate in kHz and returns the
+ * rate in Hz.
+ */
+static unsigned long clk_calc_divider_rate(unsigned long parent_rate,
+				unsigned int div)
+{
+	u32 rate;
+
+	rate = parent_rate / div;
+
+	/*
+	 * This rate is in kHz and returned value should be rounded
+	 * in MHz. So divide the value with 1000 and multiply it with
+	 * 1000(rate value was divided with 1000) * 1000(kHz to MHz).
+	 */
+	rate /= 1000;
+	rate *= 1000000;
+
+	return rate;
+}
+
+/*
+ * Calculates the VCO rate for PLL.
+ * VCO rate value is greater than unsigned long limit. Since this is an
+ * intermediate clock node for actual PLL dividers, so it returns the
+ * rate in kHz. The child nodes will return the value in Hz after its
+ * divide operation.
+ */
+static unsigned long clk_regmap_vco_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_pll_vco *rcg = to_clk_pll_vco(hw);
+	u32 fdbkdiv, refclkdiv, cdiv, vco;
+
+	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
+	refclkdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
+	fdbkdiv = (cdiv >> rcg->fdbkdiv_shift) & (BIT(rcg->fdbkdiv_width) - 1);
+
+	vco = parent_rate / refclkdiv;
+	vco /= 1000;
+	vco *= 2;
+	vco *= fdbkdiv;
+
+	return vco;
+}
+
+static const struct clk_ops clk_regmap_vco_ops = {
+	.recalc_rate = clk_regmap_vco_recalc_rate,
+};
+
+static struct clk_pll_vco gcc_apps_ddrpll_vco = {
+	.fdbkdiv_shift = 16,
+	.fdbkdiv_width = 8,
+	.cdiv.reg = 0x2e020,
+	.cdiv.shift = 24,
+	.cdiv.width = 5,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apps_ddrpll_vco",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_vco_ops,
+		},
+	},
+};
+
+static struct clk_pll_vco gcc_fepll_vco = {
+	.fdbkdiv_shift = 16,
+	.fdbkdiv_width = 8,
+	.cdiv.reg = 0x2f020,
+	.cdiv.shift = 24,
+	.cdiv.width = 5,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_fepll_vco",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_vco_ops,
+		},
+	},
+};
+
+/*
+ * Calculates the rate for PLL divider.
+ * If the divider value is not fixed then it gets the actual divider value
+ * from divider table. Then, it calculate the clock rate by dividing the
+ * parent rate with actual divider value.
+ */
+static unsigned long clk_regmap_clk_div_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_pll_div *rcg = to_clk_pll_div(hw);
+	u32 cdiv, pre_div = 1;
+	const struct clk_div_table *clkt;
+
+	if (rcg->fixed_div) {
+		pre_div = rcg->fixed_div;
+	} else {
+		regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
+		cdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
+
+		for (clkt = rcg->div_table; clkt->div; clkt++) {
+			if (clkt->val == cdiv)
+				pre_div = clkt->div;
+		}
+	}
+
+	return clk_calc_divider_rate(parent_rate, pre_div);
+};
+
+static const struct clk_ops clk_regmap_clk_div_ops = {
+	.recalc_rate = clk_regmap_clk_div_recalc_rate,
+};
+
+static struct clk_pll_div gcc_apps_sdcc_clk = {
+	.fixed_div = 28,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "ddrpllsdcc",
+			.parent_names = (const char *[]){
+				"gcc_apps_ddrpll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+};
+
+static struct clk_pll_div gcc_fepll125_clk = {
+	.fixed_div = 32,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll125",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+};
+
+static struct clk_pll_div gcc_fepll125dly_clk = {
+	.fixed_div = 32,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll125dly",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+};
+
+static struct clk_pll_div gcc_fepll200_clk = {
+	.fixed_div = 20,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll200",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+};
+
+static struct clk_pll_div gcc_fepll500_clk = {
+	.fixed_div = 8,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll500",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+};
+
+static const struct clk_div_table fepllwcss_clk_div_table[] = {
+	{ 0, 15 },
+	{ 1, 16 },
+	{ 2, 18 },
+	{ 3, 20 },
+	{ },
+};
+
+static struct clk_pll_div gcc_fepllwcss2g_clk = {
+	.cdiv.reg = 0x2f020,
+	.cdiv.shift = 8,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepllwcss2g",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+	.div_table = fepllwcss_clk_div_table
+};
+
+static struct clk_pll_div gcc_fepllwcss5g_clk = {
+	.cdiv.reg = 0x2f020,
+	.cdiv.shift = 12,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepllwcss5g",
+			.parent_names = (const char *[]){
+				"gcc_fepll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_clk_div_ops,
+		},
+	},
+	.div_table = fepllwcss_clk_div_table
+};
+
 static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[AUDIO_CLK_SRC] = &audio_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
@@ -1215,6 +1486,15 @@ static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[GCC_WCSS5G_CLK] = &gcc_wcss5g_clk.clkr,
 	[GCC_WCSS5G_REF_CLK] = &gcc_wcss5g_ref_clk.clkr,
 	[GCC_WCSS5G_RTC_CLK] = &gcc_wcss5g_rtc_clk.clkr,
+	[GCC_APPS_DDRPLL_VCO] = &gcc_apps_ddrpll_vco.cdiv.clkr,
+	[GCC_FEPLL_VCO] = &gcc_fepll_vco.cdiv.clkr,
+	[GCC_SDCC_PLLDIV_CLK] = &gcc_apps_sdcc_clk.cdiv.clkr,
+	[GCC_FEPLL125_CLK] = &gcc_fepll125_clk.cdiv.clkr,
+	[GCC_FEPLL125DLY_CLK] = &gcc_fepll125dly_clk.cdiv.clkr,
+	[GCC_FEPLL200_CLK] = &gcc_fepll200_clk.cdiv.clkr,
+	[GCC_FEPLL500_CLK] = &gcc_fepll500_clk.cdiv.clkr,
+	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
+	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
@@ -1295,7 +1575,7 @@ static const struct regmap_config gcc_ipq4019_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x2dfff,
+	.max_register	= 0x2ffff,
 	.fast_io	= true,
 };
 
@@ -1315,16 +1595,6 @@ MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
 static int gcc_ipq4019_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-
-	clk_register_fixed_rate(dev, "fepll125", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepll125dly", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepllwcss2g", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepllwcss5g", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepll200", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "fepll500", "xo", 0, 200000000);
-	clk_register_fixed_rate(dev, "ddrpllapss", "xo", 0, 666000000);
-
 	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
 }
 
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index 6240e5b..cd0cd23 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -81,6 +81,15 @@
 #define GCC_WCSS5G_CLK					62
 #define GCC_WCSS5G_REF_CLK				63
 #define GCC_WCSS5G_RTC_CLK				64
+#define GCC_APPS_DDRPLL_VCO				65
+#define GCC_SDCC_PLLDIV_CLK				66
+#define GCC_FEPLL_VCO					67
+#define GCC_FEPLL125_CLK				68
+#define GCC_FEPLL125DLY_CLK				69
+#define GCC_FEPLL200_CLK				70
+#define GCC_FEPLL500_CLK				71
+#define GCC_FEPLL_WCSS2G_CLK				72
+#define GCC_FEPLL_WCSS5G_CLK				73
 
 #define WIFI0_CPU_INIT_RESET				0
 #define WIFI0_RADIO_SRIF_RESET				1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
