From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 3/4] regulator: qcom: Refactor of-parsing code
Date: Mon, 2 Mar 2015 20:25:39 -0800
Message-ID: <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Refactor out all custom property parsing code from the probe function
into a function suitable for regulator_desc->of_parse_cb usage.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

This simply moves the parsing code out of probe(), no functional change.

 drivers/regulator/qcom_rpm-regulator.c | 147 +++++++++++++++++++--------------
 1 file changed, 85 insertions(+), 62 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 15e07c2..1ec4b98 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -645,7 +645,9 @@ static int rpm_reg_set(struct qcom_rpm_reg *vreg,
 	return 0;
 }
 
-static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
+static int rpm_reg_of_parse_freq(struct device *dev,
+				 struct device_node *node,
+				 struct qcom_rpm_reg *vreg)
 {
 	static const int freq_table[] = {
 		19200000, 9600000, 6400000, 4800000, 3840000, 3200000, 2740000,
@@ -659,7 +661,7 @@ static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
 	int i;
 
 	key = "qcom,switch-mode-frequency";
-	ret = of_property_read_u32(dev->of_node, key, &freq);
+	ret = of_property_read_u32(node, key, &freq);
 	if (ret) {
 		dev_err(dev, "regulator requires %s property\n", key);
 		return -EINVAL;
@@ -676,88 +678,45 @@ static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
 	return -EINVAL;
 }
 
-static int rpm_reg_probe(struct platform_device *pdev)
+static int rpm_reg_of_parse(struct device_node *node,
+			    const struct regulator_desc *desc,
+			    struct regulator_config *config,
+			    struct regulator_init_data *init_data)
 {
-	struct regulator_init_data *initdata;
-	const struct qcom_rpm_reg *template;
-	const struct of_device_id *match;
-	struct regulator_config config = { };
-	struct regulator_dev *rdev;
-	struct qcom_rpm_reg *vreg;
+	struct qcom_rpm_reg *vreg = config->driver_data;
+	struct device *dev = config->dev;
 	const char *key;
 	u32 force_mode;
 	bool pwm;
-	u32 val;
 	int ret;
-
-	match = of_match_device(rpm_of_match, &pdev->dev);
-	template = match->data;
-
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
-
-	initdata = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
-					      &vreg->desc);
-	if (!initdata)
-		return -EINVAL;
-
-	key = "reg";
-	ret = of_property_read_u32(pdev->dev.of_node, key, &val);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to read %s\n", key);
-		return ret;
-	}
-	vreg->resource = val;
-
-	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
-	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
-		dev_err(&pdev->dev, "no voltage specified for regulator\n");
-		return -EINVAL;
-	}
+	u32 val;
 
 	/* Regulators with ia property suppports drms */
 	if (vreg->parts->ia.mask)
-		initdata->constraints.valid_ops_mask |= REGULATOR_CHANGE_DRMS;
+		init_data->constraints.valid_ops_mask |= REGULATOR_CHANGE_DRMS;
 
 	key = "bias-pull-down";
-	if (of_property_read_bool(pdev->dev.of_node, key)) {
+	if (of_property_read_bool(node, key)) {
 		ret = rpm_reg_set(vreg, &vreg->parts->pd, 1);
 		if (ret) {
-			dev_err(&pdev->dev, "%s is invalid", key);
+			dev_err(dev, "%s is invalid", key);
 			return ret;
 		}
 	}
 
 	if (vreg->parts->freq.mask) {
-		ret = rpm_reg_of_parse_freq(&pdev->dev, vreg);
+		ret = rpm_reg_of_parse_freq(dev, node, vreg);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (vreg->parts->pm.mask) {
 		key = "qcom,power-mode-hysteretic";
-		pwm = !of_property_read_bool(pdev->dev.of_node, key);
+		pwm = !of_property_read_bool(node, key);
 
 		ret = rpm_reg_set(vreg, &vreg->parts->pm, pwm);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to set power mode\n");
+			dev_err(dev, "failed to set power mode\n");
 			return ret;
 		}
 	}
@@ -766,11 +725,11 @@ static int rpm_reg_probe(struct platform_device *pdev)
 		force_mode = -1;
 
 		key = "qcom,force-mode";
-		ret = of_property_read_u32(pdev->dev.of_node, key, &val);
+		ret = of_property_read_u32(node, key, &val);
 		if (ret == -EINVAL) {
 			val = QCOM_RPM_FORCE_MODE_NONE;
 		} else if (ret < 0) {
-			dev_err(&pdev->dev, "failed to read %s\n", key);
+			dev_err(dev, "failed to read %s\n", key);
 			return ret;
 		}
 
@@ -805,21 +764,85 @@ static int rpm_reg_probe(struct platform_device *pdev)
 		}
 
 		if (force_mode == -1) {
-			dev_err(&pdev->dev, "invalid force mode\n");
+			dev_err(dev, "invalid force mode\n");
 			return -EINVAL;
 		}
 
 		ret = rpm_reg_set(vreg, &vreg->parts->fm, force_mode);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to set force mode\n");
+			dev_err(dev, "failed to set force mode\n");
 			return ret;
 		}
 	}
 
+	return 0;
+}
+
+static int rpm_reg_probe(struct platform_device *pdev)
+{
+	struct regulator_init_data *initdata;
+	const struct qcom_rpm_reg *template;
+	const struct of_device_id *match;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	struct qcom_rpm_reg *vreg;
+	const char *key;
+	u32 val;
+	int ret;
+
+	match = of_match_device(rpm_of_match, &pdev->dev);
+	template = match->data;
+
+	vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
+	if (!vreg) {
+		dev_err(&pdev->dev, "failed to allocate vreg\n");
+		return -ENOMEM;
+	}
+	memcpy(vreg, template, sizeof(*vreg));
+	mutex_init(&vreg->lock);
+	vreg->dev = &pdev->dev;
+	vreg->desc.id = -1;
+	vreg->desc.owner = THIS_MODULE;
+	vreg->desc.type = REGULATOR_VOLTAGE;
+	vreg->desc.name = pdev->dev.of_node->name;
+	vreg->desc.supply_name = "vin";
+
+	vreg->rpm = dev_get_drvdata(pdev->dev.parent);
+	if (!vreg->rpm) {
+		dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
+		return -ENODEV;
+	}
+
+	initdata = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
+					      &vreg->desc);
+	if (!initdata)
+		return -EINVAL;
+
+	key = "reg";
+	ret = of_property_read_u32(pdev->dev.of_node, key, &val);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to read %s\n", key);
+		return ret;
+	}
+	vreg->resource = val;
+
+	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
+	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
+		dev_err(&pdev->dev, "no voltage specified for regulator\n");
+		return -EINVAL;
+	}
+
+
 	config.dev = &pdev->dev;
 	config.init_data = initdata;
 	config.driver_data = vreg;
 	config.of_node = pdev->dev.of_node;
+
+	ret = rpm_reg_of_parse(pdev->dev.of_node, &vreg->desc,
+			       &config, initdata);
+	if (ret)
+		return ret;
+
 	rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
 	if (IS_ERR(rdev)) {
 		dev_err(&pdev->dev, "can't register regulator\n");
-- 
1.8.2.2
