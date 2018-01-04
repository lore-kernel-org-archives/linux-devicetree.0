From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 2/5] regulator: make regulator voltage be an array to support more states
Date: Thu,  4 Jan 2018 15:22:45 +0800
Message-ID: <1515050568-23876-3-git-send-email-zhang.chunyan@linaro.org>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515050568-23876-1-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some regulator consumers would like to make the regulator device
keeping a voltage range output when the system entering into
suspend states.

Making regulator voltage be an array can allow consumers to set voltage
for normal state as well as for suspend states through the same code.

Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c     | 63 ++++++++++++++++++++++++--------------------
 drivers/regulator/internal.h | 18 +++++++++++--
 2 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b64b791..97bc9f7 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -240,22 +240,25 @@ static int regulator_check_voltage(struct regulator_dev *rdev,
  * regulator consumers
  */
 static int regulator_check_consumers(struct regulator_dev *rdev,
-				     int *min_uV, int *max_uV)
+				     int *min_uV, int *max_uV,
+				     suspend_state_t state)
 {
 	struct regulator *regulator;
+	struct regulator_voltage *voltage;
 
 	list_for_each_entry(regulator, &rdev->consumer_list, list) {
+		voltage = &regulator->voltage[state];
 		/*
 		 * Assume consumers that didn't say anything are OK
 		 * with anything in the constraint range.
 		 */
-		if (!regulator->min_uV && !regulator->max_uV)
+		if (!voltage->min_uV && !voltage->max_uV)
 			continue;
 
-		if (*max_uV > regulator->max_uV)
-			*max_uV = regulator->max_uV;
-		if (*min_uV < regulator->min_uV)
-			*min_uV = regulator->min_uV;
+		if (*max_uV > voltage->max_uV)
+			*max_uV = voltage->max_uV;
+		if (*min_uV < voltage->min_uV)
+			*min_uV = voltage->min_uV;
 	}
 
 	if (*min_uV > *max_uV) {
@@ -1356,9 +1359,9 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 		debugfs_create_u32("uA_load", 0444, regulator->debugfs,
 				   &regulator->uA_load);
 		debugfs_create_u32("min_uV", 0444, regulator->debugfs,
-				   &regulator->min_uV);
+				   &regulator->voltage[PM_SUSPEND_ON].min_uV);
 		debugfs_create_u32("max_uV", 0444, regulator->debugfs,
-				   &regulator->max_uV);
+				   &regulator->voltage[PM_SUSPEND_ON].max_uV);
 		debugfs_create_file("constraint_flags", 0444,
 				    regulator->debugfs, regulator,
 				    &constraint_flags_fops);
@@ -2898,9 +2901,11 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 }
 
 static int regulator_set_voltage_unlocked(struct regulator *regulator,
-					  int min_uV, int max_uV)
+					  int min_uV, int max_uV,
+					  suspend_state_t state)
 {
 	struct regulator_dev *rdev = regulator->rdev;
+	struct regulator_voltage *voltage = &regulator->voltage[state];
 	int ret = 0;
 	int old_min_uV, old_max_uV;
 	int current_uV;
@@ -2911,7 +2916,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	 * should be a noop (some cpufreq implementations use the same
 	 * voltage for multiple frequencies, for example).
 	 */
-	if (regulator->min_uV == min_uV && regulator->max_uV == max_uV)
+	if (voltage->min_uV == min_uV && voltage->max_uV == max_uV)
 		goto out;
 
 	/* If we're trying to set a range that overlaps the current voltage,
@@ -2921,8 +2926,8 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE)) {
 		current_uV = _regulator_get_voltage(rdev);
 		if (min_uV <= current_uV && current_uV <= max_uV) {
-			regulator->min_uV = min_uV;
-			regulator->max_uV = max_uV;
+			voltage->min_uV = min_uV;
+			voltage->max_uV = max_uV;
 			goto out;
 		}
 	}
@@ -2940,12 +2945,12 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		goto out;
 
 	/* restore original values in case of error */
-	old_min_uV = regulator->min_uV;
-	old_max_uV = regulator->max_uV;
-	regulator->min_uV = min_uV;
-	regulator->max_uV = max_uV;
+	old_min_uV = voltage->min_uV;
+	old_max_uV = voltage->max_uV;
+	voltage->min_uV = min_uV;
+	voltage->max_uV = max_uV;
 
-	ret = regulator_check_consumers(rdev, &min_uV, &max_uV);
+	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, state);
 	if (ret < 0)
 		goto out2;
 
@@ -2982,7 +2987,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 
 	if (supply_change_uV > 0) {
 		ret = regulator_set_voltage_unlocked(rdev->supply,
-				best_supply_uV, INT_MAX);
+				best_supply_uV, INT_MAX, state);
 		if (ret) {
 			dev_err(&rdev->dev, "Failed to increase supply voltage: %d\n",
 					ret);
@@ -2996,7 +3001,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 
 	if (supply_change_uV < 0) {
 		ret = regulator_set_voltage_unlocked(rdev->supply,
-				best_supply_uV, INT_MAX);
+				best_supply_uV, INT_MAX, state);
 		if (ret)
 			dev_warn(&rdev->dev, "Failed to decrease supply voltage: %d\n",
 					ret);
@@ -3007,8 +3012,8 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 out:
 	return ret;
 out2:
-	regulator->min_uV = old_min_uV;
-	regulator->max_uV = old_max_uV;
+	voltage->min_uV = old_min_uV;
+	voltage->max_uV = old_max_uV;
 
 	return ret;
 }
@@ -3037,7 +3042,8 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 
 	regulator_lock_supply(regulator->rdev);
 
-	ret = regulator_set_voltage_unlocked(regulator, min_uV, max_uV);
+	ret = regulator_set_voltage_unlocked(regulator, min_uV, max_uV,
+					     PM_SUSPEND_ON);
 
 	regulator_unlock_supply(regulator->rdev);
 
@@ -3138,6 +3144,7 @@ EXPORT_SYMBOL_GPL(regulator_set_voltage_time_sel);
 int regulator_sync_voltage(struct regulator *regulator)
 {
 	struct regulator_dev *rdev = regulator->rdev;
+	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
 	int ret, min_uV, max_uV;
 
 	mutex_lock(&rdev->mutex);
@@ -3149,20 +3156,20 @@ int regulator_sync_voltage(struct regulator *regulator)
 	}
 
 	/* This is only going to work if we've had a voltage configured. */
-	if (!regulator->min_uV && !regulator->max_uV) {
+	if (!voltage->min_uV && !voltage->max_uV) {
 		ret = -EINVAL;
 		goto out;
 	}
 
-	min_uV = regulator->min_uV;
-	max_uV = regulator->max_uV;
+	min_uV = voltage->min_uV;
+	max_uV = voltage->max_uV;
 
 	/* This should be a paranoia check... */
 	ret = regulator_check_voltage(rdev, &min_uV, &max_uV);
 	if (ret < 0)
 		goto out;
 
-	ret = regulator_check_consumers(rdev, &min_uV, &max_uV);
+	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, 0);
 	if (ret < 0)
 		goto out;
 
@@ -4424,8 +4431,8 @@ static void regulator_summary_show_subtree(struct seq_file *s,
 		switch (rdev->desc->type) {
 		case REGULATOR_VOLTAGE:
 			seq_printf(s, "%37dmV %5dmV",
-				   consumer->min_uV / 1000,
-				   consumer->max_uV / 1000);
+				   consumer->voltage[PM_SUSPEND_ON].min_uV / 1000,
+				   consumer->voltage[PM_SUSPEND_ON].max_uV / 1000);
 			break;
 		case REGULATOR_CURRENT:
 			break;
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 66a8ea0..aba8e414 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -16,10 +16,25 @@
 #ifndef __REGULATOR_INTERNAL_H
 #define __REGULATOR_INTERNAL_H
 
+#include <linux/suspend.h>
+
+#define REGULATOR_STATES_NUM	(PM_SUSPEND_MAX + 1)
+
+struct regulator_voltage {
+	int min_uV;
+	int max_uV;
+};
+
 /*
  * struct regulator
  *
  * One for each consumer device.
+ * @voltage - a voltage array for each state of runtime, i.e.:
+ *            PM_SUSPEND_ON
+ *            PM_SUSPEND_TO_IDLE
+ *            PM_SUSPEND_STANDBY
+ *            PM_SUSPEND_MEM
+ *            PM_SUSPEND_MAX
  */
 struct regulator {
 	struct device *dev;
@@ -27,8 +42,7 @@ struct regulator {
 	unsigned int always_on:1;
 	unsigned int bypass:1;
 	int uA_load;
-	int min_uV;
-	int max_uV;
+	struct regulator_voltage voltage[REGULATOR_STATES_NUM];
 	const char *supply_name;
 	struct device_attribute dev_attr;
 	struct regulator_dev *rdev;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
