From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pintrl: meson: add support for GPIO interrupts
Date: Thu, 11 May 2017 17:10:36 +0200
Message-ID: <CACRpkdYS6Ce7jhjm8MG-QHKgDnh9jhs6gFS8A-ARgOxJ=xh_Yw@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com> <e0fd5c2a-ef88-6c09-63d4-67a54091b9a7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <e0fd5c2a-ef88-6c09-63d4-67a54091b9a7@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 7, 2017 at 6:34 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Add support for GPIO interrupts on Amlogic Meson SoC's.
>
> There's a limit of 8 parent interupts which can be used in total.
> Note that IRQ_TYPE_EDGE_BOTH interrupts reserve two parent IRQ's,
> one for each edge.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

(..)
>         select GPIOLIB
> +       select GPIOLIB_IRQCHIP

This is nice.

> +static int meson_gpio_to_hwirq(struct meson_bank *bank, unsigned int offset)
> +{
> +       int hwirq;
> +
> +       if (bank->irq_first < 0)
> +               /* this bank cannot generate irqs */
> +               return -EINVAL;
> +
> +       hwirq = offset - bank->first + bank->irq_first;
> +
> +       if (hwirq > bank->irq_last)
> +               /* this pin cannot generate irqs */
> +               return -EINVAL;
> +
> +       return hwirq;
> +}

So this is the kind of stuff I want the gpiolib core to handle. We
cant just proliferate
hundreds of drivers to bank-to-irq mappings of cascaded IRQs.

> +static int meson_gpio_alloc_irq_slot(struct irq_data *data, int num_slots,
> +                                    int *slots)
> +{
> +       int i, cnt = 0;
> +
> +       mutex_lock(&meson_gpio_irq_slot_mutex);
> +
> +       for (i = 0; i < meson_gpio_num_irq_slots; i++)
> +               if (!meson_gpio_irq_slots[i].owner) {
> +                       meson_gpio_irq_slots[i].owner = data->irq;
> +                       slots[cnt++] = i;
> +                       if (cnt == num_slots)
> +                               break;
> +               }
> +
> +       if (cnt < num_slots)
> +               for (i = 0; i < cnt; i++)
> +                       meson_gpio_irq_slots[i].owner = 0;
> +
> +       mutex_unlock(&meson_gpio_irq_slot_mutex);
> +
> +       return cnt == num_slots ? 0 : -ENOSPC;
> +}

I don't understand what is happening here but it looks like a hierarchical
IRQ domain.

> +static int meson_gpio_irq_request_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       unsigned gpio = irqd_to_hwirq(data);
> +
> +       return gpiochip_lock_as_irq(chip, gpio);
> +}
> +
> +static void meson_gpio_irq_release_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       unsigned gpio = irqd_to_hwirq(data);
> +
> +       meson_gpio_free_irq_slot(data);
> +       gpiochip_unlock_as_irq(chip, gpio);
> +}

Nice that you implemented this though.

> +static void meson_gpio_set_hwirq(int idx, int hwirq)
> +{
> +       int reg = idx > 3 ? REG_PIN_47_SEL : REG_PIN_03_SEL;
> +       int shift = 8 * (idx % 4);
> +
> +       regmap_update_bits(meson_gpio_irq_regmap, reg, 0xff << shift,
> +                          hwirq << shift);
> +}

So you program the hardware to route the IRQ, OK.

> +static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +{
(...)
> +       for (i = 0; i < num_slots; i++) {
> +               irq = meson_gpio_irq_slots[slots[i]].irq;
> +               ret = irq_set_irq_type(irq, val);
> +               if (ret)
> +                       break;
> +               ret = request_irq(irq, meson_gpio_irq_handler, 0,
> +                                 "GPIO parent", data);
> +               if (ret)
> +                       break;

Issueing request_irq() inside .set_type() is definately wrong.

You want to do chained or nested IRQs for this, possible hierarchical
as well.

> +       return gpiochip_irqchip_add(&pc->chip, &pc->irq_chip, 0,
> +                                   handle_simple_irq, IRQ_TYPE_NONE);

gpiochip_irqchip_add() should be followed by
gpiochip_set_chained_irqchip() or gpiochip_set_nested_irqchip().

Else we are not providing the helpers you need.

Which I guess is the case.

I'm a bit confused, I think we need a better understanding of how the
hardware works.

Is it a chained interrupt handler where you can select a number of
GPIOs in each bank to cascade IRQs off?

Yours,
Linus Walleij
