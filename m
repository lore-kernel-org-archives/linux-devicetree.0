From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v3 4/5] iio: light: vcnl4000 add support for the VCNL4040 proximity and light sensor
Date: Thu, 21 Mar 2019 08:40:46 -0700
Message-ID: <20190321154047.23236-5-angus@akkea.ca>
References: <20190321154047.23236-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321154047.23236-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The VCNL4040 is almost identical to the VCNL4200 as far as register
layout goes but just need to check a different ID register location.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 drivers/iio/light/vcnl4000.c | 51 ++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 308cb2d2b641..12c52f2b853a 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1,8 +1,9 @@
 /*
- * vcnl4000.c - Support for Vishay VCNL4000/4010/4020/4200 combined ambient
+ * vcnl4000.c - Support for Vishay VCNL4000/4010/4020/4040/4200 combined ambient
  * light and proximity sensor
  *
  * Copyright 2012 Peter Meerwald <pmeerw@pmeerw.net>
+ * Copyright 2019 Pursim SPC
  *
  * This file is subject to the terms and conditions of version 2 of
  * the GNU General Public License.  See the file COPYING in the main
@@ -10,13 +11,14 @@
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
@@ -30,6 +32,7 @@
 #define VCNL4000_DRV_NAME "vcnl4000"
 #define VCNL4000_PROD_ID	0x01
 #define VCNL4010_PROD_ID	0x02 /* for VCNL4020, VCNL4010 */
+#define VCNL4040_PROD_ID	0x86
 #define VCNL4200_PROD_ID	0x58
 
 #define VCNL4000_COMMAND	0x80 /* Command register */
@@ -49,6 +52,8 @@
 #define VCNL4200_AL_DATA	0x09 /* Ambient light data */
 #define VCNL4200_DEV_ID		0x0e /* Device ID, slave address and version */
 
+#define VCNL4040_DEV_ID		0x0c /* Device ID and version */
+
 /* Bit masks for COMMAND register */
 #define VCNL4000_AL_RDY		BIT(6) /* ALS data ready? */
 #define VCNL4000_PS_RDY		BIT(5) /* proximity data ready? */
@@ -58,6 +63,7 @@
 enum vcnl4000_device_ids {
 	VCNL4000,
 	VCNL4010,
+	VCNL4040,
 	VCNL4200,
 };
 
@@ -90,6 +96,7 @@ static const struct i2c_device_id vcnl4000_id[] = {
 	{ "vcnl4000", VCNL4000 },
 	{ "vcnl4010", VCNL4010 },
 	{ "vcnl4020", VCNL4010 },
+	{ "vcnl4040", VCNL4040 },
 	{ "vcnl4200", VCNL4200 },
 	{ }
 };
@@ -128,14 +135,26 @@ static int vcnl4000_init(struct vcnl4000_data *data)
 
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
+	}
+
+	dev_dbg(&data->client->dev, "device id 0x%x", id);
 
 	data->rev = (ret >> 8) & 0xf;
 
@@ -150,9 +169,19 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 	data->al_scale = 24000;
 	data->vcnl4200_al.reg = VCNL4200_AL_DATA;
 	data->vcnl4200_ps.reg = VCNL4200_PS_DATA;
-	/* Integration time is 50ms, but the experiments show 54ms in total. */
-	data->vcnl4200_al.sampling_rate = ktime_set(0, 54000 * 1000);
-	data->vcnl4200_ps.sampling_rate = ktime_set(0, 4200 * 1000);
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
 	data->vcnl4200_al.last_measurement = ktime_set(0, 0);
 	data->vcnl4200_ps.last_measurement = ktime_set(0, 0);
 	mutex_init(&data->vcnl4200_al.lock);
@@ -271,6 +300,12 @@ static const struct vcnl4000_chip_spec vcnl4000_chip_spec_cfg[] = {
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
-- 
2.17.1
