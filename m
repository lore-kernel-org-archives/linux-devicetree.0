From: Heiko Schocher <hs@denx.de>
Subject: [PATCH v2] hwmon: Driver for TI TMP103 temperature sensor
Date: Fri, 13 Jun 2014 09:10:21 +0200
Message-ID: <1402643421-9102-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: lm-sensors@lm-sensors.org
Cc: Heiko Schocher <hs@denx.de>, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Driver for the TI TMP103.

The TI TMP103 is similar to the TMP102.  It differs from the TMP102
by having only 8 bit registers.

Signed-off-by: Heiko Schocher <hs@denx.de>

---

Cc: Jean Delvare <khali@linux-fr.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org

- change for v2:
  - add comments from GuenterRoeck:
    - remove Cc from commit subject
    - add devicetree mailinglist
    - move Documentation to Documentation/hwmon/tmp103
    - remove devicetree bindings from Documentation
    - add compatible string to
      "Documentation/devicetree/bindings/i2c/trivial-devices.txt"
    - remove CamelCase
    - fix Codingstyle issues
    - use ATTRIBUTE_GROUPS and devm_hwmon_device_register_with_groups()
    - remove unsused define TMP103_CONFIG_RD_ONLY
    - restore config register when exit()
    - use regmap

 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 Documentation/hwmon/tmp103                         |  28 ++
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tmp103.c                             | 304 +++++++++++++=
++++++++
 5 files changed, 344 insertions(+)
 create mode 100644 Documentation/hwmon/tmp103
 create mode 100644 drivers/hwmon/tmp103.c

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index bef86e5..fc944e0 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -83,5 +83,6 @@ stm,m41t80		M41T80 - SERIAL ACCESS RTC WITH ALARMS
 taos,tsl2550		Ambient Light Sensor with SMBUS/Two Wire Serial Interfac=
e
 ti,tsc2003		I2C Touch-Screen Controller
 ti,tmp102		Low Power Digital Temperature Sensor with SMBUS/Two Wire Se=
rial Interface
+ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Se=
rial Interface
 ti,tmp275		Digital Temperature Sensor
 winbond,wpct301		i2c trusted platform module (TPM)
diff --git a/Documentation/hwmon/tmp103 b/Documentation/hwmon/tmp103
new file mode 100644
index 0000000..559fea5
--- /dev/null
+++ b/Documentation/hwmon/tmp103
@@ -0,0 +1,28 @@
+Kernel driver tmp103
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+  * Texas Instruments TMP103
+    Prefix: 'tmp103'
+    Addresses scanned: none
+    Product info and datasheet: http://www.ti.com/product/tmp103
+
+Author:
+	Heiko Schocher <hs@denx.de>
+
+Description
+-----------
+
+The TMP103 is a digital output temperature sensor in a four-ball
+wafer chip-scale package (WCSP). The TMP103 is capable of reading
+temperatures to a resolution of 1=C2=B0C. The TMP103 is specified for
+operation over a temperature range of =E2=80=9340=C2=B0C to +125=C2=B0=
C.
+
+Resolution: 8 Bits
+Accuracy: =C2=B11=C2=B0C Typ (=E2=80=9310=C2=B0C to +100=C2=B0C)
+
+The driver provides the common sysfs-interface for temperatures (see
+Documentation/hwmon/sysfs-interface under Temperatures).
+
+please refer how to instantiate this driver:
+Documentation/i2c/instantiating-devices
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 0034316..0f44dbb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1381,6 +1381,16 @@ config SENSORS_TMP102
 	  This driver can also be built as a module.  If so, the module
 	  will be called tmp102.
=20
+config SENSORS_TMP103
+	tristate "Texas Instruments TMP103"
+	depends on I2C
+	help
+	  If you say yes here you get support for Texas Instruments TMP103
+	  sensor chips.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called tmp103.
+
 config SENSORS_TMP401
 	tristate "Texas Instruments TMP401 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 11798ad..8e2f6a2 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -134,6 +134,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+=3D smsc47m192.o
 obj-$(CONFIG_SENSORS_AMC6821)	+=3D amc6821.o
 obj-$(CONFIG_SENSORS_THMC50)	+=3D thmc50.o
 obj-$(CONFIG_SENSORS_TMP102)	+=3D tmp102.o
+obj-$(CONFIG_SENSORS_TMP103)	+=3D tmp103.o
 obj-$(CONFIG_SENSORS_TMP401)	+=3D tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+=3D tmp421.o
 obj-$(CONFIG_SENSORS_TWL4030_MADC)+=3D twl4030-madc-hwmon.o
diff --git a/drivers/hwmon/tmp103.c b/drivers/hwmon/tmp103.c
new file mode 100644
index 0000000..01119a6
--- /dev/null
+++ b/drivers/hwmon/tmp103.c
@@ -0,0 +1,304 @@
+/*
+ * Texas Instruments TMP103 SMBus temperature sensor driver
+ * Copyright (C) 2014 Heiko Schocher <hs@denx.de>
+ *
+ * Based on:
+ * Texas Instruments TMP102 SMBus temperature sensor driver
+ *
+ * Copyright (C) 2010 Steven King <sfking@fdwdc.com>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/regmap.h>
+
+#define	DRIVER_NAME "tmp103"
+
+#define	TMP103_TEMP_REG			0x00
+#define	TMP103_CONF_REG			0x01
+#define	TMP103_TLOW_REG			0x02
+#define	TMP103_THIGH_REG		0x03
+
+#define		TMP103_CONF_M0		0x01
+#define		TMP103_CONF_M1		0x02
+#define		TMP103_CONF_LC		0x04
+#define		TMP103_CONF_FL		0x08
+#define		TMP103_CONF_FH		0x10
+#define		TMP103_CONF_CR0		0x20
+#define		TMP103_CONF_CR1		0x40
+#define		TMP103_CONF_ID		0x80
+#define		TMP103_CONF_SD		(TMP103_CONF_M0 | TMP103_CONF_M1)
+
+struct tmp103 {
+	struct i2c_client *client;
+	struct device *hwmon_dev;
+	struct regmap *regmap;
+	struct mutex lock;
+	unsigned int config_orig;
+	unsigned long last_update;
+	int temp[3];
+};
+
+static inline int tmp103_reg_to_mc(s8 val)
+{
+	return val * 1000;
+}
+
+static inline u8 tmp103_mc_to_reg(int val)
+{
+	return DIV_ROUND_CLOSEST(val, 1000);
+}
+
+static const u8 tmp103_reg[] =3D {
+	TMP103_TEMP_REG,
+	TMP103_TLOW_REG,
+	TMP103_THIGH_REG,
+};
+
+#define TMP103_INVALID	0xffff
+
+static ssize_t tmp103_show_temp(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sda =3D to_sensor_dev_attr(attr);
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct tmp103 *tmp103 =3D i2c_get_clientdata(client);
+	unsigned int status;
+	int ret;
+
+	mutex_lock(&tmp103->lock);
+	if (time_after(jiffies, tmp103->last_update + HZ / 3)) {
+		int i;
+
+		for (i =3D 0; i < ARRAY_SIZE(tmp103->temp); ++i) {
+			ret =3D regmap_read(tmp103->regmap, tmp103_reg[i],
+					  &status);
+			if (ret < 0)
+				tmp103->temp[i] =3D TMP103_INVALID;
+			else
+				tmp103->temp[i] =3D tmp103_reg_to_mc(status);
+		}
+		tmp103->last_update =3D jiffies;
+	}
+	mutex_unlock(&tmp103->lock);
+
+	if (tmp103->temp[sda->index] !=3D TMP103_INVALID)
+		return sprintf(buf, "%d\n", tmp103->temp[sda->index]);
+
+	return sprintf(buf, "invalid\n");
+}
+
+static ssize_t tmp103_set_temp(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct sensor_device_attribute *sda =3D to_sensor_dev_attr(attr);
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct tmp103 *tmp103 =3D i2c_get_clientdata(client);
+	long val;
+	int ret;
+
+	if (kstrtol(buf, 10, &val) < 0)
+		return -EINVAL;
+
+	val =3D clamp_val(val, -55000, 127000);
+	mutex_lock(&tmp103->lock);
+	tmp103->temp[sda->index] =3D val;
+	ret =3D regmap_write(tmp103->regmap, tmp103_reg[sda->index],
+			   tmp103_mc_to_reg(val));
+	mutex_unlock(&tmp103->lock);
+	return ret ? : count;
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, tmp103_show_temp, NULL=
 , 0);
+
+static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, tmp103_show_te=
mp,
+			  tmp103_set_temp, 1);
+
+static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, tmp103_show_te=
mp,
+			  tmp103_set_temp, 2);
+
+static struct attribute *tmp103_attrs[] =3D {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(tmp103);
+
+static struct regmap_config tmp103_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.max_register =3D TMP103_THIGH_REG,
+};
+
+#define TMP103_CONFIG		(TMP103_CONF_CR1 | TMP103_CONF_M1)
+
+static int tmp103_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct device *hwmon_dev;
+	struct tmp103 *tmp103;
+	int ret;
+	unsigned int status;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
+		dev_err(&client->dev,
+			"adapter doesn't support SMBus byte transactions\n");
+		return -ENODEV;
+	}
+
+	tmp103 =3D devm_kzalloc(&client->dev, sizeof(*tmp103), GFP_KERNEL);
+	if (!tmp103)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, tmp103);
+	tmp103->client =3D client;
+
+	tmp103->regmap =3D devm_regmap_init_i2c(client, &tmp103_regmap_config=
);
+	if (IS_ERR(tmp103->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(tmp103->regmap);
+	}
+
+	ret =3D regmap_read(tmp103->regmap, TMP103_CONF_REG, &status);
+	if (ret < 0)
+		goto fail_init_regmap;
+
+	tmp103->config_orig =3D status;
+	ret =3D regmap_write(tmp103->regmap, TMP103_CONF_REG, TMP103_CONFIG);
+	if (ret < 0) {
+		dev_err(&client->dev, "error writing config register\n");
+		goto fail_restore_config;
+	}
+
+	ret =3D regmap_read(tmp103->regmap, TMP103_CONF_REG, &status);
+	if (ret < 0) {
+		dev_err(&client->dev, "error reading config register\n");
+		goto fail_restore_config;
+	}
+	if (status !=3D TMP103_CONFIG) {
+		dev_err(&client->dev, "config settings did not stick\n");
+		ret =3D -ENODEV;
+		goto fail_restore_config;
+	}
+	tmp103->last_update =3D jiffies - HZ;
+	mutex_init(&tmp103->lock);
+
+	hwmon_dev =3D hwmon_device_register_with_groups(dev, client->name,
+						      tmp103, tmp103_groups);
+	if (IS_ERR(hwmon_dev)) {
+		dev_dbg(dev, "unable to register hwmon device\n");
+		status =3D PTR_ERR(hwmon_dev);
+		goto fail_restore_config;
+	}
+	tmp103->hwmon_dev =3D hwmon_dev;
+
+	return 0;
+
+fail_restore_config:
+	regmap_write(tmp103->regmap, TMP103_CONF_REG, tmp103->config_orig);
+fail_init_regmap:
+	regmap_exit(tmp103->regmap);
+	return ret;
+}
+
+static int tmp103_remove(struct i2c_client *client)
+{
+	struct tmp103 *tmp103 =3D i2c_get_clientdata(client);
+	int ret;
+
+	ret =3D regmap_write(tmp103->regmap, TMP103_CONF_REG,
+			   tmp103->config_orig);
+	if (ret < 0)
+		dev_err(&client->dev, "error writing config register\n");
+
+	hwmon_device_unregister(tmp103->hwmon_dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int tmp103_suspend(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct tmp103 *tmp103 =3D i2c_get_clientdata(client);
+	unsigned int config;
+	int ret;
+
+	ret =3D regmap_read(tmp103->regmap, TMP103_CONF_REG, &config);
+	if (ret < 0)
+		return ret;
+
+	config &=3D ~TMP103_CONF_SD;
+	return regmap_write(tmp103->regmap, TMP103_CONF_REG, config);
+}
+
+static int tmp103_resume(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct tmp103 *tmp103 =3D i2c_get_clientdata(client);
+	unsigned int config;
+	int ret;
+
+	ret =3D regmap_read(tmp103->regmap, TMP103_CONF_REG, &config);
+	if (ret < 0)
+		return ret;
+
+	config |=3D TMP103_CONF_SD;
+	return regmap_write(tmp103->regmap, TMP103_CONF_REG, config);
+}
+
+static const struct dev_pm_ops tmp103_dev_pm_ops =3D {
+	.suspend	=3D tmp103_suspend,
+	.resume		=3D tmp103_resume,
+};
+
+#define TMP103_DEV_PM_OPS (&tmp103_dev_pm_ops)
+#else
+#define	TMP103_DEV_PM_OPS NULL
+#endif /* CONFIG_PM */
+
+static const struct i2c_device_id tmp103_id[] =3D {
+	{ DRIVER_NAME, 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tmp103_id);
+
+static struct i2c_driver tmp103_driver =3D {
+	.driver =3D {
+		.name	=3D DRIVER_NAME,
+		.pm	=3D TMP103_DEV_PM_OPS,
+	},
+	.probe		=3D tmp103_probe,
+	.remove		=3D tmp103_remove,
+	.id_table	=3D tmp103_id,
+};
+
+module_i2c_driver(tmp103_driver);
+
+MODULE_AUTHOR("Heiko Schocher <hs@denx.de>");
+MODULE_DESCRIPTION("Texas Instruments TMP103 temperature sensor driver=
");
+MODULE_LICENSE("GPL");
--=20
1.8.3.1

