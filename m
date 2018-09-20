Return-Path: <SRS0=lNwp=MC=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/4] Input: egalax_ts - clean up capability initialization
Date: Thu, 20 Sep 2018 16:22:53 +0200
Message-Id: <20180920142256.2788-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Just provide the proper flags to input_mt_init_slots(), which will
so the right thing and set the proper capability bits.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/egalax_ts.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 80e69bb8283e..5e7a60089c3d 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -199,17 +199,12 @@ static int egalax_ts_probe(struct i2c_client *client,
 	input_dev->name = "EETI eGalax Touch Screen";
 	input_dev->id.bustype = BUS_I2C;
 
-	__set_bit(EV_ABS, input_dev->evbit);
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(BTN_TOUCH, input_dev->keybit);
-
-	input_set_abs_params(input_dev, ABS_X, 0, EGALAX_MAX_X, 0, 0);
-	input_set_abs_params(input_dev, ABS_Y, 0, EGALAX_MAX_Y, 0, 0);
 	input_set_abs_params(input_dev,
 			     ABS_MT_POSITION_X, 0, EGALAX_MAX_X, 0, 0);
 	input_set_abs_params(input_dev,
 			     ABS_MT_POSITION_Y, 0, EGALAX_MAX_Y, 0, 0);
-	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS, 0);
+	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS,
+			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 
 	error = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					  egalax_ts_interrupt,
-- 
2.19.0
