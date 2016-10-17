From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 12/13] gpio-sx150x: Remove struct sx150x_platform_data
Date: Mon, 17 Oct 2016 07:27:07 -0700
Message-ID: <1476714428-11264-13-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Remove last vestiges of struct sx150x_platform_data

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 044ff3d..bfb1ec3 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -84,16 +84,6 @@ struct sx150x_device_data {
 	} pri;
 };
 
-/**
- * struct sx150x_platform_data - config data for SX150x driver
- * @oscio_is_gpo: If set to true, the driver will configure OSCIO as a GPO
- *                instead of as an oscillator, increasing the size of the
- *                GP(I)O pool created by this expander by one.  The
- *                output-only GPO pin will be added at the end of the block.
- */
-struct sx150x_platform_data {
-};
-
 struct sx150x_chip {
 	struct gpio_chip                 gpio_chip;
 	struct i2c_client               *client;
@@ -531,8 +521,7 @@ out:
 
 static void sx150x_init_chip(struct sx150x_chip *chip,
 			struct i2c_client *client,
-			kernel_ulong_t driver_data,
-			struct sx150x_platform_data *pdata)
+			kernel_ulong_t driver_data)
 {
 	mutex_init(&chip->lock);
 
@@ -592,8 +581,7 @@ static int sx150x_reset(struct sx150x_chip *chip)
 	return err;
 }
 
-static int sx150x_init_hw(struct sx150x_chip *chip,
-			struct sx150x_platform_data *pdata)
+static int sx150x_init_hw(struct sx150x_chip *chip)
 {
 	u32 io_pulldown = 0;
 	u32 io_pullup   = 0;
@@ -696,15 +684,10 @@ static int sx150x_probe(struct i2c_client *client,
 {
 	static const u32 i2c_funcs = I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
-	struct sx150x_platform_data *pdata;
 	struct sx150x_chip *chip;
 	int rc;
 	bool oscio_is_gpo;
 
-	pdata = dev_get_platdata(&client->dev);
-	if (!pdata)
-		return -EINVAL;
-
 	if (!i2c_check_functionality(client->adapter, i2c_funcs))
 		return -ENOSYS;
 
@@ -716,12 +699,12 @@ static int sx150x_probe(struct i2c_client *client,
 	oscio_is_gpo = of_property_read_bool(client->dev.of_node,
 					     "semtech,oscio-is-gpo");
 
-	sx150x_init_chip(chip, client, id->driver_data, pdata);
+	sx150x_init_chip(chip, client, id->driver_data);
 
 	if (oscio_is_gpo)
 		chip->gpio_chip.ngpio++;
 
-	rc = sx150x_init_hw(chip, pdata);
+	rc = sx150x_init_hw(chip);
 	if (rc < 0)
 		return rc;
 
-- 
2.5.5

