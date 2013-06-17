From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Mon, 17 Jun 2013 08:38:27 +0200
Message-ID: <CACRpkdZZyTDT6mo-3iqRnSSbeJtt4HnVnmkeqoir-UV_8nG0rQ@mail.gmail.com>
References: <1370505910-2102-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1370505910-2102-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Loh Tien Hock <thloh85@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 6, 2013 at 10:05 AM,  <thloh@altera.com> wrote:

> From: Tien Hock Loh <thloh@altera.com>
>
> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board.
>
> Signed-off-by: Tien Hock Loh <thloh@altera.com>
(...)

This is looking much better, some remaining comments.

> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> @@ -0,0 +1,36 @@
> +Altera GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "altr,pio-1.0"

I asked you to add this prefix to
Documentation/devicetree/bindings/vendor-prefixes.txt

> +- reg: Physical base address and length of the controller's registers.
> +- #gpio-cells : Should be 1
> +  - first cell is the gpio offset number
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- #interrupt-cells : Should be 1.
> +- interrupts: Specify the interrupt.
> +- interrupt-controller: Mark the device node as an interrupt controller
> +  The first cell is the GPIO number.

How can that cell be the "GPIO number"? Surely it is the local
interrupt offset number on the GPIO controller?

(...)
> +++ b/drivers/gpio/gpio-altera.c

> +static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +
> +       return (readl(mm_gc->regs + ALTERA_GPIO_DATA) >> offset) & 1;

I usually would write that like this:

#include <linux/bitops.h>

return !!(readl(mm_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));

But no big deal.

> +       gpio_ddr |= (1 << offset);

And with <linux/bitops.h> I would just:

gpio_ddr |= BIT(offset);

> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +       struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
> +       unsigned long status;
> +
> +       int base;
> +       chip->irq_mask(&desc->irq_data);
> +
> +       if (altera_gc->level_trigger) {
> +               status = __raw_readl(mm_gc->regs + ALTERA_GPIO_DATA);
> +               status &= __raw_readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> +
> +               for (base = 0; base < mm_gc->gc.ngpio; base++) {
> +                       if ((1 << base) & status) {
> +                               generic_handle_irq(irq_linear_revmap(
> +                                       altera_gc->irq, base));
> +                       }
> +               }
> +       } else {
> +               while ((status =
> +                       (__raw_readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> +                       __raw_readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> +                       __raw_writel(status,
> +                               mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
> +                       for (base = 0; base < mm_gc->gc.ngpio; base++) {
> +                               if ((1 << base) & status) {
> +                                       generic_handle_irq(irq_linear_revmap(
> +                                               altera_gc->irq, base));
> +                               }
> +                       }
> +               }
> +       }
> +
> +       chip->irq_eoi(irq_desc_get_irq_data(desc));
> +       chip->irq_unmask(&desc->irq_data);
> +}

Why is the above code using __raw_* accessors?

Atleast use readl_relaxed() instead of __raw.

> +       if (of_get_property(node, "interrupts", &reg) == NULL)
> +               goto skip_irq;
> +       altera_gc->hwirq = irq_of_parse_and_map(node, 0);

But wait. How can a hardware IRQ be something coming out
of irq_of_parse_and_map()???

The entire point of mapping an IRQ is to move it into some
free Linux IRQ slot, it is as far away from a HW IRQ you
ever get.

Either rename the variable or rethink what you're doing here.

Yours,
Linus Walleij
