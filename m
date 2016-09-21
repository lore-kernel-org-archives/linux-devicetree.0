From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 3/7] clk: qcom: ipq4019: Added the nodes for pcnoc
Date: Wed, 21 Sep 2016 17:51:48 +0530
Message-ID: <1474460512-31994-4-git-send-email-absahu@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474460512-31994-1-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ntelkar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current ipq4019 clock driver does not have the node for
PCNOC so this patch adds and registers the PCNOC clock nodes.
This PCNOC clock is critical and should not be turned off so
setting CRITICAL flag also.

Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/gcc-ipq4019.c               | 39 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 74f7ba8..211c68c 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1550,6 +1550,43 @@ static struct clk_pll_div gcc_fepllwcss5g_clk = {
 	.div_table = fepllwcss_clk_div_table
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
@@ -1620,6 +1657,8 @@ static struct clk_regmap *gcc_ipq4019_clocks[] = {
 	[GCC_FEPLL_WCSS2G_CLK] = &gcc_fepllwcss2g_clk.cdiv.clkr,
 	[GCC_FEPLL_WCSS5G_CLK] = &gcc_fepllwcss5g_clk.cdiv.clkr,
 	[GCC_APPS_CPU_PLLDIV_CLK] = &gcc_apps_cpu_plldiv_clk.cdiv.clkr,
+	[GCC_PCNOC_AHB_CLK_SRC] = &gcc_pcnoc_ahb_clk_src.clkr,
+	[GCC_PCNOC_AHB_CLK] = &pcnoc_clk_src.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq4019_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
index 921565d..3b98498 100644
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
@@ -91,6 +91,7 @@
 #define GCC_FEPLL_WCSS2G_CLK				72
 #define GCC_FEPLL_WCSS5G_CLK				73
 #define GCC_APPS_CPU_PLLDIV_CLK				74
+#define GCC_PCNOC_AHB_CLK_SRC				75
 
 #define WIFI0_CPU_INIT_RESET				0
 #define WIFI0_RADIO_SRIF_RESET				1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
