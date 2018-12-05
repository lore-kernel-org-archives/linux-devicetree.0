From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 4/5] si470x-i2c: Add optional reset-gpio support
Date: Wed,  5 Dec 2018 16:47:49 +0100
Message-ID: <20181205154750.17996-5-pawel.mikolaj.chmiel@gmail.com>
References: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: hverkuil@xs4all.nl, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

If reset-gpio is defined, use it to bring device out of reset.
Without this, it's not possible to access si470x registers.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 15 +++++++++++++++
 drivers/media/radio/si470x/radio-si470x.h     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index a7ac09c55188..15eea2b2c90f 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -28,6 +28,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 
 #include "radio-si470x.h"
@@ -392,6 +393,17 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	radio->videodev.release = video_device_release_empty;
 	video_set_drvdata(&radio->videodev, radio);
 
+	radio->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(radio->gpio_reset)) {
+		retval = PTR_ERR(radio->gpio_reset);
+		dev_err(&client->dev, "Failed to request gpio: %d\n", retval);
+		goto err_all;
+	}
+
+	if (radio->gpio_reset)
+		gpiod_set_value(radio->gpio_reset, 1);
+
 	/* power up : need 110ms */
 	radio->registers[POWERCFG] = POWERCFG_ENABLE;
 	if (si470x_set_register(radio, POWERCFG) < 0) {
@@ -478,6 +490,9 @@ static int si470x_i2c_remove(struct i2c_client *client)
 
 	video_unregister_device(&radio->videodev);
 
+	if (radio->gpio_reset)
+		gpiod_set_value(radio->gpio_reset, 0);
+
 	return 0;
 }
 
diff --git a/drivers/media/radio/si470x/radio-si470x.h b/drivers/media/radio/si470x/radio-si470x.h
index 35fa0f3bbdd2..6fd6a399cb77 100644
--- a/drivers/media/radio/si470x/radio-si470x.h
+++ b/drivers/media/radio/si470x/radio-si470x.h
@@ -189,6 +189,7 @@ struct si470x_device {
 
 #if IS_ENABLED(CONFIG_I2C_SI470X)
 	struct i2c_client *client;
+	struct gpio_desc *gpio_reset;
 #endif
 };
 
-- 
2.17.1
