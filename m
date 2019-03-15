From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 1/2] iio: light: vcnl4000 add support for the VCNL4040 proximity and light sensor
Date: Fri, 15 Mar 2019 14:54:24 -0700
Message-ID: <20190315215425.24140-2-angus@akkea.ca>
References: <20190315215425.24140-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315215425.24140-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Brian Masney <masneyb@onstation.org>, Robert Eshleman <bobbyeshleman@gmail.com>, Mathieu Othacehe <m.othacehe@gmail.com>, Parthiban Nallathambi <pn@denx.de>, ryang <decatf@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The VCNL4040 is almost identical to the VCNL4200 as far as register
layout goes but just need to check a different ID register location.

This does change the initialization sequence of the VCNL4200 to use word
writes instead of byte writes. The VCNL4200 datasheet says that word read
and writes should be used to access the registers but I don't have a 4200
to test with. The VCNL4040 doesn't initialize properly with the byte
writes.

devicetree hooks were also added.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 drivers/iio/light/vcnl4000.c | 89 ++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 04fd0d4b6f19..6e1f02aa6696 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -10,13 +10,14 @@
  *
  * IIO driver for:
  *   VCNL4000/10/20 (7-bit I2C slave address 0x13)
+ *   VCNL4040 (7-bit I2C slave address 0x60)
  *   VCNL4200 (7-bit I2C slave address 0x51)
  *
  * TODO:
  *   allow to adjust IR current
  *   proximity threshold and event handling
  *   periodic ALS/proximity measurement (VCNL4010/20)
- *   interrupts (VCNL4010/20, VCNL4200)
+ *   interrupts (VCNL4010/20/40, VCNL4200)
  */
 
 #include <linux/module.h>
@@ -30,6 +31,7 @@
 #define VCNL4000_DRV_NAME "vcnl4000"
 #define VCNL4000_PROD_ID	0x01
 #define VCNL4010_PROD_ID	0x02 /* for VCNL4020, VCNL4010 */
+#define VCNL4040_PROD_ID	0x86
 #define VCNL4200_PROD_ID	0x58
 
 #define VCNL4000_COMMAND	0x80 /* Command register */
@@ -49,6 +51,8 @@
 #define VCNL4200_AL_DATA	0x09 /* Ambient light data */
 #define VCNL4200_DEV_ID		0x0e /* Device ID, slave address and version */
 
+#define VCNL4040_DEV_ID		0x0c /* Device ID, slave address and version */
+
 /* Bit masks for COMMAND register */
 #define VCNL4000_AL_RDY		BIT(6) /* ALS data ready? */
 #define VCNL4000_PS_RDY		BIT(5) /* proximity data ready? */
@@ -58,6 +62,7 @@
 enum vcnl4000_device_ids {
 	VCNL4000,
 	VCNL4010,
+	VCNL4040,
 	VCNL4200,
 };
 
@@ -90,6 +95,7 @@ static const struct i2c_device_id vcnl4000_id[] = {
 	{ "vcnl4000", VCNL4000 },
 	{ "vcnl4010", VCNL4010 },
 	{ "vcnl4020", VCNL4010 },
+	{ "vcnl4040", VCNL4040 },
 	{ "vcnl4200", VCNL4200 },
 	{ }
 };
@@ -128,31 +134,56 @@ static int vcnl4000_init(struct vcnl4000_data *data)
 
 static int vcnl4200_init(struct vcnl4000_data *data)
 {
-	int ret;
+	int ret, id;
 
 	ret = i2c_smbus_read_word_data(data->client, VCNL4200_DEV_ID);
 	if (ret < 0)
 		return ret;
 
-	if ((ret & 0xff) != VCNL4200_PROD_ID)
-		return -ENODEV;
+	id = ret & 0xff;
+
+	if (id != VCNL4200_PROD_ID) {
+		ret = i2c_smbus_read_word_data(data->client, VCNL4040_DEV_ID);
+		if (ret < 0)
+			return ret;
+
+		id = ret & 0xff;
+
+		if (id != VCNL4040_PROD_ID)
+			return -ENODEV;
+
+	}
+
+	dev_dbg(&data->client->dev, "device id 0x%x", id);
 
 	data->rev = (ret >> 8) & 0xf;
 
 	/* Set defaults and enable both channels */
-	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_AL_CONF, 0x00);
+	ret = i2c_smbus_write_word_data(data->client, VCNL4200_AL_CONF, 0x00);
 	if (ret < 0)
 		return ret;
-	ret = i2c_smbus_write_byte_data(data->client, VCNL4200_PS_CONF1, 0x00);
+	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF1, 0x00);
 	if (ret < 0)
 		return ret;
 
+	switch (id) {
+	case VCNL4200_PROD_ID:
+		/* Integration time is 50ms, but the experiments */
+		/* show 54ms in total. */
+		data->vcnl4200_al.sampling_rate = ktime_set(0, 54000 * 1000);
+		data->vcnl4200_ps.sampling_rate = ktime_set(0, 4200 * 1000);
+		break;
+	case VCNL4040_PROD_ID:
+		/* Integration time is 80ms, add 10ms. */
+		data->vcnl4200_al.sampling_rate = ktime_set(0, 100000 * 1000);
+		data->vcnl4200_ps.sampling_rate = ktime_set(0, 100000 * 1000);
+		break;
+	}
+
 	data->al_scale = 24000;
 	data->vcnl4200_al.reg = VCNL4200_AL_DATA;
 	data->vcnl4200_ps.reg = VCNL4200_PS_DATA;
-	/* Integration time is 50ms, but the experiments show 54ms in total. */
-	data->vcnl4200_al.sampling_rate = ktime_set(0, 54000 * 1000);
-	data->vcnl4200_ps.sampling_rate = ktime_set(0, 4200 * 1000);
+
 	data->vcnl4200_al.last_measurement = ktime_set(0, 0);
 	data->vcnl4200_ps.last_measurement = ktime_set(0, 0);
 	mutex_init(&data->vcnl4200_al.lock);
@@ -194,8 +225,11 @@ static int vcnl4000_measure(struct vcnl4000_data *data, u8 req_mask,
 
 	ret = i2c_smbus_read_i2c_block_data(data->client,
 		data_reg, sizeof(buf), (u8 *) &buf);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(&data->client->dev, "smbus read failed 0x%02x\n",
+			ret);
 		goto fail;
+	}
 
 	mutex_unlock(&data->vcnl4000_lock);
 	*val = be16_to_cpu(buf);
@@ -216,6 +250,8 @@ static int vcnl4200_measure(struct vcnl4000_data *data,
 
 	mutex_lock(&chan->lock);
 
+	ret = i2c_smbus_read_word_data(data->client, chan->reg);
+
 	next_measurement = ktime_add(chan->last_measurement,
 			chan->sampling_rate);
 	delta = ktime_us_delta(next_measurement, ktime_get());
@@ -226,8 +262,12 @@ static int vcnl4200_measure(struct vcnl4000_data *data,
 	mutex_unlock(&chan->lock);
 
 	ret = i2c_smbus_read_word_data(data->client, chan->reg);
-	if (ret < 0)
+
+	if (ret < 0) {
+		dev_err(&data->client->dev, "smbus read failed 0x%02x\n",
+			ret);
 		return ret;
+	}
 
 	*val = ret;
 
@@ -271,6 +311,12 @@ static const struct vcnl4000_chip_spec vcnl4000_chip_spec_cfg[] = {
 		.measure_light = vcnl4000_measure_light,
 		.measure_proximity = vcnl4000_measure_proximity,
 	},
+	[VCNL4040] = {
+		.prod = "VCNL4040",
+		.init = vcnl4200_init,
+		.measure_light = vcnl4200_measure_light,
+		.measure_proximity = vcnl4200_measure_proximity,
+	},
 	[VCNL4200] = {
 		.prod = "VCNL4200",
 		.init = vcnl4200_init,
@@ -350,7 +396,7 @@ static int vcnl4000_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	dev_dbg(&client->dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
+	dev_err(&client->dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
 		data->chip_spec->prod, data->rev);
 
 	indio_dev->dev.parent = &client->dev;
@@ -373,6 +419,23 @@ static struct i2c_driver vcnl4000_driver = {
 
 module_i2c_driver(vcnl4000_driver);
 
+#ifdef CONFIG_OF
+static const struct of_device_id vcnl_4000_of_match[] = {
+	{
+		.compatible = "vishay,vcnl4000",
+		.data = "VCNL4000",
+	},
+	{
+		.compatible = "vishay,vcnl4040",
+		.data = "VCNL4040",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, vcnl4000_of_match);
+#else
+#define vcnl_4000_of_match NULL
+#endif
+
 MODULE_AUTHOR("Peter Meerwald <pmeerw@pmeerw.net>");
-MODULE_DESCRIPTION("Vishay VCNL4000 proximity/ambient light sensor driver");
+MODULE_DESCRIPTION("Vishay VCNL4xx0 proximity/ambient light sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.17.1
