From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 3/6] clk: qcom: ipq4019: Add the nodes for pcnoc
Date: Fri, 25 Nov 2016 21:11:30 +0530
Message-ID: <1480088493-4590-4-git-send-email-absahu@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The current ipq4019 clock driver does not have the node for
PCNOC so this patch adds and registers the PCNOC clock nodes.
This PCNOC clock is critical and should not be turned off so
setting CRITICAL flag also.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 39 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 000c224..40187ae 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1521,6 +1521,43 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	.pll_vco = &gcc_fepll_vco,
 };
 
+static const struct freq_tbl ftbl_gcc_pcnoc_ahb_clk[] = {
+	F(48000000,  P_XO,	 1, 0, 0),
+	F(100000000, P_FEPLL200, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcnoc_ahb_clk_src = {
+	.cmd_rcgr = 0x21024,
+	.hid_width = 5,
+	.parent_map = gcc_xo_200_500_map,
+	.freq_tbl = ftbl_gcc_pcnoc_ahb_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gcc_pcnoc_ahb_clk_src",
+		.parent_names = gcc_xo_200_500,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch pcnoc_clk_src = {
+	.halt_reg = 0x21030,
+	.clkr = {
+		.enable_reg = 0x21030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "pcnoc_clk_src",
+			.parent_names = (const char *[]){
+				"gcc_pcnoc_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT |
+				CLK_IS_CRITICAL,
+		},
+	},
+};
+
 static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[AUDIO_CLK_SRC] = &audio_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
@@ -1589,6 +1626,8 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
 	[GCC_APSS_CPU_PLLDIV_CLK] = &gcc_apss_cpu_plldiv_clk.cdiv.clkr,
+	[GCC_PCNOC_AHB_CLK_SRC] = &gcc_pcnoc_ahb_clk_src.clkr,
+	[GCC_PCNOC_AHB_CLK] = &pcnoc_clk_src.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index c629b2b..7e8a7be 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -91,6 +91,7 @@
 #define GCC_FEPLL_WCSS2G_CLK				72
 #define GCC_FEPLL_WCSS5G_CLK				73
 #define GCC_APSS_CPU_PLLDIV_CLK				74
+#define GCC_PCNOC_AHB_CLK_SRC				75
 
 #define WIFI0_CPU_INIT_RESET				0
 #define WIFI0_RADIO_SRIF_RESET				1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
