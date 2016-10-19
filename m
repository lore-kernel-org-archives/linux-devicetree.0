From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 01/10] gpio-sx150x: Remove 'gpio_base' from pdata
Date: Wed, 19 Oct 2016 07:03:57 -0700
Message-ID: <1476885846-16469-2-git-send-email-andrew.smirnov@gmail.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Since struct sx150x_platrfom_data is not accesible to anyone but the
driver itself it seems a bit pointless to have a configurable GPIO
base. Hardcode it to -1 and remove that paramter.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index a177ebd..f9d6bec 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -86,11 +86,6 @@ struct sx150x_device_data {
 
 /**
  * struct sx150x_platform_data - config data for SX150x driver
- * @gpio_base: The index number of the first GPIO assigned to this
- *             GPIO expander.  The expander will create a block of
- *             consecutively numbered gpios beginning at the given base,
- *             with the size of the block depending on the model of the
- *             expander chip.
  * @oscio_is_gpo: If set to true, the driver will configure OSCIO as a GPO
  *                instead of as an oscillator, increasing the size of the
  *                GP(I)O pool created by this expander by one.  The
@@ -125,7 +120,6 @@ struct sx150x_device_data {
  *                      in order to place it in a known state.
  */
 struct sx150x_platform_data {
-	unsigned gpio_base;
 	bool     oscio_is_gpo;
 	u16      io_pullup_ena;
 	u16      io_pulldn_ena;
@@ -588,7 +582,7 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.get              = sx150x_gpio_get;
 	chip->gpio_chip.set              = sx150x_gpio_set;
 	chip->gpio_chip.set_single_ended = sx150x_gpio_set_single_ended;
-	chip->gpio_chip.base             = pdata->gpio_base;
+	chip->gpio_chip.base             = -1;
 	chip->gpio_chip.can_sleep        = true;
 	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
 #ifdef CONFIG_OF_GPIO
-- 
2.5.5
