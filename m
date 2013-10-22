From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/4] charger-manager: Support DT to get platform data for
 charger_desc
Date: Tue, 22 Oct 2013 21:51:54 +0900
Message-ID: <1382446317-32613-2-git-send-email-cw00.choi@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: anton@enomsg.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch support DT(Device Tree) to get platform data for charger_desc
structure which includes necessary properties to control charger/fuel-gague
power-supply device.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
---
 drivers/power/charger-manager.c       | 290 +++++++++++++++++++++++++++++++++-
 include/linux/power/charger-manager.h |  12 +-
 2 files changed, 290 insertions(+), 12 deletions(-)

diff --git a/drivers/power/charger-manager.c b/drivers/power/charger-manager.c
index e30e847..cc720f9 100644
--- a/drivers/power/charger-manager.c
+++ b/drivers/power/charger-manager.c
@@ -25,6 +25,7 @@
 #include <linux/power/charger-manager.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sysfs.h>
+#include <linux/of.h>
 
 static const char * const default_event_names[] = {
 	[CM_EVENT_UNKNOWN] = "Unknown",
@@ -518,7 +519,7 @@ static int check_charging_duration(struct charger_manager *cm)
 		duration = curr - cm->charging_start_time;
 
 		if (duration > desc->charging_max_duration_ms) {
-			dev_info(cm->dev, "Charging duration exceed %lldms\n",
+			dev_info(cm->dev, "Charging duration exceed %dms\n",
 				 desc->charging_max_duration_ms);
 			uevent_notify(cm, "Discharging");
 			try_charger_enable(cm, false);
@@ -529,7 +530,7 @@ static int check_charging_duration(struct charger_manager *cm)
 
 		if (duration > desc->charging_max_duration_ms &&
 				is_ext_pwr_online(cm)) {
-			dev_info(cm->dev, "Discharging duration exceed %lldms\n",
+			dev_info(cm->dev, "Discharging duration exceed %dms\n",
 				 desc->discharging_max_duration_ms);
 			uevent_notify(cm, "Recharging");
 			try_charger_enable(cm, true);
@@ -1136,7 +1137,8 @@ static void charger_extcon_work(struct work_struct *work)
 					cable->min_uA, cable->max_uA);
 		if (ret < 0) {
 			pr_err("Cannot set current limit of %s (%s)\n",
-			       cable->charger->regulator_name, cable->name);
+			       cable->charger->regulator_name,
+			       cable->cable_name);
 			return;
 		}
 
@@ -1206,10 +1208,10 @@ static int charger_extcon_init(struct charger_manager *cm,
 	INIT_WORK(&cable->wq, charger_extcon_work);
 	cable->nb.notifier_call = charger_extcon_notifier;
 	ret = extcon_register_interest(&cable->extcon_dev,
-			cable->extcon_name, cable->name, &cable->nb);
+			cable->extcon_name, cable->cable_name, &cable->nb);
 	if (ret < 0) {
 		pr_info("Cannot register extcon_dev for %s(cable: %s)\n",
-			cable->extcon_name, cable->name);
+			cable->extcon_name, cable->cable_name);
 		ret = -EINVAL;
 	}
 
@@ -1438,14 +1440,280 @@ err:
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static int charger_manager_dt_parse_psy_charger(struct device *dev,
+					       struct charger_desc *desc)
+{
+	struct device_node *np, *psy_chargers_np, *charger_np;
+	int i, num_psy_chargers;
+
+	np = dev->of_node;
+
+	/* Get platform data of Charger Regulators from DT */
+	psy_chargers_np = of_find_node_by_name(np, "psy-chargers");
+	if (!psy_chargers_np) {
+		dev_err(dev, "cannot find psy-chargers sub-node\n");
+		return -EINVAL;
+	}
+
+	num_psy_chargers = of_get_child_count(psy_chargers_np);
+	if (!num_psy_chargers) {
+		dev_err(dev, "cannot get the child count of psy-chargers\n");
+		return -EINVAL;
+	}
+
+	desc->psy_charger_stat = devm_kzalloc(dev,
+				sizeof(*desc->psy_charger_stat) *
+				num_psy_chargers, GFP_KERNEL);
+	if (!desc->psy_charger_stat) {
+		dev_err(dev, "cannot allocate memory for psy-chargers\n");
+		return -EINVAL;
+	}
+
+	i = 0;
+	for_each_child_of_node(psy_chargers_np, charger_np) {
+		if (of_property_read_string(charger_np, "psy-charger-name",
+					&desc->psy_charger_stat[i])) {
+			dev_err(dev, "cannot get psy-charger name\n");
+			return -EINVAL;
+		}
+		dev_dbg(dev, "psy-charger.%d (%s)\n",
+				i, desc->psy_charger_stat[i]);
+		i++;
+	}
+
+	return 0;
+}
+
+static int charger_manager_dt_parse_regulator(struct device *dev,
+					       struct charger_desc *desc)
+{
+	struct device_node *np, *charger_regulators_np, *charger_cables_np;
+	struct device_node *regulator_np, *cable_np;
+	int i, j;
+	int num_charger_regulators;
+
+	np = dev->of_node;
+
+	/* Get platform data of Charger Regulators from DT */
+	charger_regulators_np = of_find_node_by_name(np, "charger-regulators");
+	if (!charger_regulators_np) {
+		dev_err(dev, "cannot find charger-regulators sub-node\n");
+		return -EINVAL;
+	}
+
+	num_charger_regulators = of_get_child_count(charger_regulators_np);
+	if (!num_charger_regulators) {
+		dev_err(dev, "cannot get child count of charger-regulators\n");
+		return -EINVAL;
+	}
+	desc->num_charger_regulators = num_charger_regulators;
+
+	desc->charger_regulators = devm_kzalloc(dev,
+				sizeof(*desc->charger_regulators) *
+				desc->num_charger_regulators, GFP_KERNEL);
+	if (!desc->charger_regulators) {
+		dev_err(dev, "cannot allocate memory for charger-regulators\n");
+		return -EINVAL;
+	}
+
+	i = 0;
+	for_each_child_of_node(charger_regulators_np, regulator_np) {
+		struct charger_regulator *charger
+				= &desc->charger_regulators[i];
+
+		if (of_property_read_string(regulator_np, "regulator-name",
+					    &charger->regulator_name)) {
+			dev_err(dev, "cannot get power supply name\n");
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "charger.%d (%s)\n", i, charger->regulator_name);
+
+		/* Get platform data of Charger Cables from DT */
+		charger_cables_np = of_find_node_by_name(regulator_np,
+							"charger-cables");
+		if (!charger_cables_np) {
+			dev_err(dev, "cannot find charger-cables sub-node\n");
+			i++;
+			continue;
+		}
+		charger->num_cables = of_get_child_count(charger_cables_np);
+		if (!charger->num_cables) {
+			dev_err(dev,
+				"cannot get child count of charger-cables\n");
+			return -EINVAL;
+		}
+
+		charger->cables = devm_kzalloc(dev, sizeof(*charger->cables) *
+					       charger->num_cables, GFP_KERNEL);
+		if (!charger->cables) {
+			dev_err(dev,
+				"cannot allocate memory for charger-cables\n");
+			return -EINVAL;
+		}
+
+		j = 0;
+		for_each_child_of_node(charger_cables_np, cable_np) {
+			struct charger_cable *cable =  &charger->cables[j];
+
+			of_property_read_string(cable_np, "cable-name",
+						&cable->cable_name);
+			of_property_read_string(cable_np, "extcon-name",
+						&cable->extcon_name);
+			of_property_read_u32(cable_np, "min-current-uA",
+					     &cable->min_uA);
+			of_property_read_u32(cable_np, "max-current-uA",
+					     &cable->max_uA);
+
+			if (!cable->cable_name || !cable->extcon_name ||
+				!cable->min_uA || !cable->max_uA) {
+				dev_err(dev,
+					"cannot get datas for charger-cable\n");
+				return -EINVAL;
+			}
+
+			dev_dbg(dev, "\tcable.%d(%s)\n", j, cable->cable_name);
+			dev_dbg(dev, "\tcable.%d(%s)\n", j, cable->extcon_name);
+			dev_dbg(dev, "\tcable.%d(%d uA)\n", j, cable->min_uA);
+			dev_dbg(dev, "\tcable.%d(%d uA)\n\n", j, cable->max_uA);
+
+			j++;
+		}
+		i++;
+	}
+
+	return 0;
+}
+
+static struct charger_desc *charger_manager_dt_parse(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct charger_desc *desc;
+
+	if (!np)
+		return NULL;
+
+	desc = devm_kzalloc(dev, sizeof(struct charger_desc), GFP_KERNEL);
+	if (!desc) {
+		dev_err(dev, "Failed to allocate memory\n");
+		return NULL;
+	}
+
+	if (of_property_read_string(np, "psy-name", &desc->psy_name)) {
+		dev_err(dev, "cannot get power supply name\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "polling-mode", &desc->polling_mode)) {
+		dev_warn(dev, "cannot get tyep of polling mode\n");
+		desc->polling_mode = CM_POLL_EXTERNAL_POWER_ONLY;
+	}
+
+	if (of_property_read_u32(np, "polling-interval-ms",
+				&desc->polling_interval_ms)) {
+		dev_warn(dev, "cannot get tyep of polling interval time\n");
+		desc->polling_interval_ms = 30000;
+	}
+
+	if (of_property_read_u32(np, "fullbatt-vchkdrop-ms",
+				&desc->fullbatt_vchkdrop_ms)) {
+
+		dev_err(dev, "cannot get fullbatt-vchkdrop-ms\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "fullbatt-vchkdrop-uV",
+				&desc->fullbatt_vchkdrop_uV)) {
+		dev_err(dev, "cannot get fullbatt-vchkdrop-ms\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "fullbatt-uV",
+				&desc->fullbatt_uV)) {
+		dev_err(dev, "cannot get fullbatt-uV\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "fullbatt-soc",
+				&desc->fullbatt_soc)) {
+		dev_warn(dev, "cannot get fullbatt-soc\n");
+		desc->fullbatt_soc = 100;
+	}
+
+	if (of_property_read_u32(np, "fullbatt-full-capacity",
+				&desc->fullbatt_full_capacity)) {
+		dev_warn(dev, "cannot get fullbatt-full-capacity\n");
+		desc->fullbatt_full_capacity = 0;
+	}
+
+	if (of_property_read_u32(np, "battery-present",
+				&desc->battery_present)) {
+		dev_warn(dev, "cannot get tyep of battery present\n");
+		desc->battery_present = CM_CHARGER_STAT;
+	}
+
+	if (charger_manager_dt_parse_psy_charger(dev, desc)) {
+		dev_err(dev, "cannot parse the power-supply charger\n");
+		return NULL;
+	}
+
+	if (charger_manager_dt_parse_regulator(dev, desc)) {
+		dev_err(dev, "cannot parse the charger-regulators/cables\n");
+		return NULL;
+	}
+
+	if (of_property_read_string(np, "psy-fuelgauge-name",
+				&desc->psy_fuel_gauge)) {
+		dev_err(dev, "cannot get fuelgauge name\n");
+		return NULL;
+	}
+
+	if (of_property_read_bool(np, "measure-battery-temp"))
+		desc->measure_battery_temp = true;
+
+	if (of_property_read_u32(np, "charging-max-duration-minute",
+				&desc->charging_max_duration_ms)) {
+		dev_err(dev, "cannot get charging-max-duration-minute\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "discharging-max-duration-minute",
+				&desc->discharging_max_duration_ms)) {
+		dev_err(dev, "cannot get discharging-max-duration-minute\n");
+		return NULL;
+	}
+
+	/* Convert unit from minute to millisecond */
+	desc->charging_max_duration_ms *= (60 * 1000);
+	desc->discharging_max_duration_ms *= (60 * 1000);
+
+	return desc;
+}
+#else
+#define charger_manager_parse_dt	NULL
+#endif
+
 static int charger_manager_probe(struct platform_device *pdev)
 {
-	struct charger_desc *desc = dev_get_platdata(&pdev->dev);
+	struct charger_desc *desc;
 	struct charger_manager *cm;
 	int ret = 0, i = 0;
 	int j = 0;
 	union power_supply_propval val;
 
+	if (pdev->dev.of_node)
+		desc = charger_manager_dt_parse(&pdev->dev);
+	else if (pdev->dev.platform_data)
+		desc = dev_get_platdata(&pdev->dev);
+	else
+		desc = NULL;
+
+	if (!desc) {
+		dev_err(&pdev->dev, "Failed to get charger_desc data\n");
+		return -EINVAL;
+	}
+
 	if (g_desc && !rtc_dev && g_desc->rtc_name) {
 		rtc_dev = rtc_class_open(g_desc->rtc_name);
 		if (IS_ERR_OR_NULL(rtc_dev)) {
@@ -1834,11 +2102,21 @@ static const struct dev_pm_ops charger_manager_pm = {
 	.complete	= cm_suspend_complete,
 };
 
+#ifdef CONFIG_OF
+static struct of_device_id charger_manager_id_match[] = {
+	{ .compatible = "charger-manager", },
+	{},
+};
+#else
+#define charger_manager_id_match	NULL
+#endif
+
 static struct platform_driver charger_manager_driver = {
 	.driver = {
 		.name = "charger-manager",
 		.owner = THIS_MODULE,
 		.pm = &charger_manager_pm,
+		.of_match_table = charger_manager_id_match,
 	},
 	.probe = charger_manager_probe,
 	.remove = charger_manager_remove,
diff --git a/include/linux/power/charger-manager.h b/include/linux/power/charger-manager.h
index 0e86840..8696fb8 100644
--- a/include/linux/power/charger-manager.h
+++ b/include/linux/power/charger-manager.h
@@ -83,7 +83,7 @@ struct charger_global_desc {
  */
 struct charger_cable {
 	const char *extcon_name;
-	const char *name;
+	const char *cable_name;
 
 	/* The charger-manager use Exton framework*/
 	struct extcon_specific_cable_nb extcon_dev;
@@ -190,7 +190,7 @@ struct charger_regulator {
  *	max_duration_ms', cm start charging.
  */
 struct charger_desc {
-	char *psy_name;
+	const char *psy_name;
 
 	enum polling_modes polling_mode;
 	unsigned int polling_interval_ms;
@@ -203,18 +203,18 @@ struct charger_desc {
 
 	enum data_source battery_present;
 
-	char **psy_charger_stat;
+	const char **psy_charger_stat;
 
 	int num_charger_regulators;
 	struct charger_regulator *charger_regulators;
 
-	char *psy_fuel_gauge;
+	const char *psy_fuel_gauge;
 
 	int (*temperature_out_of_range)(int *mC);
 	bool measure_battery_temp;
 
-	u64 charging_max_duration_ms;
-	u64 discharging_max_duration_ms;
+	unsigned int charging_max_duration_ms;
+	unsigned int discharging_max_duration_ms;
 };
 
 #define PSY_NAME_MAX	30
-- 
1.8.0
