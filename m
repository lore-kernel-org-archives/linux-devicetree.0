Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 3/4] input: touchscreen: eeti: drop module parameters, parse DT properties
Date: Sat, 23 Jun 2018 17:45:32 +0200
Message-Id: <20180623154533.26901-4-daniel@zonque.org>
In-Reply-To: <20180623154533.26901-1-daniel@zonque.org>
References: <20180623154533.26901-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

The only user of this driver in mainline does not make use of the module
parameters, so let's remove them. All properties for this driver should be
set through DT or pdata.

Use touchscreen_parse_properties() to automatically set some of the common
touchscreen properties and derive the axis inversion through that.

And finally, use touchscreen_report_pos() to handle the DT properties
automatically instead of doing the inversion ourselves.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index cc4fd33f9d6d..84561dfde7c4 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -25,9 +25,9 @@
  */
 
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/input.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/timer.h>
@@ -36,18 +36,11 @@
 #include <linux/slab.h>
 #include <asm/unaligned.h>
 
-static bool flip_x;
-module_param(flip_x, bool, 0644);
-MODULE_PARM_DESC(flip_x, "flip x coordinate");
-
-static bool flip_y;
-module_param(flip_y, bool, 0644);
-MODULE_PARM_DESC(flip_y, "flip y coordinate");
-
 struct eeti_ts {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct gpio_desc *attn_gpio;
+	struct touchscreen_properties props;
 	bool running;
 };
 
@@ -74,17 +67,10 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
 	x >>= res - EETI_TS_BITDEPTH;
 	y >>= res - EETI_TS_BITDEPTH;
 
-	if (flip_x)
-		x = EETI_MAXVAL - x;
-
-	if (flip_y)
-		y = EETI_MAXVAL - y;
-
 	if (buf[0] & REPORT_BIT_HAS_PRESSURE)
 		input_report_abs(eeti->input, ABS_PRESSURE, buf[5]);
 
-	input_report_abs(eeti->input, ABS_X, x);
-	input_report_abs(eeti->input, ABS_Y, y);
+	touchscreen_report_pos(eeti->input, &eeti->props, x, y, false);
 	input_report_key(eeti->input, BTN_TOUCH, buf[0] & REPORT_BIT_PRESSED);
 	input_sync(eeti->input);
 }
@@ -179,6 +165,8 @@ static int eeti_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input, ABS_Y, 0, EETI_MAXVAL, 0, 0);
 	input_set_abs_params(input, ABS_PRESSURE, 0, 0xff, 0, 0);
 
+	touchscreen_parse_properties(input, false, &eeti->props);
+
 	input->name = client->name;
 	input->id.bustype = BUS_I2C;
 	input->open = eeti_ts_open;
-- 
2.17.1
