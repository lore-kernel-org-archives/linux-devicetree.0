From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 3/4] regulator: Add support for a fixed delay after
 voltage increases
Date: Tue, 6 Sep 2016 12:05:04 -0700
Message-ID: <20160906190504.GA79728@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>, briannorris@chromium.org, javier@dowhile0.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The target voltage isn't necessarily reached inmediately after
requesting a regulator to change the voltage. In some cases the
ramp_delay can be used to calculate the stabilisation time, in others
there is no direct relationship between the delta in the voltage and
the stabilisation time. This change introduces the device tree property
"regulator-settle-time-up-us" which allows to specify a fixed delay
after a voltage increase.

We don't add an option of a fixed delay on the way down for now because
the way down is probably modelled best with a ramp rate, not a fixed
delay.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>

---
Changes in v4:
- Moved from PWM regulator to regulator core
- Added 'regulator' prefix to device tree property

 .../devicetree/bindings/regulator/regulator.txt    |  2 ++
 drivers/regulator/core.c                           | 24 +++++++++++++---------
 drivers/regulator/of_regulator.c                   |  4 ++++
 include/linux/regulator/machine.h                  |  2 ++
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index ecfc593..d2d1c4d 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -21,6 +21,8 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-settle-time-up-us: Time to settle down after a voltage increase
+  (unit: us). For regulators with a ramp delay the two values are added.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b1cef47..ed69fdc 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2801,7 +2801,9 @@ static int _regulator_do_set_voltage(struct regulator_dev *rdev,
 		ret = -EINVAL;
 	}
 
-	if (ret != 0 || rdev->constraints->ramp_disable)
+	if (ret != 0 ||
+		(rdev->constraints->ramp_disable &&
+			!rdev->constraints->settle_time_up))
 		goto no_delay;
 
 	if (rdev->desc->ops->set_voltage_time) {
@@ -3050,25 +3052,27 @@ EXPORT_SYMBOL_GPL(regulator_set_voltage_time);
  * Provided with the starting and ending voltage, this function calculates
  * the time in microseconds required to rise or fall to this new voltage.
  *
- * Drivers providing ramp_delay in regulation_constraints can use this as their
- * set_voltage_time() operation.
+ * Drivers providing ramp_delay or settle_time_up in regulation_constraints
+ * can use this as their set_voltage_time() operation.
  */
 int regulator_set_voltage_time_op(struct regulator_dev *rdev,
 				int old_uV, int new_uV)
 {
+	unsigned int settle_time = 0;
 	unsigned int ramp_delay = 0;
 
+	if (new_uV > old_uV)
+		settle_time = rdev->constraints->settle_time_up;
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
 EXPORT_SYMBOL_GPL(regulator_set_voltage_time_op);
 
@@ -3081,8 +3085,8 @@ EXPORT_SYMBOL_GPL(regulator_set_voltage_time_op);
  * Provided with the starting and target voltage selectors, this function
  * returns time in microseconds required to rise or fall to this new voltage
  *
- * Drivers providing ramp_delay in regulation_constraints can use this as their
- * set_voltage_time_sel() operation.
+ * Drivers providing ramp_delay or settle_time_up in regulation_constraints
+ * can use this as their set_voltage_time_sel() operation.
  */
 int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 				   unsigned int old_selector,
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 4f613ec..056f242 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -90,6 +90,10 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (!ret)
 		constraints->enable_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-settle-time-up-us", &pval);
+	if (!ret)
+		constraints->settle_time_up = pval;
+
 	constraints->soft_start = of_property_read_bool(np,
 					"regulator-soft-start");
 	ret = of_property_read_u32(np, "regulator-active-discharge", &pval);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index ad3e515..8681a82 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -108,6 +108,7 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
+ * @settle_time_up: Time to settle down after voltage increase (unit: uV/us)
  * @active_discharge: Enable/disable active discharge. The enum
  *		      regulator_active_discharge values are used for
  *		      initialisation.
@@ -150,6 +151,7 @@ struct regulation_constraints {
 
 	unsigned int ramp_delay;
 	unsigned int enable_time;
+	unsigned int settle_time_up;
 
 	unsigned int active_discharge;
 
-- 
2.8.0.rc3.226.g39d4020
