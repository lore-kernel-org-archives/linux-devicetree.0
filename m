From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Tue, 6 Sep 2016 12:05:24 -0700
Message-ID: <20160906190524.GB79728@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On some boards it's possible that transitioning the PWM regulator
downwards too fast will trigger the over voltage protection (OVP) on the
regulator.  This is because until the voltage actually falls there is a
time when the requested voltage is much lower than the actual voltage.

We'll fix this OVP problem by allowing users to specify the maximum
voltage that we can safely fall.  Apparently this maximum safe voltage
should be specified as a percentage of the current voltage.  The
regulator will then break things into separate steps with a delay in
between.

In order to figure out what the delay should be we need to figure out
how slowly the voltage rail might fall in the worst (slowest) case.
We'll assume this worst case is present and delay so we know for sure
that we've finished each step.

In this patch we actually block returning from the set_voltage() call
until we've finished delaying.  A future patch atop this one might
choose to return more immediately and let the voltages fall in the
background.  That would possibly to allow us to cancel a slow downward
decay if there was a request to go back up.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v4:
- Moved from PWM regulator to regulator core
- Added 'regulator' prefix to device tree properties

 .../devicetree/bindings/regulator/regulator.txt    |  7 +++
 drivers/regulator/core.c                           | 58 ++++++++++++++++++----
 drivers/regulator/of_regulator.c                   | 34 +++++++++++++
 include/linux/regulator/machine.h                  |  2 +
 4 files changed, 92 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index d2d1c4d..b7fbd9a 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -23,6 +23,13 @@ Optional properties:
   and board design issues such as trace capacitance and load on the supply.
 - regulator-settle-time-up-us: Time to settle down after a voltage increase
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
index ed69fdc..9124532 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -105,8 +105,8 @@ static int _regulator_get_current_limit(struct regulator_dev *rdev);
 static unsigned int _regulator_get_mode(struct regulator_dev *rdev);
 static int _notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
-static int _regulator_do_set_voltage(struct regulator_dev *rdev,
-				     int min_uV, int max_uV);
+static int _regulator_set_voltage(struct regulator_dev *rdev,
+				int min_uV, int max_uV);
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
@@ -2753,8 +2753,6 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 	int old_selector = -1;
 	int old_uV = _regulator_get_voltage(rdev);
 
-	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
-
 	min_uV += rdev->constraints->uV_offset;
 	max_uV += rdev->constraints->uV_offset;
 
@@ -2842,11 +2840,53 @@ no_delay:
 				     (void *)data);
 	}
 
-	trace_regulator_set_voltage_complete(rdev_get_name(rdev), best_val);
-
 	return ret;
 }
 
+static int _regulator_set_voltage(struct regulator_dev *rdev,
+				     int min_uV, int max_uV)
+{
+	int safe_fall_percent = rdev->constraints->safe_fall_percent;
+	int slowest_decay_rate = rdev->constraints->slowest_decay_rate;
+	int orig_uV = _regulator_get_voltage(rdev);
+	int uV = orig_uV;
+	int ret;
+
+	trace_regulator_set_voltage(rdev_get_name(rdev), min_uV, max_uV);
+
+	 /* If we're rising or we're falling but don't need to slow; easy */
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
+	trace_regulator_set_voltage_complete(rdev_get_name(rdev),
+					_regulator_get_voltage(rdev));
+
+	return 0;
+}
+
 static int regulator_set_voltage_unlocked(struct regulator *regulator,
 					  int min_uV, int max_uV)
 {
@@ -2937,7 +2977,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
 		}
 	}
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	ret = _regulator_set_voltage(rdev, min_uV, max_uV);
 	if (ret < 0)
 		goto out2;
 
@@ -3144,7 +3184,7 @@ int regulator_sync_voltage(struct regulator *regulator)
 	if (ret < 0)
 		goto out;
 
-	ret = _regulator_do_set_voltage(rdev, min_uV, max_uV);
+	ret = _regulator_set_voltage(rdev, min_uV, max_uV);
 
 out:
 	mutex_unlock(&rdev->mutex);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 056f242..fc5818f 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -94,6 +94,40 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->settle_time_up = pval;
 
+	ret = of_property_read_u32(np, "regulator-slowest-decay-rate", &pval);
+	if (!ret)
+		constraints->slowest_decay_rate = pval;
+	else
+		constraints->slowest_decay_rate = INT_MAX;
+
+	ret = of_property_read_u32(np, "regulator-safe-fall-percent", &pval);
+	if (!ret)
+		constraints->safe_fall_percent = pval;
+
+	/* We use the value as int and as divider; sanity check */
+	if (constraints->slowest_decay_rate == 0) {
+		pr_err("%s: regulator-slowest-decay-rate must not be 0\n",
+			np->name);
+		constraints->slowest_decay_rate = INT_MAX;
+	} else if (constraints->slowest_decay_rate > INT_MAX) {
+		pr_err("%s: regulator-slowest-decay-rate (%u) too big\n",
+			np->name, constraints->slowest_decay_rate);
+		constraints->slowest_decay_rate = INT_MAX;
+	}
+
+	if (constraints->safe_fall_percent > 100) {
+		pr_err("%s: regulator-safe-fall-percent (%u) > 100\n",
+			np->name, constraints->safe_fall_percent);
+		constraints->safe_fall_percent = 0;
+       }
+
+	if (constraints->safe_fall_percent &&
+		!constraints->slowest_decay_rate) {
+		pr_err("%s: regulator-slowest-decay-rate requires "
+			"regulator-safe-fall-percent\n", np->name);
+		constraints->safe_fall_percent = 0;
+	}
+
 	constraints->soft_start = of_property_read_bool(np,
 					"regulator-soft-start");
 	ret = of_property_read_u32(np, "regulator-active-discharge", &pval);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 8681a82..4f49f92 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -152,6 +152,8 @@ struct regulation_constraints {
 	unsigned int ramp_delay;
 	unsigned int enable_time;
 	unsigned int settle_time_up;
+	unsigned int slowest_decay_rate;
+	unsigned int safe_fall_percent;
 
 	unsigned int active_discharge;
 
-- 
2.8.0.rc3.226.g39d4020


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
