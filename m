From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] regulator: fixed: Use of_get_regulator_gpio_config
Date: Wed, 22 Jun 2016 17:25:55 +0900
Message-ID: <20160622082558.20935-4-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160622082558.20935-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If instanciated from the DT, use of_get_regulator_gpio_config to obtain
the enable GPIO configuration.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/fixed.c | 52 ++++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 988a7472c2ab..76a8dea763cf 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -75,22 +75,14 @@ of_get_fixed_voltage_config(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (init_data->constraints.boot_on)
-		config->enabled_at_boot = true;
-
-	config->gpio = of_get_named_gpio(np, "gpio", 0);
-	if ((config->gpio < 0) && (config->gpio != -ENOENT))
-		return ERR_PTR(config->gpio);
-
 	of_property_read_u32(np, "startup-delay-us", &config->startup_delay);
 
-	config->enable_high = of_property_read_bool(np, "enable-active-high");
-	config->gpio_is_open_drain = of_property_read_bool(np,
-							   "gpio-open-drain");
-
 	if (of_find_property(np, "vin-supply", NULL))
 		config->input_supply = "vin";
 
+	/* GPIO info will be obtained via regulator_of_get_gpio_config */
+	config->gpio = -ENOENT;
+
 	return config;
 }
 
@@ -114,6 +106,12 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 						     &drvdata->desc);
 		if (IS_ERR(config))
 			return PTR_ERR(config);
+
+		ret = of_get_regulator_gpio_config(&pdev->dev,
+						   pdev->dev.of_node, "gpio",
+						   &cfg);
+		if (ret)
+			return ret;
 	} else {
 		config = dev_get_platdata(&pdev->dev);
 	}
@@ -150,25 +148,29 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 
 	drvdata->desc.fixed_uV = config->microvolts;
 
+	/*
+	 * For platform-defined regulators - DT is already handled by
+	 * of_get_regulator_gpio_config
+	 */
 	if (gpio_is_valid(config->gpio)) {
 		cfg.ena_gpio = config->gpio;
 		if (pdev->dev.of_node)
 			cfg.ena_gpio_initialized = true;
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
+		if (config->gpio_is_open_drain)
+			cfg.ena_gpio_flags |= GPIOF_OPEN_DRAIN;
 	}
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
-	}
-	if (config->gpio_is_open_drain)
-		cfg.ena_gpio_flags |= GPIOF_OPEN_DRAIN;
 
 	cfg.dev = &pdev->dev;
 	cfg.init_data = config->init_data;
-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
