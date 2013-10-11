From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Fri, 11 Oct 2013 15:49:04 +0200
Message-ID: <CACRpkdYH+q-MRa_VW9_+cq8y70L3LcOh9QfZPAKmCePEyr64mg@mail.gmail.com>
References: <1380797055-17237-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380797055-17237-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh.linux@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Tien Hock Loh <thloh@altera.com>, lftan@altera.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2013 at 12:44 PM,  <thloh.linux@gmail.com> wrote:

> From: Tien Hock Loh <thloh@altera.com>
>
> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>
> Signed-off-by: Tien Hock Loh <thloh@altera.com>
> ---
>  .../devicetree/bindings/gpio/gpio-altera.txt       |  34 ++

This driver adds device tree bindings and need to be CC:
devicetree@vger.kernel.org
on subsequent postings.

It will not be merged until a DT person ACKs it.

> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> @@ -0,0 +1,34 @@
> +Altera GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "altr,pio-1.0"
> +- reg: Physical base address and length of the controller's registers.
> +- #gpio-cells : Should be 1
> +  - first cell is the gpio offset number
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- #interrupt-cells : Should be 1.
> +- interrupts: Specify the interrupt.
> +- interrupt-controller: Mark the device node as an interrupt controller
> +  The first cell is the local interrupt offset number to the GPIO controller.
> +
> +Altera GPIO specific properties:
> +- width: Width of the GPIO bank, range from 1-32
> +- interrupt_trigger: Specifies the interrupt trigger type the GPIO hardware is
> +  synthesized. This field is required if the Altera GPIO controller used has
> +  IRQ enabled as the interrupt type is not software controlled, but hardware
> +  synthesized.

Ah yeah I remember this thing! :-)

(...)
> +static int altera_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +       struct altera_gpio_chip *altera_gc = container_of(mm_gc,
> +                               struct altera_gpio_chip, mmchip);
> +
> +       if (altera_gc->irq == 0)
> +               return -ENXIO;

Just write it like this:
if (!altera_gc->irq)

> +       if ((altera_gc->irq && offset) < altera_gc->mmchip.gc.ngpio)

This makes no sense. && is boolean logical AND. The expression
to the left of "<" will be 0 or 1.

> +               return irq_create_mapping(altera_gc->irq, offset);
> +       else
> +               return -ENXIO;
> +}
(...)

> +
> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +       struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
> +       unsigned long status;
> +
> +       int base;

Do you have to call this variable "base"? It's quite confusing for me,
can't you just call it "i"?

> +int altera_gpio_probe(struct platform_device *pdev)
> +{
(...)
> +       struct device_node *node = pdev->dev.of_node;
> +       if (of_get_property(node, "interrupts", &reg) == NULL)
> +               goto skip_irq;
> +       altera_gc->mapped_irq = irq_of_parse_and_map(node, 0);

I think this IRQ has already been added to the pdev as a resource
by the OF core code, and you'r redoing the work of the core here.

Doesn't this work:
irq = platform_get_irq(dev, 0);

?

> +       if (altera_gc->mapped_irq == NO_IRQ)
> +               goto skip_irq;

Do not reference NO_IRQ, it is always 0 these days.

Just do this:
if (!altera_gc->mapped_irq)

Apart from this it is starting to look real good!

Yours,
Linus Walleij
