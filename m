From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 6/6] regulator: core: Prevent falling too fast
Date: Wed, 14 Sep 2016 09:52:10 -0700
Message-ID: <1473871930-99603-6-git-send-email-mka@chromium.org>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473871930-99603-1-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On some boards it is possible that transitioning the regulator downwards
too fast will trigger the over voltage protection (OVP) on the
regulator. This is because until the voltage actually falls there is
time when the requested voltage is much lower than the actual voltage.

We'll fix this OVP problem by allowing users to specify the maximum
voltage that we can safely fall. The maximum safe voltage decrease
is specified as a percentage of the current voltage. The driver will
then break things into separate steps with a delay in between.

In order to figure out what the delay should be we need to figure out
how slowly the voltage rail might fall in the worst (slowest) case.
We'll assume this worst case is present and delay so we know for sure
that we've finished each step.

In this patch we actually block returning from the set_voltage() call
until we've finished delaying. A future patch atop this one might
choose to return more immediately and let the voltages fall in the
background. That would possibly allow us to cancel a slow downward
decay if there was a request to go back up.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Leave set_voltage tracepoints where they were
- Fixed error handling in code dealing with the device tree, return an error if configuration is invalid
- Fixed coding style and formatting issues
- Updated commit message

 .../devicetree/bindings/regulator/regulator.txt    |  7 ++++
 drivers/regulator/core.c                           | 49 +++++++++++++++++++---
 drivers/regulator/of_regulator.c                   | 42 ++++++++++++++++++-
 include/linux/regulator/machine.h                  |  2 +
 4 files changed, 93 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 4f792d1..485f14c 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -25,6 +25,13 @@ Optional properties:
   (unit: us). For regulators with a ramp delay the two values are added.
 - regulator-settle-time-down-us: Time to settle down after a voltage decrease
   (unit: us). For regulators with a ramp delay the two values are added.
+- regulator-safe-fall-percent:  If specified, it's not safe to transition the
+  regulator down faster than this amount and bigger jumps need to be broken into
+  more than one step.
+- regulator-slowest-decay-rate: Describes how slowly the regulator voltage will
+  decay down in the worst case (lightest expected load). Specified in uV / us
+  (like main regulator ramp rate). This is required when safe-fall-percent is
+  specified.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index dbb238f..36abfdf 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -105,8 +105,8 @@ static int _regulator_get_current_limit(struct regulator_dev *rdev);
 static unsigned int _regulator_get_mode(struct regulator_dev *rdev);
 static int _notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
-static int _regulator_do_set_voltage(struct regulator_dev *rdev,
-				     int min_uV, int max_uV);
+static int _regulator_set_voltage(struct regulator_dev *rdev,
+				  int min_uV, int max_uV);
 static struct regulator *create_regulator(struct regulator_dev *rdev,
 					  struct device *dev,
 					  const char *supply_name);
@@ -910,7 +910,7 @@ static int machine_constraints_voltage(struct regulator_dev *rdev,
 		if (target_min != current_uV || target_max != current_uV) {
 			rdev_info(rdev, "Bringing %duV into %d-%duV\n",
 				  current_uV, target_min, target_max);
-			ret = _regulator_do_set_voltage(
+			ret = _regulator_set_voltage(
 				rdev, target_min, target_max);
 			if (ret < 0) {
 				rdev_err(rdev,
@@ -2872,6 +2872,45 @@ out:
 	return ret;
 }
 
+static int _regulator_set_voltage(struct regulator_dev *rdev,
+				  int min_uV, int max_uV)
+{
+	int safe_fall_percent = rdev->constraints->safe_fall_percent;
+	int slowest_decay_rate = rdev->constraints->slowest_decay_rate;
+	int orig_uV = _regulator_get_voltage(rdev);
+	int uV = orig_uV;
+	int ret;
+
+	/* If we're rising or we're falling but don't need to slow; easy */
+	if (min_uV >= uV || !safe_fall_percent)
+		return _regulator_do_set_voltage(rdev, min_uV, max_uV);
+
+	while (uV > min_uV) {
+		int max_drop_uV = (uV * safe_fall_percent) / 100;
+		int next_uV;
+		int delay;
+
+		/* Make sure no infinite loop even in crazy cases */
+		if (max_drop_uV == 0)
+			max_drop_uV = 1;
+
+		next_uV = max_t(int, min_uV, uV - max_drop_uV);
+		delay = DIV_ROUND_UP(uV - next_uV, slowest_decay_rate);
+
+		ret = _regulator_do_set_voltage(rdev, uV, next_uV);
+		if (ret) {
+			/* Try to go back to original */
+			_regulator_do_set_voltage(rdev, uV, orig_uV);
+			return ret;
+		}
+
+		usleep_range(delay, delay + DIV_ROUND_UP(delay, 10));
+		uV = next_uV;
+	}
+
+	return 0;
+}
+
 static int regulator_set_voltage_unlocked(struct regulator *regulator,
 					  int min_uV, int max_uV)
 {
@@ -2962,7 +3001,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		}
 	}
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	ret = _regulator_set_voltage(rdev, min_uV, max_uV);
 	if (ret < 0)
 		goto out2;
 
@@ -3138,7 +3177,7 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	ret = _regulator_set_voltage(rdev, min_uV, max_uV);
 
 out:
 	mutex_unlock(&rdev->mutex);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index d3b20ae..d7b74b2 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -24,7 +24,7 @@ static const char *const regulator_states[PM_SUSPEND_MAX + 1] = {
 	[PM_SUSPEND_MAX]	= "regulator-state-disk",
 };
 
-static void of_get_regulation_constraints(struct device_node *np,
+static int of_get_regulation_constraints(struct device_node *np,
 					struct regulator_init_data **init_data,
 					const struct regulator_desc *desc)
 {
@@ -98,6 +98,40 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->settle_time_down = pval;
 
+	ret = of_property_read_u32(np, "regulator-safe-fall-percent", &pval);
+	if (!ret) {
+		constraints->safe_fall_percent = pval;
+
+		if (constraints->safe_fall_percent > 100) {
+			pr_err("%s: regulator-safe-fall-percent (%u) > 100\n",
+			       np->name, constraints->safe_fall_percent);
+			return -EINVAL;
+		}
+	}
+
+	ret = of_property_read_u32(np, "regulator-slowest-decay-rate", &pval);
+	if (!ret) {
+		constraints->slowest_decay_rate = pval;
+
+		/* We use the value as int and as divider; sanity check */
+		if (constraints->slowest_decay_rate == 0) {
+			pr_err("%s: regulator-slowest-decay-rate must not be 0\n",
+			       np->name);
+			return -EINVAL;
+		} else if (constraints->slowest_decay_rate > INT_MAX) {
+			pr_err("%s: regulator-slowest-decay-rate (%u) too big\n",
+			       np->name, constraints->slowest_decay_rate);
+			return -EINVAL;
+		}
+	}
+
+	if (constraints->safe_fall_percent &&
+	    !constraints->slowest_decay_rate) {
+		pr_err("%s: regulator-safe-fall-percent requires regulator-slowest-decay-rate\n",
+		       np->name);
+		return -EINVAL;
+	}
+
 	constraints->soft_start = of_property_read_bool(np,
 					"regulator-soft-start");
 	ret = of_property_read_u32(np, "regulator-active-discharge", &pval);
@@ -178,6 +212,8 @@ static void of_get_regulation_constraints(struct device_node *np,
 		suspend_state = NULL;
 		suspend_np = NULL;
 	}
+
+	return 0;
 }
 
 /**
@@ -203,7 +239,9 @@ struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
 	if (!init_data)
 		return NULL; /* Out of memory? */
 
-	of_get_regulation_constraints(node, &init_data, desc);
+	if (of_get_regulation_constraints(node, &init_data, desc))
+		return NULL;
+
 	return init_data;
 }
 EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 11ac36c..2d797dd 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -154,6 +154,8 @@ struct regulation_constraints {
 	unsigned int enable_time;
 	unsigned int settle_time_up;
 	unsigned int settle_time_down;
+	unsigned int slowest_decay_rate;
+	unsigned int safe_fall_percent;
 
 	unsigned int active_discharge;
 
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
