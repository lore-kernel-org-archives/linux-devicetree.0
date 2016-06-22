From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 4/6] regulator: gpio: Use of_get_regulator_gpio_config
Date: Wed, 22 Jun 2016 17:25:56 +0900
Message-ID: <20160622082558.20935-5-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622082558.20935-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

If instanciated from the DT, use of_get_regulator_gpio_config to obtain
the enable GPIO configuration.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/regulator/gpio-regulator.c | 47 ++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 83e89e5d4752..5c079f854e77 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -153,18 +153,8 @@ of_get_gpio_regulator_config(struct device *dev, struct device_node *np,
 
 	config->supply_name = config->init_data->constraints.name;
 
-	if (of_property_read_bool(np, "enable-active-high"))
-		config->enable_high = true;
-
-	if (of_property_read_bool(np, "enable-at-boot"))
-		config->enabled_at_boot = true;
-
 	of_property_read_u32(np, "startup-delay-us", &config->startup_delay);
 
-	config->enable_gpio = of_get_named_gpio(np, "enable-gpio", 0);
-	if (config->enable_gpio == -EPROBE_DEFER)
-		return ERR_PTR(-EPROBE_DEFER);
-
 	/* Fetch GPIOs. - optional property*/
 	ret = of_gpio_count(np);
 	if ((ret < 0) && (ret != -ENOENT))
@@ -237,6 +227,9 @@ of_get_gpio_regulator_config(struct device *dev, struct device_node *np,
 				 regtype);
 	}
 
+	/* GPIO info will be obtained via regulator_of_get_gpio_config */
+	config->enable_gpio = -ENOENT;
+
 	return config;
 }
 
@@ -263,6 +256,11 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 						      &drvdata->desc);
 		if (IS_ERR(config))
 			return PTR_ERR(config);
+
+		ret = of_get_regulator_gpio_config(&pdev->dev, np,
+						   "enable-gpio", &cfg);
+		if (ret)
+			return ret;
 	}
 
 	drvdata->desc.name = kstrdup(config->supply_name, GFP_KERNEL);
@@ -337,21 +335,26 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	cfg.driver_data = drvdata;
 	cfg.of_node = np;
 
+	/*
+	 * For platform-defined regulators - DT is already handled by
+	 * of_get_regulator_gpio_config
+	 */
 	if (gpio_is_valid(config->enable_gpio)) {
 		cfg.ena_gpio = config->enable_gpio;
 		cfg.ena_gpio_initialized = true;
-	}
-	cfg.ena_gpio_invert = !config->enable_high;
-	if (config->enabled_at_boot) {
-		if (config->enable_high)
-			cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
-		else
-			cfg.ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
-	} else {
-		if (config->enable_high)
-			cfg.ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
-		else
-			cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
+
+		cfg.ena_gpio_invert = !config->enable_high;
+		if (config->enabled_at_boot) {
+			if (config->enable_high)
+				cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
+			else
+				cfg.ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
+		} else {
+			if (config->enable_high)
+				cfg.ena_gpio_flags |= GPIOF_OUT_INIT_LOW;
+			else
+				cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
+		}
 	}
 
 	drvdata->dev = regulator_register(&drvdata->desc, &cfg);
-- 
2.8.3
