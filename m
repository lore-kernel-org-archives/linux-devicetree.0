Return-Path: <SRS0=jXKD=JN=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 3/5] leds: lt3593: switch to gpiod interface
Date: Wed, 27 Jun 2018 20:52:35 +0200
Message-Id: <20180627185237.24830-4-daniel@zonque.org>
In-Reply-To: <20180627185237.24830-1-daniel@zonque.org>
References: <20180627185237.24830-1-daniel@zonque.org>
To: jacek.anaszewski@gmail.com, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Clean up the code a bit and transition over to the gpiod based interface.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-lt3593.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 1a3dc347db21..a096ee64cbbb 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -21,12 +21,13 @@
 #include <linux/leds.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 
 struct lt3593_led_data {
 	struct led_classdev cdev;
-	unsigned gpio;
+	struct gpio_desc *gpiod;
 };
 
 static int lt3593_led_set(struct led_classdev *led_cdev,
@@ -46,25 +47,25 @@ static int lt3593_led_set(struct led_classdev *led_cdev,
 	 */
 
 	if (value == 0) {
-		gpio_set_value_cansleep(led_dat->gpio, 0);
+		gpiod_set_value_cansleep(led_dat->gpiod, 0);
 		return 0;
 	}
 
 	pulses = 32 - (value * 32) / 255;
 
 	if (pulses == 0) {
-		gpio_set_value_cansleep(led_dat->gpio, 0);
+		gpiod_set_value_cansleep(led_dat->gpiod, 0);
 		mdelay(1);
-		gpio_set_value_cansleep(led_dat->gpio, 1);
+		gpiod_set_value_cansleep(led_dat->gpiod, 1);
 		return 0;
 	}
 
-	gpio_set_value_cansleep(led_dat->gpio, 1);
+	gpiod_set_value_cansleep(led_dat->gpiod, 1);
 
 	while (pulses--) {
-		gpio_set_value_cansleep(led_dat->gpio, 0);
+		gpiod_set_value_cansleep(led_dat->gpiod, 0);
 		udelay(1);
-		gpio_set_value_cansleep(led_dat->gpio, 1);
+		gpiod_set_value_cansleep(led_dat->gpiod, 1);
 		udelay(1);
 	}
 
@@ -85,15 +86,8 @@ static struct lt3593_led_data *lt3593_led_probe_pdata(struct device *dev)
 	if (!led_data)
 		return ERR_PTR(-ENOMEM);
 
-	if (!gpio_is_valid(template->gpio)) {
-		dev_info(dev, "skipping unavailable LT3593 LED at gpio "
-			 "%d (%s)\n", template->gpio, template->name);
-		return ERR_PTR(-EINVAL);
-	}
-
 	led_data->cdev.name = template->name;
 	led_data->cdev.default_trigger = template->default_trigger;
-	led_data->gpio = template->gpio;
 	led_data->cdev.brightness_set_blocking = lt3593_led_set;
 
 	state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
@@ -108,6 +102,10 @@ static struct lt3593_led_data *lt3593_led_probe_pdata(struct device *dev)
 	if (ret < 0)
 		return ERR_PTR(ret);
 
+	led_data->gpiod = gpio_to_desc(template->gpio);
+	if (!led_data->gpiod)
+		return ERR_PTR(-EPROBE_DEFER);
+
 	ret = devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret < 0)
 		return ERR_PTR(ret);
-- 
2.17.1
