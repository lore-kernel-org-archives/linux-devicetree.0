From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Fri, 6 Mar 2015 10:51:53 -0800
Message-ID: <CAL1qeaHzpi3_PNpxnLOf=b8d2n5DrRrnB_yiZFHpiP8C7b0hSg@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-3-git-send-email-abrestic@chromium.org>
	<CACRpkdbqioAreyDwM2JN87=gH20n1OkUXPjdkW885iDWUV1NnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbqioAreyDwM2JN87=gH20n1OkUXPjdkW885iDWUV1NnA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 3:55 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
> <abrestic@chromium.org> wrote:
>
>> Add a driver for the pin controller present on the IMG Pistachio SoC.
>> This driver provides pinmux and pinconfig operations as well as GPIO
>> and IRQ chips for the GPIO banks.
>>
>> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
>> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>
> (...)
>> +static inline u32 pctl_readl(struct pistachio_pinctrl *pctl, u32 reg)
>> +{
>> +       return readl(pctl->base + reg);
>> +}
>> +
>> +static inline void pctl_writel(struct pistachio_pinctrl *pctl, u32 val, u32 reg)
>> +{
>> +       writel(val, pctl->base + reg);
>> +}
>> +
>> +static inline u32 gpio_readl(struct pistachio_gpio_bank *bank, u32 reg)
>> +{
>> +       return readl(bank->base + reg);
>> +}
>> +
>> +static inline void gpio_writel(struct pistachio_gpio_bank *bank, u32 val,
>> +                              u32 reg)
>> +{
>> +       writel(val, bank->base + reg);
>> +}
>
> I don't see the point of these special readl/writel accessors. Just
> use readl/writel
> directly. Or consider readl/writel_relaxed() if MIPS has this.

I actually find these useful for tracing MMIO accesses within a driver
and it seems many other drivers do this too.  I can drop them though
if you'd prefer.

>> +static inline void gpio_mask_writel(struct pistachio_gpio_bank *bank,
>> +                                   u32 reg, unsigned int bit, u32 val)
>> +{
>> +       gpio_writel(bank, (0x10000 | val) << bit, reg);
>> +}
>
> Magic mask? Some comment on what is happening here when OR:in
> on 0x10000?

Sure.

> (...)
>> +static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct pistachio_gpio_bank *bank = gc_to_bank(chip);
>> +
>> +       if (gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset))
>> +               return GPIOF_DIR_OUT;
>> +       return GPIOF_DIR_IN;
>> +}
>
> These flags are not for the driver API.
>
> Do this:
>
> return !gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset));

Ok.

> (...)
>> +static void pistachio_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>> +{
>> +       struct gpio_chip *gc = irq_get_handler_data(irq);
>> +       struct pistachio_gpio_bank *bank = gc_to_bank(gc);
>> +       struct irq_chip *chip = irq_get_chip(irq);
>> +       unsigned long pending;
>> +       unsigned int pin, virq;
>
> Don't call it virq, just call it irq. All Linux irq numbers are virtual
> so just go with irq.

Ok.

> (...)
>> +static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>> +{
>> +       struct device_node *child, *node = pctl->dev->of_node;
>> +       struct pistachio_gpio_bank *bank;
>> +       unsigned int i = 0;
>> +       int irq, ret = 0;
>> +
>> +       for_each_child_of_node(node, child) {
>> +               if (!of_find_property(child, "gpio-controller", NULL))
>> +                       continue;
>
> So why not instead specify "simple-bus" as compatible on the parent node
> and have each subnode be its own device (simple-bus will spawn platform
> devices for all subnodes).
>
> Overall this composite-device pattern is discouraged if we can instead have
> unique devices for each bank.

I think there's an issue here though if some other device probes
between the pinctrl driver and the gpiochip drivers.  Since all these
pins are configured as GPIOs at POR, the pinctrl driver needs to clear
the GPIO enable bit on a pin when enabling a pinmux function for that
pin (see pistachio_pinmux_enable()).  If the gpiochip driver has yet
to probe, attempting to map the pinctrl pin to a GPIO range/pin (via
pinctrl_find_gpio_range_from_pin()) will fail and we won't be able to
disable the GPIO function for that pin.  Also it doesn't look like
there's a good way to tell gpiolib to disable a GPIO form the pinctrl
driver.  Any ideas?  I suppose I could keep the pin-to-GPIO mapping in
the pinctrl driver in addition to expressing it in the DT with
gpio-ranges, but that doesn't seem too nice.

> Apart from these things the driver looks very nice!

Thanks for the review!

-Andrew
