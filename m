From: AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH] clk: qcom: smd: Add support for MSM8956/76 RPM clocks
Date: Sat, 12 Jan 2019 16:38:58 +0100
Message-ID: <2fcdf0e9b1eef55350911984064dd94f16f1fcd8.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <kholk11@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>From 6aeefad77a2a5d47a9bd009d2d10db2a5dd153a2 Mon Sep 17 00:00:00 2001
From: "Angelo G. Del Regno" <kholk11@gmail.com>
Date: Sat, 12 Jan 2019 16:31:09 +0100
Subject: [PATCH] clk: qcom: smd: Add support for MSM8956/76 RPM clocks

Add all RPM clocks found on MSM8956/MSM8976 SoCs.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 87b4949e9bc8..2aebc4db54f3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -15,6 +15,7 @@ Required properties :
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
+			"qcom,rpmcc-msm8976", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index d3aadaeb2903..b916435e2759 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -531,6 +531,58 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.num_clks = ARRAY_SIZE(msm8974_clks),
 };
 
+/* msm8976 */
+DEFINE_CLK_SMD_RPM_BRANCH(msm8976, cxo, cxo_a,
+				QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM(msm8976, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8976, mmssnoc_axi_clk, mmssnoc_axi_a_clk,
+				QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8976, qdss_clk, qdss_a_clk,
+				QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk1, bb_clk1_a, 0x1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk2, bb_clk2_a, 0x2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, rf_clk2, rf_clk2_a, 0x5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, div_clk2, div_clk2_a, 0xC);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk2_pin, bb_clk2_a_pin, 2);
+
+static struct clk_smd_rpm *msm8976_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8976_cxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8976_cxo_a,
+	[RPM_SMD_BIMC_CLK] = &msm8976_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8976_bimc_a_clk,
+	[RPM_SMD_MMAXI_CLK] = &msm8976_mmssnoc_axi_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &msm8976_mmssnoc_axi_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8976_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8976_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8976_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8976_snoc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8976_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8976_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8976_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8976_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8976_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8976_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &msm8976_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8976_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8976_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8976_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK2] = &msm8976_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8976_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2] = &msm8976_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8976_div_clk2_a,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
+	.clks = msm8976_clks,
+	.num_clks = ARRAY_SIZE(msm8976_clks),
+};
+
 /* msm8996 */
 DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -658,6 +710,7 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
+	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ }
-- 
2.19.1
