From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 1/6] clk: qcom: ipq4019: remove fixed clocks and add pll clocks
Date: Fri, 25 Nov 2016 21:11:28 +0530
Message-ID: <1480088493-4590-2-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
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

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 254 +++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   9 +
 2 files changed, 252 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index b593065..fa922fd 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -20,6 +20,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/math64.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -28,6 +29,13 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "clk-regmap-divider.h"
+
+#define to_clk_regmap_div(_hw) container_of(to_clk_regmap(_hw),\
+					struct clk_regmap_div, clkr)
+
+#define to_clk_fepll(_hw) container_of(to_clk_regmap_div(_hw),\
+						struct clk_fepll, cdiv)
 
 enum {
 	P_XO,
@@ -40,6 +48,41 @@ enum {
 	P_DDRPLLAPSS,
 };
 
+/*
+ * struct clk_fepll_vco - vco feedback divider corresponds for FEPLL clocks
+ * @fdbkdiv_shift: lowest bit for FDBKDIV
+ * @fdbkdiv_width: number of bits in FDBKDIV
+ * @refclkdiv_shift: lowest bit for REFCLKDIV
+ * @refclkdiv_width: number of bits in REFCLKDIV
+ * @reg: PLL_DIV register address
+ */
+struct clk_fepll_vco {
+	u32 fdbkdiv_shift;
+	u32 fdbkdiv_width;
+	u32 refclkdiv_shift;
+	u32 refclkdiv_width;
+	u32 reg;
+};
+
+/*
+ * struct clk_fepll - clk divider corresponds to FEPLL clocks
+ * @fixed_div: fixed divider value if divider is fixed
+ * @parent_map: map from software's parent index to hardware's src_sel field
+ * @cdiv: divider values for PLL_DIV
+ * @pll_vco: vco feedback divider
+ * @div_table: mapping for actual divider value to register divider value
+ *             in case of non fixed divider
+ * @freq_tbl: frequency table
+ */
+struct clk_fepll {
+	u32 fixed_div;
+	const u8 *parent_map;
+	struct clk_regmap_div cdiv;
+	const struct clk_fepll_vco *pll_vco;
+	const struct clk_div_table *div_table;
+	const struct freq_tbl *freq_tbl;
+};
+
 static struct parent_map gcc_xo_200_500_map[] = {
 	{ P_XO, 0 },
 	{ P_FEPLL200, 1 },
@@ -1155,6 +1198,198 @@ enum {
 	},
 };
 
+/* Calculates the VCO rate for FEPLL. */
+static u64 clk_fepll_vco_calc_rate(struct clk_fepll *pll_div,
+				   unsigned long parent_rate)
+{
+	const struct clk_fepll_vco *pll_vco = pll_div->pll_vco;
+	u32 fdbkdiv, refclkdiv, cdiv;
+	u64 vco;
+
+	regmap_read(pll_div->cdiv.clkr.regmap, pll_vco->reg, &cdiv);
+	refclkdiv = (cdiv >> pll_vco->refclkdiv_shift) &
+		    (BIT(pll_vco->refclkdiv_width) - 1);
+	fdbkdiv = (cdiv >> pll_vco->fdbkdiv_shift) &
+		  (BIT(pll_vco->fdbkdiv_width) - 1);
+
+	vco = parent_rate / refclkdiv;
+	vco *= 2;
+	vco *= fdbkdiv;
+
+	return vco;
+}
+
+static const struct clk_fepll_vco gcc_apss_ddrpll_vco = {
+	.fdbkdiv_shift = 16,
+	.fdbkdiv_width = 8,
+	.refclkdiv_shift = 24,
+	.refclkdiv_width = 5,
+	.reg = 0x2e020,
+};
+
+static const struct clk_fepll_vco gcc_fepll_vco = {
+	.fdbkdiv_shift = 16,
+	.fdbkdiv_width = 8,
+	.refclkdiv_shift = 24,
+	.refclkdiv_width = 5,
+	.reg = 0x2f020,
+};
+
+/* Calculates the rate for PLL divider.
+ * If the divider value is not fixed then it gets the actual divider value
+ * from divider table. Then, it calculate the clock rate by dividing the
+ * parent rate with actual divider value.
+ */
+static unsigned long
+clk_regmap_clk_div_recalc_rate(struct clk_hw *hw,
+			       unsigned long parent_rate)
+{
+	struct clk_fepll *pll = to_clk_fepll(hw);
+	u32 cdiv, pre_div = 1;
+	u64 rate;
+	const struct clk_div_table *clkt;
+
+	if (pll->fixed_div) {
+		pre_div = pll->fixed_div;
+	} else {
+		regmap_read(pll->cdiv.clkr.regmap, pll->cdiv.reg, &cdiv);
+		cdiv = (cdiv >> pll->cdiv.shift) & (BIT(pll->cdiv.width) - 1);
+
+		for (clkt = pll->div_table; clkt->div; clkt++) {
+			if (clkt->val == cdiv)
+				pre_div = clkt->div;
+		}
+	}
+
+	rate = clk_fepll_vco_calc_rate(pll, parent_rate);
+	do_div(rate, pre_div);
+
+	return rate;
+};
+
+static const struct clk_ops clk_fepll_div_ops = {
+	.recalc_rate = clk_regmap_clk_div_recalc_rate,
+};
+
+static struct clk_fepll gcc_apss_sdcc_clk = {
+	.fixed_div = 28,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "ddrpllsdcc",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.pll_vco = &gcc_apss_ddrpll_vco,
+};
+
+static struct clk_fepll gcc_fepll125_clk = {
+	.fixed_div = 32,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll125",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.pll_vco = &gcc_fepll_vco,
+};
+
+static struct clk_fepll gcc_fepll125dly_clk = {
+	.fixed_div = 32,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll125dly",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.pll_vco = &gcc_fepll_vco,
+};
+
+static struct clk_fepll gcc_fepll200_clk = {
+	.fixed_div = 20,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll200",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.pll_vco = &gcc_fepll_vco,
+};
+
+static struct clk_fepll gcc_fepll500_clk = {
+	.fixed_div = 8,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepll500",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.pll_vco = &gcc_fepll_vco,
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
+static struct clk_fepll gcc_fepllwcss2g_clk = {
+	.cdiv.reg = 0x2f020,
+	.cdiv.shift = 8,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepllwcss2g",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.div_table = fepllwcss_clk_div_table,
+	.pll_vco = &gcc_fepll_vco,
+};
+
+static struct clk_fepll gcc_fepllwcss5g_clk = {
+	.cdiv.reg = 0x2f020,
+	.cdiv.shift = 12,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "fepllwcss5g",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_fepll_div_ops,
+		},
+	},
+	.div_table = fepllwcss_clk_div_table,
+	.pll_vco = &gcc_fepll_vco,
+};
+
 static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[AUDIO_CLK_SRC] = &audio_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
@@ -1215,6 +1450,13 @@ enum {
 	[GCC_WCSS5G_CLK] = &gcc_wcss5g_clk.clkr,
 	[GCC_WCSS5G_REF_CLK] = &gcc_wcss5g_ref_clk.clkr,
 	[GCC_WCSS5G_RTC_CLK] = &gcc_wcss5g_rtc_clk.clkr,
+	[GCC_SDCC_PLLDIV_CLK] = &gcc_apss_sdcc_clk.cdiv.clkr,
+	[GCC_FEPLL125_CLK] = &gcc_fepll125_clk.cdiv.clkr,
+	[GCC_FEPLL125DLY_CLK] = &gcc_fepll125dly_clk.cdiv.clkr,
+	[GCC_FEPLL200_CLK] = &gcc_fepll200_clk.cdiv.clkr,
+	[GCC_FEPLL500_CLK] = &gcc_fepll500_clk.cdiv.clkr,
+	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
+	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
@@ -1295,7 +1537,7 @@ enum {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x2dfff,
+	.max_register	= 0x2ffff,
 	.fast_io	= true,
 };
 
@@ -1315,16 +1557,6 @@ enum {
 
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
index 6240e5b..a906d46 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -81,6 +81,15 @@
 #define GCC_WCSS5G_CLK					62
 #define GCC_WCSS5G_REF_CLK				63
 #define GCC_WCSS5G_RTC_CLK				64
+#define GCC_APSS_DDRPLL_VCO				65
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
