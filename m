From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] clk: qcom: Add some missing gcc clks for msm8996
Date: Thu,  9 Aug 2018 15:01:19 -0700
Message-ID: <20180809220119.18932-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

Add a few missing gcc clks for msm8996

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
[bjorn: omit aggre0_noc_qosgen_extref_clk]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Dropped LPASS SMMU clocks already introduced by Srinivas

 drivers/clk/qcom/gcc-msm8996.c               | 152 +++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h |   9 ++
 2 files changed, 161 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 9a3290fdd01b..9d136172c27c 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -260,6 +260,36 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 	},
 };
 
+static struct clk_branch gcc_mmss_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mmss_gpll0_div_clk",
+			.parent_names = (const char *[]){ "gpll0" },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_gpll0_div_clk",
+			.parent_names = (const char *[]){ "gpll0" },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops
+		},
+	},
+};
+
 static struct clk_alpha_pll gpll4_early = {
 	.offset = 0x77000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -2951,6 +2981,20 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_aggre1_pnoc_ahb_clk = {
+	.halt_reg = 0x82014,
+	.clkr = {
+		.enable_reg = 0x82014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre1_pnoc_ahb_clk",
+			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_aggre2_ufs_axi_clk = {
 	.halt_reg = 0x83014,
 	.clkr = {
@@ -2981,6 +3025,34 @@ static struct clk_branch gcc_aggre2_usb3_axi_clk = {
 	},
 };
 
+static struct clk_branch gcc_dcc_ahb_clk = {
+	.halt_reg = 0x84004,
+	.clkr = {
+		.enable_reg = 0x84004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_dcc_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre0_noc_mpu_cfg_ahb_clk = {
+	.halt_reg = 0x85000,
+	.clkr = {
+		.enable_reg = 0x85000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre0_noc_mpu_cfg_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qspi_ahb_clk = {
 	.halt_reg = 0x8b004,
 	.clkr = {
@@ -3039,6 +3111,20 @@ static struct clk_branch gcc_hdmi_clkref_clk = {
 	},
 };
 
+static struct clk_branch gcc_edp_clkref_clk = {
+	.halt_reg = 0x88004,
+	.clkr = {
+		.enable_reg = 0x88004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_edp_clkref_clk",
+			.parent_names = (const char *[]){ "xo" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_clkref_clk = {
 	.halt_reg = 0x88008,
 	.clkr = {
@@ -3095,6 +3181,62 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 	},
 };
 
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x8a000,
+	.clkr = {
+		.enable_reg = 0x8a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_cfg_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
+	.halt_reg = 0x8a004,
+	.clkr = {
+		.enable_reg = 0x8a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_mnoc_bimc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_snoc_axi_clk = {
+	.halt_reg = 0x8a024,
+	.clkr = {
+		.enable_reg = 0x8a024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_snoc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x8a028,
+	.clkr = {
+		.enable_reg = 0x8a028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_msm8996_hws[] = {
 	&xo.hw,
 	&gpll0_early_div.hw,
@@ -3355,6 +3497,7 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_AGGRE0_CNOC_AHB_CLK] = &gcc_aggre0_cnoc_ahb_clk.clkr,
 	[GCC_SMMU_AGGRE0_AXI_CLK] = &gcc_smmu_aggre0_axi_clk.clkr,
 	[GCC_SMMU_AGGRE0_AHB_CLK] = &gcc_smmu_aggre0_ahb_clk.clkr,
+	[GCC_AGGRE1_PNOC_AHB_CLK] = &gcc_aggre1_pnoc_ahb_clk.clkr,
 	[GCC_AGGRE2_UFS_AXI_CLK] = &gcc_aggre2_ufs_axi_clk.clkr,
 	[GCC_AGGRE2_USB3_AXI_CLK] = &gcc_aggre2_usb3_axi_clk.clkr,
 	[GCC_QSPI_AHB_CLK] = &gcc_qspi_ahb_clk.clkr,
@@ -3365,6 +3508,15 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_PCIE_CLKREF_CLK] = &gcc_pcie_clkref_clk.clkr,
 	[GCC_RX2_USB2_CLKREF_CLK] = &gcc_rx2_usb2_clkref_clk.clkr,
 	[GCC_RX1_USB2_CLKREF_CLK] = &gcc_rx1_usb2_clkref_clk.clkr,
+	[GCC_EDP_CLKREF_CLK] = &gcc_edp_clkref_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
+	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
+	[GCC_DCC_AHB_CLK] = &gcc_dcc_ahb_clk.clkr,
+	[GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK] = &gcc_aggre0_noc_mpu_cfg_ahb_clk.clkr,
+	[GCC_MMSS_GPLL0_DIV_CLK] = &gcc_mmss_gpll0_div_clk.clkr,
+	[GCC_MSS_GPLL0_DIV_CLK] = &gcc_mss_gpll0_div_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8996_gdscs[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 75b07cf5eed0..db80f2ee571b 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -235,6 +235,15 @@
 #define GCC_RX1_USB2_CLKREF_CLK					218
 #define GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK			219
 #define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK			220
+#define GCC_EDP_CLKREF_CLK					221
+#define GCC_MSS_CFG_AHB_CLK					222
+#define GCC_MSS_Q6_BIMC_AXI_CLK					223
+#define GCC_MSS_SNOC_AXI_CLK					224
+#define GCC_MSS_MNOC_BIMC_AXI_CLK				225
+#define GCC_DCC_AHB_CLK						226
+#define GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK				227
+#define GCC_MMSS_GPLL0_DIV_CLK					228
+#define GCC_MSS_GPLL0_DIV_CLK					229
 
 #define GCC_SYSTEM_NOC_BCR					0
 #define GCC_CONFIG_NOC_BCR					1
-- 
2.18.0
