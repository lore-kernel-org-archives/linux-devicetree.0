From: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Subject: [PATCH 1/2 v2] hwmon: (ltc4151) Make shunt-resistor configurable
Date: Mon, 25 Jul 2016 13:56:02 +0200
Message-ID: <20160725115558.GA18360@makrotopia.org>
References: <5795A144.2020300@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5795A144.2020300-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Per =?iso-8859-1?Q?Dal=E9n?= <per.dalen-US8m9dViuwNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow to specify the resistance of the attached shunt via DT by
adding the shunt-resistor property. Fall-back to the previous
default (1 mOhm) if unset.

Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
---
v2: removed unneeded things and throw -EINVAL for shunt==0

 drivers/hwmon/ltc4151.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc4151.c b/drivers/hwmon/ltc4151.c
index c86a184..419c6f7 100644
--- a/drivers/hwmon/ltc4151.c
+++ b/drivers/hwmon/ltc4151.c
@@ -30,6 +30,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -52,6 +53,7 @@ struct ltc4151_data {
 	struct mutex update_lock;
 	bool valid;
 	unsigned long last_updated; /* in jiffies */
+	unsigned int shunt; /* in micro ohms */
 
 	/* Registers */
 	u8 regs[6];
@@ -111,9 +113,9 @@ static int ltc4151_get_value(struct ltc4151_data *data, u8 reg)
 	case LTC4151_SENSE_H:
 		/*
 		 * 20uV resolution. Convert to current as measured with
-		 * an 1 mOhm sense resistor, in mA.
+		 * a given sense resistor, in mA.
 		 */
-		val = val * 20;
+		val = val * 20 * 1000 / data->shunt;
 		break;
 	case LTC4151_VIN_H:
 		/* 25 mV per increment */
@@ -176,6 +178,7 @@ static int ltc4151_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ltc4151_data *data;
 	struct device *hwmon_dev;
+	u32 shunt;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
@@ -184,6 +187,14 @@ static int ltc4151_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
+	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &shunt))
+		shunt = 1000; /* 1 mOhm if not set via DT */
+
+	if (shunt == 0)
+		return -EINVAL;
+
+	data->shunt = shunt;
+
 	data->client = client;
 	mutex_init(&data->update_lock);
 
@@ -199,10 +210,16 @@ static const struct i2c_device_id ltc4151_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ltc4151_id);
 
+static const struct of_device_id ltc4151_match[] = {
+	{ .compatible = "lltc,ltc4151" },
+	{},
+};
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ltc4151_driver = {
 	.driver = {
 		.name	= "ltc4151",
+		.of_match_table = of_match_ptr(ltc4151_match),
 	},
 	.probe		= ltc4151_probe,
 	.id_table	= ltc4151_id,
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
