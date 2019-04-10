From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/3] gpio: lpc32xx: enable interrupt lookup for port 3
Date: Wed, 10 Apr 2019 12:39:25 +0200
Message-ID: <20190410103926.8781-3-alexandre.belloni@bootlin.com>
References: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Interrupt support was disabled "temporarily" in commit 320a6480ef24 ("gpio:
lpc32xx: disable broken to_irq support").

Reenable to_irq for port 3 as they are directly connected to an interrupt
controller and a simple lookup is working.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/gpio/gpio-lpc32xx.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index aa74cc4d8b14..24f09b08e319 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -22,6 +22,7 @@
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 
@@ -385,14 +386,9 @@ static int lpc32xx_gpio_to_irq_p01(struct gpio_chip *chip, unsigned offset)
 	return -ENXIO;
 }
 
-static int lpc32xx_gpio_to_irq_gpio_p3(struct gpio_chip *chip, unsigned offset)
+static int lpc32xx_gpio_to_irq_p3(struct gpio_chip *chip, unsigned int offset)
 {
-	return -ENXIO;
-}
-
-static int lpc32xx_gpio_to_irq_gpi_p3(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
+	return of_irq_get_byname(chip->of_node, chip->names[offset]);
 }
 
 static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
@@ -451,7 +447,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_output	= lpc32xx_gpio_dir_output_p3,
 			.set			= lpc32xx_gpio_set_value_p3,
 			.request		= lpc32xx_gpio_request,
-			.to_irq			= lpc32xx_gpio_to_irq_gpio_p3,
+			.to_irq			= lpc32xx_gpio_to_irq_p3,
 			.base			= LPC32XX_GPIO_P3_GRP,
 			.ngpio			= LPC32XX_GPIO_P3_MAX,
 			.names			= gpio_p3_names,
@@ -465,7 +461,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_in_always,
 			.get			= lpc32xx_gpi_get_value,
 			.request		= lpc32xx_gpio_request,
-			.to_irq			= lpc32xx_gpio_to_irq_gpi_p3,
+			.to_irq			= lpc32xx_gpio_to_irq_p3,
 			.base			= LPC32XX_GPI_P3_GRP,
 			.ngpio			= LPC32XX_GPI_P3_MAX,
 			.names			= gpi_p3_names,
-- 
2.20.1
