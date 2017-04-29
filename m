From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] regulator: Allow for asymmetric settling times
Date: Fri, 28 Apr 2017 17:06:43 -0700
Message-ID: <20170429000643.56407-1-mka@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some regulators have different settling times for voltage increases and
decreases. To avoid a time penalty on the faster transition extend the
settling time property to allow for different settings for upward and
downward transitions.

Signed-off-by: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Dependencies (from broonie/regulator topic/settle):
 - regulator: DT: Add settling time property for non-linear voltage change
 - regulator: Add settling time for non-linear voltage transition

Sorry for not bringing this up during the review of the 'settling time'
patch, I just came across it when looking to revive a similar change I
sent out some time ago (https://patchwork.kernel.org/patch/9332051/).

 Documentation/devicetree/bindings/regulator/regulator.txt | 11 ++++++++---
 drivers/regulator/core.c                                  |  8 ++++++--
 drivers/regulator/of_regulator.c                          |  9 +++++++--
 include/linux/regulator/machine.h                         |  9 ++++++---
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index d18edb075e1c..f21fead1c802 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -21,9 +21,14 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
-- regulator-settling-time-us: Settling time, in microseconds, for voltage
-  change if regulator have the constant time for any level voltage change.
-  This is useful when regulator have exponential voltage change.
+- regulator-settling-time-up-us: Settling time, in microseconds, for voltage
+  increase if the regulator needs a constant time to settle after voltage
+  increases of any level. This is useful for regulators with exponential
+  voltage changes.
+- regulator-settling-time-down-us: Settling time, in microseconds, for voltage
+  decrease if the regulator needs a constant time to settle after voltage
+  decreases of any level. This is useful for regulators with exponential
+  voltage changes.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 811096b23143..4df86c0da123 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2773,8 +2773,12 @@ static int _regulator_set_voltage_time(struct regulator_dev *rdev,
 		ramp_delay = rdev->constraints->ramp_delay;
 	else if (rdev->desc->ramp_delay)
 		ramp_delay = rdev->desc->ramp_delay;
-	else if (rdev->constraints->settling_time)
-		return rdev->constraints->settling_time;
+	else if (rdev->constraints->settling_time_up &&
+		 (new_uV > old_uV))
+		return rdev->constraints->settling_time_up;
+	else if (rdev->constraints->settling_time_down &&
+		 (new_uV < old_uV))
+		return rdev->constraints->settling_time_down;
 
 	if (ramp_delay == 0) {
 		rdev_dbg(rdev, "ramp_delay not set\n");
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 09d677d5d3f0..4d36c0e4c9b4 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -86,9 +86,14 @@ static void of_get_regulation_constraints(struct device_node *np,
 			constraints->ramp_disable = true;
 	}
 
-	ret = of_property_read_u32(np, "regulator-settling-time-us", &pval);
+	ret = of_property_read_u32(np, "regulator-settling-time-up-us", &pval);
 	if (!ret)
-		constraints->settling_time = pval;
+		constraints->settling_time_up = pval;
+
+	ret = of_property_read_u32(np, "regulator-settling-time-down-us",
+				   &pval);
+	if (!ret)
+		constraints->settling_time_down = pval;
 
 	ret = of_property_read_u32(np, "regulator-enable-ramp-delay", &pval);
 	if (!ret)
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 117699d1f7df..a92829e86b5d 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -108,8 +108,10 @@ struct regulator_state {
  * @initial_state: Suspend state to set by default.
  * @initial_mode: Mode to set at startup.
  * @ramp_delay: Time to settle down after voltage change (unit: uV/us)
- * @settling_time: Time to settle down after voltage change when voltage
- *		   change is non-linear (unit: microseconds).
+ * @settling_time_up: Time to settle down after voltage increase when voltage
+ *		      change is non-linear (unit: microseconds).
+ * @settling_time_down : Time to settle down after voltage decrease when
+ *			 voltage change is non-linear (unit: microseconds).
  * @active_discharge: Enable/disable active discharge. The enum
  *		      regulator_active_discharge values are used for
  *		      initialisation.
@@ -151,7 +153,8 @@ struct regulation_constraints {
 	unsigned int initial_mode;
 
 	unsigned int ramp_delay;
-	unsigned int settling_time;
+	unsigned int settling_time_up;
+	unsigned int settling_time_down;
 	unsigned int enable_time;
 
 	unsigned int active_discharge;
-- 
2.13.0.rc0.306.g87b477812d-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
