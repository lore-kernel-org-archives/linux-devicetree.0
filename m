Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 3/5] input: touchscreen: eeti: add support for DT properties to flip screen
Date: Sun, 17 Jun 2018 13:46:57 +0200
Message-Id: <20180617114659.367-3-daniel@zonque.org>
In-Reply-To: <20180617114659.367-1-daniel@zonque.org>
References: <20180617114659.367-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Use touchscreen_parse_properties() to automatically set some of the common
touchscreen properties. Also make flip_x and flip_y members of the private
device context and allow setting them through both the module parameters and
devicetree properties.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index cc4fd33f9d6d..e7fade1a895c 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -28,6 +28,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/input.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/timer.h>
@@ -48,6 +49,7 @@ struct eeti_ts {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct gpio_desc *attn_gpio;
+	bool flip_x, flip_y;
 	bool running;
 };
 
@@ -74,10 +76,10 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
 	x >>= res - EETI_TS_BITDEPTH;
 	y >>= res - EETI_TS_BITDEPTH;
 
-	if (flip_x)
+	if (eeti->flip_x)
 		x = EETI_MAXVAL - x;
 
-	if (flip_y)
+	if (eeti->flip_y)
 		y = EETI_MAXVAL - y;
 
 	if (buf[0] & REPORT_BIT_HAS_PRESSURE)
@@ -149,6 +151,7 @@ static void eeti_ts_close(struct input_dev *dev)
 static int eeti_ts_probe(struct i2c_client *client,
 			 const struct i2c_device_id *idp)
 {
+	struct touchscreen_properties props;
 	struct device *dev = &client->dev;
 	struct eeti_ts *eeti;
 	struct input_dev *input;
@@ -179,6 +182,8 @@ static int eeti_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, EETI_MAXVAL, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE, 0, 0xff, 0, 0);
 
+	touchscreen_parse_properties(input, false, &props);
+
 	input->name = client->name;
 	input->id.bustype = BUS_I2C;
 	input->open = eeti_ts_open;
@@ -187,6 +192,9 @@ static int eeti_ts_probe(struct i2c_client *client,
 	eeti->client = client;
 	eeti->input = input;
 
+	eeti->flip_x = flip_x || props.invert_x;
+	eeti->flip_y = flip_y || props.invert_y;
+
 	eeti->attn_gpio = devm_gpiod_get_optional(dev, "attn", GPIOD_IN);
 	if (IS_ERR(eeti->attn_gpio))
 		return PTR_ERR(eeti->attn_gpio);
-- 
2.17.1
