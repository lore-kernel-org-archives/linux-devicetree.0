From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 2/6] clk: qcom: ipq4019: Add the apss cpu pll divider clock node
Date: Fri, 25 Nov 2016 21:11:29 +0530
Message-ID: <1480088493-4590-3-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, snlakshm-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current ipq4019 clock driver does not have support for all
the frequency supported by APSS CPU. APSS CPU frequency is
provided with APSS CPU PLL divider which divides down the VCO
frequency. This divider is nonlinear and specific to IPQ4019
so the standard divider code cannot be used for this.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 132 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   1 +
 2 files changed, 133 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index fa922fd..000c224 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -21,6 +21,7 @@
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <linux/math64.h>
+#include <linux/delay.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -585,6 +586,7 @@ struct clk_fepll {
 		.parent_names = gcc_xo_ddr_500_200,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1235,6 +1237,135 @@ static u64 clk_fepll_vco_calc_rate(struct clk_fepll *pll_div,
 	.reg = 0x2f020,
 };
 
+/*
+ * Round rate function for APSS CPU PLL Clock divider.
+ * It looks up the frequency table and returns the next higher frequency
+ * supported in hardware.
+ */
+static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *p_rate)
+{
+	struct clk_fepll *pll = to_clk_fepll(hw);
+	struct clk_hw *p_hw;
+	const struct freq_tbl *f;
+
+	f = qcom_find_freq(pll->freq_tbl, rate);
+	if (!f)
+		return -EINVAL;
+
+	p_hw = clk_hw_get_parent_by_index(hw, f->src);
+	*p_rate = clk_hw_get_rate(p_hw);
+
+	return f->freq;
+};
+
+/*
+ * Clock set rate function for APSS CPU PLL Clock divider.
+ * It looks up the frequency table and updates the PLL divider to corresponding
+ * divider value.
+ */
+static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_fepll *pll = to_clk_fepll(hw);
+	const struct freq_tbl *f;
+	u32 mask;
+	int ret;
+
+	f = qcom_find_freq(pll->freq_tbl, rate);
+	if (!f)
+		return -EINVAL;
+
+	mask = (BIT(pll->cdiv.width) - 1) << pll->cdiv.shift;
+	ret = regmap_update_bits(pll->cdiv.clkr.regmap,
+				 pll->cdiv.reg, mask,
+				 f->pre_div << pll->cdiv.shift);
+	/*
+	 * There is no status bit which can be checked for successful CPU
+	 * divider update operation so using delay for the same.
+	 */
+	udelay(1);
+
+	return 0;
+};
+
+/*
+ * Clock frequency calculation function for APSS CPU PLL Clock divider.
+ * This clock divider is nonlinear so this function calculates the actual
+ * divider and returns the output frequency by dividing VCO Frequency
+ * with this actual divider value.
+ */
+static unsigned long
+clk_cpu_div_recalc_rate(struct clk_hw *hw,
+			unsigned long parent_rate)
+{
+	struct clk_fepll *pll = to_clk_fepll(hw);
+	u32 cdiv, pre_div;
+	u64 rate;
+
+	regmap_read(pll->cdiv.clkr.regmap, pll->cdiv.reg, &cdiv);
+	cdiv = (cdiv >> pll->cdiv.shift) & (BIT(pll->cdiv.width) - 1);
+
+	/*
+	 * Some dividers have value in 0.5 fraction so multiply both VCO
+	 * frequency(parent_rate) and pre_div with 2 to make integer
+	 * calculation.
+	 */
+	if (cdiv > 10)
+		pre_div = (cdiv + 1) * 2;
+	else
+		pre_div = cdiv + 12;
+
+	rate = clk_fepll_vco_calc_rate(pll, parent_rate) * 2;
+	do_div(rate, pre_div);
+
+	return rate;
+};
+
+static const struct clk_ops clk_regmap_cpu_div_ops = {
+	.round_rate = clk_cpu_div_round_rate,
+	.set_rate = clk_cpu_div_set_rate,
+	.recalc_rate = clk_cpu_div_recalc_rate,
+};
+
+static const struct freq_tbl ftbl_apss_ddr_pll[] = {
+	{ 384000000, P_XO, 0xd, 0, 0 },
+	{ 413000000, P_XO, 0xc, 0, 0 },
+	{ 448000000, P_XO, 0xb, 0, 0 },
+	{ 488000000, P_XO, 0xa, 0, 0 },
+	{ 512000000, P_XO, 0x9, 0, 0 },
+	{ 537000000, P_XO, 0x8, 0, 0 },
+	{ 565000000, P_XO, 0x7, 0, 0 },
+	{ 597000000, P_XO, 0x6, 0, 0 },
+	{ 632000000, P_XO, 0x5, 0, 0 },
+	{ 672000000, P_XO, 0x4, 0, 0 },
+	{ 716000000, P_XO, 0x3, 0, 0 },
+	{ 768000000, P_XO, 0x2, 0, 0 },
+	{ 823000000, P_XO, 0x1, 0, 0 },
+	{ 896000000, P_XO, 0x0, 0, 0 },
+	{ }
+};
+
+static struct clk_fepll gcc_apss_cpu_plldiv_clk = {
+	.cdiv.reg = 0x2e020,
+	.cdiv.shift = 4,
+	.cdiv.width = 4,
+	.cdiv.clkr = {
+		.enable_reg = 0x2e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ddrpllapss",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_cpu_div_ops,
+		},
+	},
+	.freq_tbl = ftbl_apss_ddr_pll,
+	.pll_vco = &gcc_apss_ddrpll_vco,
+};
+
 /* Calculates the rate for PLL divider.
  * If the divider value is not fixed then it gets the actual divider value
  * from divider table. Then, it calculate the clock rate by dividing the
@@ -1457,6 +1588,7 @@ static u64 clk_fepll_vco_calc_rate(struct clk_fepll *pll_div,
 	[GCC_FEPLL500_CLK] = &gcc_fepll500_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
+	[GCC_APSS_CPU_PLLDIV_CLK] = &gcc_apss_cpu_plldiv_clk.cdiv.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index a906d46..c629b2b 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -90,6 +90,7 @@
 #define GCC_FEPLL500_CLK				71
 #define GCC_FEPLL_WCSS2G_CLK				72
 #define GCC_FEPLL_WCSS5G_CLK				73
+#define GCC_APSS_CPU_PLLDIV_CLK				74
 
 #define WIFI0_CPU_INIT_RESET				0
 #define WIFI0_RADIO_SRIF_RESET				1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
