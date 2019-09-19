From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 4/4] thermal: step_wise: Extend thermal step-wise governor to monitor falling temperature.
Date: Wed, 18 Sep 2019 22:18:23 -0400
Message-ID: <1568859503-19725-5-git-send-email-thara.gopinath@linaro.org>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>From the step wise governor point of view, the policy decisions
that has to taken on a thermal trip point that is defined to be monitored
for falling temprature is the mirror opposite of the decisions it has
to take on a trip point that is monitored for rising temperature.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/thermal/step_wise.c | 59 +++++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/step_wise.c b/drivers/thermal/step_wise.c
index 6e051cb..aa8e0a0 100644
--- a/drivers/thermal/step_wise.c
+++ b/drivers/thermal/step_wise.c
@@ -35,7 +35,8 @@
  *       deactivate the thermal instance
  */
 static unsigned long get_target_state(struct thermal_instance *instance,
-				enum thermal_trend trend, bool throttle)
+				enum thermal_trend trend, bool throttle,
+				enum thermal_trip_monitor_type type)
 {
 	struct thermal_cooling_device *cdev = instance->cdev;
 	unsigned long cur_state;
@@ -65,11 +66,21 @@ static unsigned long get_target_state(struct thermal_instance *instance,
 
 	switch (trend) {
 	case THERMAL_TREND_RAISING:
-		if (throttle) {
-			next_target = cur_state < instance->upper ?
-				    (cur_state + 1) : instance->upper;
-			if (next_target < instance->lower)
-				next_target = instance->lower;
+		if (type == THERMAL_TRIP_MONITOR_FALLING) {
+			if (cur_state <= instance->lower) {
+				if (!throttle)
+					next_target = THERMAL_NO_TARGET;
+			} else {
+				if (!throttle)
+					next_target = cur_state - 1;
+			}
+		} else {
+			if (throttle) {
+				next_target = cur_state < instance->upper ?
+					    (cur_state + 1) : instance->upper;
+				if (next_target < instance->lower)
+					next_target = instance->lower;
+			}
 		}
 		break;
 	case THERMAL_TREND_RAISE_FULL:
@@ -77,14 +88,23 @@ static unsigned long get_target_state(struct thermal_instance *instance,
 			next_target = instance->upper;
 		break;
 	case THERMAL_TREND_DROPPING:
-		if (cur_state <= instance->lower) {
-			if (!throttle)
-				next_target = THERMAL_NO_TARGET;
+		if (type == THERMAL_TRIP_MONITOR_FALLING) {
+			if (throttle) {
+				next_target = cur_state < instance->upper ?
+					(cur_state + 1) : instance->upper;
+				if (next_target < instance->lower)
+					next_target = instance->lower;
+			}
 		} else {
-			if (!throttle) {
-				next_target = cur_state - 1;
-				if (next_target > instance->upper)
-					next_target = instance->upper;
+			if (cur_state <= instance->lower) {
+				if (!throttle)
+					next_target = THERMAL_NO_TARGET;
+			} else {
+				if (!throttle) {
+					next_target = cur_state - 1;
+					if (next_target > instance->upper)
+						next_target = instance->upper;
+				}
 			}
 		}
 		break;
@@ -117,6 +137,8 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 {
 	int trip_temp;
 	enum thermal_trip_type trip_type;
+	enum thermal_trip_monitor_type monitor_type =
+					THERMAL_TRIP_MONITOR_RISING;
 	enum thermal_trend trend;
 	struct thermal_instance *instance;
 	bool throttle = false;
@@ -130,9 +152,15 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 		tz->ops->get_trip_type(tz, trip, &trip_type);
 	}
 
+	if (tz->ops->get_trip_monitor_type)
+		tz->ops->get_trip_monitor_type(tz, trip, &monitor_type);
+
 	trend = get_tz_trend(tz, trip);
 
-	if (tz->temperature >= trip_temp) {
+	if (((monitor_type == THERMAL_TRIP_MONITOR_RISING) &&
+	      (tz->temperature >= trip_temp)) ||
+	      ((monitor_type == THERMAL_TRIP_MONITOR_FALLING) &&
+	      (tz->temperature <= trip_temp))) {
 		throttle = true;
 		trace_thermal_zone_trip(tz, trip, trip_type);
 	}
@@ -147,7 +175,8 @@ static void thermal_zone_trip_update(struct thermal_zone_device *tz, int trip)
 			continue;
 
 		old_target = instance->target;
-		instance->target = get_target_state(instance, trend, throttle);
+		instance->target = get_target_state(instance, trend, throttle,
+						    monitor_type);
 		dev_dbg(&instance->cdev->device, "old_target=%d, target=%d\n",
 					old_target, (int)instance->target);
 
-- 
2.1.4
