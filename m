Return-Path: <SRS0=lNwp=MC=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/4] Input: egalax_ts - use touchscreen helpers
Date: Thu, 20 Sep 2018 16:22:54 +0200
Message-Id: <20180920142256.2788-2-l.stach@pengutronix.de>
In-Reply-To: <20180920142256.2788-1-l.stach@pengutronix.de>
References: <20180920142256.2788-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Using those helpers the driver will support all the common OF
touchscreen properties like rotation and axis swap.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/egalax_ts.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 5e7a60089c3d..4c751f8f806d 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -25,6 +25,7 @@
 #include <linux/bitops.h>
 #include <linux/input/mt.h>
 #include <linux/of_gpio.h>
+#include <linux/input/touchscreen.h>
 
 /*
  * Mouse Mode: some panel may configure the controller to mouse mode,
@@ -52,13 +53,12 @@
 
 #define MAX_I2C_DATA_LEN	10
 
-#define EGALAX_MAX_X	32760
-#define EGALAX_MAX_Y	32760
 #define EGALAX_MAX_TRIES 100
 
 struct egalax_ts {
 	struct i2c_client		*client;
 	struct input_dev		*input_dev;
+	struct touchscreen_properties	props;
 };
 
 static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
@@ -105,8 +105,7 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
 		down ? "down" : "up", id, x, y, z);
 
 	if (down) {
-		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
-		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
+		touchscreen_report_pos(input_dev, &ts->props, x, y, true);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, z);
 	}
 
@@ -199,10 +198,14 @@ static int egalax_ts_probe(struct i2c_client *client,
 	input_dev->name = "EETI eGalax Touch Screen";
 	input_dev->id.bustype = BUS_I2C;
 
-	input_set_abs_params(input_dev,
-			     ABS_MT_POSITION_X, 0, EGALAX_MAX_X, 0, 0);
-	input_set_abs_params(input_dev,
-			     ABS_MT_POSITION_Y, 0, EGALAX_MAX_Y, 0, 0);
+	touchscreen_parse_properties(ts->input_dev, true, &ts->props);
+	if (!ts->props.max_x && !ts->props.max_y)
+		ts->props.max_x = ts->props.max_y = 32760;
+
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
+			     0, ts->props.max_x, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
+			     0, ts->props.max_y, 0, 0);
 	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 
-- 
2.19.0
