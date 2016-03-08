From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 4/5] regulator: pwm: Add support for voltage linear equal steps
Date: Tue, 8 Mar 2016 16:23:24 +0530
Message-ID: <1457434405-30372-5-git-send-email-ldewangan@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com
Cc: lgirdwood@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Currently PWM regulator support the multiple voltage by
two different mechanism: Voltage table based and continuous
steps which divides duty cycle into 100 parts.

There is a use cases where entire voltage ranges from minimum
to maximum is divided into n equal steps and just providing the
steps count, the voltage table with duty cycles is linearly
calculated.

Add support to have specified linear n equal steps for specified
regulator's minimum and maximum voltage range for PWM regulators.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/regulator/pwm-regulator.c | 76 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 9db67a1..060e5cf 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -38,6 +38,9 @@ struct pwm_regulator_data {
 
 	/* Continuous voltage */
 	int volt_uV;
+
+	/* Regulator n linear steps */
+	unsigned int regulator_n_steps;
 };
 
 struct pwm_voltages {
@@ -65,7 +68,11 @@ static int pwm_regulator_set_voltage_sel(struct regulator_dev *rdev,
 
 	pwm_reg_period = pwm_get_period(drvdata->pwm);
 
-	dutycycle = (pwm_reg_period *
+	if (drvdata->regulator_n_steps)
+		dutycycle = (pwm_reg_period * selector) /
+					(drvdata->regulator_n_steps - 1);
+	else
+		dutycycle = (pwm_reg_period *
 		    drvdata->duty_cycle_table[selector].dutycycle) / 100;
 
 	ret = pwm_config(drvdata->pwm, dutycycle, pwm_reg_period);
@@ -227,6 +234,41 @@ static int pwm_regulator_init_table(struct platform_device *pdev,
 	return 0;
 }
 
+static int pwm_regulator_init_linear_steps(struct platform_device *pdev,
+					   struct pwm_regulator_data *drvdata)
+{
+	struct device_node *np = pdev->dev.of_node;
+	unsigned int period;
+	u32 uval;
+	int ret;
+
+	ret = of_property_read_u32(np, "regulator-n-voltages", &uval);
+	if (ret < 0)
+		return ret;
+	if (uval < 2) {
+		dev_err(&pdev->dev, "Invalid number of voltage steps\n");
+		return -EINVAL;
+	}
+
+	period = pwm_get_period(drvdata->pwm);
+	if (period % (uval - 1)) {
+		dev_err(&pdev->dev, "PWM Period must multiple of n_voltages\n");
+		return -EINVAL;
+	}
+
+	memcpy(&drvdata->ops, &pwm_regulator_voltage_table_ops,
+	       sizeof(drvdata->ops));
+	drvdata->ops.list_voltage = regulator_list_voltage_linear;
+	drvdata->ops.map_voltage = regulator_map_voltage_linear;
+
+	drvdata->regulator_n_steps = uval;
+	drvdata->desc.ops = &drvdata->ops;
+	drvdata->desc.linear_min_sel = 0;
+	drvdata->desc.n_voltages = drvdata->regulator_n_steps;
+
+	return 0;
+}
+
 static int pwm_regulator_init_continuous(struct platform_device *pdev,
 					 struct pwm_regulator_data *drvdata)
 {
@@ -256,10 +298,19 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
+	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
+	if (IS_ERR(drvdata->pwm)) {
+		ret = PTR_ERR(drvdata->pwm);
+		dev_err(&pdev->dev, "Failed to get PWM, %d\n", ret);
+		return ret;
+	}
+
 	memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc));
 
 	if (of_find_property(np, "voltage-table", NULL))
 		ret = pwm_regulator_init_table(pdev, drvdata);
+	else if (of_find_property(np, "regulator-n-voltages", NULL))
+		ret = pwm_regulator_init_linear_steps(pdev, drvdata);
 	else
 		ret = pwm_regulator_init_continuous(pdev, drvdata);
 	if (ret)
@@ -270,18 +321,27 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	if (!init_data)
 		return -ENOMEM;
 
+	if (drvdata->regulator_n_steps) {
+		int min_uV = init_data->constraints.min_uV;
+		int max_uV = init_data->constraints.max_uV;
+		int step_uV;
+
+		if ((max_uV - min_uV) % (drvdata->regulator_n_steps - 1)) {
+			dev_err(&pdev->dev,
+				"Min/Max is not proper to get step voltage\n");
+			return -EINVAL;
+		}
+
+		step_uV = (max_uV - min_uV) / (drvdata->regulator_n_steps - 1);
+		drvdata->desc.min_uV = min_uV;
+		drvdata->desc.uV_step = step_uV;
+	}
+
 	config.of_node = np;
 	config.dev = &pdev->dev;
 	config.driver_data = drvdata;
 	config.init_data = init_data;
 
-	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
-	if (IS_ERR(drvdata->pwm)) {
-		ret = PTR_ERR(drvdata->pwm);
-		dev_err(&pdev->dev, "Failed to get PWM, %d\n", ret);
-		return ret;
-	}
-
 	regulator = devm_regulator_register(&pdev->dev,
 					    &drvdata->desc, &config);
 	if (IS_ERR(regulator)) {
-- 
2.1.4
