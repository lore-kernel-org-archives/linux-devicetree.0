From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 07/11] clk: qcom: ipq8074: add NSS clocks
Date: Wed, 13 Dec 2017 19:55:38 +0530
Message-ID: <1513175142-3702-8-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IPQ8074 has NSS (Network Switching System) which has 2 UBI cores
and hardware crypto engine. Some clocks are separate for each UBI
core and remaining NSS clocks are common. The BIAS_PLL (300 Mhz)
and BIAS_PLL_NSS_NOC (416.5 Mhz) are external fixed clocks and
will be registered from dtsi or NSS driver.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1034 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1034 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 7010560..cec921c 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -28,6 +28,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "clk-alpha-pll.h"
+#include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 #include "reset.h"
 
@@ -38,12 +39,17 @@ enum {
 	P_GPLL0,
 	P_GPLL0_DIV2,
 	P_GPLL2,
+	P_GPLL4,
 	P_GPLL6,
 	P_SLEEP_CLK,
 	P_PCIE20_PHY0_PIPE,
 	P_PCIE20_PHY1_PIPE,
 	P_USB3PHY_0_PIPE,
 	P_USB3PHY_1_PIPE,
+	P_UBI32_PLL,
+	P_NSS_CRYPTO_PLL,
+	P_BIAS_PLL,
+	P_BIAS_PLL_NSS_NOC,
 };
 
 static const char * const gcc_xo_gpll0_gpll0_out_main_div2[] = {
@@ -174,6 +180,104 @@ enum {
 	{ P_GPLL0_DIV2, 4 },
 };
 
+static const char * const gcc_xo_gpll0_gpll6_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0",
+	"gpll6",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll6_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL6, 2 },
+	{ P_GPLL0_DIV2, 3 },
+};
+
+static const char * const gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2[] = {
+	"xo",
+	"bias_pll_nss_noc_clk",
+	"gpll0",
+	"gpll2",
+};
+
+static const struct parent_map gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2_map[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL_NSS_NOC, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL2, 3 },
+};
+
+static const char * const gcc_xo_nss_crypto_pll_gpll0[] = {
+	"xo",
+	"nss_crypto_pll",
+	"gpll0",
+};
+
+static const struct parent_map gcc_xo_nss_crypto_pll_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_NSS_CRYPTO_PLL, 1 },
+	{ P_GPLL0, 2 },
+};
+
+static const char * const gcc_xo_ubi32_pll_gpll0_gpll2_gpll4_gpll6[] = {
+	"xo",
+	"ubi32_pll",
+	"gpll0",
+	"gpll2",
+	"gpll4",
+	"gpll6",
+};
+
+static const struct parent_map gcc_xo_ubi32_gpll0_gpll2_gpll4_gpll6_map[] = {
+	{ P_XO, 0 },
+	{ P_UBI32_PLL, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL2, 3 },
+	{ P_GPLL4, 4 },
+	{ P_GPLL6, 5 },
+};
+
+static const char * const gcc_xo_gpll0_out_main_div2[] = {
+	"xo",
+	"gpll0_out_main_div2",
+};
+
+static const struct parent_map gcc_xo_gpll0_out_main_div2_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_DIV2, 1 },
+};
+
+static const char * const gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
+	"xo",
+	"bias_pll_cc_clk",
+	"gpll0",
+	"gpll4",
+	"nss_crypto_pll",
+	"ubi32_pll",
+};
+
+static const struct parent_map gcc_xo_bias_gpll0_gpll4_nss_ubi32_map[] = {
+	{ P_XO, 0 },
+	{ P_BIAS_PLL, 1 },
+	{ P_GPLL0, 2 },
+	{ P_GPLL4, 3 },
+	{ P_NSS_CRYPTO_PLL, 4 },
+	{ P_UBI32_PLL, 5 },
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 2 },
+};
+
 static struct clk_alpha_pll gpll0_main = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -1025,6 +1129,290 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_xo_clk_src = {
+	.halt_reg = 0x30018,
+	.clkr = {
+		.enable_reg = 0x30018,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_xo_clk_src",
+			.parent_names = (const char *[]){
+				"xo"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor gcc_xo_div4_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "gcc_xo_div4_clk_src",
+		.parent_names = (const char *[]){
+			"gcc_xo_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_system_noc_bfdcd_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_DIV2, 8, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x26004,
+	.freq_tbl = ftbl_system_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_noc_bfdcd_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll6_gpll0_out_main_div2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor system_noc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "system_noc_clk_src",
+		.parent_names = (const char *[]){
+			"system_noc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ce_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ce_clk_src = {
+	.cmd_rcgr = 0x68098,
+	.freq_tbl = ftbl_nss_ce_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ce_clk_src",
+		.parent_names = gcc_xo_gpll0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_noc_bfdcd_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(461500000, P_BIAS_PLL_NSS_NOC, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x68088,
+	.freq_tbl = ftbl_nss_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_noc_bfdcd_clk_src",
+		.parent_names = gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor nss_noc_clk_src = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "nss_noc_clk_src",
+		.parent_names = (const char *[]){
+			"nss_noc_bfdcd_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_crypto_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(600000000, P_NSS_CRYPTO_PLL, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_crypto_clk_src = {
+	.cmd_rcgr = 0x68144,
+	.freq_tbl = ftbl_nss_crypto_clk_src,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_xo_nss_crypto_pll_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_crypto_clk_src",
+		.parent_names = gcc_xo_nss_crypto_pll_gpll0,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ubi_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(187200000, P_UBI32_PLL, 8, 0, 0),
+	F(748800000, P_UBI32_PLL, 2, 0, 0),
+	F(1497600000, P_UBI32_PLL, 1, 0, 0),
+	F(1689600000, P_UBI32_PLL, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ubi0_clk_src = {
+	.cmd_rcgr = 0x68104,
+	.freq_tbl = ftbl_nss_ubi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_ubi32_gpll0_gpll2_gpll4_gpll6_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ubi0_clk_src",
+		.parent_names = gcc_xo_ubi32_pll_gpll0_gpll2_gpll4_gpll6,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap_div nss_ubi0_div_clk_src = {
+	.reg = 0x68118,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_ubi0_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_ubi0_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ro_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg2 nss_ubi1_clk_src = {
+	.cmd_rcgr = 0x68124,
+	.freq_tbl = ftbl_nss_ubi_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_ubi32_gpll0_gpll2_gpll4_gpll6_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ubi1_clk_src",
+		.parent_names = gcc_xo_ubi32_pll_gpll0_gpll2_gpll4_gpll6,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap_div nss_ubi1_div_clk_src = {
+	.reg = 0x68138,
+	.shift = 0,
+	.width = 4,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "nss_ubi1_div_clk_src",
+			.parent_names = (const char *[]){
+				"nss_ubi1_clk_src"
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_div_ro_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_ubi_mpt_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_DIV2, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ubi_mpt_clk_src = {
+	.cmd_rcgr = 0x68090,
+	.freq_tbl = ftbl_ubi_mpt_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_out_main_div2_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ubi_mpt_clk_src",
+		.parent_names = gcc_xo_gpll0_out_main_div2,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_imem_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_imem_clk_src = {
+	.cmd_rcgr = 0x68158,
+	.freq_tbl = ftbl_nss_imem_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll4_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_imem_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll4,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(300000000, P_BIAS_PLL, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_ppe_clk_src = {
+	.cmd_rcgr = 0x68080,
+	.freq_tbl = ftbl_nss_ppe_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_xo_bias_gpll0_gpll4_nss_ubi32_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "nss_ppe_clk_src",
+		.parent_names = gcc_xo_bias_gpll0_gpll4_nss_ubi32,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor nss_ppe_cdiv_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "nss_ppe_cdiv_clk_src",
+		.parent_names = (const char *[]){
+			"nss_ppe_clk_src"
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static struct clk_branch gcc_blsp1_ahb_clk = {
 	.halt_reg = 0x01008,
 	.clkr = {
@@ -1931,10 +2319,609 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_mem_noc_nss_axi_clk = {
+	.halt_reg = 0x1d03c,
+	.clkr = {
+		.enable_reg = 0x1d03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mem_noc_nss_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ce_apb_clk = {
+	.halt_reg = 0x68174,
+	.clkr = {
+		.enable_reg = 0x68174,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ce_apb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ce_axi_clk = {
+	.halt_reg = 0x68170,
+	.clkr = {
+		.enable_reg = 0x68170,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ce_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_cfg_clk = {
+	.halt_reg = 0x68160,
+	.clkr = {
+		.enable_reg = 0x68160,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_cfg_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_crypto_clk = {
+	.halt_reg = 0x68164,
+	.clkr = {
+		.enable_reg = 0x68164,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_crypto_clk",
+			.parent_names = (const char *[]){
+				"nss_crypto_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_csr_clk = {
+	.halt_reg = 0x68318,
+	.clkr = {
+		.enable_reg = 0x68318,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_csr_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_edma_cfg_clk = {
+	.halt_reg = 0x6819c,
+	.clkr = {
+		.enable_reg = 0x6819c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_edma_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_edma_clk = {
+	.halt_reg = 0x68198,
+	.clkr = {
+		.enable_reg = 0x68198,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_edma_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_imem_clk = {
+	.halt_reg = 0x68178,
+	.clkr = {
+		.enable_reg = 0x68178,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_imem_clk",
+			.parent_names = (const char *[]){
+				"nss_imem_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_noc_clk = {
+	.halt_reg = 0x68168,
+	.clkr = {
+		.enable_reg = 0x68168,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_noc_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_btq_clk = {
+	.halt_reg = 0x6833c,
+	.clkr = {
+		.enable_reg = 0x6833c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_btq_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_cfg_clk = {
+	.halt_reg = 0x68194,
+	.clkr = {
+		.enable_reg = 0x68194,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_clk = {
+	.halt_reg = 0x68190,
+	.clkr = {
+		.enable_reg = 0x68190,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ppe_ipe_clk = {
+	.halt_reg = 0x68338,
+	.clkr = {
+		.enable_reg = 0x68338,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ppe_ipe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ptp_ref_clk = {
+	.halt_reg = 0x6816c,
+	.clkr = {
+		.enable_reg = 0x6816c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nss_ptp_ref_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_cdiv_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ce_apb_clk = {
+	.halt_reg = 0x6830c,
+	.clkr = {
+		.enable_reg = 0x6830c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ce_apb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ce_axi_clk = {
+	.halt_reg = 0x68308,
+	.clkr = {
+		.enable_reg = 0x68308,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ce_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_crypto_clk = {
+	.halt_reg = 0x68314,
+	.clkr = {
+		.enable_reg = 0x68314,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_crypto_clk",
+			.parent_names = (const char *[]){
+				"nss_crypto_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ppe_cfg_clk = {
+	.halt_reg = 0x68304,
+	.clkr = {
+		.enable_reg = 0x68304,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ppe_cfg_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ppe_clk = {
+	.halt_reg = 0x68300,
+	.clkr = {
+		.enable_reg = 0x68300,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ppe_clk",
+			.parent_names = (const char *[]){
+				"nss_ppe_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_qosgen_ref_clk = {
+	.halt_reg = 0x68180,
+	.clkr = {
+		.enable_reg = 0x68180,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_qosgen_ref_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_clk = {
+	.halt_reg = 0x68188,
+	.clkr = {
+		.enable_reg = 0x68188,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_snoc_clk",
+			.parent_names = (const char *[]){
+				"system_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_timeout_ref_clk = {
+	.halt_reg = 0x68184,
+	.clkr = {
+		.enable_reg = 0x68184,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_timeout_ref_clk",
+			.parent_names = (const char *[]){
+				"gcc_xo_div4_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ubi0_ahb_clk = {
+	.halt_reg = 0x68270,
+	.clkr = {
+		.enable_reg = 0x68270,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ubi0_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_ubi1_ahb_clk = {
+	.halt_reg = 0x68274,
+	.clkr = {
+		.enable_reg = 0x68274,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_nssnoc_ubi1_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_ahb_clk = {
+	.halt_reg = 0x6820c,
+	.clkr = {
+		.enable_reg = 0x6820c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_axi_clk = {
+	.halt_reg = 0x68200,
+	.clkr = {
+		.enable_reg = 0x68200,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_nc_axi_clk = {
+	.halt_reg = 0x68204,
+	.clkr = {
+		.enable_reg = 0x68204,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_nc_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_core_clk = {
+	.halt_reg = 0x68210,
+	.clkr = {
+		.enable_reg = 0x68210,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_core_clk",
+			.parent_names = (const char *[]){
+				"nss_ubi0_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi0_mpt_clk = {
+	.halt_reg = 0x68208,
+	.clkr = {
+		.enable_reg = 0x68208,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi0_mpt_clk",
+			.parent_names = (const char *[]){
+				"ubi_mpt_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi1_ahb_clk = {
+	.halt_reg = 0x6822c,
+	.clkr = {
+		.enable_reg = 0x6822c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi1_ahb_clk",
+			.parent_names = (const char *[]){
+				"nss_ce_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi1_axi_clk = {
+	.halt_reg = 0x68220,
+	.clkr = {
+		.enable_reg = 0x68220,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi1_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi1_nc_axi_clk = {
+	.halt_reg = 0x68224,
+	.clkr = {
+		.enable_reg = 0x68224,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi1_nc_axi_clk",
+			.parent_names = (const char *[]){
+				"nss_noc_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi1_core_clk = {
+	.halt_reg = 0x68230,
+	.clkr = {
+		.enable_reg = 0x68230,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi1_core_clk",
+			.parent_names = (const char *[]){
+				"nss_ubi1_div_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ubi1_mpt_clk = {
+	.halt_reg = 0x68228,
+	.clkr = {
+		.enable_reg = 0x68228,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ubi1_mpt_clk",
+			.parent_names = (const char *[]){
+				"ubi_mpt_clk_src"
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_ipq8074_hws[] = {
 	&gpll0_out_main_div2.hw,
 	&gpll6_out_main_div2.hw,
 	&pcnoc_clk_src.hw,
+	&system_noc_clk_src.hw,
+	&gcc_xo_div4_clk_src.hw,
+	&nss_noc_clk_src.hw,
+	&nss_ppe_cdiv_clk_src.hw,
 };
 
 static struct clk_regmap *gcc_ipq8074_clks[] = {
@@ -1987,6 +2974,18 @@ enum {
 	[USB1_AUX_CLK_SRC] = &usb1_aux_clk_src.clkr,
 	[USB1_MOCK_UTMI_CLK_SRC] = &usb1_mock_utmi_clk_src.clkr,
 	[USB1_PIPE_CLK_SRC] = &usb1_pipe_clk_src.clkr,
+	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[NSS_CE_CLK_SRC] = &nss_ce_clk_src.clkr,
+	[NSS_NOC_BFDCD_CLK_SRC] = &nss_noc_bfdcd_clk_src.clkr,
+	[NSS_CRYPTO_CLK_SRC] = &nss_crypto_clk_src.clkr,
+	[NSS_UBI0_CLK_SRC] = &nss_ubi0_clk_src.clkr,
+	[NSS_UBI0_DIV_CLK_SRC] = &nss_ubi0_div_clk_src.clkr,
+	[NSS_UBI1_CLK_SRC] = &nss_ubi1_clk_src.clkr,
+	[NSS_UBI1_DIV_CLK_SRC] = &nss_ubi1_div_clk_src.clkr,
+	[UBI_MPT_CLK_SRC] = &ubi_mpt_clk_src.clkr,
+	[NSS_IMEM_CLK_SRC] = &nss_imem_clk_src.clkr,
+	[NSS_PPE_CLK_SRC] = &nss_ppe_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
 	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
@@ -2040,6 +3039,41 @@ enum {
 	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
 	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
 	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_MEM_NOC_NSS_AXI_CLK] = &gcc_mem_noc_nss_axi_clk.clkr,
+	[GCC_NSS_CE_APB_CLK] = &gcc_nss_ce_apb_clk.clkr,
+	[GCC_NSS_CE_AXI_CLK] = &gcc_nss_ce_axi_clk.clkr,
+	[GCC_NSS_CFG_CLK] = &gcc_nss_cfg_clk.clkr,
+	[GCC_NSS_CRYPTO_CLK] = &gcc_nss_crypto_clk.clkr,
+	[GCC_NSS_CSR_CLK] = &gcc_nss_csr_clk.clkr,
+	[GCC_NSS_EDMA_CFG_CLK] = &gcc_nss_edma_cfg_clk.clkr,
+	[GCC_NSS_EDMA_CLK] = &gcc_nss_edma_clk.clkr,
+	[GCC_NSS_IMEM_CLK] = &gcc_nss_imem_clk.clkr,
+	[GCC_NSS_NOC_CLK] = &gcc_nss_noc_clk.clkr,
+	[GCC_NSS_PPE_BTQ_CLK] = &gcc_nss_ppe_btq_clk.clkr,
+	[GCC_NSS_PPE_CFG_CLK] = &gcc_nss_ppe_cfg_clk.clkr,
+	[GCC_NSS_PPE_CLK] = &gcc_nss_ppe_clk.clkr,
+	[GCC_NSS_PPE_IPE_CLK] = &gcc_nss_ppe_ipe_clk.clkr,
+	[GCC_NSS_PTP_REF_CLK] = &gcc_nss_ptp_ref_clk.clkr,
+	[GCC_NSSNOC_CE_APB_CLK] = &gcc_nssnoc_ce_apb_clk.clkr,
+	[GCC_NSSNOC_CE_AXI_CLK] = &gcc_nssnoc_ce_axi_clk.clkr,
+	[GCC_NSSNOC_CRYPTO_CLK] = &gcc_nssnoc_crypto_clk.clkr,
+	[GCC_NSSNOC_PPE_CFG_CLK] = &gcc_nssnoc_ppe_cfg_clk.clkr,
+	[GCC_NSSNOC_PPE_CLK] = &gcc_nssnoc_ppe_clk.clkr,
+	[GCC_NSSNOC_QOSGEN_REF_CLK] = &gcc_nssnoc_qosgen_ref_clk.clkr,
+	[GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
+	[GCC_NSSNOC_TIMEOUT_REF_CLK] = &gcc_nssnoc_timeout_ref_clk.clkr,
+	[GCC_NSSNOC_UBI0_AHB_CLK] = &gcc_nssnoc_ubi0_ahb_clk.clkr,
+	[GCC_NSSNOC_UBI1_AHB_CLK] = &gcc_nssnoc_ubi1_ahb_clk.clkr,
+	[GCC_UBI0_AHB_CLK] = &gcc_ubi0_ahb_clk.clkr,
+	[GCC_UBI0_AXI_CLK] = &gcc_ubi0_axi_clk.clkr,
+	[GCC_UBI0_NC_AXI_CLK] = &gcc_ubi0_nc_axi_clk.clkr,
+	[GCC_UBI0_CORE_CLK] = &gcc_ubi0_core_clk.clkr,
+	[GCC_UBI0_MPT_CLK] = &gcc_ubi0_mpt_clk.clkr,
+	[GCC_UBI1_AHB_CLK] = &gcc_ubi1_ahb_clk.clkr,
+	[GCC_UBI1_AXI_CLK] = &gcc_ubi1_axi_clk.clkr,
+	[GCC_UBI1_NC_AXI_CLK] = &gcc_ubi1_nc_axi_clk.clkr,
+	[GCC_UBI1_CORE_CLK] = &gcc_ubi1_core_clk.clkr,
+	[GCC_UBI1_MPT_CLK] = &gcc_ubi1_mpt_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq8074_resets[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
