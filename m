From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 6/9] pinctrl: meson: add support for GPIO interrupts
Date: Tue, 30 May 2017 22:26:48 +0200
Message-ID: <12e8fe0e-d608-f560-9ddb-7287e10d3db2@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <66c57893-0a9e-4f8c-a017-ab346abbdfd0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for GPIO interrupts and make use of the just introduced
irqchip driver handling the GPIO interrupt-controller.

Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v5:
- changed Kconfig entry based on Neil's suggestion
- extended comments
- fixed indentation
---
 drivers/pinctrl/Kconfig               |   1 +
 drivers/pinctrl/meson/pinctrl-meson.c | 170 +++++++++++++++++++++++++++++++++-
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7ae04a97..86834dea 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -166,6 +166,7 @@ config PINCTRL_MESON
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 	select REGMAP_MMIO
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c1..7bacd4e3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -62,6 +62,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-meson.h"
 
+static struct irq_domain *meson_pinctrl_irq_domain;
+
 /**
  * meson_get_bank() - find the bank containing a given pin
  *
@@ -497,6 +499,154 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(bit));
 }
 
+static struct meson_pinctrl *meson_gpio_data_to_pc(struct irq_data *data)
+{
+        struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+        return gpiochip_get_data(chip);
+}
+
+static int meson_gpio_bank_hwirq(struct meson_bank *bank, unsigned int offset)
+{
+        int hwirq;
+
+        if (bank->irq_first < 0)
+                /* this bank cannot generate irqs */
+                return 0;
+
+        hwirq = offset - bank->first + bank->irq_first;
+
+        if (hwirq > bank->irq_last)
+                /* this pin cannot generate irqs */
+                return 0;
+
+        return hwirq;
+}
+
+static int meson_gpio_to_hwirq(struct irq_data *data)
+{
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	unsigned int offset = data->hwirq;
+        struct meson_bank *bank;
+        int hwirq, ret;
+
+        offset += pc->data->pin_base;
+
+        ret = meson_get_bank(pc, offset, &bank);
+        if (ret)
+                return ret;
+
+        hwirq = meson_gpio_bank_hwirq(bank, offset);
+        if (!hwirq)
+                dev_dbg(pc->dev, "no interrupt for pin %u\n", offset);
+
+        return hwirq;
+}
+
+static void meson_gpio_irq_handler(struct irq_desc *desc)
+{
+        struct irq_chip *chip = irq_desc_get_chip(desc);
+        struct irq_data *gpio_irq_data = irq_desc_get_handler_data(desc);
+
+        chained_irq_enter(chip, desc);
+
+        if (gpio_irq_data)
+                generic_handle_irq(gpio_irq_data->irq);
+
+        chained_irq_exit(chip, desc);
+}
+
+static void meson_gpio_irq_unmask(struct irq_data *data) {}
+static void meson_gpio_irq_mask(struct irq_data *data) {}
+
+static void meson_gpio_irq_shutdown(struct irq_data *data)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+	int irq;
+
+	if (hwirq <= 0)
+		return;
+
+	/*
+	 * In case of IRQ_TYPE_EDGE_BOTH we need two parent interrupts,
+	 * one for each edge. That's due to HW constraints.
+	 * We use format 2 * GPIO_HWIRQ +(0|1) for the hwirq, so we can
+	 * have one GPIO_HWIRQ twice and derive the GPIO_HWIRQ from hwirq
+	 * by shifting hwirq one bit to the right.
+	 */
+	irq = irq_find_mapping(meson_pinctrl_irq_domain, hwirq * 2);
+	if (irq) {
+		irq_set_chained_handler_and_data(irq, handle_bad_irq, NULL);
+		irq_domain_free_irqs(irq, 1);
+	}
+
+	irq = irq_find_mapping(meson_pinctrl_irq_domain, hwirq * 2 + 1);
+	if (irq) {
+		irq_set_chained_handler_and_data(irq, handle_bad_irq, NULL);
+		irq_domain_free_irqs(irq, 1);
+	}
+}
+
+static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+	struct irq_fwspec fwspec;
+        int irq, irq2, num_slots;
+
+	if (irqd_is_activated(data))
+		return -EBUSY;
+
+	if (hwirq < 0)
+		return hwirq;
+
+	if (!hwirq)
+		return -ENXIO;
+
+	fwspec.fwnode = meson_pinctrl_irq_domain->fwnode;
+	fwspec.param_count = 2;
+
+	/*
+	 * The chip can create an interrupt for either rising or falling edge
+	 * only. Therefore use two interrupts in case of IRQ_TYPE_EDGE_BOTH,
+	 * first for falling edge and second one for rising edge.
+	 */
+	num_slots = (type == IRQ_TYPE_EDGE_BOTH) ? 2 : 1;
+
+	/* see comment in meson_gpio_irq_shutdown why we shift one bit here */
+	fwspec.param[0] = hwirq << 1;
+	if (num_slots == 1)
+		fwspec.param[1] = type;
+	else
+		fwspec.param[1] = IRQ_TYPE_EDGE_FALLING;
+
+	irq = irq_create_fwspec_mapping(&fwspec);
+	if (!irq)
+		return -EINVAL;
+
+	irq_set_chained_handler_and_data(irq, meson_gpio_irq_handler, data);
+
+	if (num_slots > 1) {
+		fwspec.param[0]++;
+		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+		irq2 = irq_create_fwspec_mapping(&fwspec);
+		if (!irq2) {
+			irq_domain_free_irqs(irq, 1);
+			return -EINVAL;
+		}
+		irq_set_chained_handler_and_data(irq2, meson_gpio_irq_handler, data);
+	}
+
+        return 0;
+}
+
+static struct irq_chip meson_gpio_irq_chip = {
+        .name = "GPIO",
+        .irq_set_type = meson_gpio_irq_set_type,
+        .irq_mask = meson_gpio_irq_mask,
+        .irq_unmask = meson_gpio_irq_unmask,
+        .irq_shutdown = meson_gpio_irq_shutdown,
+};
+
 static const struct of_device_id meson_pinctrl_dt_match[] = {
 	{
 		.compatible = "amlogic,meson8-cbus-pinctrl",
@@ -558,7 +708,8 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 		return ret;
 	}
 
-	return 0;
+	return gpiochip_irqchip_add(&pc->chip, &meson_gpio_irq_chip, 0,
+				    handle_simple_irq, IRQ_TYPE_NONE);
 }
 
 static struct regmap_config meson_regmap_config = {
@@ -637,6 +788,23 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 		return PTR_ERR(pc->reg_gpio);
 	}
 
+	if (!meson_pinctrl_irq_domain) {
+		np = of_find_compatible_node(NULL, NULL, "amlogic,meson-gpio-intc");
+		if (!np) {
+			dev_err(pc->dev, "interrupt controller DT node not found\n");
+			return -EINVAL;
+		}
+
+		meson_pinctrl_irq_domain = irq_find_host(np);
+		if (!meson_pinctrl_irq_domain) {
+			dev_err(pc->dev, "interrupt controller not found\n");
+			of_node_put(np);
+			return -EINVAL;
+		}
+
+		of_node_put(np);
+	}
+
 	return 0;
 }
 
-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
