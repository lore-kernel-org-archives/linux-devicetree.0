From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v7 1/6] regulator: core: Make locks re-entrant
Date: Mon, 23 Apr 2018 16:33:37 +0200
Message-ID: <1524494022-22260-2-git-send-email-m.purski@samsung.com>
References: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
        <CGME20180423143400eucas1p162d48bddb8ba5ebc6e294ade791cb27c@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Setting voltage, enabling/disabling regulators requires operations on
all regulators related with the regulator being changed. Therefore,
all of them should be locked for the whole operation. With the current
locking implementation, adding additional dependency (regulators
coupling) causes deadlocks in some cases.

Introduce a possibility to attempt to lock a mutex multiple times
by the same task without waiting on a mutex. This should handle all
reasonable coupling-supplying combinations, especially when two coupled
regulators share common supplies. The only situation that should be
forbidden is simultaneous coupling and supplying between a pair of
regulators.

The idea is based on clk core.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/core.c         | 132 +++++++++++++++++++++++++++------------
 include/linux/regulator/driver.h |   2 +
 2 files changed, 93 insertions(+), 41 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index d480346..acca5de 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -147,6 +147,56 @@ static inline struct regulator_dev *rdev_get_supply(struct regulator_dev *rdev)
 }
 
 /**
+ * regulator_lock_nested - lock a single regulator
+ * @rdev:		regulator source
+ * @subclass:		mutex subclass used for lockdep
+ *
+ * This function can be called many times by one task on
+ * a single regulator and its mutex will be locked only
+ * once. If a task, which is calling this function is other
+ * than the one, which initially locked the mutex, it will
+ * wait on mutex.
+ */
+static void regulator_lock_nested(struct regulator_dev *rdev,
+				  unsigned int subclass)
+{
+	if (!mutex_trylock(&rdev->mutex)) {
+		if (rdev->mutex_owner == current) {
+			rdev->ref_cnt++;
+			return;
+		}
+		mutex_lock_nested(&rdev->mutex, subclass);
+	}
+
+	rdev->ref_cnt = 1;
+	rdev->mutex_owner = current;
+}
+
+static inline void regulator_lock(struct regulator_dev *rdev)
+{
+	regulator_lock_nested(rdev, 0);
+}
+
+/**
+ * regulator_unlock - unlock a single regulator
+ * @rdev:		regulator_source
+ *
+ * This function unlocks the mutex when the
+ * reference counter reaches 0.
+ */
+static void regulator_unlock(struct regulator_dev *rdev)
+{
+	if (rdev->ref_cnt != 0) {
+		rdev->ref_cnt--;
+
+		if (!rdev->ref_cnt) {
+			rdev->mutex_owner = NULL;
+			mutex_unlock(&rdev->mutex);
+		}
+	}
+}
+
+/**
  * regulator_lock_supply - lock a regulator and its supplies
  * @rdev:         regulator source
  */
@@ -155,7 +205,7 @@ static void regulator_lock_supply(struct regulator_dev *rdev)
 	int i;
 
 	for (i = 0; rdev; rdev = rdev_get_supply(rdev), i++)
-		mutex_lock_nested(&rdev->mutex, i);
+		regulator_lock_nested(rdev, i);
 }
 
 /**
@@ -167,7 +217,7 @@ static void regulator_unlock_supply(struct regulator_dev *rdev)
 	struct regulator *supply;
 
 	while (1) {
-		mutex_unlock(&rdev->mutex);
+		regulator_unlock(rdev);
 		supply = rdev->supply;
 
 		if (!rdev->supply)
@@ -350,9 +400,9 @@ static ssize_t regulator_uV_show(struct device *dev,
 	struct regulator_dev *rdev = dev_get_drvdata(dev);
 	ssize_t ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	ret = sprintf(buf, "%d\n", _regulator_get_voltage(rdev));
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -416,9 +466,9 @@ static ssize_t regulator_state_show(struct device *dev,
 	struct regulator_dev *rdev = dev_get_drvdata(dev);
 	ssize_t ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	ret = regulator_print_state(buf, _regulator_is_enabled(rdev));
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -526,10 +576,10 @@ static ssize_t regulator_total_uA_show(struct device *dev,
 	struct regulator *regulator;
 	int uA = 0;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	list_for_each_entry(regulator, &rdev->consumer_list, list)
 		uA += regulator->uA_load;
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return sprintf(buf, "%d\n", uA);
 }
 static DEVICE_ATTR(requested_microamps, 0444, regulator_total_uA_show, NULL);
@@ -1321,7 +1371,7 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 	if (regulator == NULL)
 		return NULL;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	regulator->rdev = rdev;
 	list_add(&regulator->list, &rdev->consumer_list);
 
@@ -1376,12 +1426,12 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 	    _regulator_is_enabled(rdev))
 		regulator->always_on = true;
 
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return regulator;
 overflow_err:
 	list_del(&regulator->list);
 	kfree(regulator);
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return NULL;
 }
 
@@ -1770,13 +1820,13 @@ static void _regulator_put(struct regulator *regulator)
 	/* remove any sysfs entries */
 	if (regulator->dev)
 		sysfs_remove_link(&rdev->dev.kobj, regulator->supply_name);
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	list_del(&regulator->list);
 
 	rdev->open_count--;
 	rdev->exclusive = 0;
 	put_device(&rdev->dev);
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	kfree_const(regulator->supply_name);
 	kfree(regulator);
@@ -2384,7 +2434,7 @@ static void regulator_disable_work(struct work_struct *work)
 						  disable_work.work);
 	int count, i, ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	BUG_ON(!rdev->deferred_disables);
 
@@ -2405,7 +2455,7 @@ static void regulator_disable_work(struct work_struct *work)
 			rdev_err(rdev, "Deferred disable failed: %d\n", ret);
 	}
 
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	if (rdev->supply) {
 		for (i = 0; i < count; i++) {
@@ -2440,11 +2490,11 @@ int regulator_disable_deferred(struct regulator *regulator, int ms)
 	if (!ms)
 		return regulator_disable(regulator);
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	rdev->deferred_disables++;
 	mod_delayed_work(system_power_efficient_wq, &rdev->disable_work,
 			 msecs_to_jiffies(ms));
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return 0;
 }
@@ -2476,10 +2526,10 @@ static int _regulator_list_voltage(struct regulator_dev *rdev,
 		if (selector >= rdev->desc->n_voltages)
 			return -EINVAL;
 		if (lock)
-			mutex_lock(&rdev->mutex);
+			regulator_lock(rdev);
 		ret = ops->list_voltage(rdev, selector);
 		if (lock)
-			mutex_unlock(&rdev->mutex);
+			regulator_unlock(rdev);
 	} else if (rdev->is_switch && rdev->supply) {
 		ret = _regulator_list_voltage(rdev->supply->rdev,
 					      selector, lock);
@@ -3252,7 +3302,7 @@ int regulator_sync_voltage(struct regulator *regulator)
 	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
 	int ret, min_uV, max_uV;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	if (!rdev->desc->ops->set_voltage &&
 	    !rdev->desc->ops->set_voltage_sel) {
@@ -3281,7 +3331,7 @@ int regulator_sync_voltage(struct regulator *regulator)
 	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
 
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_sync_voltage);
@@ -3374,7 +3424,7 @@ int regulator_set_current_limit(struct regulator *regulator,
 	struct regulator_dev *rdev = regulator->rdev;
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	/* sanity check */
 	if (!rdev->desc->ops->set_current_limit) {
@@ -3389,7 +3439,7 @@ int regulator_set_current_limit(struct regulator *regulator,
 
 	ret = rdev->desc->ops->set_current_limit(rdev, min_uA, max_uA);
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_set_current_limit);
@@ -3398,7 +3448,7 @@ static int _regulator_get_current_limit(struct regulator_dev *rdev)
 {
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	/* sanity check */
 	if (!rdev->desc->ops->get_current_limit) {
@@ -3408,7 +3458,7 @@ static int _regulator_get_current_limit(struct regulator_dev *rdev)
 
 	ret = rdev->desc->ops->get_current_limit(rdev);
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 
@@ -3444,7 +3494,7 @@ int regulator_set_mode(struct regulator *regulator, unsigned int mode)
 	int ret;
 	int regulator_curr_mode;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	/* sanity check */
 	if (!rdev->desc->ops->set_mode) {
@@ -3468,7 +3518,7 @@ int regulator_set_mode(struct regulator *regulator, unsigned int mode)
 
 	ret = rdev->desc->ops->set_mode(rdev, mode);
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regulator_set_mode);
@@ -3477,7 +3527,7 @@ static unsigned int _regulator_get_mode(struct regulator_dev *rdev)
 {
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	/* sanity check */
 	if (!rdev->desc->ops->get_mode) {
@@ -3487,7 +3537,7 @@ static unsigned int _regulator_get_mode(struct regulator_dev *rdev)
 
 	ret = rdev->desc->ops->get_mode(rdev);
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 
@@ -3508,7 +3558,7 @@ static int _regulator_get_error_flags(struct regulator_dev *rdev,
 {
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	/* sanity check */
 	if (!rdev->desc->ops->get_error_flags) {
@@ -3518,7 +3568,7 @@ static int _regulator_get_error_flags(struct regulator_dev *rdev,
 
 	ret = rdev->desc->ops->get_error_flags(rdev, flags);
 out:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 	return ret;
 }
 
@@ -3567,10 +3617,10 @@ int regulator_set_load(struct regulator *regulator, int uA_load)
 	struct regulator_dev *rdev = regulator->rdev;
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	regulator->uA_load = uA_load;
 	ret = drms_uA_update(rdev);
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -3598,7 +3648,7 @@ int regulator_allow_bypass(struct regulator *regulator, bool enable)
 	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_BYPASS))
 		return 0;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	if (enable && !regulator->bypass) {
 		rdev->bypass_count++;
@@ -3622,7 +3672,7 @@ int regulator_allow_bypass(struct regulator *regulator, bool enable)
 	if (ret == 0)
 		regulator->bypass = enable;
 
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -4288,9 +4338,9 @@ static int _regulator_suspend_late(struct device *dev, void *data)
 	suspend_state_t *state = data;
 	int ret;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 	ret = suspend_set_state(rdev, *state);
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -4320,14 +4370,14 @@ static int _regulator_resume_early(struct device *dev, void *data)
 	if (rstate == NULL)
 		return 0;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	if (rdev->desc->ops->resume_early &&
 	    (rstate->enabled == ENABLE_IN_SUSPEND ||
 	     rstate->enabled == DISABLE_IN_SUSPEND))
 		ret = rdev->desc->ops->resume_early(rdev);
 
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return ret;
 }
@@ -4629,7 +4679,7 @@ static int __init regulator_late_cleanup(struct device *dev, void *data)
 	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_STATUS))
 		return 0;
 
-	mutex_lock(&rdev->mutex);
+	regulator_lock(rdev);
 
 	if (rdev->use_count)
 		goto unlock;
@@ -4660,7 +4710,7 @@ static int __init regulator_late_cleanup(struct device *dev, void *data)
 	}
 
 unlock:
-	mutex_unlock(&rdev->mutex);
+	regulator_unlock(rdev);
 
 	return 0;
 }
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 4fc96cb..659a031 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -431,6 +431,8 @@ struct regulator_dev {
 
 	struct blocking_notifier_head notifier;
 	struct mutex mutex; /* consumer lock */
+	struct task_struct *mutex_owner;
+	int ref_cnt;
 	struct module *owner;
 	struct device dev;
 	struct regulation_constraints *constraints;
-- 
2.7.4
