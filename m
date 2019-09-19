From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 3/4] thermal: of-thermal: Extend thermal dt driver to support bi-directional monitoring of a thermal trip point.
Date: Wed, 18 Sep 2019 22:18:22 -0400
Message-ID: <1568859503-19725-4-git-send-email-thara.gopinath@linaro.org>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce of_thermal_get_trip_monitor_type to return the direction
of monitoring of a thermal trip point. Also translate the DT information
regarding trip point monitor direction into the thermal framework.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/thermal/of-thermal.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index dc5093b..a5f6fdc 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -377,6 +377,20 @@ static int of_thermal_set_trip_hyst(struct thermal_zone_device *tz, int trip,
 	return 0;
 }
 
+static int of_thermal_get_trip_monitor_type
+				(struct thermal_zone_device *tz, int trip,
+				 enum thermal_trip_monitor_type *type)
+{
+	struct __thermal_zone *data = tz->devdata;
+
+	if (trip >= data->ntrips || trip < 0)
+		return -EDOM;
+
+	*type = data->trips[trip].monitor_type;
+
+	return 0;
+}
+
 static int of_thermal_get_crit_temp(struct thermal_zone_device *tz,
 				    int *temp)
 {
@@ -401,6 +415,7 @@ static struct thermal_zone_device_ops of_thermal_ops = {
 	.set_trip_temp = of_thermal_set_trip_temp,
 	.get_trip_hyst = of_thermal_get_trip_hyst,
 	.set_trip_hyst = of_thermal_set_trip_hyst,
+	.get_trip_monitor_type = of_thermal_get_trip_monitor_type,
 	.get_crit_temp = of_thermal_get_crit_temp,
 
 	.bind = of_thermal_bind,
@@ -809,6 +824,7 @@ static int thermal_of_populate_trip(struct device_node *np,
 {
 	int prop;
 	int ret;
+	bool is_monitor_falling;
 
 	ret = of_property_read_u32(np, "temperature", &prop);
 	if (ret < 0) {
@@ -830,6 +846,12 @@ static int thermal_of_populate_trip(struct device_node *np,
 		return ret;
 	}
 
+	is_monitor_falling = of_property_read_bool(np, "monitor-falling");
+	if (is_monitor_falling)
+		trip->monitor_type = THERMAL_TRIP_MONITOR_FALLING;
+	else
+		trip->monitor_type = THERMAL_TRIP_MONITOR_RISING;
+
 	/* Required for cooling map matching */
 	trip->np = np;
 	of_node_get(np);
-- 
2.1.4
