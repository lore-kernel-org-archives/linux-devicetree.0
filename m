From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] clk: qcom: smd: Add support for QCS404 rpm clocks
Date: Sat,  3 Nov 2018 00:00:02 -0700
Message-ID: <20181103070002.19106-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

Add rpm smd clocks, PMIC and bus clocks which are required on QCS404
for clients to vote on.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
[bjorn: Dropped cxo, voter clocks and static initialization]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 45 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 4491d1c104aa..87b4949e9bc8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -16,6 +16,7 @@ Required properties :
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
+			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 850c02a52248..d3aadaeb2903 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -611,10 +611,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 	.num_clks = ARRAY_SIZE(msm8996_clks),
 };
 
+/* QCS404 */
+DEFINE_CLK_SMD_RPM_QDSS(qcs404, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+
+DEFINE_CLK_SMD_RPM(qcs404, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcs404, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+
+DEFINE_CLK_SMD_RPM(qcs404, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+
+DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcs404, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, rf_clk1_pin, rf_clk1_a_pin, 4);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_a_clk, 8);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8);
+
+static struct clk_smd_rpm *qcs404_clks[] = {
+	[RPM_SMD_QDSS_CLK] = &qcs404_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &qcs404_qdss_a_clk,
+	[RPM_SMD_PNOC_CLK] = &qcs404_pnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &qcs404_pnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &qcs404_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &qcs404_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &qcs404_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &qcs404_bimc_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
+	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
+	[RPM_SMD_CE1_CLK] = &qcs404_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &qcs404_ce1_a_clk,
+	[RPM_SMD_RF_CLK1] = &qcs404_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &qcs404_rf_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
+	.clks = qcs404_clks,
+	.num_clks = ARRAY_SIZE(qcs404_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
+	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index c585b82b9c05..3658b0c14966 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -123,5 +123,9 @@
 #define RPM_SMD_DIV_A_CLK3			73
 #define RPM_SMD_LN_BB_CLK			74
 #define RPM_SMD_LN_BB_A_CLK			75
+#define RPM_SMD_BIMC_GPU_CLK			76
+#define RPM_SMD_BIMC_GPU_A_CLK			77
+#define RPM_SMD_QPIC_CLK			78
+#define RPM_SMD_QPIC_CLK_A			79
 
 #endif
-- 
2.18.0
