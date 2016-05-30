From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 2/5] clk: qcom: ipq4019: Added the apss cpu pll divider clock node
Date: Mon, 30 May 2016 20:02:35 +0530
Message-ID: <1464618758-20965-3-git-send-email-absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The existing code does not have support for all the frequency
supported by APPS CPU. APPS CPU frequency is provided with APSS
CPU PLL divider which divides down the VCO frequency. This divider
is nonlinear and specific to IPQ4019 so the standard divider code
cannot be used for this.

This patch adds new node and its clock operations for APPS CPU clock
divider. Since, this divider is nonlinear, so frequency table is also
added for this, which contains the frequency and its corresponding
hardware divider values.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 140 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index db24cb8..45f4749 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -20,6 +20,11 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/bitops.h>
+#include <linux/math64.h>
+#include <asm/div64.h>
 
 #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
 
@@ -28,6 +33,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "clk-regmap-divider.h"
 
 enum {
 	P_XO,
@@ -40,6 +46,18 @@ enum {
 	P_DDRPLLAPSS,
 };
 
+#define to_clk_regmap_div(_hw) container_of(to_clk_regmap(_hw),\
+					struct clk_regmap_div, clkr)
+
+#define to_clk_cdiv_rcg(_hw) container_of((to_clk_regmap_div(_hw)),\
+						struct clk_apps_cpu_div, cdiv)
+
+struct clk_apps_cpu_div {
+	struct clk_regmap_div cdiv;
+	const u8	*parent_map;
+	const struct freq_tbl	*freq_tbl;
+};
+
 static struct parent_map gcc_xo_200_500_map[] = {
 	{ P_XO, 0 },
 	{ P_FEPLL200, 1 },
@@ -524,6 +542,128 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
 	},
 };
 
+/*
+* Round rate function for APPS CPU PLL Clock divider.
+* It Returns the input rate without changing it. The hardware supported rate
+* will be calculated in set function by getting the same from frequency table.
+*/
+static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *p_rate)
+{
+	return rate;
+};
+
+/*
+* Clock set rate function for APPS CPU PLL Clock divider.
+* It looks up the frequency table and updates the PLL divider to corresponding
+* divider value.
+*/
+static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct clk_apps_cpu_div *rcg = to_clk_cdiv_rcg(hw);
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
+				(f->pre_div << rcg->cdiv.shift) & mask);
+	udelay(1);
+
+	return 0;
+};
+
+/*
+* Clock frequency calculation function for APPS CPU PLL Clock divider.
+* It first calculates the VCO frequency with the parent rate. This clock divider
+* is nonlinear so this function calculates the actual divider and returns the
+* output frequency by dividing VCO Frequency with this actual divider value.
+*/
+static unsigned long clk_cpu_div_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_apps_cpu_div *rcg = to_clk_cdiv_rcg(hw);
+	u32 fdbkdiv, cdiv, rate, pre_div;
+	u32 fdbkdiv_shift = 16, fdbkdiv_mask =  0xff;
+	u64 vco;
+
+	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
+	fdbkdiv = cdiv & (fdbkdiv_mask << fdbkdiv_shift);
+	fdbkdiv = fdbkdiv >> fdbkdiv_shift;
+
+	cdiv &= (BIT(rcg->cdiv.width) - 1) << rcg->cdiv.shift;
+	cdiv = cdiv >> rcg->cdiv.shift;
+
+	/*
+	* Some dividers have value in 0.5 fraction so multiply both VCO
+	* frequency and pre_div with 2 to make integer calculation.
+	*/
+	vco = parent_rate;
+	vco *= fdbkdiv;
+	vco *= 2;
+
+	if (cdiv > 10)
+		pre_div = (cdiv + 1) * 2;
+	else
+		pre_div = cdiv + 12;
+
+	do_div(vco, pre_div);
+	do_div(vco, 1000000);
+	rate = (u32)vco * 1000000;
+
+	return rate;
+};
+
+const struct clk_ops clk_regmap_cpu_div_ops = {
+	.round_rate = clk_cpu_div_round_rate,
+	.set_rate = clk_cpu_div_set_rate,
+	.recalc_rate = clk_cpu_div_recalc_rate,
+};
+
+static const struct freq_tbl ftbl_apps_ddr_pll[] = {
+	{380000000, P_XO, 0xD, 0},
+	{409000000, P_XO, 0xC, 0, 0},
+	{444000000, P_XO, 0xB, 0, 0},
+	{484000000, P_XO, 0xA, 0, 0},
+	{507000000, P_XO, 0x9, 0, 0},
+	{532000000, P_XO, 0x8, 0, 0},
+	{560000000, P_XO, 0x7, 0, 0},
+	{592000000, P_XO, 0x6, 0, 0},
+	{626000000, P_XO, 0x5, 0, 0},
+	{666000000, P_XO, 0x4, 0, 0},
+	{710000000, P_XO, 0x3, 0, 0},
+	{761000000, P_XO, 0x2, 0, 0},
+	{819000000, P_XO, 0x1, 0, 0},
+	{888000000, P_XO, 0x0, 0, 0},
+	{}
+};
+
+static struct clk_apps_cpu_div gcc_apps_cpu_div_clk = {
+	.cdiv.reg = 0x2E020,
+	.cdiv.shift = 4,
+	.cdiv.width = 4,
+	.cdiv.clkr = {
+		.enable_reg = 0x2E000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apps_cpu_div_clk",
+			.parent_names = (const char *[]){
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_cpu_div_ops,
+			.flags = CLK_IGNORE_UNUSED,
+		},
+	},
+	.freq_tbl = ftbl_apps_ddr_pll,
+};
+
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
 	F(48000000, P_XO,	   1, 0, 0),
 	F(200000000, P_FEPLL200,   1, 0, 0),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
