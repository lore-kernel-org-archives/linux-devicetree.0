From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] regulator: max8973: add support to configure ETR based on rail load
Date: Wed, 1 Jul 2015 18:31:44 +0530
Message-ID: <1435755704-1164-3-git-send-email-ldewangan@nvidia.com>
References: <1435755704-1164-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435755704-1164-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support to configure Enhanced Transient Response Enable (ETR)
and Sensitivity Selection based on maximum current i.e. expected
load on that rail.

Maxim recommended as:
- Enable ETR with high sensitivity (75mV/us) for 0 to 9A expected loads,
- Enable ETR with low sensitivity (150mV/us) for 9A to 12A expected loads.
- Disable ETR for expected load > 12A.

These recommendation will be configured for MAX77621 when maximum load
is provided through regulator constraint for maximum current from platform.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/max8973-regulator.c | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index a8fd7f4..f673659 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -75,6 +75,7 @@
 #define MAX8973_DISCH_ENBABLE				BIT(5)
 #define MAX8973_FT_ENABLE				BIT(4)
 
+#define MAX8973_CKKADV_TRIP_MASK			0xC
 #define MAX8973_CKKADV_TRIP_DISABLE			0xC
 #define MAX8973_CKKADV_TRIP_75mV_PER_US			0x0
 #define MAX8973_CKKADV_TRIP_150mV_PER_US		0x4
@@ -282,6 +283,55 @@ static int max8973_set_ramp_delay(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int max8973_set_current_limit(struct regulator_dev *rdev,
+		int min_ua, int max_ua)
+{
+	struct max8973_chip *max = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	if (max_ua <= 9000000)
+		val = MAX8973_CKKADV_TRIP_75mV_PER_US;
+	else if (max_ua <= 12000000)
+		val = MAX8973_CKKADV_TRIP_150mV_PER_US;
+	else
+		val = MAX8973_CKKADV_TRIP_DISABLE;
+
+	ret = regmap_update_bits(max->regmap, MAX8973_CONTROL2,
+			MAX8973_CKKADV_TRIP_MASK, val);
+	if (ret < 0) {
+		dev_err(max->dev, "register %d update failed: %d\n",
+				MAX8973_CONTROL2, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int max8973_get_current_limit(struct regulator_dev *rdev)
+{
+	struct max8973_chip *max = rdev_get_drvdata(rdev);
+	unsigned int control2;
+	int ret;
+
+	ret = regmap_read(max->regmap, MAX8973_CONTROL2, &control2);
+	if (ret < 0) {
+		dev_err(max->dev, "register %d read failed: %d\n",
+				MAX8973_CONTROL2, ret);
+		return ret;
+	}
+	switch (control2 & MAX8973_CKKADV_TRIP_MASK) {
+	case MAX8973_CKKADV_TRIP_DISABLE:
+		return 15000000;
+	case MAX8973_CKKADV_TRIP_150mV_PER_US:
+		return 12000000;
+	case MAX8973_CKKADV_TRIP_75mV_PER_US:
+		return 9000000;
+	default:
+		break;
+	}
+	return 9000000;
+}
+
 static const struct regulator_ops max8973_dcdc_ops = {
 	.get_voltage_sel	= max8973_dcdc_get_voltage_sel,
 	.set_voltage_sel	= max8973_dcdc_set_voltage_sel,
@@ -632,6 +682,8 @@ static int max8973_probe(struct i2c_client *client,
 		max->ops.enable = regulator_enable_regmap;
 		max->ops.disable = regulator_disable_regmap;
 		max->ops.is_enabled = regulator_is_enabled_regmap;
+		max->ops.set_current_limit = max8973_set_current_limit;
+		max->ops.get_current_limit = max8973_get_current_limit;
 		break;
 	default:
 		break;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
