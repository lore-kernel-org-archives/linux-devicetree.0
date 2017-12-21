From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] regulator: add PM suspend and resume hooks
Date: Thu, 21 Dec 2017 14:25:06 +0800
Message-ID: <1513837506-26543-6-git-send-email-zhang.chunyan@linaro.org>
References: <1513837506-26543-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513837506-26543-1-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In this patch, consumers are allowed to set suspend voltage, and this
actually just set the "uV" in constraint::regulator_state, when the
regulator_suspend_late() was called by PM core through callback when
the system is entering into suspend, the regulator device would act
suspend activity then.

And it assumes that if any consumer set suspend voltage, the regulator
device should be enabled in the suspend state.  And if the suspend
voltage of a regulator device for all consumers was set zero, the
regulator device would be off in the suspend state.

This patch also provides a new function hook to regulator devices for
resuming from suspend states.

Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c          | 251 +++++++++++++++++++++++++++++++++-----
 drivers/regulator/of_regulator.c  |  12 ++
 include/linux/regulator/driver.h  |   2 +
 include/linux/regulator/machine.h |  16 ++-
 4 files changed, 249 insertions(+), 32 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 080c233..3f4d3aa 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -236,6 +236,12 @@ static int regulator_check_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
+/* return 0 if the state is valid */
+static int regulator_check_states(suspend_state_t state)
+{
+	return (state > PM_SUSPEND_MAX || state == PM_SUSPEND_TO_IDLE);
+}
+
 /* Make sure we select a voltage that suits the needs of all
  * regulator consumers
  */
@@ -327,6 +333,24 @@ static int regulator_mode_constrain(struct regulator_dev *rdev,
 	return -EINVAL;
 }
 
+static inline struct regulator_state *
+regulator_get_suspend_state(struct regulator_dev *rdev, suspend_state_t state)
+{
+	if (rdev->constraints == NULL)
+		return NULL;
+
+	switch (state) {
+	case PM_SUSPEND_STANDBY:
+		return &rdev->constraints->state_standby;
+	case PM_SUSPEND_MEM:
+		return &rdev->constraints->state_mem;
+	case PM_SUSPEND_MAX:
+		return &rdev->constraints->state_disk;
+	default:
+		return NULL;
+	}
+}
+
 static ssize_t regulator_uV_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -734,9 +758,14 @@ static int drms_uA_update(struct regulator_dev *rdev)
 }
 
 static int suspend_set_state(struct regulator_dev *rdev,
-	struct regulator_state *rstate)
+				    suspend_state_t state)
 {
 	int ret = 0;
+	struct regulator_state *rstate;
+
+	rstate = regulator_get_suspend_state(rdev, state);
+	if (rstate == NULL)
+		return -EINVAL;
 
 	/* If we have no suspend mode configration don't set anything;
 	 * only warn if the driver implements set_suspend_voltage or
@@ -779,28 +808,8 @@ static int suspend_set_state(struct regulator_dev *rdev,
 			return ret;
 		}
 	}
-	return ret;
-}
 
-/* locks held by caller */
-static int suspend_prepare(struct regulator_dev *rdev, suspend_state_t state)
-{
-	if (!rdev->constraints)
-		return -EINVAL;
-
-	switch (state) {
-	case PM_SUSPEND_STANDBY:
-		return suspend_set_state(rdev,
-			&rdev->constraints->state_standby);
-	case PM_SUSPEND_MEM:
-		return suspend_set_state(rdev,
-			&rdev->constraints->state_mem);
-	case PM_SUSPEND_MAX:
-		return suspend_set_state(rdev,
-			&rdev->constraints->state_disk);
-	default:
-		return -EINVAL;
-	}
+	return ret;
 }
 
 static void print_constraints(struct regulator_dev *rdev)
@@ -1069,7 +1078,7 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 
 	/* do we need to setup our suspend state */
 	if (rdev->constraints->initial_state) {
-		ret = suspend_prepare(rdev, rdev->constraints->initial_state);
+		ret = suspend_set_state(rdev, rdev->constraints->initial_state);
 		if (ret < 0) {
 			rdev_err(rdev, "failed to set suspend state\n");
 			return ret;
@@ -2898,6 +2907,35 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int _regulator_do_set_suspend_voltage(struct regulator_dev *rdev,
+				  int min_uV, int max_uV, suspend_state_t state)
+{
+	struct regulator_state *rstate;
+	int uV, sel;
+
+	rstate = regulator_get_suspend_state(rdev, state);
+	if (rstate == NULL)
+		return -EINVAL;
+
+	if (!rstate->changeable)
+		return -EINVAL;
+
+	if (min_uV < rstate->min_uV)
+		min_uV = rstate->min_uV;
+	if (max_uV > rstate->max_uV)
+		max_uV = rstate->max_uV;
+
+	sel = regulator_map_voltage(rdev, min_uV, max_uV);
+	if (sel < 0)
+		return sel;
+
+	uV = rdev->desc->ops->list_voltage(rdev, sel);
+	if (uV >= min_uV && uV <= max_uV)
+		rstate->uV = uV;
+
+	return 0;
+}
+
 static int regulator_set_voltage_unlocked(struct regulator *regulator,
 					  int min_uV, int max_uV,
 					  suspend_state_t state)
@@ -2993,7 +3031,11 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		}
 	}
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	if (state == PM_SUSPEND_ON)
+		ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	else
+		ret = _regulator_do_set_suspend_voltage(rdev, min_uV,
+							max_uV, state);
 	if (ret < 0)
 		goto out2;
 
@@ -3049,6 +3091,92 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage);
 
+static inline int regulator_suspend_toggle(struct regulator_dev *rdev,
+					   suspend_state_t state, bool en)
+{
+	struct regulator_state *rstate;
+
+	rstate = regulator_get_suspend_state(rdev, state);
+	if (rstate == NULL)
+		return -EINVAL;
+
+	if (!rstate->changeable)
+		return -EINVAL;
+
+	rstate->enabled = en;
+
+	return 0;
+}
+
+static int regulator_suspend_enable(struct regulator_dev *rdev,
+				    suspend_state_t state)
+{
+	return regulator_suspend_toggle(rdev, state, true);
+}
+
+static int regulator_suspend_disable(struct regulator_dev *rdev,
+				     suspend_state_t state)
+{
+	struct regulator *regulator;
+	struct regulator_voltage *voltage;
+
+	/*
+	 * if any consumer wants this regulator device keeping on in
+	 * suspend states, don't set it as disabled.
+	 */
+	list_for_each_entry(regulator, &rdev->consumer_list, list) {
+		voltage = &regulator->voltage[state];
+		if (voltage->min_uV || voltage->max_uV)
+			return 0;
+	}
+
+	return regulator_suspend_toggle(rdev, state, false);
+}
+
+static int _regulator_set_suspend_voltage(struct regulator *regulator,
+					  int min_uV, int max_uV,
+					  suspend_state_t state)
+{
+	int ret;
+	struct regulator_dev *rdev = regulator->rdev;
+
+	/*
+	 * We assume users want to switch off the regulator device for
+	 * suspend state when setting min_uV and max_uV all with zero.
+	 */
+	if (min_uV == 0 && max_uV == 0) {
+		regulator->voltage[state].min_uV = 0;
+		regulator->voltage[state].max_uV = 0;
+		return regulator_suspend_disable(rdev, state);
+	}
+
+	ret = regulator_suspend_enable(rdev, state);
+	if (ret < 0)
+		return ret;
+
+	return regulator_set_voltage_unlocked(regulator, min_uV, max_uV, state);
+}
+
+int regulator_set_suspend_voltage(struct regulator *regulator, int min_uV,
+				  int max_uV, suspend_state_t state)
+{
+	int ret = 0;
+
+	/* PM_SUSPEND_ON is handled by regulator_set_voltage() */
+	if (regulator_check_states(state) || state == PM_SUSPEND_ON)
+		return -EINVAL;
+
+	regulator_lock_supply(regulator->rdev);
+
+	ret = _regulator_set_suspend_voltage(regulator, min_uV,
+					     max_uV, state);
+
+	regulator_unlock_supply(regulator->rdev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(regulator_set_suspend_voltage);
+
 /**
  * regulator_set_voltage_time - get raise/fall time
  * @regulator: regulator source
@@ -3923,12 +4051,6 @@ static void regulator_dev_release(struct device *dev)
 	kfree(rdev);
 }
 
-static struct class regulator_class = {
-	.name = "regulator",
-	.dev_release = regulator_dev_release,
-	.dev_groups = regulator_dev_groups,
-};
-
 static void rdev_init_debugfs(struct regulator_dev *rdev)
 {
 	struct device *parent = rdev->dev.parent;
@@ -4179,7 +4301,76 @@ void regulator_unregister(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(regulator_unregister);
 
+static int _regulator_suspend_late(struct device *dev, void *data)
+{
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+	suspend_state_t *state = data;
+	int ret;
 
+	mutex_lock(&rdev->mutex);
+	ret = suspend_set_state(rdev, *state);
+	mutex_unlock(&rdev->mutex);
+
+	return ret;
+}
+
+/**
+ * regulator_suspend_late - prepare regulators for system wide suspend
+ * @state: system suspend state
+ *
+ * Configure each regulator with it's suspend operating parameters for state.
+ */
+static int regulator_suspend_late(struct device *dev)
+{
+	suspend_state_t state = pm_suspend_target_state;
+
+	return class_for_each_device(&regulator_class, NULL, &state,
+				     _regulator_suspend_late);
+}
+static int _regulator_resume_early(struct device *dev, void *data)
+{
+	int ret = 0;
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+	suspend_state_t *state = data;
+	struct regulator_state *rstate;
+
+	rstate = regulator_get_suspend_state(rdev, *state);
+	if (rstate == NULL)
+		return -EINVAL;
+
+	mutex_lock(&rdev->mutex);
+
+	if (rdev->desc->ops->resume_early &&
+	    (rstate->enabled == ENABLE_IN_SUSPEND ||
+	     rstate->enabled == DISABLE_IN_SUSPEND))
+		ret = rdev->desc->ops->resume_early(rdev);
+
+	mutex_unlock(&rdev->mutex);
+
+	return ret;
+}
+
+static int regulator_resume_early(struct device *dev)
+{
+	suspend_state_t state = pm_suspend_target_state;
+
+	return class_for_each_device(&regulator_class, NULL, &state,
+				     _regulator_resume_early);
+}
+
+static const struct dev_pm_ops __maybe_unused regulator_pm_ops = {
+	.suspend_late	= regulator_suspend_late,
+	.resume_early	= regulator_resume_early,
+};
+
+static struct class regulator_class = {
+	.name = "regulator",
+	.dev_release = regulator_dev_release,
+	.dev_groups = regulator_dev_groups,
+#ifdef CONFIG_PM_SLEEP
+	.pm = &regulator_pm_ops,
+#endif
+};
 /**
  * regulator_has_full_constraints - the system has fully specified constraints
  *
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 41dad42..7dc8fd2 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -188,6 +188,18 @@ static void of_get_regulation_constraints(struct device_node *np,
 					"regulator-suspend-microvolt", &pval))
 			suspend_state->uV = pval;
 
+		if (!of_property_read_u32(np, "regulator-suspend-min-microvolt",
+					  &pval))
+			suspend_state->min_uV = pval;
+
+		if (!of_property_read_u32(np, "regulator-suspend-max-microvolt",
+					  &pval))
+			suspend_state->max_uV = pval;
+
+		if (of_property_read_bool(suspend_np,
+					"regulator-changeable-in-suspend"))
+			suspend_state->changeable = true;
+
 		if (i == PM_SUSPEND_MEM)
 			constraints->initial_state = PM_SUSPEND_MEM;
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 94417b4..4c00486 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -214,6 +214,8 @@ struct regulator_ops {
 	/* set regulator suspend operating mode (defined in consumer.h) */
 	int (*set_suspend_mode) (struct regulator_dev *, unsigned int mode);
 
+	int (*resume_early)(struct regulator_dev *rdev);
+
 	int (*set_pull_down) (struct regulator_dev *);
 };
 
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index b4ddb56..f60ec1f 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -42,7 +42,12 @@ struct regulator;
 #define REGULATOR_CHANGE_DRMS		0x10
 #define REGULATOR_CHANGE_BYPASS		0x20
 
-/* operations in suspend mode */
+/*
+ * operations in suspend mode
+ * DO_NOTHING_IN_SUSPEND - the default value
+ * DISABLE_IN_SUSPEND	- turn off regulator in suspend states
+ * ENABLE_IN_SUSPEND	- keep regulator on in suspend states
+ */
 #define DO_NOTHING_IN_SUSPEND	(-1)
 #define DISABLE_IN_SUSPEND	0
 #define ENABLE_IN_SUSPEND	1
@@ -61,17 +66,24 @@ enum regulator_active_discharge {
  * state.  One of enabled or disabled must be set for the
  * configuration to be applied.
  *
- * @uV: Operating voltage during suspend.
+ * @uV: Default operating voltage during suspend, it can be adjusted
+ *	among <min_uV, max_uV>
+ * @min_uV: Minimum suspend voltage may be set.
+ * @max_uV: Maximum suspend voltage may be set.
  * @mode: Operating mode during suspend.
  * @enabled: operations during suspend.
  *	     - DO_NOTHING_IN_SUSPEND
  *	     - DISABLE_IN_SUSPEND
  *	     - ENABLE_IN_SUSPEND
+ * @changeable: Is this state can be changed.
  */
 struct regulator_state {
 	int uV;	/* suspend voltage */
+	int min_uV;
+	int max_uV;
 	unsigned int mode; /* suspend regulator operating mode */
 	int enabled; /* is regulator enabled in this suspend state */
+	bool changeable;
 };
 
 /**
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
