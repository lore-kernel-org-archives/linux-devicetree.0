From: =?UTF-8?q?St=C3=A9phan=20Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 1/3] lm90: separate register accessors from sysfs
Date: Thu, 21 Jan 2016 20:34:35 +0100
Message-ID: <1453404877-17897-2-git-send-email-stephan@kochen.nl>
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

Add additional support functions `lm90_get_*` and `lm90_set_*` extracte=
d
from the sysfs routines. The sysfs routines are now just stubs wrapping
the new support functions.

This way we have a consistent register access interface, which can be
used from other integrations down the line. To avoid confusion, all
sysfs methods are now prefixed `lm90_sysfs_*`.

To accomplish this, the `lm90_update_device` signature has changed and
is now `lm90_update`, taking data directly. It no longer serves the
dual purpose of update function *and* driver data getter.

`lm90_set_convrate`, `lm90_select_remote_channel` and `lm90_init_client=
`
also had redundant i2c client parameters, which have been removed.

Signed-off-by: St=C3=A9phan Kochen <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
---
 drivers/hwmon/lm90.c | 511 ++++++++++++++++++++++++++++++-------------=
--------
 1 file changed, 300 insertions(+), 211 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c9ff08d..88daf72 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -473,10 +473,10 @@ static int lm90_read16(struct i2c_client *client,=
 u8 regh, u8 regl, u16 *value)
  * various registers have different meanings as a result of selecting =
a
  * non-default remote channel.
  */
-static inline void lm90_select_remote_channel(struct i2c_client *clien=
t,
-					      struct lm90_data *data,
-					      int channel)
+static inline void lm90_select_remote_channel(
+		struct lm90_data *data, int channel)
 {
+	struct i2c_client *client =3D data->client;
 	u8 config;
=20
 	if (data->kind =3D=3D max6696) {
@@ -490,32 +490,10 @@ static inline void lm90_select_remote_channel(str=
uct i2c_client *client,
 }
=20
 /*
- * Set conversion rate.
- * client->update_lock must be held when calling this function (unless=
 we are
- * in detection or initialization steps).
+ * Update all current register values
  */
-static void lm90_set_convrate(struct i2c_client *client, struct lm90_d=
ata *data,
-			      unsigned int interval)
-{
-	int i;
-	unsigned int update_interval;
-
-	/* Shift calculations to avoid rounding errors */
-	interval <<=3D 6;
-
-	/* find the nearest update rate */
-	for (i =3D 0, update_interval =3D LM90_MAX_CONVRATE_MS << 6;
-	     i < data->max_convrate; i++, update_interval >>=3D 1)
-		if (interval >=3D update_interval * 3 / 4)
-			break;
-
-	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
-	data->update_interval =3D DIV_ROUND_CLOSEST(update_interval, 64);
-}
-
-static struct lm90_data *lm90_update_device(struct device *dev)
+static void lm90_update(struct lm90_data *data)
 {
-	struct lm90_data *data =3D dev_get_drvdata(dev);
 	struct i2c_client *client =3D data->client;
 	unsigned long next_update;
=20
@@ -583,7 +561,7 @@ static struct lm90_data *lm90_update_device(struct =
device *dev)
 		data->alarms =3D alarms;	/* save as 16 bit value */
=20
 		if (data->kind =3D=3D max6696) {
-			lm90_select_remote_channel(client, data, 1);
+			lm90_select_remote_channel(data, 1);
 			lm90_read_reg(client, LM90_REG_R_REMOTE_CRIT,
 				      &data->temp8[REMOTE2_CRIT]);
 			lm90_read_reg(client, MAX6659_REG_R_REMOTE_EMERG,
@@ -595,7 +573,7 @@ static struct lm90_data *lm90_update_device(struct =
device *dev)
 				data->temp11[REMOTE2_LOW] =3D h << 8;
 			if (!lm90_read_reg(client, LM90_REG_R_REMOTE_HIGHH, &h))
 				data->temp11[REMOTE2_HIGH] =3D h << 8;
-			lm90_select_remote_channel(client, data, 0);
+			lm90_select_remote_channel(data, 0);
=20
 			if (!lm90_read_reg(client, MAX6696_REG_R_STATUS2,
 					   &alarms))
@@ -624,8 +602,6 @@ static struct lm90_data *lm90_update_device(struct =
device *dev)
 	}
=20
 	mutex_unlock(&data->update_lock);
-
-	return data;
 }
=20
 /*
@@ -756,32 +732,31 @@ static u16 temp_to_u16_adt7461(struct lm90_data *=
data, long val)
 }
=20
 /*
- * Sysfs stuff
+ * Register accessors. Getters trigger an update. Setters have locked =
variants
+ * that require update_lock to be held.
  */
=20
-static ssize_t show_temp8(struct device *dev, struct device_attribute =
*devattr,
-			  char *buf)
+static int lm90_get_temp8(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct lm90_data *data =3D lm90_update_device(dev);
 	int temp;
=20
+	lm90_update(data);
+
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
-		temp =3D temp_from_u8_adt7461(data, data->temp8[attr->index]);
+		temp =3D temp_from_u8_adt7461(data, data->temp8[index]);
 	else if (data->kind =3D=3D max6646)
-		temp =3D temp_from_u8(data->temp8[attr->index]);
+		temp =3D temp_from_u8(data->temp8[index]);
 	else
-		temp =3D temp_from_s8(data->temp8[attr->index]);
+		temp =3D temp_from_s8(data->temp8[index]);
=20
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind =3D=3D lm99 && attr->index =3D=3D 3)
+	if (data->kind =3D=3D lm99 && index =3D=3D 3)
 		temp +=3D 16000;
=20
-	return sprintf(buf, "%d\n", temp);
+	return temp;
 }
=20
-static ssize_t set_temp8(struct device *dev, struct device_attribute *=
devattr,
-			 const char *buf, size_t count)
+static void lm90_set_temp8_locked(struct lm90_data *data, int index, l=
ong val)
 {
 	static const u8 reg[TEMP8_REG_NUM] =3D {
 		LM90_REG_W_LOCAL_LOW,
@@ -794,90 +769,73 @@ static ssize_t set_temp8(struct device *dev, stru=
ct device_attribute *devattr,
 		MAX6659_REG_W_REMOTE_EMERG,
 	};
=20
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct lm90_data *data =3D dev_get_drvdata(dev);
-	struct i2c_client *client =3D data->client;
-	int nr =3D attr->index;
-	long val;
-	int err;
-
-	err =3D kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind =3D=3D lm99 && attr->index =3D=3D 3)
+	if (data->kind =3D=3D lm99 && index =3D=3D 3)
 		val -=3D 16000;
=20
-	mutex_lock(&data->update_lock);
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
-		data->temp8[nr] =3D temp_to_u8_adt7461(data, val);
+		data->temp8[index] =3D temp_to_u8_adt7461(data, val);
 	else if (data->kind =3D=3D max6646)
-		data->temp8[nr] =3D temp_to_u8(val);
+		data->temp8[index] =3D temp_to_u8(val);
 	else
-		data->temp8[nr] =3D temp_to_s8(val);
+		data->temp8[index] =3D temp_to_s8(val);
=20
-	lm90_select_remote_channel(client, data, nr >=3D 6);
-	i2c_smbus_write_byte_data(client, reg[nr], data->temp8[nr]);
-	lm90_select_remote_channel(client, data, 0);
+	lm90_select_remote_channel(data, index >=3D 6);
+	i2c_smbus_write_byte_data(data->client, reg[index], data->temp8[index=
]);
+	lm90_select_remote_channel(data, 0);
+}
=20
+static void lm90_set_temp8(struct lm90_data *data, int index, long val=
)
+{
+	mutex_lock(&data->update_lock);
+	lm90_set_temp8_locked(data, index, val);
 	mutex_unlock(&data->update_lock);
-	return count;
 }
=20
-static ssize_t show_temp11(struct device *dev, struct device_attribute=
 *devattr,
-			   char *buf)
+static int lm90_get_temp11(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute_2 *attr =3D to_sensor_dev_attr_2(devat=
tr);
-	struct lm90_data *data =3D lm90_update_device(dev);
 	int temp;
=20
+	lm90_update(data);
+
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
-		temp =3D temp_from_u16_adt7461(data, data->temp11[attr->index]);
+		temp =3D temp_from_u16_adt7461(data, data->temp11[index]);
 	else if (data->kind =3D=3D max6646)
-		temp =3D temp_from_u16(data->temp11[attr->index]);
+		temp =3D temp_from_u16(data->temp11[index]);
 	else
-		temp =3D temp_from_s16(data->temp11[attr->index]);
+		temp =3D temp_from_s16(data->temp11[index]);
=20
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind =3D=3D lm99 &&  attr->index <=3D 2)
+	if (data->kind =3D=3D lm99 && index <=3D 2)
 		temp +=3D 16000;
=20
-	return sprintf(buf, "%d\n", temp);
+	return temp;
 }
=20
-static ssize_t set_temp11(struct device *dev, struct device_attribute =
*devattr,
-			  const char *buf, size_t count)
+static void lm90_set_temp11_locked(struct lm90_data *data, int index, =
long val)
 {
-	struct {
-		u8 high;
-		u8 low;
-		int channel;
-	} reg[5] =3D {
-		{ LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL, 0 },
-		{ LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL, 0 },
-		{ LM90_REG_W_REMOTE_OFFSH, LM90_REG_W_REMOTE_OFFSL, 0 },
-		{ LM90_REG_W_REMOTE_LOWH, LM90_REG_W_REMOTE_LOWL, 1 },
-		{ LM90_REG_W_REMOTE_HIGHH, LM90_REG_W_REMOTE_HIGHL, 1 }
-	};
-
-	struct sensor_device_attribute_2 *attr =3D to_sensor_dev_attr_2(devat=
tr);
-	struct lm90_data *data =3D dev_get_drvdata(dev);
 	struct i2c_client *client =3D data->client;
-	int nr =3D attr->nr;
-	int index =3D attr->index;
-	long val;
-	int err;
+	u8 high, low, channel;
=20
-	err =3D kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
+#define SELECT_REGS(_reg, _channel) { \
+	high =3D LM90_REG_W_##_reg##H; \
+	low =3D LM90_REG_W_##_reg##L; \
+	channel =3D _channel; \
+}
+	switch (index) {
+	case REMOTE_LOW:    SELECT_REGS(REMOTE_LOW,  0); break;
+	case REMOTE_HIGH:   SELECT_REGS(REMOTE_HIGH, 0); break;
+	case REMOTE_OFFSET: SELECT_REGS(REMOTE_OFFS, 0); break;
+	case REMOTE2_LOW:   SELECT_REGS(REMOTE_LOW,  1); break;
+	case REMOTE2_HIGH:  SELECT_REGS(REMOTE_HIGH, 1); break;
+	default: return;
+	}
+#undef SELECT_REGS
=20
 	/* +16 degrees offset for temp2 for the LM99 */
 	if (data->kind =3D=3D lm99 && index <=3D 2)
 		val -=3D 16000;
=20
-	mutex_lock(&data->update_lock);
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
 		data->temp11[index] =3D temp_to_u16_adt7461(data, val);
 	else if (data->kind =3D=3D max6646)
@@ -887,54 +845,46 @@ static ssize_t set_temp11(struct device *dev, str=
uct device_attribute *devattr,
 	else
 		data->temp11[index] =3D temp_to_s8(val) << 8;
=20
-	lm90_select_remote_channel(client, data, reg[nr].channel);
-	i2c_smbus_write_byte_data(client, reg[nr].high,
-				  data->temp11[index] >> 8);
+	lm90_select_remote_channel(data, channel);
+	i2c_smbus_write_byte_data(client, high,
+			data->temp11[index] >> 8);
 	if (data->flags & LM90_HAVE_REM_LIMIT_EXT)
-		i2c_smbus_write_byte_data(client, reg[nr].low,
-					  data->temp11[index] & 0xff);
-	lm90_select_remote_channel(client, data, 0);
+		i2c_smbus_write_byte_data(client, low,
+				data->temp11[index] & 0xff);
+	lm90_select_remote_channel(data, 0);
+}
=20
+static void lm90_set_temp11(struct lm90_data *data, int index, long va=
l)
+{
+	mutex_lock(&data->update_lock);
+	lm90_set_temp11_locked(data, index, val);
 	mutex_unlock(&data->update_lock);
-	return count;
 }
=20
-static ssize_t show_temphyst(struct device *dev,
-			     struct device_attribute *devattr,
-			     char *buf)
+static ssize_t lm90_get_temphyst(struct lm90_data *data, int index)
 {
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct lm90_data *data =3D lm90_update_device(dev);
 	int temp;
=20
+	lm90_update(data);
+
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
-		temp =3D temp_from_u8_adt7461(data, data->temp8[attr->index]);
+		temp =3D temp_from_u8_adt7461(data, data->temp8[index]);
 	else if (data->kind =3D=3D max6646)
-		temp =3D temp_from_u8(data->temp8[attr->index]);
+		temp =3D temp_from_u8(data->temp8[index]);
 	else
-		temp =3D temp_from_s8(data->temp8[attr->index]);
+		temp =3D temp_from_s8(data->temp8[index]);
=20
 	/* +16 degrees offset for temp2 for the LM99 */
-	if (data->kind =3D=3D lm99 && attr->index =3D=3D 3)
+	if (data->kind =3D=3D lm99 && index =3D=3D 3)
 		temp +=3D 16000;
=20
-	return sprintf(buf, "%d\n", temp - temp_from_s8(data->temp_hyst));
+	return temp - temp_from_s8(data->temp_hyst);
 }
=20
-static ssize_t set_temphyst(struct device *dev, struct device_attribut=
e *dummy,
-			    const char *buf, size_t count)
+static void lm90_set_temphyst_locked(struct lm90_data *data, long val)
 {
-	struct lm90_data *data =3D dev_get_drvdata(dev);
-	struct i2c_client *client =3D data->client;
-	long val;
-	int err;
 	int temp;
=20
-	err =3D kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&data->update_lock);
 	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451)
 		temp =3D temp_from_u8_adt7461(data, data->temp8[LOCAL_CRIT]);
 	else if (data->kind =3D=3D max6646)
@@ -943,43 +893,167 @@ static ssize_t set_temphyst(struct device *dev, =
struct device_attribute *dummy,
 		temp =3D temp_from_s8(data->temp8[LOCAL_CRIT]);
=20
 	data->temp_hyst =3D hyst_to_reg(temp - val);
-	i2c_smbus_write_byte_data(client, LM90_REG_W_TCRIT_HYST,
-				  data->temp_hyst);
+	i2c_smbus_write_byte_data(data->client, LM90_REG_W_TCRIT_HYST,
+			data->temp_hyst);
+}
+
+static void lm90_set_temphyst(struct lm90_data *data, long val)
+{
+	mutex_lock(&data->update_lock);
+	lm90_set_temphyst_locked(data, val);
+	mutex_unlock(&data->update_lock);
+}
+
+static void lm90_set_convrate_locked(struct lm90_data *data, unsigned =
int val)
+{
+	int i;
+	unsigned int update_interval;
+
+	/* Shift calculations to avoid rounding errors */
+	val <<=3D 6;
+
+	/* find the nearest update rate */
+	for (i =3D 0, update_interval =3D LM90_MAX_CONVRATE_MS << 6;
+	     i < data->max_convrate; i++, update_interval >>=3D 1)
+		if (val >=3D update_interval * 3 / 4)
+			break;
+
+	i2c_smbus_write_byte_data(data->client, LM90_REG_W_CONVRATE, i);
+	data->update_interval =3D DIV_ROUND_CLOSEST(update_interval, 64);
+}
+
+static void lm90_set_convrate(struct lm90_data *data, unsigned int val=
)
+{
+	mutex_lock(&data->update_lock);
+	lm90_set_convrate_locked(data, val);
 	mutex_unlock(&data->update_lock);
+}
+
+/*
+ * Sysfs stuff
+ */
+
+static ssize_t lm90_sysfs_show_temp8(
+		struct device *dev, struct device_attribute *devattr,
+		char *buf)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", lm90_get_temp8(data, attr->index));
+}
+
+static ssize_t lm90_sysfs_set_temp8(
+		struct device *dev, struct device_attribute *devattr,
+		const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err =3D kstrtol(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	lm90_set_temp8(data, attr->index, val);
+
 	return count;
 }
=20
-static ssize_t show_alarms(struct device *dev, struct device_attribute=
 *dummy,
-			   char *buf)
+static ssize_t lm90_sysfs_show_temp11(
+		struct device *dev, struct device_attribute *devattr,
+		char *buf)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", lm90_get_temp11(data, attr->index));
+}
+
+static ssize_t lm90_sysfs_set_temp11(
+		struct device *dev, struct device_attribute *devattr,
+		const char *buf, size_t count)
 {
-	struct lm90_data *data =3D lm90_update_device(dev);
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err =3D kstrtol(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	lm90_set_temp11(data, attr->index, val);
+
+	return count;
+}
+
+static ssize_t lm90_sysfs_show_temphyst(
+		struct device *dev, struct device_attribute *devattr,
+		char *buf)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", lm90_get_temphyst(data, attr->index));
+}
+
+static ssize_t lm90_sysfs_set_temphyst(
+		struct device *dev, struct device_attribute *dummy,
+		const char *buf, size_t count)
+{
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+	long val;
+	int err;
+
+	err =3D kstrtol(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	lm90_set_temphyst(data, val);
+
+	return count;
+}
+
+static ssize_t lm90_sysfs_show_alarms(
+		struct device *dev, struct device_attribute *dummy,
+		char *buf)
+{
+	struct lm90_data *data =3D dev_get_drvdata(dev);
+
+	lm90_update(data);
+
 	return sprintf(buf, "%d\n", data->alarms);
 }
=20
-static ssize_t show_alarm(struct device *dev, struct device_attribute
-			  *devattr, char *buf)
+static ssize_t lm90_sysfs_show_alarm(
+		struct device *dev, struct device_attribute *devattr,
+		char *buf)
 {
 	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct lm90_data *data =3D lm90_update_device(dev);
+	struct lm90_data *data =3D dev_get_drvdata(dev);
 	int bitnr =3D attr->index;
=20
+	lm90_update(data);
+
 	return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
 }
=20
-static ssize_t show_update_interval(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static ssize_t lm90_sysfs_show_update_interval(
+		struct device *dev, struct device_attribute *attr,
+		char *buf)
 {
 	struct lm90_data *data =3D dev_get_drvdata(dev);
=20
 	return sprintf(buf, "%u\n", data->update_interval);
 }
=20
-static ssize_t set_update_interval(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t lm90_sysfs_set_update_interval(
+		struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count)
 {
 	struct lm90_data *data =3D dev_get_drvdata(dev);
-	struct i2c_client *client =3D data->client;
 	unsigned long val;
 	int err;
=20
@@ -987,49 +1061,55 @@ static ssize_t set_update_interval(struct device=
 *dev,
 	if (err)
 		return err;
=20
-	mutex_lock(&data->update_lock);
-	lm90_set_convrate(client, data, clamp_val(val, 0, 100000));
-	mutex_unlock(&data->update_lock);
+	lm90_set_convrate(data, clamp_val(val, 0, 100000));
=20
 	return count;
 }
=20
-static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp11, NULL,
-	0, LOCAL_TEMP);
-static SENSOR_DEVICE_ATTR_2(temp2_input, S_IRUGO, show_temp11, NULL,
-	0, REMOTE_TEMP);
-static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_LOW);
-static SENSOR_DEVICE_ATTR_2(temp2_min, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 0, REMOTE_LOW);
-static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_HIGH);
-static SENSOR_DEVICE_ATTR_2(temp2_max, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 1, REMOTE_HIGH);
-static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, LOCAL_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE_CRIT);
-static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_tem=
physt,
-	set_temphyst, LOCAL_CRIT);
-static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO, show_temphyst, NUL=
L,
-	REMOTE_CRIT);
-static SENSOR_DEVICE_ATTR_2(temp2_offset, S_IWUSR | S_IRUGO, show_temp=
11,
-	set_temp11, 2, REMOTE_OFFSET);
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
+	lm90_sysfs_show_temp11, NULL, LOCAL_TEMP);
+static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO,
+	lm90_sysfs_show_temp11, NULL, REMOTE_TEMP);
+static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, LOCAL_LOW);
+static SENSOR_DEVICE_ATTR(temp2_min, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp11, lm90_sysfs_set_temp11, REMOTE_LOW);
+static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, LOCAL_HIGH);
+static SENSOR_DEVICE_ATTR(temp2_max, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp11, lm90_sysfs_set_temp11, REMOTE_HIGH);
+static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, LOCAL_CRIT);
+static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, REMOTE_CRIT);
+static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temphyst, lm90_sysfs_set_temphyst, LOCAL_CRIT);
+static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IRUGO,
+	lm90_sysfs_show_temphyst, NULL, REMOTE_CRIT);
+static SENSOR_DEVICE_ATTR(temp2_offset, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp11, lm90_sysfs_set_temp11, REMOTE_OFFSET);
=20
 /* Individual alarm files */
-static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_alarm, NULL,=
 0);
-static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL,=
 1);
-static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, =
3);
-static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO, show_alarm, NULL, =
4);
-static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_alarm, NULL, =
5);
-static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_alarm, NULL, =
6);
+static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp2_max_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 6);
 /* Raw alarm file for compatibility */
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR(alarms, S_IRUGO,
+	lm90_sysfs_show_alarms, NULL);
=20
-static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR, show_update_int=
erval,
-		   set_update_interval);
+static DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
+	lm90_sysfs_show_update_interval, lm90_sysfs_set_update_interval);
=20
 static struct attribute *lm90_attributes[] =3D {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -1071,14 +1151,14 @@ static const struct attribute_group lm90_temp2_=
offset_group =3D {
 /*
  * Additional attributes for devices with emergency sensors
  */
-static SENSOR_DEVICE_ATTR(temp1_emergency, S_IWUSR | S_IRUGO, show_tem=
p8,
-	set_temp8, LOCAL_EMERG);
-static SENSOR_DEVICE_ATTR(temp2_emergency, S_IWUSR | S_IRUGO, show_tem=
p8,
-	set_temp8, REMOTE_EMERG);
-static SENSOR_DEVICE_ATTR(temp1_emergency_hyst, S_IRUGO, show_temphyst=
,
-			  NULL, LOCAL_EMERG);
-static SENSOR_DEVICE_ATTR(temp2_emergency_hyst, S_IRUGO, show_temphyst=
,
-			  NULL, REMOTE_EMERG);
+static SENSOR_DEVICE_ATTR(temp1_emergency, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, LOCAL_EMERG);
+static SENSOR_DEVICE_ATTR(temp2_emergency, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, REMOTE_EMERG);
+static SENSOR_DEVICE_ATTR(temp1_emergency_hyst, S_IRUGO,
+	lm90_sysfs_show_temphyst, NULL, LOCAL_EMERG);
+static SENSOR_DEVICE_ATTR(temp2_emergency_hyst, S_IRUGO,
+	lm90_sysfs_show_temphyst, NULL, REMOTE_EMERG);
=20
 static struct attribute *lm90_emergency_attributes[] =3D {
 	&sensor_dev_attr_temp1_emergency.dev_attr.attr,
@@ -1092,8 +1172,10 @@ static const struct attribute_group lm90_emergen=
cy_group =3D {
 	.attrs =3D lm90_emergency_attributes,
 };
=20
-static SENSOR_DEVICE_ATTR(temp1_emergency_alarm, S_IRUGO, show_alarm, =
NULL, 15);
-static SENSOR_DEVICE_ATTR(temp2_emergency_alarm, S_IRUGO, show_alarm, =
NULL, 13);
+static SENSOR_DEVICE_ATTR(temp1_emergency_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 15);
+static SENSOR_DEVICE_ATTR(temp2_emergency_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 13);
=20
 static struct attribute *lm90_emergency_alarm_attributes[] =3D {
 	&sensor_dev_attr_temp1_emergency_alarm.dev_attr.attr,
@@ -1108,26 +1190,31 @@ static const struct attribute_group lm90_emerge=
ncy_alarm_group =3D {
 /*
  * Additional attributes for devices with 3 temperature sensors
  */
-static SENSOR_DEVICE_ATTR_2(temp3_input, S_IRUGO, show_temp11, NULL,
-	0, REMOTE2_TEMP);
-static SENSOR_DEVICE_ATTR_2(temp3_min, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 3, REMOTE2_LOW);
-static SENSOR_DEVICE_ATTR_2(temp3_max, S_IWUSR | S_IRUGO, show_temp11,
-	set_temp11, 4, REMOTE2_HIGH);
-static SENSOR_DEVICE_ATTR(temp3_crit, S_IWUSR | S_IRUGO, show_temp8,
-	set_temp8, REMOTE2_CRIT);
-static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO, show_temphyst, NUL=
L,
-	REMOTE2_CRIT);
-static SENSOR_DEVICE_ATTR(temp3_emergency, S_IWUSR | S_IRUGO, show_tem=
p8,
-	set_temp8, REMOTE2_EMERG);
-static SENSOR_DEVICE_ATTR(temp3_emergency_hyst, S_IRUGO, show_temphyst=
,
-			  NULL, REMOTE2_EMERG);
-
-static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO, show_alarm, NULL,=
 9);
-static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO, show_alarm, NULL, 10);
-static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO, show_alarm, NULL, =
11);
-static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO, show_alarm, NULL, =
12);
-static SENSOR_DEVICE_ATTR(temp3_emergency_alarm, S_IRUGO, show_alarm, =
NULL, 14);
+static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO,
+	lm90_sysfs_show_temp11, NULL, REMOTE2_TEMP);
+static SENSOR_DEVICE_ATTR(temp3_min, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp11, lm90_sysfs_set_temp11, REMOTE2_LOW);
+static SENSOR_DEVICE_ATTR(temp3_max, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp11, lm90_sysfs_set_temp11, REMOTE2_HIGH);
+static SENSOR_DEVICE_ATTR(temp3_crit, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, REMOTE2_CRIT);
+static SENSOR_DEVICE_ATTR(temp3_crit_hyst, S_IRUGO,
+	lm90_sysfs_show_temphyst, NULL, REMOTE2_CRIT);
+static SENSOR_DEVICE_ATTR(temp3_emergency, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_temp8, lm90_sysfs_set_temp8, REMOTE2_EMERG);
+static SENSOR_DEVICE_ATTR(temp3_emergency_hyst, S_IRUGO,
+	lm90_sysfs_show_temphyst, NULL, REMOTE2_EMERG);
+
+static SENSOR_DEVICE_ATTR(temp3_crit_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 9);
+static SENSOR_DEVICE_ATTR(temp3_fault, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 10);
+static SENSOR_DEVICE_ATTR(temp3_min_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 11);
+static SENSOR_DEVICE_ATTR(temp3_max_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 12);
+static SENSOR_DEVICE_ATTR(temp3_emergency_alarm, S_IRUGO,
+	lm90_sysfs_show_alarm, NULL, 14);
=20
 static struct attribute *lm90_temp3_attributes[] =3D {
 	&sensor_dev_attr_temp3_input.dev_attr.attr,
@@ -1151,15 +1238,15 @@ static const struct attribute_group lm90_temp3_=
group =3D {
 };
=20
 /* pec used for ADM1032 only */
-static ssize_t show_pec(struct device *dev, struct device_attribute *d=
ummy,
-			char *buf)
+static ssize_t lm90_sysfs_show_pec(struct device *dev,
+		struct device_attribute *dummy, char *buf)
 {
 	struct i2c_client *client =3D to_i2c_client(dev);
 	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));
 }
=20
-static ssize_t set_pec(struct device *dev, struct device_attribute *du=
mmy,
-		       const char *buf, size_t count)
+static ssize_t lm90_sysfs_set_pec(struct device *dev,
+		struct device_attribute *dummy, const char *buf, size_t count)
 {
 	struct i2c_client *client =3D to_i2c_client(dev);
 	long val;
@@ -1183,7 +1270,8 @@ static ssize_t set_pec(struct device *dev, struct=
 device_attribute *dummy,
 	return count;
 }
=20
-static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO, show_pec, set_pec);
+static DEVICE_ATTR(pec, S_IWUSR | S_IRUGO,
+	lm90_sysfs_show_pec, lm90_sysfs_set_pec);
=20
 /*
  * Real code
@@ -1413,8 +1501,9 @@ static void lm90_restore_conf(struct i2c_client *=
client, struct lm90_data *data)
 				  data->config_orig);
 }
=20
-static void lm90_init_client(struct i2c_client *client, struct lm90_da=
ta *data)
+static void lm90_init_client(struct lm90_data *data)
 {
+	struct i2c_client *client =3D data->client;
 	u8 config, convrate;
=20
 	if (lm90_read_reg(client, LM90_REG_R_CONVRATE, &convrate) < 0) {
@@ -1426,7 +1515,7 @@ static void lm90_init_client(struct i2c_client *c=
lient, struct lm90_data *data)
 	/*
 	 * Start the conversions.
 	 */
-	lm90_set_convrate(client, data, 500);	/* 500ms; 2Hz conversion rate *=
/
+	lm90_set_convrate_locked(data, 500);  /* 500ms / 2Hz  */
 	if (lm90_read_reg(client, LM90_REG_R_CONFIG1, &config) < 0) {
 		dev_warn(&client->dev, "Initialization failed!\n");
 		return;
@@ -1557,7 +1646,7 @@ static int lm90_probe(struct i2c_client *client,
 	data->max_convrate =3D lm90_params[data->kind].max_convrate;
=20
 	/* Initialize the LM90 chip */
-	lm90_init_client(client, data);
+	lm90_init_client(data);
=20
 	/* Register sysfs hooks */
 	data->groups[groups++] =3D &lm90_group;
--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
