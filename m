From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2] clk: qcom: smd: Add support for MSM8998 rpm clocks
Date: Thu,  6 Dec 2018 15:11:50 -0700
Message-ID: <1544134310-10227-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on MSM8998
for clients to vote on.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
v2
-fix compatible ordering nits per Stephen

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                     | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             |  6 +++
 3 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 87b4949..944719b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -16,6 +16,7 @@ Required properties :
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
+			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index d3aadae..b1f95a9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -655,10 +655,72 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
+/* msm8998 */
+DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, div_clk1, div_clk1_a, 0xb);
+DEFINE_CLK_SMD_RPM(msm8998, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, bb_clk3_pin, bb_clk3_a_pin, 3);
+DEFINE_CLK_SMD_RPM(msm8998, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
+		   QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
+		   QCOM_SMD_RPM_AGGR_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
+		   QCOM_SMD_RPM_AGGR_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8998, qdss_clk, qdss_a_clk,
+			QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
+static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8998_cnoc_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8998_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8998_ce1_a_clk,
+	[RPM_SMD_DIV_CLK1] = &msm8998_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8998_div_clk1_a,
+	[RPM_SMD_IPA_CLK] = &msm8998_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8998_ipa_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8998_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8998_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &msm8998_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8998_bb_clk2_a,
+	[RPM_SMD_BB_CLK3_PIN] = &msm8998_bb_clk3_pin,
+	[RPM_SMD_BB_CLK3_A_PIN] = &msm8998_bb_clk3_a_pin,
+	[RPM_SMD_MMAXI_CLK] = &msm8998_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &msm8998_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_AGGR1_NOC_CLK] = &msm8998_aggre1_noc_clk,
+	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8998_aggre1_noc_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &msm8998_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8998_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8998_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8998_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8998_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8998_rf_clk1_a,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8998_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8998_rf_clk2_a_pin,
+	[RPM_SMD_RF_CLK3] = &msm8998_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &msm8998_rf_clk3_a,
+	[RPM_SMD_RF_CLK3_PIN] = &msm8998_rf_clk3_pin,
+	[RPM_SMD_RF_CLK3_A_PIN] = &msm8998_rf_clk3_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
+	.clks = msm8998_clks,
+	.num_clks = ARRAY_SIZE(msm8998_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
+	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ }
 };
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 3658b0c..81dbd1f 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -127,5 +127,11 @@
 #define RPM_SMD_BIMC_GPU_A_CLK			77
 #define RPM_SMD_QPIC_CLK			78
 #define RPM_SMD_QPIC_CLK_A			79
+#define RPM_SMD_BB_CLK3_PIN			80
+#define RPM_SMD_BB_CLK3_A_PIN			81
+#define RPM_SMD_RF_CLK3				82
+#define RPM_SMD_RF_CLK3_A			83
+#define RPM_SMD_RF_CLK3_PIN			84
+#define RPM_SMD_RF_CLK3_A_PIN			85
 
 #endif
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
