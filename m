From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 2/4] thermal: Thermal core and sysfs changes needed to support bi-directional monitoring of trip points.
Date: Wed, 18 Sep 2019 22:18:21 -0400
Message-ID: <1568859503-19725-3-git-send-email-thara.gopinath@linaro.org>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thermal trip points can be defined to indicate whether a
temperature rise or a temperature fall is to be monitored. This
property can now be defined in the DT bindings for a trip point.
To support this following three changes are introduced to thermal
core and sysfs code.
1. Define a new variable in thermal_trip to capture the monitor
   rising/falling information from trip point DT bindings.
2. Define a new ops in thermal_zone_device_ops that can be populated
   to indicate whether a trip is being monitored for rising or falling
   temperature. If the ops is not populated or if the binding is missing
   in the DT, it is assumed that the trip is being monitored for rising
   temperature. (default behavior today)
3. Introduce sysfs entries for each trip point to read the direction of
   monitoring.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/thermal/thermal_sysfs.c | 60 ++++++++++++++++++++++++++++++++++++++---
 include/linux/thermal.h         | 10 +++++++
 include/uapi/linux/thermal.h    |  2 +-
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
index aa99edb..b4ef6be 100644
--- a/drivers/thermal/thermal_sysfs.c
+++ b/drivers/thermal/thermal_sysfs.c
@@ -216,6 +216,31 @@ trip_point_hyst_show(struct device *dev, struct device_attribute *attr,
 }
 
 static ssize_t
+trip_point_monitor_type_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct thermal_zone_device *tz = to_thermal_zone(dev);
+	enum thermal_trip_monitor_type type;
+	int trip, result;
+
+	if (sscanf(attr->attr.name, "trip_point_%d_monitor_type", &trip) != 1)
+		return -EINVAL;
+
+	if (!tz->ops->get_trip_monitor_type)
+		goto exit;
+
+	result = tz->ops->get_trip_monitor_type(tz, trip, &type);
+	if (result)
+		return result;
+
+	if (type == THERMAL_TRIP_MONITOR_FALLING)
+		return sprintf(buf, "falling\n");
+
+exit:
+		return sprintf(buf, "rising\n");
+}
+
+static ssize_t
 passive_store(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
 {
@@ -520,10 +545,20 @@ static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
 	if (!tz->trip_type_attrs)
 		return -ENOMEM;
 
+	tz->trip_monitor_type_attrs = kcalloc
+					(tz->trips,
+					sizeof(*tz->trip_monitor_type_attrs),
+					GFP_KERNEL);
+	if (!tz->trip_monitor_type_attrs) {
+		kfree(tz->trip_type_attrs);
+		return -ENOMEM;
+	}
+
 	tz->trip_temp_attrs = kcalloc(tz->trips, sizeof(*tz->trip_temp_attrs),
 				      GFP_KERNEL);
 	if (!tz->trip_temp_attrs) {
 		kfree(tz->trip_type_attrs);
+		kfree(tz->trip_monitor_type_attrs);
 		return -ENOMEM;
 	}
 
@@ -533,14 +568,16 @@ static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
 					      GFP_KERNEL);
 		if (!tz->trip_hyst_attrs) {
 			kfree(tz->trip_type_attrs);
+			kfree(tz->trip_monitor_type_attrs);
 			kfree(tz->trip_temp_attrs);
 			return -ENOMEM;
 		}
 	}
 
-	attrs = kcalloc(tz->trips * 3 + 1, sizeof(*attrs), GFP_KERNEL);
+	attrs = kcalloc(tz->trips * 4 + 1, sizeof(*attrs), GFP_KERNEL);
 	if (!attrs) {
 		kfree(tz->trip_type_attrs);
+		kfree(tz->trip_monitor_type_attrs);
 		kfree(tz->trip_temp_attrs);
 		if (tz->ops->get_trip_hyst)
 			kfree(tz->trip_hyst_attrs);
@@ -559,6 +596,20 @@ static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
 		tz->trip_type_attrs[indx].attr.show = trip_point_type_show;
 		attrs[indx] = &tz->trip_type_attrs[indx].attr.attr;
 
+		/* create trip monitor type attribute */
+		snprintf(tz->trip_monitor_type_attrs[indx].name,
+			 THERMAL_NAME_LENGTH, "trip_point_%d_monitor_type",
+			 indx);
+
+		sysfs_attr_init(&tz->trip_monitor_type_attrs[indx].attr.attr);
+		tz->trip_monitor_type_attrs[indx].attr.attr.name =
+				tz->trip_monitor_type_attrs[indx].name;
+		tz->trip_monitor_type_attrs[indx].attr.attr.mode = S_IRUGO;
+		tz->trip_monitor_type_attrs[indx].attr.show =
+				trip_point_monitor_type_show;
+		attrs[indx + tz->trips] =
+				&tz->trip_monitor_type_attrs[indx].attr.attr;
+
 		/* create trip temp attribute */
 		snprintf(tz->trip_temp_attrs[indx].name, THERMAL_NAME_LENGTH,
 			 "trip_point_%d_temp", indx);
@@ -574,7 +625,8 @@ static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
 			tz->trip_temp_attrs[indx].attr.store =
 							trip_point_temp_store;
 		}
-		attrs[indx + tz->trips] = &tz->trip_temp_attrs[indx].attr.attr;
+		attrs[indx + tz->trips * 2] =
+				&tz->trip_temp_attrs[indx].attr.attr;
 
 		/* create Optional trip hyst attribute */
 		if (!tz->ops->get_trip_hyst)
@@ -592,10 +644,10 @@ static int create_trip_attrs(struct thermal_zone_device *tz, int mask)
 			tz->trip_hyst_attrs[indx].attr.store =
 					trip_point_hyst_store;
 		}
-		attrs[indx + tz->trips * 2] =
+		attrs[indx + tz->trips * 3] =
 					&tz->trip_hyst_attrs[indx].attr.attr;
 	}
-	attrs[tz->trips * 3] = NULL;
+	attrs[tz->trips * 4] = NULL;
 
 	tz->trips_attribute_group.attrs = attrs;
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index e45659c..1435176b 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -70,6 +70,11 @@ enum thermal_trip_type {
 	THERMAL_TRIP_CRITICAL,
 };
 
+enum thermal_trip_monitor_type {
+	THERMAL_TRIP_MONITOR_RISING = 0,
+	THERMAL_TRIP_MONITOR_FALLING
+};
+
 enum thermal_trend {
 	THERMAL_TREND_STABLE, /* temperature is stable */
 	THERMAL_TREND_RAISING, /* temperature is raising */
@@ -113,6 +118,8 @@ struct thermal_zone_device_ops {
 			  enum thermal_trend *);
 	int (*notify) (struct thermal_zone_device *, int,
 		       enum thermal_trip_type);
+	int (*get_trip_monitor_type)(struct thermal_zone_device *, int,
+				     enum thermal_trip_monitor_type *);
 };
 
 struct thermal_cooling_device_ops {
@@ -196,6 +203,7 @@ struct thermal_zone_device {
 	struct thermal_attr *trip_temp_attrs;
 	struct thermal_attr *trip_type_attrs;
 	struct thermal_attr *trip_hyst_attrs;
+	struct thermal_attr *trip_monitor_type_attrs;
 	void *devdata;
 	int trips;
 	unsigned long trips_disabled;	/* bitmap for disabled trips */
@@ -364,6 +372,7 @@ struct thermal_zone_of_device_ops {
  * @temperature: temperature value in miliCelsius
  * @hysteresis: relative hysteresis in miliCelsius
  * @type: trip point type
+ * @monitor_type: trip point monitor type.
  */
 
 struct thermal_trip {
@@ -371,6 +380,7 @@ struct thermal_trip {
 	int temperature;
 	int hysteresis;
 	enum thermal_trip_type type;
+	enum thermal_trip_monitor_type monitor_type;
 };
 
 /* Function declarations */
diff --git a/include/uapi/linux/thermal.h b/include/uapi/linux/thermal.h
index 9621837..c01492c 100644
--- a/include/uapi/linux/thermal.h
+++ b/include/uapi/linux/thermal.h
@@ -2,7 +2,7 @@
 #ifndef _UAPI_LINUX_THERMAL_H
 #define _UAPI_LINUX_THERMAL_H
 
-#define THERMAL_NAME_LENGTH	20
+#define THERMAL_NAME_LENGTH	30
 
 /* Adding event notification support elements */
 #define THERMAL_GENL_FAMILY_NAME                "thermal_event"
-- 
2.1.4
