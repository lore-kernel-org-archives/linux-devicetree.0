From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 03/10] gpio-sx150x: Remove 'irq_base' parameter
Date: Wed, 19 Oct 2016 07:03:59 -0700
Message-ID: <1476885846-16469-4-git-send-email-andrew.smirnov@gmail.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Remove 'irq_base' parameter and call 'gpiochip_irqchip_add' with '0' as
irq base to automatically assign it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/gpio/gpio-sx150x.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index e80c115..e01afd8 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -105,10 +105,6 @@ struct sx150x_device_data {
  *               the polarity of that IO line, while clearing it results
  *               in normal polarity. For chips with fewer than 16 IO pins,
  *               high-end bits are ignored.
- * @irq_base: The first 'virtual IRQ' line at which our block of GPIO-based
- *            IRQ lines will appear.  Similarly to gpio_base, the expander
- *            will create a block of irqs beginning at this number.
- *            This value is ignored if irq_summary is < 0.
  * @reset_during_probe: If set to true, the driver will trigger a full
  *                      reset of the chip at the beginning of the probe
  *                      in order to place it in a known state.
@@ -118,7 +114,6 @@ struct sx150x_platform_data {
 	u16      io_pullup_ena;
 	u16      io_pulldn_ena;
 	u16      io_polarity;
-	unsigned irq_base;
 	bool     reset_during_probe;
 };
 
@@ -126,7 +121,6 @@ struct sx150x_chip {
 	struct gpio_chip                 gpio_chip;
 	struct i2c_client               *client;
 	const struct sx150x_device_data *dev_cfg;
-	int                              irq_base;
 	int				 irq_update;
 	u32                              irq_sense;
 	u32				 irq_masked;
@@ -590,7 +584,6 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->irq_chip.irq_set_type        = sx150x_irq_set_type;
 	chip->irq_chip.irq_bus_lock        = sx150x_irq_bus_lock;
 	chip->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
-	chip->irq_base                     = -1;
 	chip->irq_masked                   = ~0;
 	chip->irq_sense                    = 0;
 	chip->dev_masked                   = ~0;
@@ -689,16 +682,13 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 	return err;
 }
 
-static int sx150x_install_irq_chip(struct sx150x_chip *chip,
-				   int irq_base)
+static int sx150x_install_irq_chip(struct sx150x_chip *chip)
 {
 	int err;
 
-	chip->irq_base    = irq_base;
-
 	/* Add gpio chip to irq subsystem */
 	err = gpiochip_irqchip_add(&chip->gpio_chip,
-		&chip->irq_chip, chip->irq_base,
+		&chip->irq_chip, 0,
 		handle_edge_irq, IRQ_TYPE_EDGE_BOTH);
 	if (err) {
 		dev_err(&chip->client->dev,
@@ -710,10 +700,6 @@ static int sx150x_install_irq_chip(struct sx150x_chip *chip,
 			chip->client->irq, NULL, sx150x_irq_thread_fn,
 			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_FALLING,
 			chip->irq_chip.name, chip);
-	if (err < 0) {
-		chip->irq_base    = -1;
-	}
-
 	return err;
 }
 
@@ -748,8 +734,7 @@ static int sx150x_probe(struct i2c_client *client,
 		return rc;
 
 	if (client->irq) {
-		rc = sx150x_install_irq_chip(chip,
-					pdata->irq_base);
+		rc = sx150x_install_irq_chip(chip);
 		if (rc < 0)
 			return rc;
 	}
-- 
2.5.5

