From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] regulator: qcom-smd: Add PM8994 regulator support
Date: Wed, 18 Jan 2017 02:46:37 -0800
Message-ID: <20170118104637.3312-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

This patch adds support for the PM8994 regulators found on msm8992,
msm8994 and msm8996 platforms.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
[bjorn: Add DT binding doc and vdd_lvs1_2 supply]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/regulator/qcom,smd-rpm-regulator.txt  |  56 +++++++++++
 drivers/regulator/qcom_smd-regulator.c             | 102 +++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
index 1f8d6f84b657..4e3dfb5b5f16 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
@@ -22,6 +22,7 @@ Regulator nodes are identified by their compatible:
 		    "qcom,rpm-pm8841-regulators"
 		    "qcom,rpm-pm8916-regulators"
 		    "qcom,rpm-pm8941-regulators"
+		    "qcom,rpm-pm8994-regulators"
 		    "qcom,rpm-pma8084-regulators"
 
 - vdd_s1-supply:
@@ -80,6 +81,56 @@ Regulator nodes are identified by their compatible:
 - vdd_s10-supply:
 - vdd_s11-supply:
 - vdd_s12-supply:
+- vdd_l1-supply:
+- vdd_l2_l26_l28-supply:
+- vdd_l3_l11-supply:
+- vdd_l4_l27_l31-supply:
+- vdd_l5_l7-supply:
+- vdd_l6_l12_l32-supply:
+- vdd_l5_l7-supply:
+- vdd_l8_l16_l30-supply:
+- vdd_l9_l10_l18_l22-supply:
+- vdd_l9_l10_l18_l22-supply:
+- vdd_l3_l11-supply:
+- vdd_l6_l12_l32-supply:
+- vdd_l13_l19_l23_l24-supply:
+- vdd_l14_l15-supply:
+- vdd_l14_l15-supply:
+- vdd_l8_l16_l30-supply:
+- vdd_l17_l29-supply:
+- vdd_l9_l10_l18_l22-supply:
+- vdd_l13_l19_l23_l24-supply:
+- vdd_l20_l21-supply:
+- vdd_l20_l21-supply:
+- vdd_l9_l10_l18_l22-supply:
+- vdd_l13_l19_l23_l24-supply:
+- vdd_l13_l19_l23_l24-supply:
+- vdd_l25-supply:
+- vdd_l2_l26_l28-supply:
+- vdd_l4_l27_l31-supply:
+- vdd_l2_l26_l28-supply:
+- vdd_l17_l29-supply:
+- vdd_l8_l16_l30-supply:
+- vdd_l4_l27_l31-supply:
+- vdd_l6_l12_l32-supply:
+- vdd_lvs1_2-supply:
+	Usage: optional (pm8994 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+- vdd_s7-supply:
+- vdd_s8-supply:
+- vdd_s9-supply:
+- vdd_s10-supply:
+- vdd_s11-supply:
+- vdd_s12-supply:
 - vdd_l1_l11-supply:
 - vdd_l2_l3_l4_l27-supply:
 - vdd_l5_l7-supply:
@@ -113,6 +164,11 @@ pm8941:
 	l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
 	lvs3, 5vs1, 5vs2
 
+pm8994:
+	s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3, l4, l5,
+	l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20,
+	l21, l22, l23, l24, l25, l26, l27, l28, l29, l30, l31, l32, lvs1, lvs2
+
 pma8084:
 	s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3, l4, l5,
 	l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20,
diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 8ed46a9a55c8..f35994a2a5be 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -305,6 +305,56 @@ static const struct regulator_desc pm8916_buck_hvo_smps = {
 	.ops = &rpm_smps_ldo_ops,
 };
 
+static const struct regulator_desc pm8994_hfsmps = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE( 375000,  0,  95, 12500),
+		REGULATOR_LINEAR_RANGE(1550000, 96, 158, 25000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 159,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8994_ftsmps = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(350000,  0, 199, 5000),
+		REGULATOR_LINEAR_RANGE(700000, 200, 349, 10000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 350,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8994_nldo = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(750000, 0, 63, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 64,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8994_pldo = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE( 750000,  0,  63, 12500),
+		REGULATOR_LINEAR_RANGE(1550000, 64, 126, 25000),
+		REGULATOR_LINEAR_RANGE(3100000, 127, 163, 50000),
+	},
+	.n_linear_ranges = 3,
+	.n_voltages = 164,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8994_switch = {
+	.ops = &rpm_switch_ops,
+};
+
+static const struct regulator_desc pm8994_lnldo = {
+	.fixed_uV = 1740000,
+	.n_voltages = 1,
+	.ops = &rpm_smps_ldo_ops_fixed,
+};
+
 struct rpm_regulator_data {
 	const char *name;
 	u32 type;
@@ -443,10 +493,62 @@ static const struct rpm_regulator_data rpm_pma8084_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8994_ftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8994_ftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm8994_hfsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8994_hfsmps, "vdd_s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8994_hfsmps, "vdd_s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pm8994_ftsmps, "vdd_s6" },
+	{ "s7", QCOM_SMD_RPM_SMPA, 7, &pm8994_hfsmps, "vdd_s7" },
+	{ "s8", QCOM_SMD_RPM_SMPA, 8, &pm8994_ftsmps, "vdd_s8" },
+	{ "s9", QCOM_SMD_RPM_SMPA, 9, &pm8994_ftsmps, "vdd_s9" },
+	{ "s10", QCOM_SMD_RPM_SMPA, 10, &pm8994_ftsmps, "vdd_s10" },
+	{ "s11", QCOM_SMD_RPM_SMPA, 11, &pm8994_ftsmps, "vdd_s11" },
+	{ "s12", QCOM_SMD_RPM_SMPA, 12, &pm8994_ftsmps, "vdd_s12" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm8994_nldo, "vdd_l1" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm8994_nldo, "vdd_l2_l26_l28" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm8994_nldo, "vdd_l3_l11" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm8994_nldo, "vdd_l4_l27_l31" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm8994_lnldo, "vdd_l5_l7" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm8994_pldo, "vdd_l6_l12_l32" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm8994_lnldo, "vdd_l5_l7" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm8994_pldo, "vdd_l8_l16_l30" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm8994_pldo, "vdd_l9_l10_l18_l22" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8994_pldo, "vdd_l9_l10_l18_l22" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8994_nldo, "vdd_l3_l11" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8994_pldo, "vdd_l6_l12_l32" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8994_pldo, "vdd_l13_l19_l23_l24" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8994_pldo, "vdd_l14_l15" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8994_pldo, "vdd_l14_l15" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8994_pldo, "vdd_l8_l16_l30" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8994_pldo, "vdd_l17_l29" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm8994_pldo, "vdd_l9_l10_l18_l22" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm8994_pldo, "vdd_l13_l19_l23_l24" },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm8994_pldo, "vdd_l20_l21" },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm8994_pldo, "vdd_l20_l21" },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm8994_pldo, "vdd_l9_l10_l18_l22" },
+	{ "l23", QCOM_SMD_RPM_LDOA, 23, &pm8994_pldo, "vdd_l13_l19_l23_l24" },
+	{ "l24", QCOM_SMD_RPM_LDOA, 24, &pm8994_pldo, "vdd_l13_l19_l23_l24" },
+	{ "l25", QCOM_SMD_RPM_LDOA, 25, &pm8994_pldo, "vdd_l25" },
+	{ "l26", QCOM_SMD_RPM_LDOA, 26, &pm8994_nldo, "vdd_l2_l26_l28" },
+	{ "l27", QCOM_SMD_RPM_LDOA, 27, &pm8994_nldo, "vdd_l4_l27_l31" },
+	{ "l28", QCOM_SMD_RPM_LDOA, 28, &pm8994_nldo, "vdd_l2_l26_l28" },
+	{ "l29", QCOM_SMD_RPM_LDOA, 29, &pm8994_pldo, "vdd_l17_l29" },
+	{ "l30", QCOM_SMD_RPM_LDOA, 30, &pm8994_pldo, "vdd_l8_l16_l30" },
+	{ "l31", QCOM_SMD_RPM_LDOA, 31, &pm8994_nldo, "vdd_l4_l27_l31" },
+	{ "l32", QCOM_SMD_RPM_LDOA, 32, &pm8994_pldo, "vdd_l6_l12_l32" },
+	{ "lvs1", QCOM_SMD_RPM_VSA, 1, &pm8994_switch, "vdd_lvs1_2" },
+	{ "lvs2", QCOM_SMD_RPM_VSA, 2, &pm8994_switch, "vdd_lvs1_2" },
+
+	{}
+};
+
 static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
 	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },
+	{ .compatible = "qcom,rpm-pm8994-regulators", .data = &rpm_pm8994_regulators },
 	{ .compatible = "qcom,rpm-pma8084-regulators", .data = &rpm_pma8084_regulators },
 	{}
 };
-- 
2.11.0
