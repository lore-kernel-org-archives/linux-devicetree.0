From: =?UTF-8?q?St=C3=A9phan=20Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 3/3] lm90: register with thermal zones
Date: Thu, 21 Jan 2016 20:34:37 +0100
Message-ID: <1453404877-17897-4-git-send-email-stephan@kochen.nl>
References: <1453404877-17897-1-git-send-email-stephan@kochen.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453404877-17897-1-git-send-email-stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
Cc: =?UTF-8?q?St=C3=A9phan=20Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Any lm90-driven node in the device tree can now be referenced in therma=
l
zones. One thermal zone device is registered for each sensor present.

Signed-off-by: St=C3=A9phan Kochen <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/lm90.txt |  8 ++++
 drivers/hwmon/lm90.c                             | 54 ++++++++++++++++=
++++++++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documen=
tation/devicetree/bindings/hwmon/lm90.txt
index 045e94b..da9aae7 100644
--- a/Documentation/devicetree/bindings/hwmon/lm90.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm90.txt
@@ -28,6 +28,13 @@ Required node properties:
=20
 - vcc-supply: vcc regulator for the supply voltage.
=20
+- #thermal-sensor-cells: Should be 1. See ../../thermal/thermal.txt fo=
r a
+                         description of this property. Use the followi=
ng
+                         values to refer to a specific sensor:
+                         0: chip internal sensor
+                         1: external sensor
+                         2: second external sensor, if present
+
 Optional properties:
 - interrupts: Contains a single interrupt specifier which describes th=
e
               LM90 "-ALERT" pin output.
@@ -81,4 +88,5 @@ temp-sensor {
 	remote-high =3D <80000>;
 	remote-critical =3D <90000>;
 	remote-offset =3D <(-62125)>;
+	#thermal-sensor-cells =3D <1>;
 }
diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 8ae8791..4577916 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -95,6 +95,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/sysfs.h>
+#include <linux/thermal.h>
 #include <linux/interrupt.h>
 #include <linux/regulator/consumer.h>
=20
@@ -207,6 +208,8 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, ma=
x6659, adt7461, max6680,
 #define MAX6696_STATUS2_R2OT2	(1 << 6) /* remote2 emergency limit trip=
ped */
 #define MAX6696_STATUS2_LOT2	(1 << 7) /* local emergency limit tripped=
 */
=20
+#define LM90_NUM_SENSORS(d) (((d)->flags & LM90_HAVE_TEMP3) ? 3 : 2)
+
 /*
  * Driver data (common to all clients)
  */
@@ -365,6 +368,13 @@ enum lm90_temp11_reg_index {
  * Client data (each client gets its own)
  */
=20
+struct lm90_sensor {
+	struct lm90_data *data;
+	int index;
+
+	struct thermal_zone_device *tz;
+};
+
 struct lm90_data {
 	struct i2c_client *client;
 	struct device *hwmon_dev;
@@ -390,6 +400,10 @@ struct lm90_data {
 	s16 temp11[TEMP11_REG_NUM];
 	u8 temp_hyst;
 	u16 alarms; /* bitvector (upper 8 bits for max6695/96) */
+
+#ifdef CONFIG_THERMAL_OF
+	struct lm90_sensor sensors[3];
+#endif
 };
=20
 /*
@@ -1275,6 +1289,23 @@ static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO,
 	lm90_sysfs_show_pec, lm90_sysfs_set_pec);
=20
 /*
+ * Thermal zone code
+ */
+
+#ifdef CONFIG_THERMAL_OF
+static int lm90_of_get_temp(void *data, int *out_temp)
+{
+	struct lm90_sensor *sensor =3D data;
+	*out_temp =3D lm90_get_temp11(sensor->data, sensor->index);
+	return 0;
+}
+
+static const struct thermal_zone_of_device_ops lm90_of_thermal_ops =3D=
 {
+	.get_temp =3D lm90_of_get_temp,
+};
+#endif
+
+/*
  * Real code
  */
=20
@@ -1653,6 +1684,7 @@ static int lm90_probe(struct i2c_client *client,
 	struct regulator *regulator;
 	int groups =3D 0;
 	int err;
+	unsigned int i;
=20
 	regulator =3D devm_regulator_get(dev, "vcc");
 	if (IS_ERR(regulator))
@@ -1737,6 +1769,20 @@ static int lm90_probe(struct i2c_client *client,
 		}
 	}
=20
+#ifdef CONFIG_THERMAL_OF
+	data->sensors[0].index =3D LOCAL_TEMP;
+	data->sensors[1].index =3D REMOTE_TEMP;
+	data->sensors[2].index =3D REMOTE2_TEMP;
+	for (i =3D 0; i < LM90_NUM_SENSORS(data); i++) {
+		data->sensors[i].data =3D data;
+		data->sensors[i].tz =3D thermal_zone_of_sensor_register(
+			dev, i, &data->sensors[i],
+			&lm90_of_thermal_ops);
+		if (IS_ERR(data->sensors[i].tz))
+			data->sensors[i].tz =3D NULL;
+	}
+#endif
+
 	return 0;
=20
 exit_unregister:
@@ -1753,6 +1799,14 @@ exit_restore:
 static int lm90_remove(struct i2c_client *client)
 {
 	struct lm90_data *data =3D i2c_get_clientdata(client);
+#ifdef CONFIG_THERMAL_OF
+	unsigned int i;
+
+	for (i =3D 0; i < LM90_NUM_SENSORS(data); i++) {
+		thermal_zone_of_sensor_unregister(&client->dev,
+						  data->sensors[i].tz);
+	}
+#endif
=20
 	hwmon_device_unregister(data->hwmon_dev);
 	device_remove_file(&client->dev, &dev_attr_pec);
--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
