From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 5/6] regulator: core: Add support for a fixed delay after voltage changes
Date: Wed, 14 Sep 2016 09:52:09 -0700
Message-ID: <1473871930-99603-5-git-send-email-mka@chromium.org>
References: <1473871930-99603-1-git-send-email-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473871930-99603-1-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The target voltage is not necessarily reached inmediately after
requesting a regulator to change the voltage. In some cases the
ramp_delay can be used to calculate the stabilisation time, in others
there is no direct relationship between the delta in the voltage and
the stabilisation time. This change introduces the device tree properties
"regulator-settle-time-up-us"/"regulator-settle-time-down-us" which
allow to specify a fixed delay after a voltage increase or decrease.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Added support for delay on voltage decreases
- Don't skip set_voltage_time op if no settle time and ramp delay

 .../devicetree/bindings/regulator/regulator.txt        |  4 ++++
 drivers/regulator/core.c                               | 18 +++++++++++-------
 drivers/regulator/of_regulator.c                       |  8 ++++++++
 include/linux/regulator/machine.h                      |  4 ++++
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index ecfc593..4f792d1 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -21,6 +21,10 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-settle-time-up-us: Time to settle down after a voltage increase
+  (unit: us). For regulators with a ramp delay the two values are added.
+- regulator-settle-time-down-us: Time to settle down after a voltage decrease
+  (unit: us). For regulators with a ramp delay the two values are added.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c52fc0c..dbb238f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2746,19 +2746,23 @@ static int _regulator_call_set_voltage_sel(struct regulator_dev *rdev,
 static int _regulator_set_voltage_time(struct regulator_dev *rdev,
 				       int old_uV, int new_uV)
 {
+	unsigned int settle_time = 0;
 	unsigned int ramp_delay = 0;
 
+	if (new_uV > old_uV)
+		settle_time = rdev->constraints->settle_time_up;
+	else if (new_uV < old_uV)
+		settle_time = rdev->constraints->settle_time_down;
+
 	if (rdev->constraints->ramp_delay)
 		ramp_delay = rdev->constraints->ramp_delay;
 	else if (rdev->desc->ramp_delay)
 		ramp_delay = rdev->desc->ramp_delay;
 
-	if (ramp_delay == 0) {
-		rdev_warn(rdev, "ramp_delay not set\n");
-		return 0;
-	}
+	if (ramp_delay == 0)
+		return settle_time;
 
-	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
+	return settle_time + DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
 }
 
 static int _regulator_do_set_voltage(struct regulator_dev *rdev,
@@ -3071,8 +3075,8 @@ EXPORT_SYMBOL_GPL(regulator_set_voltage_time);
  * Provided with the starting and target voltage selectors, this function
  * returns time in microseconds required to rise or fall to this new voltage
  *
- * Drivers providing ramp_delay in regulation_constraints can use this as their
- * set_voltage_time_sel() operation.
+ * Drivers providing ramp_delay or settle_time in regulation_constraints can
+ * use this as their set_voltage_time_sel() operation.
  */
 int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 				   unsigned int old_selector,
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 4f613ec..d3b20ae 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -90,6 +90,14 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->enable_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-settle-time-up-us", &pval);
+	if (!ret)
+		constraints->settle_time_up = pval;
+
+	ret = of_property_read_u32(np, "regulator-settle-time-down-us", &pval);
+	if (!ret)
+		constraints->settle_time_down = pval;
+
 	constraints->soft_start = of_property_read_bool(np,
 					"regulator-soft-start");
 	ret = of_property_read_u32(np, "regulator-active-discharge", &pval);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index ad3e515..11ac36c 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -108,6 +108,8 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
+ * @settle_time_up: Time to settle down after voltage increase (unit: uV/us)
+ * @settle_time_down: Time to settle down after voltage decrease (unit: uV/us)
  * @active_discharge: Enable/disable active discharge. The enum
  *		      regulator_active_discharge values are used for
  *		      initialisation.
@@ -150,6 +152,8 @@ struct regulation_constraints {
 
 	unsigned int ramp_delay;
 	unsigned int enable_time;
+	unsigned int settle_time_up;
+	unsigned int settle_time_down;
 
 	unsigned int active_discharge;
 
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
