From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] clk: qcom: gcc-msm8996: Remove RPM controlled clocks
Date: Wed, 22 Mar 2017 15:09:26 +0530
Message-ID: <1490175566-4084-3-git-send-email-rnayak@codeaurora.org>
References: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

All the noc clock sources (system, peripheral and config)
are controlled by RPM. So is gcc_sleep_clk_src RCG.
Remove these as part of GCC and hook up all of their children
to the respective RPM clocks.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c               | 156 ++++++---------------------
 include/dt-bindings/clock/qcom,gcc-msm8996.h |   4 -
 2 files changed, 33 insertions(+), 127 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 8abc200..a7aac0b 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -48,10 +48,6 @@ enum {
 	P_GPLL1_EARLY_DIV
 };
 
-static const struct parent_map gcc_sleep_clk_map[] = {
-	{ P_SLEEP_CLK, 5 }
-};
-
 static const char * const gcc_sleep_clk[] = {
 	"sleep_clk"
 };
@@ -284,71 +280,6 @@ enum {
 	},
 };
 
-static const struct freq_tbl ftbl_system_noc_clk_src[] = {
-	F(19200000, P_XO, 1, 0, 0),
-	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
-	F(100000000, P_GPLL0, 6, 0, 0),
-	F(150000000, P_GPLL0, 4, 0, 0),
-	F(200000000, P_GPLL0, 3, 0, 0),
-	F(240000000, P_GPLL0, 2.5, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 system_noc_clk_src = {
-	.cmd_rcgr = 0x0401c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div_map,
-	.freq_tbl = ftbl_system_noc_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "system_noc_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2_gpll3_gpll1_gpll2_early_gpll0_early_div,
-		.num_parents = 7,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_config_noc_clk_src[] = {
-	F(19200000, P_XO, 1, 0, 0),
-	F(37500000, P_GPLL0, 16, 0, 0),
-	F(75000000, P_GPLL0, 8, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 config_noc_clk_src = {
-	.cmd_rcgr = 0x0500c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_config_noc_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "config_noc_clk_src",
-		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static const struct freq_tbl ftbl_periph_noc_clk_src[] = {
-	F(19200000, P_XO, 1, 0, 0),
-	F(37500000, P_GPLL0, 16, 0, 0),
-	F(50000000, P_GPLL0, 12, 0, 0),
-	F(75000000, P_GPLL0, 8, 0, 0),
-	F(100000000, P_GPLL0, 6, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 periph_noc_clk_src = {
-	.cmd_rcgr = 0x06014,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_periph_noc_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "periph_noc_clk_src",
-		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_usb30_master_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(120000000, P_GPLL0, 5, 0, 0),
@@ -1112,18 +1043,6 @@ enum {
 	},
 };
 
-static struct clk_rcg2 gcc_sleep_clk_src = {
-	.cmd_rcgr = 0x43014,
-	.hid_width = 5,
-	.parent_map = gcc_sleep_clk_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gcc_sleep_clk_src",
-		.parent_names = gcc_sleep_clk,
-		.num_parents = 1,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.cmd_rcgr = 0x48040,
 	.hid_width = 5,
@@ -1331,7 +1250,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 			.ops = &clk_branch2_ops,
@@ -1374,9 +1293,8 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
-			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
+			.parent_names = gcc_sleep_clk,
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1449,9 +1367,8 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb20_sleep_clk",
-			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
+			.parent_names = gcc_sleep_clk,
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1479,7 +1396,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_phy_cfg_ahb2phy_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1509,7 +1426,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1554,7 +1471,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1584,7 +1501,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc3_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1614,7 +1531,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1630,7 +1547,7 @@ enum {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1646,9 +1563,8 @@ enum {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
-			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
+			.parent_names = gcc_sleep_clk,
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1932,7 +1848,7 @@ enum {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1948,9 +1864,8 @@ enum {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_sleep_clk",
-			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
+			.parent_names = gcc_sleep_clk,
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2233,7 +2148,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2264,7 +2179,7 @@ enum {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2279,7 +2194,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2309,9 +2224,8 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_inactivity_timers_clk",
-			.parent_names = (const char *[]){ "gcc_sleep_clk_src" },
+			.parent_names = gcc_sleep_clk,
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2325,7 +2239,7 @@ enum {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2413,7 +2327,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_slv_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2428,7 +2342,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_mstr_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2443,7 +2357,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2488,7 +2402,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_slv_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2503,7 +2417,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_mstr_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2518,7 +2432,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2563,7 +2477,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_2_slv_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2578,7 +2492,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_2_mstr_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2593,7 +2507,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_2_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2638,7 +2552,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_phy_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2683,7 +2597,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2863,7 +2777,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre0_snoc_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2878,7 +2792,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre0_cnoc_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2893,7 +2807,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_aggre0_axi_clk",
-			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.parent_names = (const char *[]){ "snoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2908,7 +2822,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_aggre0_ahb_clk",
-			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.parent_names = (const char *[]){ "cnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2953,7 +2867,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qspi_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.parent_names = (const char *[]){ "pcnoc_clk" },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -3150,9 +3064,6 @@ enum {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL4_EARLY] = &gpll4_early.clkr,
 	[GPLL4] = &gpll4.clkr,
-	[SYSTEM_NOC_CLK_SRC] = &system_noc_clk_src.clkr,
-	[CONFIG_NOC_CLK_SRC] = &config_noc_clk_src.clkr,
-	[PERIPH_NOC_CLK_SRC] = &periph_noc_clk_src.clkr,
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[USB30_MOCK_UTMI_CLK_SRC] = &usb30_mock_utmi_clk_src.clkr,
 	[USB3_PHY_AUX_CLK_SRC] = &usb3_phy_aux_clk_src.clkr,
@@ -3201,7 +3112,6 @@ enum {
 	[BLSP2_UART6_APPS_CLK_SRC] = &blsp2_uart6_apps_clk_src.clkr,
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[TSIF_REF_CLK_SRC] = &tsif_ref_clk_src.clkr,
-	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
 	[HMSS_RBCPR_CLK_SRC] = &hmss_rbcpr_clk_src.clkr,
 	[HMSS_GPLL0_CLK_SRC] = &hmss_gpll0_clk_src.clkr,
 	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 1f5c422..1847e13 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -24,9 +24,6 @@
 #define GPLL3							7
 #define GPLL4_EARLY						8
 #define GPLL4							9
-#define SYSTEM_NOC_CLK_SRC					10
-#define CONFIG_NOC_CLK_SRC					11
-#define PERIPH_NOC_CLK_SRC					12
 #define MMSS_BIMC_GFX_CLK_SRC					13
 #define USB30_MASTER_CLK_SRC					14
 #define USB30_MOCK_UTMI_CLK_SRC					15
@@ -77,7 +74,6 @@
 #define PDM2_CLK_SRC						60
 #define TSIF_REF_CLK_SRC					61
 #define CE1_CLK_SRC						62
-#define GCC_SLEEP_CLK_SRC					63
 #define BIMC_CLK_SRC						64
 #define HMSS_AHB_CLK_SRC					65
 #define BIMC_HMSS_AXI_CLK_SRC					66
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

