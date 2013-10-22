From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/4] charger-manager: Use IIO subsystem to read battery
 temperature instead of legacy method
Date: Tue, 22 Oct 2013 21:51:55 +0900
Message-ID: <1382446317-32613-3-git-send-email-cw00.choi@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: anton@enomsg.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch support charger-manager use IIO(Industrial I/O) subsystem to read
current battery temperature instead of legacy methor about callback function.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
---
 drivers/power/Kconfig                 |  1 +
 drivers/power/charger-manager.c       | 88 +++++++++++++++++++++++++++++++++--
 include/linux/power/charger-manager.h | 13 ++++++
 3 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
index e6f92b4..6700191 100644
--- a/drivers/power/Kconfig
+++ b/drivers/power/Kconfig
@@ -309,6 +309,7 @@ config CHARGER_MANAGER
 	bool "Battery charger manager for multiple chargers"
 	depends on REGULATOR && RTC_CLASS
 	select EXTCON
+	select IIO
 	help
           Say Y to enable charger-manager support, which allows multiple
           chargers attached to a battery and multiple batteries attached to a
diff --git a/drivers/power/charger-manager.c b/drivers/power/charger-manager.c
index cc720f9..02a395c 100644
--- a/drivers/power/charger-manager.c
+++ b/drivers/power/charger-manager.c
@@ -26,6 +26,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/sysfs.h>
 #include <linux/of.h>
+#include <linux/iio/consumer.h>
 
 static const char * const default_event_names[] = {
 	[CM_EVENT_UNKNOWN] = "Unknown",
@@ -542,6 +543,50 @@ static int check_charging_duration(struct charger_manager *cm)
 }
 
 /**
+ * read_battery_temperature - Read current battery temperature
+ * @cm: the Charger Manager representing the battery.
+ * @last_temp_mC: store current battery temperature
+ *
+ * Returns current state of temperature by using IIO or legacy method
+ * - CM_TEMP_NORMAL
+ * - CM_TEMP_OVERHEAT
+ * - CM_TEMP_COLD
+ */
+static int read_battery_temperature(struct charger_manager *cm,
+				    int *last_temp_mC)
+{
+	struct charger_desc *desc = cm->desc;
+	int temp;
+
+	if (desc->channel) {
+		temp = iio_read_channel_raw(desc->channel, last_temp_mC);
+
+		/*
+		 * The charger-manager use IIO subsystem to read ADC raw data
+		 * from IIO ADC device drvier. The each device driver has
+		 * own non-standard ADC table. If user of charger-manager
+		 * would like to get correct temperature value, have to convert
+		 * 'last_temp_mC' variable according to proper calculation
+		 * method and own ADC table.
+		 */
+
+		if (*last_temp_mC >= desc->iio_adc_overheat)
+			temp = CM_TEMP_NORMAL;	/* Overheat */
+		else if (*last_temp_mC <= desc->iio_adc_cold)
+			temp = CM_TEMP_COLD;	/* Cold */
+		else
+			temp = CM_TEMP_NORMAL;	/* Normal */
+
+	} else if (desc->temperature_out_of_range) {
+		temp = desc->temperature_out_of_range(last_temp_mC);
+	} else {
+		temp = INT_MAX;
+	}
+
+	return temp;
+}
+
+/**
  * _cm_monitor - Monitor the temperature and return true for exceptions.
  * @cm: the Charger Manager representing the battery.
  *
@@ -551,7 +596,7 @@ static int check_charging_duration(struct charger_manager *cm)
 static bool _cm_monitor(struct charger_manager *cm)
 {
 	struct charger_desc *desc = cm->desc;
-	int temp = desc->temperature_out_of_range(&cm->last_temp_mC);
+	int temp = read_battery_temperature(cm, &cm->last_temp_mC);
 
 	dev_dbg(cm->dev, "monitoring (%2.2d.%3.3dC)\n",
 		cm->last_temp_mC / 1000, cm->last_temp_mC % 1000);
@@ -805,7 +850,7 @@ static int charger_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_TEMP:
 		/* in thenth of centigrade */
 		if (cm->last_temp_mC == INT_MIN)
-			desc->temperature_out_of_range(&cm->last_temp_mC);
+			read_battery_temperature(cm, &cm->last_temp_mC);
 		val->intval = cm->last_temp_mC / 100;
 		if (!desc->measure_battery_temp)
 			ret = -ENODEV;
@@ -813,7 +858,7 @@ static int charger_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_TEMP_AMBIENT:
 		/* in thenth of centigrade */
 		if (cm->last_temp_mC == INT_MIN)
-			desc->temperature_out_of_range(&cm->last_temp_mC);
+			read_battery_temperature(cm, &cm->last_temp_mC);
 		val->intval = cm->last_temp_mC / 100;
 		if (desc->measure_battery_temp)
 			ret = -ENODEV;
@@ -1586,6 +1631,32 @@ static int charger_manager_dt_parse_regulator(struct device *dev,
 	return 0;
 }
 
+static int charger_manager_dt_parse_iio(struct device *dev,
+					      struct charger_desc *desc)
+{
+	struct device_node *np = dev->of_node;
+
+	if (of_property_read_u32(np, "iio-adc-overheat",
+				&desc->iio_adc_overheat)) {
+		dev_warn(dev, "cannot get standard value for hot temperature\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(np, "iio-adc-cold",
+				&desc->iio_adc_cold)) {
+		dev_warn(dev, "cannot get standard value for cold temperature\n");
+		return -EINVAL;
+	}
+
+	desc->channel = iio_channel_get(dev, NULL);
+	if (IS_ERR(desc->channel)) {
+		dev_err(dev, "cannot get iio channel\n");
+		return PTR_ERR(desc->channel);
+	}
+
+	return 0;
+}
+
 static struct charger_desc *charger_manager_dt_parse(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
@@ -1688,6 +1759,11 @@ static struct charger_desc *charger_manager_dt_parse(struct device *dev)
 	desc->charging_max_duration_ms *= (60 * 1000);
 	desc->discharging_max_duration_ms *= (60 * 1000);
 
+	if (charger_manager_dt_parse_iio(dev, desc)) {
+		dev_err(dev, "cannot get iio device to read temperature\n");
+		return NULL;
+	}
+
 	return desc;
 }
 #else
@@ -1814,8 +1890,8 @@ static int charger_manager_probe(struct platform_device *pdev)
 		goto err_chg_stat;
 	}
 
-	if (!desc->temperature_out_of_range) {
-		dev_err(&pdev->dev, "there is no temperature_out_of_range\n");
+	if (!desc->channel && !desc->temperature_out_of_range) {
+		dev_err(&pdev->dev, "there is no temperature function\n");
 		ret = -EINVAL;
 		goto err_chg_stat;
 	}
@@ -1986,6 +2062,8 @@ static int charger_manager_remove(struct platform_device *pdev)
 
 	try_charger_enable(cm, false);
 
+	iio_channel_release(desc->channel);
+
 	kfree(cm->charger_psy.properties);
 	kfree(cm->charger_stat);
 	kfree(cm->desc);
diff --git a/include/linux/power/charger-manager.h b/include/linux/power/charger-manager.h
index 8696fb8..33dfc69 100644
--- a/include/linux/power/charger-manager.h
+++ b/include/linux/power/charger-manager.h
@@ -42,6 +42,12 @@ enum cm_event_types {
 	CM_EVENT_OTHERS,
 };
 
+enum cm_temperature_types {
+	CM_TEMP_COLD = -1,
+	CM_TEMP_NORMAL = 0,
+	CM_TEMP_OVERHEAT = 1,
+};
+
 /**
  * struct charger_global_desc
  * @rtc_name: the name of RTC used to wake up the system from suspend.
@@ -188,6 +194,9 @@ struct charger_regulator {
  *	Maximum possible duration for discharging with charger cable
  *	after full-batt. If discharging duration exceed 'discharging
  *	max_duration_ms', cm start charging.
+ * @channel: filled with a channel from iio
+ * @iio_adc_overheat: the value of the highest ADC for temperature
+ * @iio_adc_cold: the value of the lowest ADC for temperature
  */
 struct charger_desc {
 	const char *psy_name;
@@ -215,6 +224,10 @@ struct charger_desc {
 
 	unsigned int charging_max_duration_ms;
 	unsigned int discharging_max_duration_ms;
+
+	struct iio_channel *channel;
+	int iio_adc_overheat;
+	int iio_adc_cold;
 };
 
 #define PSY_NAME_MAX	30
-- 
1.8.0
