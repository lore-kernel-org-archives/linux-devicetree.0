From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/5] regulator: pwm: Add support to have multiple instance of pwm regulator
Date: Tue, 8 Mar 2016 16:23:22 +0530
Message-ID: <1457434405-30372-3-git-send-email-ldewangan@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com
Cc: lgirdwood@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some of platforms like Nvidia's Tegra210 Jetson-TX1 platform has
multiple PMW based regulators. Add support to have multiple instances
of the driver by not changing any global data of pwm regulator and
if required, making instance specific copy and then making changes.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/regulator/pwm-regulator.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 4d8eb35..4689d62 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -27,6 +27,13 @@ struct pwm_regulator_data {
 
 	/* Voltage table */
 	struct pwm_voltages *duty_cycle_table;
+
+	/* regulator descriptor */
+	struct regulator_desc desc;
+
+	/* Regulator ops */
+	struct regulator_ops ops;
+
 	int state;
 
 	/* Continuous voltage */
@@ -212,8 +219,10 @@ static int pwm_regulator_init_table(struct platform_device *pdev,
 	}
 
 	drvdata->duty_cycle_table	= duty_cycle_table;
-	pwm_regulator_desc.ops		= &pwm_regulator_voltage_table_ops;
-	pwm_regulator_desc.n_voltages	= length / sizeof(*duty_cycle_table);
+	memcpy(&drvdata->ops, &pwm_regulator_voltage_table_ops,
+	       sizeof(drvdata->ops));
+	drvdata->desc.ops = &drvdata->ops;
+	drvdata->desc.n_voltages	= length / sizeof(*duty_cycle_table);
 
 	return 0;
 }
@@ -221,8 +230,10 @@ static int pwm_regulator_init_table(struct platform_device *pdev,
 static int pwm_regulator_init_continuous(struct platform_device *pdev,
 					 struct pwm_regulator_data *drvdata)
 {
-	pwm_regulator_desc.ops = &pwm_regulator_voltage_continuous_ops;
-	pwm_regulator_desc.continuous_voltage_range = true;
+	memcpy(&drvdata->ops, &pwm_regulator_voltage_continuous_ops,
+	       sizeof(drvdata->ops));
+	drvdata->desc.ops = &drvdata->ops;
+	drvdata->desc.continuous_voltage_range = true;
 
 	return 0;
 }
@@ -245,6 +256,8 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
+	memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc));
+
 	if (of_find_property(np, "voltage-table", NULL))
 		ret = pwm_regulator_init_table(pdev, drvdata);
 	else
@@ -253,7 +266,7 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 		return ret;
 
 	init_data = of_get_regulator_init_data(&pdev->dev, np,
-					       &pwm_regulator_desc);
+					       &drvdata->desc);
 	if (!init_data)
 		return -ENOMEM;
 
@@ -269,10 +282,10 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	}
 
 	regulator = devm_regulator_register(&pdev->dev,
-					    &pwm_regulator_desc, &config);
+					    &drvdata->desc, &config);
 	if (IS_ERR(regulator)) {
 		dev_err(&pdev->dev, "Failed to register regulator %s\n",
-			pwm_regulator_desc.name);
+			drvdata->desc.name);
 		return PTR_ERR(regulator);
 	}
 
-- 
2.1.4
