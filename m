From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 1/5] clk: qcom: ipq4019: Added the clock nodes and operations for pll
Date: Tue, 21 Jun 2016 19:19:18 +0530
Message-ID: <1466516962-18087-2-git-send-email-absahu@codeaurora.org>
References: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466516962-18087-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ntelkar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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
   VCO frequency in KHz.

2. Operation for calculating the internal PLL divider clock
   frequency. Clock Divider node should give either fixed
   divider value or divider table(maps the register divider
   value to actual divider value).

3. Adds and registers clock nodes for VCO(APPS DDR PLL and FE
   PLL) and PLL internal dividers(SDCC, FEPLL 500 Mhz, FEPLL
   200 Mhz, FEPLL 125 Mhz, FEPLL 125 Mhz with delay,
   programmable WCSS 2G and 5G).

4. Changes the regmap limit from 0x2DFFF to 0x2FFFF for
   supporting the PLL registers read.

5. Changes the fixed clock name to have consistency in all
   clock names

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 316 ++++++++++++++++++++++++---
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   9 +
 2 files changed, 297 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 3cd1af0..17ca6d3 100644
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
 
@@ -28,6 +33,16 @@
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
@@ -40,6 +55,20 @@ enum {
 	P_DDRPLLAPSS,
 };
 
+struct clk_pll_vco {
+	u32 fdbkdiv_shift;
+	u32 fdbkdiv_width;
+	struct clk_regmap_div cdiv;
+};
+
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
@@ -48,8 +77,8 @@ static struct parent_map gcc_xo_200_500_map[] = {
 
 static const char * const gcc_xo_200_500[] = {
 	"xo",
-	"fepll200",
-	"fepll500",
+	"gcc_fepll200_clk",
+	"gcc_fepll500_clk",
 };
 
 static struct parent_map gcc_xo_200_map[] = {
@@ -59,7 +88,7 @@ static struct parent_map gcc_xo_200_map[] = {
 
 static const char * const gcc_xo_200[] = {
 	"xo",
-	"fepll200",
+	"gcc_fepll200_clk",
 };
 
 static struct parent_map gcc_xo_200_spi_map[] = {
@@ -69,7 +98,7 @@ static struct parent_map gcc_xo_200_spi_map[] = {
 
 static const char * const gcc_xo_200_spi[] = {
 	"xo",
-	"fepll200",
+	"gcc_fepll200_clk",
 };
 
 static struct parent_map gcc_xo_sdcc1_500_map[] = {
@@ -80,8 +109,8 @@ static struct parent_map gcc_xo_sdcc1_500_map[] = {
 
 static const char * const gcc_xo_sdcc1_500[] = {
 	"xo",
-	"ddrpll",
-	"fepll500",
+	"gcc_apps_sdcc_clk",
+	"gcc_fepll500_clk",
 };
 
 static struct parent_map gcc_xo_wcss2g_map[] = {
@@ -91,7 +120,7 @@ static struct parent_map gcc_xo_wcss2g_map[] = {
 
 static const char * const gcc_xo_wcss2g[] = {
 	"xo",
-	"fepllwcss2g",
+	"gcc_fepllwcss2g_clk",
 };
 
 static struct parent_map gcc_xo_wcss5g_map[] = {
@@ -101,7 +130,7 @@ static struct parent_map gcc_xo_wcss5g_map[] = {
 
 static const char * const gcc_xo_wcss5g[] = {
 	"xo",
-	"fepllwcss5g",
+	"gcc_fepllwcss5g_clk",
 };
 
 static struct parent_map gcc_xo_125_dly_map[] = {
@@ -111,7 +140,7 @@ static struct parent_map gcc_xo_125_dly_map[] = {
 
 static const char * const gcc_xo_125_dly[] = {
 	"xo",
-	"fepll125dly",
+	"gcc_fepll125dly_clk",
 };
 
 static struct parent_map gcc_xo_ddr_500_200_map[] = {
@@ -123,8 +152,8 @@ static struct parent_map gcc_xo_ddr_500_200_map[] = {
 
 static const char * const gcc_xo_ddr_500_200[] = {
 	"xo",
-	"fepll200",
-	"fepll500",
+	"gcc_fepll200_clk",
+	"gcc_fepll500_clk",
 	"ddrpllapss",
 };
 
@@ -506,7 +535,7 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
 	F(25000000,  P_FEPLL500,		1,  1, 20),
 	F(50000000,  P_FEPLL500,		1,  1, 10),
 	F(100000000, P_FEPLL500,		1,  1, 5),
-	F(193000000, P_DDRPLL,		1,  0, 0),
+	F(190000000, P_DDRPLL,		1,  0, 0),
 	{ }
 };
 
@@ -658,7 +687,7 @@ static struct clk_branch gcc_crypto_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_axi_clk",
 			.parent_names = (const char *[]){
-				"fepll125",
+				"gcc_fepll125_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -675,7 +704,7 @@ static struct clk_branch gcc_crypto_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_clk",
 			.parent_names = (const char *[]){
-				"fepll125",
+				"gcc_fepll125_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -709,7 +738,7 @@ static struct clk_branch gcc_imem_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_imem_axi_clk",
 			.parent_names = (const char *[]){
-				"fepll200",
+				"gcc_fepll200_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -773,7 +802,7 @@ static struct clk_branch gcc_pcie_axi_s_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_axi_s_clk",
 			.parent_names = (const char *[]){
-				"fepll200",
+				"gcc_fepll200_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -955,7 +984,7 @@ static struct clk_branch gcc_usb3_master_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_master_clk",
 			.parent_names = (const char *[]){
-				"fepll125",
+				"gcc_fepll125_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1155,6 +1184,238 @@ static struct clk_branch gcc_wcss5g_rtc_clk = {
 	},
 };
 
+/*
+ * Calculates the rate from parent rate and divider and round the rate
+ * in Mhz. This function takes the parent rate in Khz and returns the
+ * rate in Hz.
+ */
+static unsigned long clk_calc_divider_rate(unsigned long parent_rate,
+				unsigned int div)
+{
+	u64 rate = parent_rate;
+
+	do_div(rate, div);
+
+	/*
+	 * This rate is in KHz so divide with 1000 and multiply with 1000000
+	 * to get the rate in Hz.
+	 */
+	do_div(rate, 1000);
+	rate *= 1000000;
+
+	return (unsigned long)rate;
+}
+
+/*
+ * Calculates the VCO rate for PLL.
+ * VCO rate value is greater than unsigned long limit. Since this is an
+ * intermediate clock node for actual PLL dividers, so it returns the
+ * rate in Khz. The child nodes will return the value in Hz after its
+ * divide operation.
+ */
+static unsigned long clk_regmap_vco_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_pll_vco *rcg = to_clk_pll_vco(hw);
+	u32 fdbkdiv, refclkdiv, cdiv;
+	u64 vco;
+
+	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
+	refclkdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
+	fdbkdiv = (cdiv >> rcg->fdbkdiv_shift) & (BIT(rcg->fdbkdiv_width) - 1);
+
+	vco = parent_rate;
+	do_div(vco, refclkdiv);
+	do_div(vco, 1000);
+	vco *= 2;
+	vco *= fdbkdiv;
+
+	return (unsigned long)vco;
+}
+
+const struct clk_ops clk_regmap_vco_ops = {
+	.recalc_rate = clk_regmap_vco_recalc_rate,
+};
+
+static struct clk_pll_vco gcc_apps_ddrpll_vco = {
+	.fdbkdiv_shift = 16,
+	.fdbkdiv_width = 8,
+	.cdiv.reg = 0x2E020,
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
+	.cdiv.reg = 0x2F020,
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
+/* Calculates the rate for PLL divider.
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
+const struct clk_ops clk_regmap_clk_div_ops = {
+	.recalc_rate = clk_regmap_clk_div_recalc_rate,
+};
+
+static struct clk_pll_div gcc_apps_sdcc_clk = {
+	.fixed_div = 28,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apps_sdcc_clk",
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
+			.name = "gcc_fepll125_clk",
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
+			.name = "gcc_fepll125dly_clk",
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
+			.name = "gcc_fepll200_clk",
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
+			.name = "gcc_fepll500_clk",
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
+	{0, 15},
+	{1, 16},
+	{2, 18},
+	{3, 20},
+	{},
+};
+
+static struct clk_pll_div gcc_fepllwcss2g_clk = {
+	.cdiv.reg = 0x2F020,
+	.cdiv.shift = 8,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_fepllwcss2g_clk",
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
+	.cdiv.reg = 0x2F020,
+	.cdiv.shift = 12,
+	.cdiv.width = 2,
+	.cdiv.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_fepllwcss5g_clk",
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
@@ -1215,6 +1476,15 @@ static struct clk_regmap *gcc_ipq4019_clocks[] = {
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
@@ -1295,7 +1565,7 @@ static const struct regmap_config gcc_ipq4019_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x2dfff,
+	.max_register	= 0x2FFFF,
 	.fast_io	= true,
 };
 
@@ -1315,16 +1585,6 @@ MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
 
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
