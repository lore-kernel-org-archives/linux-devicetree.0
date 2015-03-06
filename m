From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Fri, 6 Mar 2015 12:55:12 +0100
Message-ID: <CACRpkdbqioAreyDwM2JN87=gH20n1OkUXPjdkW885iDWUV1NnA@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424744104-14151-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

> Add a driver for the pin controller present on the IMG Pistachio SoC.
> This driver provides pinmux and pinconfig operations as well as GPIO
> and IRQ chips for the GPIO banks.
>
> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>

(...)
> +static inline u32 pctl_readl(struct pistachio_pinctrl *pctl, u32 reg)
> +{
> +       return readl(pctl->base + reg);
> +}
> +
> +static inline void pctl_writel(struct pistachio_pinctrl *pctl, u32 val, u32 reg)
> +{
> +       writel(val, pctl->base + reg);
> +}
> +
> +static inline u32 gpio_readl(struct pistachio_gpio_bank *bank, u32 reg)
> +{
> +       return readl(bank->base + reg);
> +}
> +
> +static inline void gpio_writel(struct pistachio_gpio_bank *bank, u32 val,
> +                              u32 reg)
> +{
> +       writel(val, bank->base + reg);
> +}

I don't see the point of these special readl/writel accessors. Just
use readl/writel
directly. Or consider readl/writel_relaxed() if MIPS has this.

> +static inline void gpio_mask_writel(struct pistachio_gpio_bank *bank,
> +                                   u32 reg, unsigned int bit, u32 val)
> +{
> +       gpio_writel(bank, (0x10000 | val) << bit, reg);
> +}

Magic mask? Some comment on what is happening here when OR:in
on 0x10000?

(...)
> +static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct pistachio_gpio_bank *bank = gc_to_bank(chip);
> +
> +       if (gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset))
> +               return GPIOF_DIR_OUT;
> +       return GPIOF_DIR_IN;
> +}

These flags are not for the driver API.

Do this:

return !gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset));

> +static void pistachio_gpio_set(struct gpio_chip *chip, unsigned offset,
> +                              int value)
> +{
> +       struct pistachio_gpio_bank *bank = gc_to_bank(chip);
> +
> +       gpio_mask_writel(bank, GPIO_OUTPUT, offset, !!value);
> +}

Hm we should clamp value in the core and make the parameter "value"
a bool.... sigh for another day when things are calm.

(...)
> +static void pistachio_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_get_handler_data(irq);
> +       struct pistachio_gpio_bank *bank = gc_to_bank(gc);
> +       struct irq_chip *chip = irq_get_chip(irq);
> +       unsigned long pending;
> +       unsigned int pin, virq;

Don't call it virq, just call it irq. All Linux irq numbers are virtual
so just go with irq.

> +
> +       chained_irq_enter(chip, desc);
> +       pending = gpio_readl(bank, GPIO_INTERRUPT_STATUS) &
> +               gpio_readl(bank, GPIO_INTERRUPT_EN);
> +       for_each_set_bit(pin, &pending, 16) {
> +               virq = irq_linear_revmap(gc->irqdomain, pin);
> +               generic_handle_irq(virq);
> +       }
> +       chained_irq_exit(chip, desc);
> +}

(...)
> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
> +{
> +       struct device_node *child, *node = pctl->dev->of_node;
> +       struct pistachio_gpio_bank *bank;
> +       unsigned int i = 0;
> +       int irq, ret = 0;
> +
> +       for_each_child_of_node(node, child) {
> +               if (!of_find_property(child, "gpio-controller", NULL))
> +                       continue;

So why not instead specify "simple-bus" as compatible on the parent node
and have each subnode be its own device (simple-bus will spawn platform
devices for all subnodes).

Overall this composite-device pattern is discouraged if we can instead have
unique devices for each bank.

Apart from these things the driver looks very nice!

Yours,
Linus Walleij
