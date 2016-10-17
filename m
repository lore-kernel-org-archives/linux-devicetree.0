From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 10/13] gpio-sx150x: Replace 'oscio_is_gpio' with DT binding
Date: Mon, 17 Oct 2016 07:27:05 -0700
Message-ID: <1476714428-11264-11-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index a63f6ea..044ff3d 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -92,7 +92,6 @@ struct sx150x_device_data {
  *                output-only GPO pin will be added at the end of the block.
  */
 struct sx150x_platform_data {
-	bool     oscio_is_gpo;
 };
 
 struct sx150x_chip {
@@ -553,8 +552,6 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.of_node          = client->dev.of_node;
 	chip->gpio_chip.of_gpio_n_cells  = 2;
 #endif
-	if (pdata->oscio_is_gpo)
-		++chip->gpio_chip.ngpio;
 
 	chip->irq_chip.name                = client->name;
 	chip->irq_chip.irq_mask            = sx150x_irq_mask;
@@ -670,10 +667,6 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 			return err;
 	}
 
-
-	if (pdata->oscio_is_gpo)
-		sx150x_set_oscio(chip, 0);
-
 	return err;
 }
 
@@ -706,6 +699,7 @@ static int sx150x_probe(struct i2c_client *client,
 	struct sx150x_platform_data *pdata;
 	struct sx150x_chip *chip;
 	int rc;
+	bool oscio_is_gpo;
 
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata)
@@ -719,11 +713,21 @@ static int sx150x_probe(struct i2c_client *client,
 	if (!chip)
 		return -ENOMEM;
 
+	oscio_is_gpo = of_property_read_bool(client->dev.of_node,
+					     "semtech,oscio-is-gpo");
+
 	sx150x_init_chip(chip, client, id->driver_data, pdata);
+
+	if (oscio_is_gpo)
+		chip->gpio_chip.ngpio++;
+
 	rc = sx150x_init_hw(chip, pdata);
 	if (rc < 0)
 		return rc;
 
+	if (oscio_is_gpo)
+		sx150x_set_oscio(chip, 0);
+
 	rc = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (rc)
 		return rc;
-- 
2.5.5

