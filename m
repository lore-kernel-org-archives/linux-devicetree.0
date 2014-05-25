From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Sun, 25 May 2014 23:50:39 +0400
Message-ID: <201405252350.40402.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use more compact of_property_read_{bool|u32}() calls instead of the
of_{find|get}_property() calls.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against Mark Brown's 'regulator.git' repo's 'for-next' branch.

 drivers/regulator/fixed.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

Index: regulator/drivers/regulator/fixed.c
===================================================================
--- regulator.orig/drivers/regulator/fixed.c
+++ regulator/drivers/regulator/fixed.c
@@ -50,7 +50,6 @@ of_get_fixed_voltage_config(struct devic
 {
 	struct fixed_voltage_config *config;
 	struct device_node *np = dev->of_node;
-	const __be32 *delay;
 	struct regulator_init_data *init_data;
 
 	config = devm_kzalloc(dev, sizeof(struct fixed_voltage_config),
@@ -91,15 +90,11 @@ of_get_fixed_voltage_config(struct devic
 	if ((config->gpio == -ENODEV) || (config->gpio == -EPROBE_DEFER))
 		return ERR_PTR(-EPROBE_DEFER);
 
-	delay = of_get_property(np, "startup-delay-us", NULL);
-	if (delay)
-		config->startup_delay = be32_to_cpu(*delay);
+	of_property_read_u32(np, "startup-delay-us", &config->startup_delay);
 
-	if (of_find_property(np, "enable-active-high", NULL))
-		config->enable_high = true;
-
-	if (of_find_property(np, "gpio-open-drain", NULL))
-		config->gpio_is_open_drain = true;
+	config->enable_high = of_property_read_bool(np, "enable-active-high");
+	config->gpio_is_open_drain = of_property_read_bool(np,
+							   "gpio-open-drain");
 
 	if (of_find_property(np, "vin-supply", NULL))
 		config->input_supply = "vin";
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
