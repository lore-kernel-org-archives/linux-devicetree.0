From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] clk: qcom: clk-smd-rpm: add msm8996 rpmclks
Date: Wed, 22 Mar 2017 15:09:25 +0530
Message-ID: <1490175566-4084-2-git-send-email-rnayak@codeaurora.org>
References: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add all RPM controlled clocks on msm8996 platform

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
[srini: Fixed various issues with offsets and made names specific to msm8996]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                     | 82 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             | 14 ++++
 include/linux/soc/qcom/smd-rpm.h                   |  4 ++
 4 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index a7235e9..a7e4a86 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -13,6 +13,7 @@ Required properties :
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
+			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3487c26..4186d3d 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -532,9 +532,91 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 	.clks = msm8974_clks,
 	.num_clks = ARRAY_SIZE(msm8974_clks),
 };
+
+/* msm8996 */
+DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8996, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8996, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
+		   QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8996, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8996, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk,
+			  QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk,
+			  QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
+DEFINE_CLK_SMD_RPM_QDSS(msm8996, qdss_clk, qdss_a_clk,
+			QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, ln_bb_clk, ln_bb_a_clk, 8);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk1, div_clk1_a, 0xb);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk2, div_clk2_a, 0xc);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk3, div_clk3_a, 0xd);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, bb_clk2_pin, bb_clk2_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+static struct clk_smd_rpm *msm8996_clks[] = {
+	[RPM_SMD_PCNOC_CLK] = &msm8996_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8996_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8996_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8996_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8996_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8996_cnoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8996_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8996_bimc_a_clk,
+	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &msm8996_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8996_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8996_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8996_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8996_ce1_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8996_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8996_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8996_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8996_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &msm8996_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8996_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &msm8996_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8996_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8996_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8996_rf_clk2_a,
+	[RPM_SMD_LN_BB_CLK] = &msm8996_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8996_ln_bb_a_clk,
+	[RPM_SMD_DIV_CLK1] = &msm8996_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8996_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &msm8996_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8996_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &msm8996_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &msm8996_div_clk3_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8996_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8996_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8996_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8996_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8996_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8996_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8996_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8996_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
+	.clks = msm8996_clks,
+	.num_clks = ARRAY_SIZE(msm8996_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
+	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 96b63c0..eb5ef66 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -101,5 +101,19 @@
 #define RPM_SMD_CXO_A1_A_PIN			59
 #define RPM_SMD_CXO_A2_PIN			60
 #define RPM_SMD_CXO_A2_A_PIN			61
+#define RPM_SMD_AGGR1_NOC_CLK			62
+#define RPM_SMD_AGGR1_NOC_A_CLK			63
+#define RPM_SMD_AGGR2_NOC_CLK			64
+#define RPM_SMD_AGGR2_NOC_A_CLK			65
+#define RPM_SMD_MMAXI_CLK			66
+#define RPM_SMD_MMAXI_A_CLK			67
+#define RPM_SMD_IPA_CLK				68
+#define RPM_SMD_IPA_A_CLK			69
+#define RPM_SMD_CE1_CLK				70
+#define RPM_SMD_CE1_A_CLK			71
+#define RPM_SMD_DIV_CLK3			72
+#define RPM_SMD_DIV_A_CLK3			73
+#define RPM_SMD_LN_BB_CLK			74
+#define RPM_SMD_LN_BB_A_CLK			75
 
 #endif
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 2a53dca..ebdabd6 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -26,6 +26,10 @@
 #define QCOM_SMD_RPM_SMPB	0x62706d73
 #define QCOM_SMD_RPM_SPDM	0x63707362
 #define QCOM_SMD_RPM_VSA	0x00617376
+#define QCOM_SMD_RPM_MMAXI_CLK	0x69786d6d
+#define QCOM_SMD_RPM_IPA_CLK	0x617069
+#define QCOM_SMD_RPM_CE_CLK	0x6563
+#define QCOM_SMD_RPM_AGGR_CLK	0x72676761
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

