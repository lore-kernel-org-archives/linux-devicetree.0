From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Mon, 20 May 2013 20:02:30 +0200
Message-ID: <CACRpkdaOZn=f7eqAOCw6Fnf=D+ZgrZO2UXitL2UOYixULa2r-w@mail.gmail.com>
References: <1367980740-5716-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367980740-5716-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, thloh85@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, May 8, 2013 at 4:39 AM, Tien Hock Loh <thloh@altera.com> wrote:

> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board.
>
> Signed-off-by: Tien Hock Loh <thloh@altera.com>
(...)

Note: I have come to realize that there is apparently almost zero
review on the devicetree-discuss list, is there anyone in the world
reviewing new device tree bindings for generality, or is it all up to
Linux subsystem maintainers like myself to take care of this?

> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> @@ -0,0 +1,40 @@
> +Altera GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "altr,pio-1.0"

This vendor prefix does not exist in
Documentation/devicetree/bindings/vendor-prefixes.txt
so atleast add it.

I don't see the point in abbreviating "altera" to "altr" to
save two letters, use the full name of the company!

> +- reg: Physical base address and length of the controller's registers.
> +- #gpio-cells : Should be two.
> +  - first cell is the gpio offset number
> +  - second cell is used to specify optional parameters (unused)

So why do you add it? Because all other GPIO controllers
use it? Or because you will use it for something later?

> +- gpio-controller : Marks the device node as a GPIO controller.
> +- #interrupt-cells : Should be 1.
> +- interrupts: Specify the interrupt.
> +- interrupt-controller: Mark the device node as an interrupt controller
> +  The first cell is the GPIO number.
> +Altera GPIO specific properties:
> +- width: Width of the GPIO bank, range from 1-32
> +- level_trigger: Specifies whether the GPIO interrupt is level trigger.
> +  This field is required if the Altera GPIO controller used has IRQ enabled.

Is this how other GPIO controllers do it?

> +  Note: This field is does not specify whether Altera GPIO controller is
> +  level or edge trigger. It is used to detect internally how the trigger is
> +  handled.

I don't get it, but I guess reading the code will. I suspect this
needs editing since DT bindings shall be *reusable* without
having to read the code to understand them.

Explain exactly what you mean when you say it is "used to
detect internally how the trigger is handled". Used how?
Handled how? Internally to what?

> +Note: If the Altera GPIO is set to be built as a module, peripherals that uses
> +Altera GPIO as interrupt-parent should be a module so that the peripheral
> +doesn't get initialized before Altera GPIO is initialized.

Delete this. We do not put Linux-specific information into the
device tree bindings.

(...)
> +++ b/drivers/gpio/gpio-altera.c
(...)
> +#include <linux/platform_device.h>

Suggest
#include <linux/basic_mmio_gpio.h>

> +#define ALTERA_GPIO_DATA               0x0
> +#define ALTERA_GPIO_DIR                        0x4
> +#define ALTERA_GPIO_IRQ_MASK           0x8
> +#define ALTERA_GPIO_EDGE_CAP           0xc
> +#define ALTERA_GPIO_OUTSET             0x10
> +#define ALTERA_GPIO_OUTCLEAR           0x14

Looking at this is is pretty apparent that you shall use
the generic basic MMIO GPIO helper library.

In Kconfig:
select GPIO_GENERIC

Include #include <linux/basic_mmio_gpio.h>

See other GPIO drivers to figure out how to reuse the
generic MMIO GPIO helpers. For example the new
GRGPIO driver, drivers/gpio/gpio-grgpio.c.

> +struct altera_gpio_chip {
> +       struct of_mm_gpio_chip mmchip;
> +       struct irq_domain *irq; /* GPIO controller IRQ number */
> +       spinlock_t gpio_lock;   /* Lock used for synchronization */
> +       bool level_trigger;
> +       int hwirq;
> +};

Convert inline documentation to kerneldoc.
Document the rest of the members as well because
I don't understand them, and the documentation for the
irqdomain is plain wrong, the other comment is
just stating the obvious: tell us *what* is it locking
and *why*.

(...)
> +static int altera_gpio_irq_set_type(struct irq_data *d,
> +                               unsigned int type)
> +{
> +       /* There is no way to know the soft IP configuration,
> +          so we accept any interrupt types that are supported by the soft
> +          IP. Nothing to do here since it is hardware defined. Just return
> +          OK status to the caller. */

Eh what? Why don't you say pass in the capabilities from
the device tree then, if the hardware cannot say what it is
capable of, something else has to.

/*
 * Please use this multiline comment
 * style, it is easier to read.
 */

> +       if (type == IRQ_TYPE_EDGE_RISING ||
> +               type == IRQ_TYPE_EDGE_FALLING ||
> +               type == IRQ_TYPE_EDGE_BOTH ||
> +               type == IRQ_TYPE_NONE) {
> +               return 0;
> +       }

This is not OK if it is unclear whether this is all supported.

Get that info from somewhere.

Apparently this is exactly what the level trigger field in
the device tree defines.

Especially handling both edges is quite tricky, have you
actually tested this?

(...)
> +static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
> +static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
> +static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> +static int altera_gpio_direction_output(struct gpio_chip *gc,
> +               unsigned offset, int value)

These look like they could all use basic_mmio_gpio instead
of being verbatim copies of generic code.

> +static int altera_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
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
> +       if (altera_gc->level_trigger == ALTERA_TRIGGER_LEVEL_HIGH) {
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +       struct altera_gpio_chip *altera_gc = container_of(mm_gc,
> +                               struct altera_gpio_chip, mmchip);
> +
> +       if (altera_gc->irq == 0)
> +               return -ENXIO;
> +       if ((altera_gc->irq && offset) < altera_gc->mmchip.gc.ngpio)
> +               return irq_create_mapping(altera_gc->irq, offset);
> +       else
> +               return -ENXIO;
> +}
> +

So here it is pretty clear what this thing in the device tree
means. It means "I am a level triggered chip".

> +               status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
> +               status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> +
> +               for (base = 0; base < mm_gc->gc.ngpio; base++) {
> +                       if ((1 << base) & status) {
> +                               generic_handle_irq(irq_linear_revmap(
> +                                       altera_gc->irq, base));
> +                       }
> +               }
> +       } else {

And if I'm not level triggered I'm edge triggered, right?

> +               while ((status = (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> +                       readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> +                       writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
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

(...)
> +int altera_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       int id, reg, ret;
> +       struct altera_gpio_chip *altera_gc = devm_kzalloc(&pdev->dev,
> +                               sizeof(*altera_gc), GFP_KERNEL);
> +       if (altera_gc == NULL) {
> +               ret = -ENOMEM;
> +               pr_err("%s: registration failed with status %d\n",
> +                       node->full_name, ret);
> +               return ret;

dev_err(&pdev->dev, "%s out of memory\n");
return -ENOMEM;

So:

- Use dev_* print primitives

- Print the actual error, or we go back to the 1980ies
  habit of having to look up an abstract error code in a
  binder.

- Just return the error.


> +       }
> +       altera_gc->irq = 0;
> +
> +       spin_lock_init(&altera_gc->gpio_lock);
> +
> +       id = pdev->id;
> +
> +       if (of_property_read_u32(node, "width", &reg))
> +               /*By default assume full GPIO controller*/
> +               altera_gc->mmchip.gc.ngpio = 32;
> +       else
> +               altera_gc->mmchip.gc.ngpio = reg;
> +
> +       if (altera_gc->mmchip.gc.ngpio > 32) {
> +               pr_warn("%s: ngpio is greater than 32, defaulting to 32\n",
> +                       node->full_name);
> +               altera_gc->mmchip.gc.ngpio = 32;
> +       }
> +
> +       altera_gc->mmchip.gc.direction_input    = altera_gpio_direction_input;
> +       altera_gc->mmchip.gc.direction_output   = altera_gpio_direction_output;
> +       altera_gc->mmchip.gc.get                = altera_gpio_get;
> +       altera_gc->mmchip.gc.set                = altera_gpio_set;
> +       altera_gc->mmchip.gc.to_irq             = altera_gpio_to_irq;
> +       altera_gc->mmchip.gc.owner              = THIS_MODULE;
> +
> +       ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
> +       if (ret)
> +               goto err;

Just print the error and return directly.

There is nothing to free or clean up at the err: label.

> +       platform_set_drvdata(pdev, altera_gc);
> +
> +       if (of_get_property(node, "interrupts", &reg) == NULL)
> +               goto skip_irq;
> +       altera_gc->hwirq = irq_of_parse_and_map(node, 0);
> +
> +       if (altera_gc->hwirq == NO_IRQ)
> +               goto skip_irq;
> +
> +       altera_gc->irq = irq_domain_add_linear(node, altera_gc->mmchip.gc.ngpio,
> +                               &altera_gpio_irq_ops, altera_gc);
> +
> +       if (!altera_gc->irq) {
> +               ret = -ENODEV;
> +               goto dispose_irq;
> +       }
> +
> +       if (of_property_read_u32(node, "level_trigger", &reg)) {
> +               ret = -EINVAL;
> +               pr_err("%s: level_trigger value not set in device tree\n",
> +                       node->full_name);
> +               goto teardown;
> +       }
> +       altera_gc->level_trigger = reg;
> +
> +       irq_set_handler_data(altera_gc->hwirq, altera_gc);
> +       irq_set_chained_handler(altera_gc->hwirq, altera_gpio_irq_handler);
> +
> +       return 0;
> +
> +teardown:
> +       irq_domain_remove(altera_gc->irq);
> +dispose_irq:
> +       irq_dispose_mapping(altera_gc->hwirq);
> +       WARN_ON(gpiochip_remove(&altera_gc->mmchip.gc) < 0);
> +
> +err:
> +       pr_err("%s: registration failed with status %d\n",
> +               node->full_name, ret);
> +       devm_kfree(&pdev->dev, altera_gc);

No. The devm_* managed resources take care of freeing when probe
fails, that is the major idea with it.

> +
> +       return ret;
> +skip_irq:
> +       return 0;
> +}
> +
> +static int altera_gpio_remove(struct platform_device *pdev)
> +{
> +       unsigned int irq, i;
> +       int status;
> +       struct altera_gpio_chip *altera_gc = platform_get_drvdata(pdev);
> +
> +       status = gpiochip_remove(&altera_gc->mmchip.gc);
> +
> +       if (status < 0)
> +               return status;
> +
> +       if (altera_gc->irq) {
> +               irq_dispose_mapping(altera_gc->hwirq);
> +
> +               for (i = 0; i < altera_gc->mmchip.gc.ngpio; i++) {
> +                       irq = irq_find_mapping(altera_gc->irq, i);
> +                       if (irq > 0)
> +                               irq_dispose_mapping(irq);
> +               }
> +
> +               irq_domain_remove(altera_gc->irq);
> +       }
> +
> +       irq_set_handler_data(altera_gc->hwirq, NULL);
> +       irq_set_chained_handler(altera_gc->hwirq, NULL);
> +       devm_kfree(&pdev->dev, altera_gc);

Again no. You're missing the point with devm*.

> +#ifdef CONFIG_OF
> +static struct of_device_id altera_gpio_of_match[] = {
> +       { .compatible = "altr,pio-1.0", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
> +#else
> +#define altera_gpio_of_match NULL
> +#endif

Your driver depends on OF_GPIO, which depends on OF.

Skip the #ifdefs.

Yours,
Linus Walleij
