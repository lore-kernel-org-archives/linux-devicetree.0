From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH 2/2] regulator: fixed: Add support for regmap
Date: Sat, 28 Nov 2015 21:14:45 +0000
Message-ID: <565A1945.1040800@simon.arlott.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565A18DD.60108-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the device tree properties for regmap:
* Lookup the regmap phandle
* Use the enable offset and enable mask
* Reuse enable-active-high value

Use an alternative set of regulator_ops when the regmap is set,
specifying the regmap helper functions.

As syscon_regmap_lookup_by_phandle() can only return -ENODEV or -ENOSYS
as errors and -EPROBE_DEFER doesn't make sense for a register, the
specific error is never propagated.

This is required for Broadcom BCM63xx SoCs that enable power to
individual peripherals by clearing a bit in the miscIddqCtrl register.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 drivers/regulator/fixed.c       | 30 +++++++++++++++++++++++++++++-
 include/linux/regulator/fixed.h |  9 ++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index ff62d69..5a3fa44 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -30,6 +30,7 @@
 #include <linux/of_gpio.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/machine.h>
+#include <linux/mfd/syscon.h>
 
 struct fixed_voltage_data {
 	struct regulator_desc desc;
@@ -92,6 +93,19 @@ of_get_fixed_voltage_config(struct device *dev,
 	if ((config->gpio == -ENODEV) || (config->gpio == -EPROBE_DEFER))
 		return ERR_PTR(-EPROBE_DEFER);
 
+	config->regmap = syscon_regmap_lookup_by_phandle(np, "regmap");
+	if (!IS_ERR(config->regmap)) {
+		u32 val;
+
+		if (of_property_read_u32(np, "regmap-offset", &val))
+			return ERR_PTR(-EINVAL);
+		config->enable_reg = val;
+
+		if (of_property_read_u32(np, "regmap-mask", &val))
+			return ERR_PTR(-EINVAL);
+		config->enable_mask = val;
+	}
+
 	of_property_read_u32(np, "startup-delay-us", &config->startup_delay);
 
 	config->enable_high = of_property_read_bool(np, "enable-active-high");
@@ -107,6 +121,12 @@ of_get_fixed_voltage_config(struct device *dev,
 static struct regulator_ops fixed_voltage_ops = {
 };
 
+static struct regulator_ops fixed_voltage_regmap_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
 static int reg_fixed_voltage_probe(struct platform_device *pdev)
 {
 	struct fixed_voltage_config *config;
@@ -140,7 +160,15 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	}
 	drvdata->desc.type = REGULATOR_VOLTAGE;
 	drvdata->desc.owner = THIS_MODULE;
-	drvdata->desc.ops = &fixed_voltage_ops;
+	if (!IS_ERR_OR_NULL(config->regmap)) {
+		drvdata->desc.ops = &fixed_voltage_regmap_ops;
+		cfg.regmap = config->regmap;
+		drvdata->desc.enable_reg = config->enable_reg;
+		drvdata->desc.enable_mask = config->enable_mask;
+		drvdata->desc.enable_is_inverted = !config->enable_high;
+	} else {
+		drvdata->desc.ops = &fixed_voltage_ops;
+	}
 
 	drvdata->desc.enable_time = config->startup_delay;
 
diff --git a/include/linux/regulator/fixed.h b/include/linux/regulator/fixed.h
index 48918be..7cec0d1 100644
--- a/include/linux/regulator/fixed.h
+++ b/include/linux/regulator/fixed.h
@@ -26,6 +26,10 @@ struct regulator_init_data;
  * @microvolts:		Output voltage of regulator
  * @gpio:		GPIO to use for enable control
  * 			set to -EINVAL if not used
+ * @regmap:		Regmap to use for enable control
+ *			set to -ENODEV if not used
+ * @enable_reg:		Register for control when using regmap
+ * @enable_mask:	Mask for control when using regmap
  * @startup_delay:	Start-up time in microseconds
  * @gpio_is_open_drain: Gpio pin is open drain or normal type.
  *			If it is open drain type then HIGH will be set
@@ -33,7 +37,7 @@ struct regulator_init_data;
  *			and low will be set as gpio-output with driven
  *			to low. For non-open-drain case, the gpio will
  *			will be in output and drive to low/high accordingly.
- * @enable_high:	Polarity of enable GPIO
+ * @enable_high:	Polarity of enable GPIO/regmap
  *			1 = Active high, 0 = Active low
  * @enabled_at_boot:	Whether regulator has been enabled at
  * 			boot or not. 1 = Yes, 0 = No
@@ -50,6 +54,9 @@ struct fixed_voltage_config {
 	const char *input_supply;
 	int microvolts;
 	int gpio;
+	struct regmap *regmap;
+	unsigned int enable_reg;
+	unsigned int enable_mask;
 	unsigned startup_delay;
 	unsigned gpio_is_open_drain:1;
 	unsigned enable_high:1;
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
