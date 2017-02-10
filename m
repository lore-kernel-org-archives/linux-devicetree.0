From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/2] hwmon: lm90: integration of channel map in dt-bindings
Date: Fri, 10 Feb 2017 17:12:30 +0100
Message-ID: <bda1ec86d68fe6b78c04c7dec7eb3c63c0850a97.1486741517.git.chunkeey@googlemail.com>
References: <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
References: <2979642.2YCYMDeKdL@debian64> <0d274e32ad09daa2f6f7f27f1c36d39da526b66d.1486741517.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch integrates the LOCAL, REMOTE and REMOTE2
channel definitions into the lm90.c driver.

Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
This is an optional patch to showcase how the channel definition
in the dt-bindings are mapped into the driver.
In theory, this makes it possible to easily remap the channel
indices. However, it does make the driver harder to read.
---
 drivers/hwmon/lm90.c | 61 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 841f2428e84a..aa67810000f9 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -95,6 +95,7 @@
 #include <linux/sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/regulator/consumer.h>
+#include <dt-bindings/thermal/lm90.h>
 
 /*
  * Addresses to scan
@@ -1016,23 +1017,33 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 }
 
 static const u8 lm90_temp_index[3] = {
-	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
+	[LM90_LOCAL_TEMPERATURE] = LOCAL_TEMP,
+	[LM90_REMOTE_TEMPERATURE] = REMOTE_TEMP,
+	[LM90_REMOTE2_TEMPERATURE] =  REMOTE2_TEMP
 };
 
 static const u8 lm90_temp_min_index[3] = {
-	LOCAL_LOW, REMOTE_LOW, REMOTE2_LOW
+	[LM90_LOCAL_TEMPERATURE] = LOCAL_LOW,
+	[LM90_REMOTE_TEMPERATURE] = REMOTE_LOW,
+	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_LOW
 };
 
 static const u8 lm90_temp_max_index[3] = {
-	LOCAL_HIGH, REMOTE_HIGH, REMOTE2_HIGH
+	[LM90_LOCAL_TEMPERATURE] = LOCAL_HIGH,
+	[LM90_REMOTE_TEMPERATURE] = REMOTE_HIGH,
+	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_HIGH
 };
 
 static const u8 lm90_temp_crit_index[3] = {
-	LOCAL_CRIT, REMOTE_CRIT, REMOTE2_CRIT
+	[LM90_LOCAL_TEMPERATURE] = LOCAL_CRIT,
+	[LM90_REMOTE_TEMPERATURE] = REMOTE_CRIT,
+	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_CRIT
 };
 
 static const u8 lm90_temp_emerg_index[3] = {
-	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
+	[LM90_LOCAL_TEMPERATURE] = LOCAL_EMERG,
+	[LM90_REMOTE_TEMPERATURE] = REMOTE_EMERG,
+	[LM90_REMOTE2_TEMPERATURE] = REMOTE2_EMERG
 };
 
 static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
@@ -1654,6 +1665,10 @@ static int lm90_probe(struct i2c_client *client,
 	struct lm90_data *data;
 	int err;
 
+	BUILD_BUG_ON(LM90_LOCAL_TEMPERATURE == LM90_REMOTE_TEMPERATURE ||
+		     LM90_REMOTE_TEMPERATURE == LM90_REMOTE2_TEMPERATURE ||
+		     LM90_REMOTE2_TEMPERATURE == LM90_LOCAL_TEMPERATURE);
+
 	regulator = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(regulator))
 		return PTR_ERR(regulator);
@@ -1695,37 +1710,41 @@ static int lm90_probe(struct i2c_client *client,
 	data->chip.ops = &lm90_ops;
 	data->chip.info = data->info;
 
-	data->info[0] = &lm90_chip_info;
-	data->info[1] = &data->temp_info;
+	data->info[LM90_LOCAL_TEMPERATURE] = &lm90_chip_info;
+	data->info[LM90_REMOTE_TEMPERATURE] = &data->temp_info;
 
 	info = &data->temp_info;
 	info->type = hwmon_temp;
 	info->config = data->channel_config;
 
-	data->channel_config[0] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
-	data->channel_config[1] = HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-		HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_FAULT;
+	data->channel_config[LM90_LOCAL_TEMPERATURE] = HWMON_T_INPUT |
+		HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
+	data->channel_config[LM90_REMOTE_TEMPERATURE] = HWMON_T_INPUT |
+		HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+		HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+		HWMON_T_FAULT;
 
 	if (data->flags & LM90_HAVE_OFFSET)
-		data->channel_config[1] |= HWMON_T_OFFSET;
+		data->channel_config[LM90_REMOTE_TEMPERATURE] |= HWMON_T_OFFSET;
 
 	if (data->flags & LM90_HAVE_EMERGENCY) {
-		data->channel_config[0] |= HWMON_T_EMERGENCY |
-			HWMON_T_EMERGENCY_HYST;
-		data->channel_config[1] |= HWMON_T_EMERGENCY |
-			HWMON_T_EMERGENCY_HYST;
+		data->channel_config[LM90_LOCAL_TEMPERATURE] |=
+			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST;
+		data->channel_config[LM90_REMOTE_TEMPERATURE] |=
+			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST;
 	}
 
 	if (data->flags & LM90_HAVE_EMERGENCY_ALARM) {
-		data->channel_config[0] |= HWMON_T_EMERGENCY_ALARM;
-		data->channel_config[1] |= HWMON_T_EMERGENCY_ALARM;
+		data->channel_config[LM90_LOCAL_TEMPERATURE] |=
+			HWMON_T_EMERGENCY_ALARM;
+		data->channel_config[LM90_REMOTE_TEMPERATURE] |=
+			HWMON_T_EMERGENCY_ALARM;
 	}
 
 	if (data->flags & LM90_HAVE_TEMP3) {
-		data->channel_config[2] = HWMON_T_INPUT |
+		data->channel_config[LM90_REMOTE2_TEMPERATURE] =
+			HWMON_T_INPUT |
 			HWMON_T_MIN | HWMON_T_MAX |
 			HWMON_T_CRIT | HWMON_T_CRIT_HYST |
 			HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST |
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
