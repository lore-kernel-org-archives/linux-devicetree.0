Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/4] gpio: rename gpio_set_drive_single_ended() to gpio_set_config()
Date: Thu,  3 Jan 2019 17:41:00 +0100
Message-Id: <20190103164102.31437-3-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

This commit simply renames gpio_set_drive_single_ended() to
gpio_set_config(), as the function is not specific to setting the GPIO
drive type, and will be used for other purposes in followup commits.

In addition, it moves the function above gpiod_direction_input(), as
it will be used from gpiod_direction_input().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/gpio/gpiolib.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a2cbb474901c..b07e4f6ee641 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2530,6 +2530,14 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
+static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
+			   enum pin_config_param mode)
+{
+	unsigned long config = { PIN_CONF_PACKED(mode, 0) };
+
+	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2583,14 +2591,6 @@ int gpiod_direction_input(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
-static int gpio_set_drive_single_ended(struct gpio_chip *gc, unsigned offset,
-				       enum pin_config_param mode)
-{
-	unsigned long config = { PIN_CONF_PACKED(mode, 0) };
-
-	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
-}
-
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
@@ -2687,8 +2687,8 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	gc = desc->gdev->chip;
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
-		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-						  PIN_CONFIG_DRIVE_OPEN_DRAIN);
+		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
+				      PIN_CONFIG_DRIVE_OPEN_DRAIN);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
@@ -2696,16 +2696,16 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			return gpiod_direction_input(desc);
 	}
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-						  PIN_CONFIG_DRIVE_OPEN_SOURCE);
+		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
+				      PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
 		if (!value)
 			return gpiod_direction_input(desc);
 	} else {
-		gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
-					    PIN_CONFIG_DRIVE_PUSH_PULL);
+		gpio_set_config(gc, gpio_chip_hwgpio(desc),
+				PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
 
 set_output_value:
-- 
2.20.1
