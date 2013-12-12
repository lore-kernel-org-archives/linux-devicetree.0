From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/2] gpio: davinci: reuse for Keystone SoC
Date: Thu, 12 Dec 2013 20:12:53 +0200
Message-ID: <1386871973-26762-3-git-send-email-grygorii.strashko@ti.com>
References: <1386871973-26762-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386871973-26762-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The similar GPIO HW block is used by keystone SoCs as
in Davinci SoCs.
Hence, reuse Davinci GPIO driver for Keystone taking into
account that Keystone contains ARM GIC IRQ controller which
is implemented using IRQ Chip.

Documentation:
	http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf

CC: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
CC: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt      |    4 +-
 drivers/gpio/gpio-davinci.c                        |   49 +++++++++++++++-----
 2 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index a2e839d..4ce9862 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -1,7 +1,7 @@
-Davinci GPIO controller bindings
+Davinci/Keystone GPIO controller bindings
 
 Required Properties:
-- compatible: should be "ti,dm6441-gpio"
+- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 73f65ca..3e44e0c 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -413,6 +413,27 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
 	.xlate = irq_domain_xlate_onetwocell,
 };
 
+static struct irq_chip *davinci_gpio_get_irq_chip(unsigned int irq)
+{
+	static struct irq_chip_type gpio_unbanked;
+
+	gpio_unbanked = *container_of(irq_get_chip(irq),
+				      struct irq_chip_type, chip);
+
+	return &gpio_unbanked.chip;
+};
+
+static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
+{
+	static struct irq_chip gpio_unbanked;
+
+	gpio_unbanked = *irq_get_chip(irq);
+	pr_err("keystone_gpio_get_irq_chip\n");
+	return &gpio_unbanked;
+};
+
+static const struct of_device_id davinci_gpio_ids[];
+
 /*
  * NOTE:  for suspend/resume, probably best to make a platform_device with
  * suspend_late/resume_resume calls hooking into results of the set_wake()
@@ -433,6 +454,15 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	struct davinci_gpio_platform_data *pdata = dev->platform_data;
 	struct davinci_gpio_regs __iomem *g;
 	struct irq_domain	*irq_domain = NULL;
+	const struct of_device_id *match;
+	struct irq_chip *irq_chip;
+	struct irq_chip *(*gpio_get_irq_chip)(unsigned int irq);
+
+	gpio_get_irq_chip = davinci_gpio_get_irq_chip;
+	match = of_match_device(of_match_ptr(davinci_gpio_ids),
+				dev);
+	if (match)
+		gpio_get_irq_chip = match->data;
 
 	ngpio = pdata->ngpio;
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
@@ -442,7 +472,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	}
 
 	bank_irq = res->start;
-
 	if (!bank_irq) {
 		dev_err(dev, "Invalid IRQ resource\n");
 		return -ENODEV;
@@ -484,25 +513,22 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	}
 
 	/*
-	 * AINTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
+	 * INTC can handle direct/unbanked IRQs for GPIOs, with the GPIO
 	 * controller only handling trigger modes.  We currently assume no
 	 * IRQ mux conflicts; gpio_irq_type_unbanked() is only for GPIOs.
 	 */
 	if (pdata->gpio_unbanked) {
-		static struct irq_chip_type gpio_unbanked;
-
 		/* pass "bank 0" GPIO IRQs to AINTC */
 		chips[0].chip.to_irq = gpio_to_irq_unbanked;
 		chips[0].gpio_irq = bank_irq;
 		chips[0].gpio_unbanked = pdata->gpio_unbanked;
 		binten = BIT(0);
 
-		/* AINTC handles mask/unmask; GPIO handles triggering */
+		/* INTC handles mask/unmask; GPIO handles triggering */
 		irq = bank_irq;
-		gpio_unbanked = *container_of(irq_get_chip(irq),
-					      struct irq_chip_type, chip);
-		gpio_unbanked.chip.name = "GPIO-AINTC";
-		gpio_unbanked.chip.irq_set_type = gpio_irq_type_unbanked;
+		irq_chip = gpio_get_irq_chip(irq);
+		irq_chip->name = "GPIO-AINTC";
+		irq_chip->irq_set_type = gpio_irq_type_unbanked;
 
 		/* default trigger: both edges */
 		g = gpio2regs(0);
@@ -511,7 +537,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 
 		/* set the direct IRQs up to use that irqchip */
 		for (gpio = 0; gpio < pdata->gpio_unbanked; gpio++, irq++) {
-			irq_set_chip(irq, &gpio_unbanked.chip);
+			irq_set_chip(irq, irq_chip);
 			irq_set_handler_data(irq, &chips[gpio / 32]);
 			irq_set_status_flags(irq, IRQ_TYPE_EDGE_BOTH);
 		}
@@ -554,7 +580,8 @@ done:
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id davinci_gpio_ids[] = {
-	{ .compatible = "ti,dm6441-gpio", },
+	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
+	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
