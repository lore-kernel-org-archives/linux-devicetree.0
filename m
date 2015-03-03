From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Mon, 2 Mar 2015 20:25:40 -0800
Message-ID: <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Modeling the individual RPM resources as platform devices consumes at
least 12-15kb of RAM, just to hold the platform_device structs. Rework
this to instead have one device per pmic exposed by the RPM.

With this representation we can more accurately define the input pins on
the pmic and have the supply description match the data sheet.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/regulator/qcom_rpm-regulator.c | 245 ++++++++++++++++++++++-----------
 1 file changed, 161 insertions(+), 84 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 1ec4b98..5cdd568 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -607,31 +607,6 @@ static const struct qcom_rpm_reg smb208_smps = {
 	.supports_force_mode_bypass = false,
 };
 
-static const struct of_device_id rpm_of_match[] = {
-	{ .compatible = "qcom,rpm-pm8058-pldo",     .data = &pm8058_pldo },
-	{ .compatible = "qcom,rpm-pm8058-nldo",     .data = &pm8058_nldo },
-	{ .compatible = "qcom,rpm-pm8058-smps",     .data = &pm8058_smps },
-	{ .compatible = "qcom,rpm-pm8058-ncp",      .data = &pm8058_ncp },
-	{ .compatible = "qcom,rpm-pm8058-switch",   .data = &pm8058_switch },
-
-	{ .compatible = "qcom,rpm-pm8901-pldo",     .data = &pm8901_pldo },
-	{ .compatible = "qcom,rpm-pm8901-nldo",     .data = &pm8901_nldo },
-	{ .compatible = "qcom,rpm-pm8901-ftsmps",   .data = &pm8901_ftsmps },
-	{ .compatible = "qcom,rpm-pm8901-switch",   .data = &pm8901_switch },
-
-	{ .compatible = "qcom,rpm-pm8921-pldo",     .data = &pm8921_pldo },
-	{ .compatible = "qcom,rpm-pm8921-nldo",     .data = &pm8921_nldo },
-	{ .compatible = "qcom,rpm-pm8921-nldo1200", .data = &pm8921_nldo1200 },
-	{ .compatible = "qcom,rpm-pm8921-smps",     .data = &pm8921_smps },
-	{ .compatible = "qcom,rpm-pm8921-ftsmps",   .data = &pm8921_ftsmps },
-	{ .compatible = "qcom,rpm-pm8921-ncp",      .data = &pm8921_ncp },
-	{ .compatible = "qcom,rpm-pm8921-switch",   .data = &pm8921_switch },
-
-	{ .compatible = "qcom,rpm-smb208", .data = &smb208_smps },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, rpm_of_match);
-
 static int rpm_reg_set(struct qcom_rpm_reg *vreg,
 		       const struct request_member *req,
 		       const int value)
@@ -778,75 +753,177 @@ static int rpm_reg_of_parse(struct device_node *node,
 	return 0;
 }
 
-static int rpm_reg_probe(struct platform_device *pdev)
-{
-	struct regulator_init_data *initdata;
+struct rpm_regulator_data {
+	const char *name;
+	int resource;
 	const struct qcom_rpm_reg *template;
-	const struct of_device_id *match;
-	struct regulator_config config = { };
-	struct regulator_dev *rdev;
-	struct qcom_rpm_reg *vreg;
-	const char *key;
-	u32 val;
-	int ret;
+	const char *supply;
+};
+
+static const struct rpm_regulator_data rpm_pm8058_regulators[] = {
+	{ "l0",   QCOM_RPM_PM8058_LDO0,   &pm8058_nldo, "vdd_l0_l1_lvs"	},
+	{ "l1",   QCOM_RPM_PM8058_LDO1,   &pm8058_nldo, "vdd_l0_l1_lvs" },
+	{ "l2",   QCOM_RPM_PM8058_LDO2,   &pm8058_pldo, "vdd_l2_l11_l12" },
+	{ "l3",   QCOM_RPM_PM8058_LDO3,   &pm8058_pldo, "vdd_l3_l4_l5" },
+	{ "l4",   QCOM_RPM_PM8058_LDO4,   &pm8058_pldo, "vdd_l3_l4_l5" },
+	{ "l5",   QCOM_RPM_PM8058_LDO5,   &pm8058_pldo, "vdd_l3_l4_l5" },
+	{ "l6",   QCOM_RPM_PM8058_LDO6,   &pm8058_pldo, "vdd_l6_l7" },
+	{ "l7",   QCOM_RPM_PM8058_LDO7,   &pm8058_pldo, "vdd_l6_l7" },
+	{ "l8",   QCOM_RPM_PM8058_LDO8,   &pm8058_pldo, "vdd_l8" },
+	{ "l9",   QCOM_RPM_PM8058_LDO9,   &pm8058_pldo, "vdd_l9" },
+	{ "l10",  QCOM_RPM_PM8058_LDO10,  &pm8058_pldo, "vdd_l10" },
+	{ "l11",  QCOM_RPM_PM8058_LDO11,  &pm8058_pldo, "vdd_l2_l11_l12" },
+	{ "l12",  QCOM_RPM_PM8058_LDO12,  &pm8058_pldo, "vdd_l2_l11_l12" },
+	{ "l13",  QCOM_RPM_PM8058_LDO13,  &pm8058_pldo, "vdd_l13_l16" },
+	{ "l14",  QCOM_RPM_PM8058_LDO14,  &pm8058_pldo, "vdd_l14_l15" },
+	{ "l15",  QCOM_RPM_PM8058_LDO15,  &pm8058_pldo, "vdd_l14_l15" },
+	{ "l16",  QCOM_RPM_PM8058_LDO16,  &pm8058_pldo, "vdd_l13_l16" },
+	{ "l17",  QCOM_RPM_PM8058_LDO17,  &pm8058_pldo, "vdd_l17_l18" },
+	{ "l18",  QCOM_RPM_PM8058_LDO18,  &pm8058_pldo, "vdd_l17_l18" },
+	{ "l19",  QCOM_RPM_PM8058_LDO19,  &pm8058_pldo, "vdd_l19_l20" },
+	{ "l20",  QCOM_RPM_PM8058_LDO20,  &pm8058_pldo, "vdd_l19_l20" },
+	{ "l21",  QCOM_RPM_PM8058_LDO21,  &pm8058_nldo, "vdd_l21" },
+	{ "l22",  QCOM_RPM_PM8058_LDO22,  &pm8058_nldo, "vdd_l22" },
+	{ "l23",  QCOM_RPM_PM8058_LDO23,  &pm8058_nldo, "vdd_l23_l24_l25" },
+	{ "l24",  QCOM_RPM_PM8058_LDO24,  &pm8058_nldo, "vdd_l23_l24_l25" },
+	{ "l25",  QCOM_RPM_PM8058_LDO25,  &pm8058_nldo, "vdd_l23_l24_l25" },
+
+	{ "s0",   QCOM_RPM_PM8058_SMPS0,  &pm8058_smps, "vdd_s0" },
+	{ "s1",   QCOM_RPM_PM8058_SMPS1,  &pm8058_smps, "vdd_s1" },
+	{ "s2",   QCOM_RPM_PM8058_SMPS2,  &pm8058_smps, "vdd_s2" },
+	{ "s3",   QCOM_RPM_PM8058_SMPS3,  &pm8058_smps, "vdd_s3" },
+	{ "s4",   QCOM_RPM_PM8058_SMPS4,  &pm8058_smps, "vdd_s4" },
+
+	{ "lvs0", QCOM_RPM_PM8058_LVS0, &pm8058_switch, "vdd_l0_l1_lvs" },
+	{ "lvs1", QCOM_RPM_PM8058_LVS1, &pm8058_switch, "vdd_l0_l1_lvs" },
+
+	{ "ncp",  QCOM_RPM_PM8058_NCP, &pm8058_ncp, "vdd_ncp" },
+	{ }
+};
 
-	match = of_match_device(rpm_of_match, &pdev->dev);
-	template = match->data;
+static const struct rpm_regulator_data rpm_pm8901_regulators[] = {
+	{ "l0",   QCOM_RPM_PM8901_LDO0, &pm8901_nldo, "vdd_l0" },
+	{ "l1",   QCOM_RPM_PM8901_LDO1, &pm8901_pldo, "vdd_l1" },
+	{ "l2",   QCOM_RPM_PM8901_LDO2, &pm8901_pldo, "vdd_l2" },
+	{ "l3",   QCOM_RPM_PM8901_LDO3, &pm8901_pldo, "vdd_l3" },
+	{ "l4",   QCOM_RPM_PM8901_LDO4, &pm8901_pldo, "vdd_l4" },
+	{ "l5",   QCOM_RPM_PM8901_LDO5, &pm8901_pldo, "vdd_l5" },
+	{ "l6",   QCOM_RPM_PM8901_LDO6, &pm8901_pldo, "vdd_l6" },
 
-	vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
-	if (!vreg) {
-		dev_err(&pdev->dev, "failed to allocate vreg\n");
-		return -ENOMEM;
-	}
-	memcpy(vreg, template, sizeof(*vreg));
-	mutex_init(&vreg->lock);
-	vreg->dev = &pdev->dev;
-	vreg->desc.id = -1;
-	vreg->desc.owner = THIS_MODULE;
-	vreg->desc.type = REGULATOR_VOLTAGE;
-	vreg->desc.name = pdev->dev.of_node->name;
-	vreg->desc.supply_name = "vin";
-
-	vreg->rpm = dev_get_drvdata(pdev->dev.parent);
-	if (!vreg->rpm) {
-		dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
-		return -ENODEV;
-	}
+	{ "s0",   QCOM_RPM_PM8901_SMPS0, &pm8901_ftsmps, "vdd_s0" },
+	{ "s1",   QCOM_RPM_PM8901_SMPS1, &pm8901_ftsmps, "vdd_s1" },
+	{ "s2",   QCOM_RPM_PM8901_SMPS2, &pm8901_ftsmps, "vdd_s2" },
+	{ "s3",   QCOM_RPM_PM8901_SMPS3, &pm8901_ftsmps, "vdd_s3" },
+	{ "s4",   QCOM_RPM_PM8901_SMPS4, &pm8901_ftsmps, "vdd_s4" },
 
-	initdata = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
-					      &vreg->desc);
-	if (!initdata)
-		return -EINVAL;
+	{ "lvs0", QCOM_RPM_PM8901_LVS0, &pm8901_switch, "lvs0_in" },
+	{ "lvs1", QCOM_RPM_PM8901_LVS1, &pm8901_switch, "lvs1_in" },
+	{ "lvs2", QCOM_RPM_PM8901_LVS2, &pm8901_switch, "lvs2_in" },
+	{ "lvs3", QCOM_RPM_PM8901_LVS3, &pm8901_switch, "lvs3_in" },
 
-	key = "reg";
-	ret = of_property_read_u32(pdev->dev.of_node, key, &val);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to read %s\n", key);
-		return ret;
-	}
-	vreg->resource = val;
+	{ "mvs", QCOM_RPM_PM8901_MVS, &pm8901_switch, "mvs_in" },
+	{ }
+};
 
-	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
-	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
-		dev_err(&pdev->dev, "no voltage specified for regulator\n");
-		return -EINVAL;
-	}
+static const struct rpm_regulator_data rpm_pm8921_regulators[] = {
+	{ "s1",  QCOM_RPM_PM8921_SMPS1, &pm8921_smps },
+	{ "s2",  QCOM_RPM_PM8921_SMPS2, &pm8921_smps },
+	{ "s3",  QCOM_RPM_PM8921_SMPS3, &pm8921_smps },
+	{ "s4",  QCOM_RPM_PM8921_SMPS4, &pm8921_smps },
+	{ "s7",  QCOM_RPM_PM8921_SMPS7, &pm8921_smps },
+	{ "s8",  QCOM_RPM_PM8921_SMPS8, &pm8921_smps },
+
+	{ "l1",  QCOM_RPM_PM8921_LDO1, &pm8921_nldo, "vin_l1_l2_l12_l18" },
+	{ "l2",  QCOM_RPM_PM8921_LDO2, &pm8921_nldo, "vin_l1_l2_l12_l18" },
+	{ "l3",  QCOM_RPM_PM8921_LDO3, &pm8921_pldo },
+	{ "l4",  QCOM_RPM_PM8921_LDO4, &pm8921_pldo },
+	{ "l5",  QCOM_RPM_PM8921_LDO5, &pm8921_pldo },
+	{ "l6",  QCOM_RPM_PM8921_LDO6, &pm8921_pldo },
+	{ "l7",  QCOM_RPM_PM8921_LDO7, &pm8921_pldo },
+	{ "l8",  QCOM_RPM_PM8921_LDO8, &pm8921_pldo },
+	{ "l9",  QCOM_RPM_PM8921_LDO9, &pm8921_pldo },
+	{ "l10", QCOM_RPM_PM8921_LDO10, &pm8921_pldo },
+	{ "l11", QCOM_RPM_PM8921_LDO11, &pm8921_pldo },
+	{ "l12", QCOM_RPM_PM8921_LDO12, &pm8921_nldo },
+	{ "l14", QCOM_RPM_PM8921_LDO14, &pm8921_pldo },
+	{ "l15", QCOM_RPM_PM8921_LDO15, &pm8921_pldo },
+	{ "l16", QCOM_RPM_PM8921_LDO16, &pm8921_pldo },
+	{ "l17", QCOM_RPM_PM8921_LDO17, &pm8921_pldo },
+	{ "l18", QCOM_RPM_PM8921_LDO18, &pm8921_nldo, "vin_l1_l2_l12_l18" },
+	{ "l21", QCOM_RPM_PM8921_LDO21, &pm8921_pldo },
+	{ "l22", QCOM_RPM_PM8921_LDO22, &pm8921_pldo },
+	{ "l23", QCOM_RPM_PM8921_LDO23, &pm8921_pldo },
+	{ "l24", QCOM_RPM_PM8921_LDO24, &pm8921_nldo1200, "vin_l24" },
+	{ "l25", QCOM_RPM_PM8921_LDO25, &pm8921_nldo1200, "vin_l25" },
+	{ "l26", QCOM_RPM_PM8921_LDO26, &pm8921_nldo1200 },
+	{ "l27", QCOM_RPM_PM8921_LDO27, &pm8921_nldo1200, "vin_l27" },
+	{ "l28", QCOM_RPM_PM8921_LDO28, &pm8921_nldo1200, "vin_l28" },
+	{ "l29", QCOM_RPM_PM8921_LDO29, &pm8921_pldo },
+
+	{ "lvs1", QCOM_RPM_PM8921_LVS1, &pm8921_switch, "vin_lvs_1_3_6" },
+	{ "lvs2", QCOM_RPM_PM8921_LVS2, &pm8921_switch, "vin_lvs2" },
+	{ "lvs3", QCOM_RPM_PM8921_LVS3, &pm8921_switch, "vin_lvs_1_3_6" },
+	{ "lvs4", QCOM_RPM_PM8921_LVS4, &pm8921_switch, "vin_lvs_4_5_7" },
+	{ "lvs5", QCOM_RPM_PM8921_LVS5, &pm8921_switch, "vin_lvs_4_5_7" },
+	{ "lvs6", QCOM_RPM_PM8921_LVS6, &pm8921_switch, "vin_lvs_1_3_6" },
+	{ "lvs7", QCOM_RPM_PM8921_LVS7, &pm8921_switch, "vin_lvs_4_5_7" },
+
+	{ "usb-switch", QCOM_RPM_USB_OTG_SWITCH, &pm8921_switch },
+	{ "hdmi-switch", QCOM_RPM_HDMI_SWITCH, &pm8921_switch },
+	{ "ncp", QCOM_RPM_PM8921_NCP, &pm8921_ncp, "vin_ncp" },
+	{ }
+};
 
+static const struct of_device_id rpm_of_match[] = {
+	{ .compatible = "qcom,rpm-pm8058-regulators", .data = &rpm_pm8058_regulators },
+	{ .compatible = "qcom,rpm-pm8901-regulators", .data = &rpm_pm8901_regulators },
+	{ .compatible = "qcom,rpm-pm8921-regulators", .data = &rpm_pm8921_regulators },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpm_of_match);
 
-	config.dev = &pdev->dev;
-	config.init_data = initdata;
-	config.driver_data = vreg;
-	config.of_node = pdev->dev.of_node;
+static int rpm_reg_probe(struct platform_device *pdev)
+{
+	const struct rpm_regulator_data *reg;
+	const struct of_device_id *match;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	struct qcom_rpm_reg *vreg;
 
-	ret = rpm_reg_of_parse(pdev->dev.of_node, &vreg->desc,
-			       &config, initdata);
-	if (ret)
-		return ret;
+	match = of_match_device(rpm_of_match, &pdev->dev);
+	for (reg = match->data; reg->name; reg++) {
+		vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
+		if (!vreg) {
+			dev_err(&pdev->dev, "failed to allocate vreg\n");
+			return -ENOMEM;
+		}
+		memcpy(vreg, reg->template, sizeof(*vreg));
+		mutex_init(&vreg->lock);
+
+		vreg->dev = &pdev->dev;
+		vreg->resource = reg->resource;
+
+		vreg->desc.id = -1;
+		vreg->desc.owner = THIS_MODULE;
+		vreg->desc.type = REGULATOR_VOLTAGE;
+		vreg->desc.name = reg->name;
+		vreg->desc.supply_name = reg->supply;
+		vreg->desc.of_match = reg->name;
+		vreg->desc.of_parse_cb = rpm_reg_of_parse;
+
+		vreg->rpm = dev_get_drvdata(pdev->dev.parent);
+		if (!vreg->rpm) {
+			dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
+			return -ENODEV;
+		}
 
-	rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "can't register regulator\n");
-		return PTR_ERR(rdev);
+		config.dev = &pdev->dev;
+		config.driver_data = vreg;
+		rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "can't register regulator\n");
+			return PTR_ERR(rdev);
+		}
 	}
 
 	return 0;
-- 
1.8.2.2
