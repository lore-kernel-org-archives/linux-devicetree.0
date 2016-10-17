From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/13] gpio-sx150x: Remove 'irq_summary' parameter
Date: Mon, 17 Oct 2016 07:26:57 -0700
Message-ID: <1476714428-11264-3-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Information conveyed by 'irq_summary' paramter can be obtained from
struct i2c_client's irq field. Remove any uses of the former and replace
it with the latter.

Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-sx150x.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index f9d6bec..e80c115 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -105,12 +105,6 @@ struct sx150x_device_data {
  *               the polarity of that IO line, while clearing it results
  *               in normal polarity. For chips with fewer than 16 IO pins,
  *               high-end bits are ignored.
- * @irq_summary: The 'summary IRQ' line to which the GPIO expander's INT line
- *               is connected, via which it reports interrupt events
- *               across all GPIO lines.  This must be a real,
- *               pre-existing IRQ line.
- *               Setting this value < 0 disables the irq_chip functionality
- *               of the driver.
  * @irq_base: The first 'virtual IRQ' line at which our block of GPIO-based
  *            IRQ lines will appear.  Similarly to gpio_base, the expander
  *            will create a block of irqs beginning at this number.
@@ -124,7 +118,6 @@ struct sx150x_platform_data {
 	u16      io_pullup_ena;
 	u16      io_pulldn_ena;
 	u16      io_polarity;
-	int      irq_summary;
 	unsigned irq_base;
 	bool     reset_during_probe;
 };
@@ -133,7 +126,6 @@ struct sx150x_chip {
 	struct gpio_chip                 gpio_chip;
 	struct i2c_client               *client;
 	const struct sx150x_device_data *dev_cfg;
-	int                              irq_summary;
 	int                              irq_base;
 	int				 irq_update;
 	u32                              irq_sense;
@@ -598,7 +590,6 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->irq_chip.irq_set_type        = sx150x_irq_set_type;
 	chip->irq_chip.irq_bus_lock        = sx150x_irq_bus_lock;
 	chip->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
-	chip->irq_summary                  = -1;
 	chip->irq_base                     = -1;
 	chip->irq_masked                   = ~0;
 	chip->irq_sense                    = 0;
@@ -699,12 +690,10 @@ static int sx150x_init_hw(struct sx150x_chip *chip,
 }
 
 static int sx150x_install_irq_chip(struct sx150x_chip *chip,
-				int irq_summary,
-				int irq_base)
+				   int irq_base)
 {
 	int err;
 
-	chip->irq_summary = irq_summary;
 	chip->irq_base    = irq_base;
 
 	/* Add gpio chip to irq subsystem */
@@ -718,11 +707,10 @@ static int sx150x_install_irq_chip(struct sx150x_chip *chip,
 	}
 
 	err = devm_request_threaded_irq(&chip->client->dev,
-			irq_summary, NULL, sx150x_irq_thread_fn,
+			chip->client->irq, NULL, sx150x_irq_thread_fn,
 			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_FALLING,
 			chip->irq_chip.name, chip);
 	if (err < 0) {
-		chip->irq_summary = -1;
 		chip->irq_base    = -1;
 	}
 
@@ -759,9 +747,8 @@ static int sx150x_probe(struct i2c_client *client,
 	if (rc)
 		return rc;
 
-	if (pdata->irq_summary >= 0) {
+	if (client->irq) {
 		rc = sx150x_install_irq_chip(chip,
-					pdata->irq_summary,
 					pdata->irq_base);
 		if (rc < 0)
 			return rc;
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
