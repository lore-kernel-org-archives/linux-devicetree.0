From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 1/3] pinctrl: stm32: set pin to gpio input when used as interrupt
Date: Mon, 29 May 2017 18:17:31 +0200
Message-ID: <1496074653-2941-2-git-send-email-alexandre.torgue@st.com>
References: <1496074653-2941-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496074653-2941-1-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch ensures that pin is correctly set as gpio input when it is used
as an interrupt.

Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index d3c5f5d..5a15c7d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -219,12 +219,41 @@ static int stm32_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	.to_irq			= stm32_gpio_to_irq,
 };
 
+static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
+{
+	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	int ret;
+
+	ret = stm32_gpio_direction_input(&bank->gpio_chip, irq_data->hwirq);
+	if (ret)
+		return ret;
+
+	ret = gpiochip_lock_as_irq(&bank->gpio_chip, irq_data->hwirq);
+	if (ret) {
+		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
+			irq_data->hwirq);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
+{
+	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
+
+	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
+}
+
 static struct irq_chip stm32_gpio_irq_chip = {
 	.name           = "stm32gpio",
 	.irq_eoi	= irq_chip_eoi_parent,
 	.irq_mask       = irq_chip_mask_parent,
 	.irq_unmask     = irq_chip_unmask_parent,
 	.irq_set_type   = irq_chip_set_type_parent,
+	.irq_request_resources = stm32_gpio_irq_request_resources,
+	.irq_release_resources = stm32_gpio_irq_release_resources,
 };
 
 static int stm32_gpio_domain_translate(struct irq_domain *d,
@@ -248,15 +277,6 @@ static void stm32_gpio_domain_activate(struct irq_domain *d,
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 
 	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_nr);
-	gpiochip_lock_as_irq(&bank->gpio_chip, irq_data->hwirq);
-}
-
-static void stm32_gpio_domain_deactivate(struct irq_domain *d,
-				       struct irq_data *irq_data)
-{
-	struct stm32_gpio_bank *bank = d->host_data;
-
-	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
 }
 
 static int stm32_gpio_domain_alloc(struct irq_domain *d,
@@ -285,7 +305,6 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	.alloc          = stm32_gpio_domain_alloc,
 	.free           = irq_domain_free_irqs_common,
 	.activate	= stm32_gpio_domain_activate,
-	.deactivate	= stm32_gpio_domain_deactivate,
 };
 
 /* Pinctrl functions */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
