From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 15/16] pinctrl: samsung: Add GPIO to IRQ translation
Date: Mon, 08 Oct 2012 10:39:15 +0200
Message-ID: <1349685556-23718-16-git-send-email-t.figa@samsung.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

Some drivers require a way to translate GPIO pins to their IRQ numbers.

This patch adds the .to_irq() gpiolib callback to pinctrl-samsung
driver, which creates (if not present yet) and returns an IRQ mapping
for given GPIO pin.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 495b226..8172c1e 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
+#include <linux/irqdomain.h>
 
 #include "core.h"
 #include "pinctrl-samsung.h"
@@ -528,6 +529,23 @@ static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 }
 
 /*
+ * gpiolib gpio_to_irq callback function. Creates a mapping between a GPIO pin
+ * and a virtual IRQ, if not already present.
+ */
+static int samsung_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+{
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned int virq;
+
+	if (!bank->irq_domain)
+		return -ENXIO;
+
+	virq = irq_create_mapping(bank->irq_domain, offset);
+
+	return (virq) ? : -ENXIO;
+}
+
+/*
  * Parse the pin names listed in the 'samsung,pins' property and convert it
  * into a list of gpio numbers are create a pin group from it.
  */
@@ -757,6 +775,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
 	.get = samsung_gpio_get,
 	.direction_input = samsung_gpio_direction_input,
 	.direction_output = samsung_gpio_direction_output,
+	.to_irq = samsung_gpio_to_irq,
 	.owner = THIS_MODULE,
 };
 
-- 
1.7.12
