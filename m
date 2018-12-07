From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 2/4] si470x-i2c: Use managed resource helpers
Date: Fri,  7 Dec 2018 14:58:10 +0100
Message-ID: <20181207135812.12842-3-pawel.mikolaj.chmiel@gmail.com>
References: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207135812.12842-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

Simplify cleanup of failures by using managed resource helpers

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 250828ddb5fa..a7ac09c55188 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -350,7 +350,7 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	unsigned char version_warning = 0;
 
 	/* private data allocation and initialization */
-	radio = kzalloc(sizeof(struct si470x_device), GFP_KERNEL);
+	radio = devm_kzalloc(&client->dev, sizeof(*radio), GFP_KERNEL);
 	if (!radio) {
 		retval = -ENOMEM;
 		goto err_initial;
@@ -370,7 +370,7 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	retval = v4l2_device_register(&client->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&client->dev, "couldn't register v4l2_device\n");
-		goto err_radio;
+		goto err_initial;
 	}
 
 	v4l2_ctrl_handler_init(&radio->hdl, 2);
@@ -396,14 +396,14 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	radio->registers[POWERCFG] = POWERCFG_ENABLE;
 	if (si470x_set_register(radio, POWERCFG) < 0) {
 		retval = -EIO;
-		goto err_ctrl;
+		goto err_all;
 	}
 	msleep(110);
 
 	/* get device and chip versions */
 	if (si470x_get_all_registers(radio) < 0) {
 		retval = -EIO;
-		goto err_ctrl;
+		goto err_all;
 	}
 	dev_info(&client->dev, "DeviceID=0x%4.4hx ChipID=0x%4.4hx\n",
 			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
@@ -430,10 +430,10 @@ static int si470x_i2c_probe(struct i2c_client *client,
 
 	/* rds buffer allocation */
 	radio->buf_size = rds_buf * 3;
-	radio->buffer = kmalloc(radio->buf_size, GFP_KERNEL);
+	radio->buffer = devm_kmalloc(&client->dev, radio->buf_size, GFP_KERNEL);
 	if (!radio->buffer) {
 		retval = -EIO;
-		goto err_ctrl;
+		goto err_all;
 	}
 
 	/* rds buffer configuration */
@@ -441,12 +441,13 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	radio->rd_index = 0;
 	init_waitqueue_head(&radio->read_queue);
 
-	retval = request_threaded_irq(client->irq, NULL, si470x_i2c_interrupt,
-			IRQF_TRIGGER_FALLING | IRQF_ONESHOT, DRIVER_NAME,
-			radio);
+	retval = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					   si470x_i2c_interrupt,
+					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					   DRIVER_NAME, radio);
 	if (retval) {
 		dev_err(&client->dev, "Failed to register interrupt\n");
-		goto err_rds;
+		goto err_all;
 	}
 
 	/* register video device */
@@ -460,15 +461,9 @@ static int si470x_i2c_probe(struct i2c_client *client,
 
 	return 0;
 err_all:
-	free_irq(client->irq, radio);
-err_rds:
-	kfree(radio->buffer);
-err_ctrl:
 	v4l2_ctrl_handler_free(&radio->hdl);
 err_dev:
 	v4l2_device_unregister(&radio->v4l2_dev);
-err_radio:
-	kfree(radio);
 err_initial:
 	return retval;
 }
@@ -481,9 +476,7 @@ static int si470x_i2c_remove(struct i2c_client *client)
 {
 	struct si470x_device *radio = i2c_get_clientdata(client);
 
-	free_irq(client->irq, radio);
 	video_unregister_device(&radio->videodev);
-	kfree(radio);
 
 	return 0;
 }
-- 
2.17.1
