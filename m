From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 2/7] clk: qcom: ipq4019: Added the apss cpu pll divider clock node
Date: Wed, 21 Sep 2016 17:51:47 +0530
Message-ID: <1474460512-31994-3-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current ipq4019 clock driver does not have support for all
the frequency supported by APPS CPU. APPS CPU frequency is
provided with APSS CPU PLL divider which divides down the VCO
frequency. This divider is nonlinear and specific to IPQ4019
so the standard divider code cannot be used for this.

This patch registers new clock node and adds its clock
operations for APPS CPU clock divider. Since, this divider
is nonlinear, so frequency table is also added for this,
which contains the frequency and its corresponding hardware
divider values.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 127 ++++++++++++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   1 +
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 9251457..74f7ba8 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -20,6 +20,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/delay.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -581,6 +582,7 @@ static struct clk_rcg2 apps_clk_src = {
 		.parent_names = gcc_xo_ddr_500_200,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1283,7 +1285,129 @@ static struct clk_pll_vco gcc_fepll_vco = {
 };
 
 /*
- * Calculates the rate for PLL divider.
+ * Round rate function for APPS CPU PLL Clock divider.
+ * It looks up the frequency table and returns the next higher frequency
+ * supported in hardware.
+ */
+static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *p_rate)
+{
+	struct clk_pll_div *rcg = to_clk_pll_div(hw);
+	struct clk_hw *p_hw;
+	const struct freq_tbl *f;
+
+	f = qcom_find_freq(rcg->freq_tbl, rate);
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
+ * Clock set rate function for APPS CPU PLL Clock divider.
+ * It looks up the frequency table and updates the PLL divider to corresponding
+ * divider value.
+ */
+static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct clk_pll_div *rcg = to_clk_pll_div(hw);
+	const struct freq_tbl *f;
+	u32 mask;
+	int ret;
+
+	f = qcom_find_freq(rcg->freq_tbl, rate);
+	if (!f)
+		return -EINVAL;
+
+	mask = (BIT(rcg->cdiv.width) - 1) << rcg->cdiv.shift;
+	ret = regmap_update_bits(rcg->cdiv.clkr.regmap,
+				rcg->cdiv.reg, mask,
+				f->pre_div << rcg->cdiv.shift);
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
+ * Clock frequency calculation function for APPS CPU PLL Clock divider.
+ * This clock divider is nonlinear so this function calculates the actual
+ * divider and returns the output frequency by dividing VCO Frequency
+ * with this actual divider value.
+ */
+static unsigned long clk_cpu_div_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_pll_div *rcg = to_clk_pll_div(hw);
+	u32 cdiv, pre_div;
+
+	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
+	cdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
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
+	return clk_calc_divider_rate(parent_rate * 2, pre_div);
+};
+
+static const struct clk_ops clk_regmap_cpu_div_ops = {
+	.round_rate = clk_cpu_div_round_rate,
+	.set_rate = clk_cpu_div_set_rate,
+	.recalc_rate = clk_cpu_div_recalc_rate,
+};
+
+static const struct freq_tbl ftbl_apps_ddr_pll[] = {
+	{ 380000000, P_XO, 0xd, 0, 0 },
+	{ 409000000, P_XO, 0xc, 0, 0 },
+	{ 444000000, P_XO, 0xb, 0, 0 },
+	{ 484000000, P_XO, 0xa, 0, 0 },
+	{ 507000000, P_XO, 0x9, 0, 0 },
+	{ 532000000, P_XO, 0x8, 0, 0 },
+	{ 560000000, P_XO, 0x7, 0, 0 },
+	{ 592000000, P_XO, 0x6, 0, 0 },
+	{ 626000000, P_XO, 0x5, 0, 0 },
+	{ 666000000, P_XO, 0x4, 0, 0 },
+	{ 710000000, P_XO, 0x3, 0, 0 },
+	{ 761000000, P_XO, 0x2, 0, 0 },
+	{ 819000000, P_XO, 0x1, 0, 0 },
+	{ 888000000, P_XO, 0x0, 0, 0 },
+	{ }
+};
+
+static struct clk_pll_div gcc_apps_cpu_plldiv_clk = {
+	.cdiv.reg = 0x2e020,
+	.cdiv.shift = 4,
+	.cdiv.width = 4,
+	.cdiv.clkr = {
+		.enable_reg = 0x2e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ddrpllapss",
+			.parent_names = (const char *[]){
+				"gcc_apps_ddrpll_vco",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_cpu_div_ops,
+		},
+	},
+	.freq_tbl = ftbl_apps_ddr_pll,
+};
+
+/* Calculates the rate for PLL divider.
  * If the divider value is not fixed then it gets the actual divider value
  * from divider table. Then, it calculate the clock rate by dividing the
  * parent rate with actual divider value.
@@ -1495,6 +1619,7 @@ static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[GCC_FEPLL500_CLK] = &gcc_fepll500_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
+	[GCC_APPS_CPU_PLLDIV_CLK] = &gcc_apps_cpu_plldiv_clk.cdiv.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index cd0cd23..921565d 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -90,6 +90,7 @@
 #define GCC_FEPLL500_CLK				71
 #define GCC_FEPLL_WCSS2G_CLK				72
 #define GCC_FEPLL_WCSS5G_CLK				73
+#define GCC_APPS_CPU_PLLDIV_CLK				74
 
 #define WIFI0_CPU_INIT_RESET				0
 #define WIFI0_RADIO_SRIF_RESET				1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
