From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 6/9] pinctrl: meson: add support for GPIO interrupts
Date: Sat, 10 Jun 2017 23:58:39 +0200
Message-ID: <442efc75-f67c-38b8-8ee9-7e97e4107699@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
v6:
- no changes
v7:
- remove IRQ_TYPE_EDGE_BOTH support for now as it requires a
  somehwat hacky workaround
- smaller refactorings
---
 drivers/pinctrl/Kconfig               |   1 +
 drivers/pinctrl/meson/pinctrl-meson.c | 176 +++++++++++++++++++++++++++++++++-
 2 files changed, 176 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3c3c9d94..8bb99d5a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -167,6 +167,7 @@ config PINCTRL_MESON
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 	select REGMAP_MMIO
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 66ed70c1..454048d2 100644
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
@@ -497,6 +499,160 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(bit));
 }
 
+static struct meson_pinctrl *meson_gpio_data_to_pc(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	return gpiochip_get_data(chip);
+}
+
+static int meson_gpio_bank_hwirq(struct meson_bank *bank, unsigned int offset)
+{
+	int hwirq;
+
+	if (bank->irq_first < 0)
+		/* this bank cannot generate irqs */
+		return -ENOENT;
+
+	hwirq = offset - bank->first + bank->irq_first;
+
+	if (hwirq > bank->irq_last)
+		return  -EINVAL;
+
+	return hwirq;
+}
+
+static int meson_gpio_to_hwirq(struct irq_data *data)
+{
+	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
+	unsigned int offset = data->hwirq + pc->data->pin_base;
+	struct meson_bank *bank;
+	int hwirq, ret;
+
+	ret = meson_get_bank(pc, offset, &bank);
+	if (ret)
+		return ret;
+
+	hwirq = meson_gpio_bank_hwirq(bank, offset);
+	if (hwirq < 0)
+		dev_dbg(pc->dev, "no interrupt for pin %u\n", offset);
+
+	return hwirq;
+}
+
+static void meson_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_data *gpio_irq_data = irq_desc_get_handler_data(desc);
+
+	chained_irq_enter(chip, desc);
+
+	if (gpio_irq_data)
+		generic_handle_irq(gpio_irq_data->irq);
+
+	chained_irq_exit(chip, desc);
+}
+
+static void meson_gpio_irq_unmask(struct irq_data *data) {}
+static void meson_gpio_irq_mask(struct irq_data *data) {}
+
+static unsigned int meson_gpio_irq_startup(struct irq_data *data)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+	int irq = irq_find_mapping(meson_pinctrl_irq_domain, 2 * hwirq);
+
+	irq_set_chained_handler_and_data(irq, meson_gpio_irq_handler, data);
+
+	return 0;
+}
+
+static void meson_gpio_irq_shutdown(struct irq_data *data)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+	int irq = irq_find_mapping(meson_pinctrl_irq_domain, 2 * hwirq);
+
+	irq_set_chained_handler_and_data(irq, handle_bad_irq, NULL);
+}
+
+static int meson_gpio_create_irq(struct irq_data *data, int hwirq)
+{
+	struct irq_fwspec fwspec;
+
+	fwspec.fwnode = meson_pinctrl_irq_domain->fwnode;
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
+	fwspec.param[1] = IRQ_TYPE_NONE;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
+static void meson_gpio_delete_irq(int hwirq)
+{
+	int irq = irq_find_mapping(meson_pinctrl_irq_domain, hwirq);
+
+	irq_dispose_mapping(irq);
+}
+
+static int meson_gpio_irq_reqres(struct irq_data *data)
+{
+	int irq, hwirq, ret;
+
+	hwirq = meson_gpio_to_hwirq(data);
+	if (hwirq < 0)
+		return hwirq;
+
+	ret = gpiochip_irq_reqres(data);
+	if (ret)
+		return ret;
+	/*
+	 * In case of IRQ_TYPE_EDGE_BOTH we need two parent interrupts,
+	 * one for each edge. That's due to HW constraints.
+	 * Future extension:
+	 * Use format 2 * GPIO_HWIRQ +(0|1) for the hwirq, so we can have
+	 * one GPIO_HWIRQ twice and derive the GPIO_HWIRQ from hwirq by
+	 * shifting hwirq one bit to the right.
+	 * In preperation of this extension use format 2 * GPIO_HWIRQ already.
+	 */
+	irq = meson_gpio_create_irq(data, 2 * hwirq);
+	if (!irq) {
+		gpiochip_irq_relres(data);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void meson_gpio_irq_relres(struct irq_data *data)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+
+	meson_gpio_delete_irq(2 * hwirq);
+	gpiochip_irq_relres(data);
+}
+
+static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	int hwirq = meson_gpio_to_hwirq(data);
+	int irq = irq_find_mapping(meson_pinctrl_irq_domain, 2 * hwirq);
+
+	/* not supported due to hardware constraints */
+	if (type == IRQ_TYPE_EDGE_BOTH)
+		return -EINVAL;
+
+        return irq_set_irq_type(irq, type);
+}
+
+static struct irq_chip meson_gpio_irq_chip = {
+        .name = "GPIO",
+        .irq_set_type = meson_gpio_irq_set_type,
+        .irq_mask = meson_gpio_irq_mask,
+        .irq_unmask = meson_gpio_irq_unmask,
+        .irq_startup = meson_gpio_irq_startup,
+        .irq_shutdown = meson_gpio_irq_shutdown,
+        .irq_request_resources = meson_gpio_irq_reqres,
+        .irq_release_resources = meson_gpio_irq_relres,
+};
+
 static const struct of_device_id meson_pinctrl_dt_match[] = {
 	{
 		.compatible = "amlogic,meson8-cbus-pinctrl",
@@ -558,7 +714,8 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 		return ret;
 	}
 
-	return 0;
+	return gpiochip_irqchip_add(&pc->chip, &meson_gpio_irq_chip, 0,
+				    handle_simple_irq, IRQ_TYPE_NONE);
 }
 
 static struct regmap_config meson_regmap_config = {
@@ -637,6 +794,23 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
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
2.13.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
