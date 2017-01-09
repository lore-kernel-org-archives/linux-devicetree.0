From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Mon, 9 Jan 2017 20:35:37 +0100
Message-ID: <CACRpkdaOQM7=mDTA1K92N5P=jjaCyhsSw5DGL+bnXE_GOYw82Q@mail.gmail.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com> <1483744980-25898-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483744980-25898-3-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 7, 2017 at 12:22 AM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>
> Cavium ThunderX and OCTEON-TX are arm64 based SoCs.  Add driver for
> the on-chip GPIO pins.
>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

(...)
> +config GPIO_THUNDERX
> +       tristate "Cavium ThunderX/OCTEON-TX GPIO"

Do you really load this as module? OK then...

> +#include <linux/gpio.h>

No.
#include <linux/gpio/driver.h>

Nothing else.

> +#define GLITCH_FILTER_400NS ((4ull << GPIO_BIT_CFG_FIL_SEL_SHIFT) | \
> +                            (9ull << GPIO_BIT_CFG_FIL_CNT_SHIFT))
> +
> +static unsigned int bit_cfg_reg(unsigned int line)
> +{
> +       return 8 * line + GPIO_BIT_CFG;
> +}
> +
> +static unsigned int intr_reg(unsigned int line)
> +{
> +       return 8 * line + GPIO_INTR;
> +}

This looks a bit overzealous, but OK.

> +struct thunderx_gpio;
> +
> +struct thunderx_irqdev {
> +       struct thunderx_gpio    *gpio;
> +       char                    *name;
> +       unsigned int            line;
> +};
> +
> +struct thunderx_gpio {
> +       struct gpio_chip        chip;
> +       u8 __iomem              *register_base;
> +       struct msix_entry       *msix_entries;
> +       struct thunderx_irqdev  *irqdev_entries;
> +       raw_spinlock_t          lock;
> +       unsigned long           invert_mask[2];
> +       unsigned long           od_mask[2];
> +       int                     base_msi;
> +};

Why can't you just move the thunderx_irqdev fields
into thunderx_gpio? It will save very little memory for
non-irq systems, I do not think footprint warrants it.

> +
> +static bool thunderx_gpio_is_gpio(struct thunderx_gpio *gpio,
> +                                 unsigned int line)
> +{
> +       u64 bit_cfg = readq(gpio->register_base + bit_cfg_reg(line));
> +       bool rv = (bit_cfg & GPIO_BIT_CFG_PIN_SEL_MASK) == 0;
> +
> +       WARN_RATELIMIT(!rv, "Pin %d not available for GPIO\n", line);
> +
> +       return rv;
> +}

Nifty. So this actually has a pin controller back-end?
I haven't seen the code for that yet, I think.

This seems like a cheap version of

/* External interface to pin control */
extern int pinctrl_request_gpio(unsigned gpio);
extern void pinctrl_free_gpio(unsigned gpio);
extern int pinctrl_gpio_direction_input(unsigned gpio);
extern int pinctrl_gpio_direction_output(unsigned gpio);

>From <linux/pinctrl/consumer.h>

So are you planning pin control support separately in drivers/pinctrl/*
in the future? Maybe some comment to replace this with proper pin control
in the future is warranted?

> +static int thunderx_gpio_dir_in(struct gpio_chip *chip, unsigned int line)
> +{
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);

1. Please use gpiochip_get_data() instead of the container_of() construction,
   utilized devm_gpiochip_add_data() in your probe() call.

2. Do not call this local variable "gpio" that is superconfusing, at least call
    it txgpio or something.

1 & 2 applies EVERYWHERE in thid driver.

> +static void thunderx_gpio_set(struct gpio_chip *chip, unsigned int line,
> +                             int value)
> +{
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);
> +       int bank = line / 64;
> +       int bank_bit = line % 64;
> +
> +       void __iomem *reg = gpio->register_base +
> +               (bank * GPIO_2ND_BANK) + (value ? GPIO_TX_SET : GPIO_TX_CLR);
> +
> +       writeq(1ull << bank_bit, reg);

Use this:

#include <linus/bitops.h>

writeq(BIT(bank_bit), reg);

Applies EVERYWHERE you use (1ULL << n)

> +static int thunderx_gpio_set_single_ended(struct gpio_chip *chip,
> +                                         unsigned int line,
> +                                         enum single_ended_mode mode)

Thanks for implementing this properly.

> +       read_bits >>= bank_bit;
> +
> +       if (test_bit(line, gpio->invert_mask))
> +               return !(read_bits & 1);
> +       else
> +               return read_bits & 1;

This looks superconvoluted.

Can't you just:

if (test_bit(line, gpio->invert_mask))
   return !(read_bits & BIT(bank_bit));
else
   return !!(read_bits & BIT(bank_bit));

OK maybe not much clearer but seems clearer to me.

> +static int thunderx_gpio_irq_request_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);
> +       unsigned int line = data->hwirq;
> +       struct thunderx_irqdev *irqdev;
> +       int err;
> +
> +       if (!thunderx_gpio_is_gpio(gpio, line))
> +               return -EIO;
> +
> +       irqdev = gpio->irqdev_entries + line;
> +
> +       irqdev->gpio = gpio;
> +       irqdev->line = line;
> +       irqdev->name = devm_kasprintf(chip->parent, GFP_KERNEL,
> +                                     "gpio-%d", line + chip->base);
> +
> +       writeq(GPIO_INTR_ENA_W1C, gpio->register_base + intr_reg(line));
> +
> +       err = devm_request_irq(chip->parent, gpio->msix_entries[line].vector,
> +                              thunderx_gpio_chain_handler, IRQF_NO_THREAD, irqdev->name, irqdev);
> +       return err;
> +}
> +
> +static void thunderx_gpio_irq_release_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);
> +       unsigned int line = data->hwirq;
> +       struct thunderx_irqdev *irqdev;
> +
> +       irqdev = gpio->irqdev_entries + line;
> +
> +       /*
> +        * The request_resources/release_resources functions may be
> +        * called multiple times in the lifitime of the driver, so we
> +        * need to clean up the devm_* things to avoid a resource
> +        * leak.
> +        */
> +       devm_free_irq(chip->parent, gpio->msix_entries[line].vector, irqdev);
> +
> +       writeq(GPIO_INTR_ENA_W1C, gpio->register_base + intr_reg(line));
> +
> +       devm_kfree(chip->parent, irqdev->name);
> +}

Then just do not use the devm* variants. Explicitly allocate and free instead.

These callbacks should be called on all resources anyways.

> +static void thunderx_gpio_irq_unmask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);
> +       unsigned int line = data->hwirq;
> +
> +       writeq(GPIO_INTR_ENA_W1S, gpio->register_base + intr_reg(line));
> +}
> +
> +static int thunderx_gpio_irq_set_type(struct irq_data *data,
> +                                     unsigned int flow_type)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct thunderx_gpio *gpio = container_of(chip, struct thunderx_gpio, chip);
> +       unsigned int line = data->hwirq;
> +       u64 bit_cfg;
> +
> +       irqd_set_trigger_type(data, flow_type);
> +
> +       bit_cfg = GLITCH_FILTER_400NS | GPIO_BIT_CFG_INT_EN;
> +
> +       if (flow_type & IRQ_TYPE_EDGE_BOTH) {
> +               irq_set_handler_locked(data, handle_edge_irq);
> +               bit_cfg |= GPIO_BIT_CFG_INT_TYPE;
> +       } else {
> +               irq_set_handler_locked(data, handle_level_irq);
> +       }
> +
> +       raw_spin_lock(&gpio->lock);
> +       if (flow_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_LEVEL_LOW)) {
> +               bit_cfg |= GPIO_BIT_CFG_PIN_XOR;
> +               set_bit(line, gpio->invert_mask);
> +       } else {
> +               clear_bit(line, gpio->invert_mask);
> +       }
> +       clear_bit(line, gpio->od_mask);
> +       writeq(bit_cfg, gpio->register_base + bit_cfg_reg(line));
> +       raw_spin_unlock(&gpio->lock);
> +
> +       return IRQ_SET_MASK_OK;
> +}
> +
> +/*
> + * Interrupts are chained from underlying MSI-X vectors.  We have
> + * these irq_chip functions to be able to handle level triggering
> + * semantics and other acknowledgment tasks associated with the GPIO
> + * mechanism.
> + */
> +static struct irq_chip thunderx_gpio_irq_chip = {
> +       .name                   = "GPIO",
> +       .irq_enable             = thunderx_gpio_irq_unmask,
> +       .irq_disable            = thunderx_gpio_irq_mask,
> +       .irq_ack                = thunderx_gpio_irq_ack,
> +       .irq_mask               = thunderx_gpio_irq_mask,
> +       .irq_mask_ack           = thunderx_gpio_irq_mask_ack,
> +       .irq_unmask             = thunderx_gpio_irq_unmask,
> +       .irq_set_type           = thunderx_gpio_irq_set_type,
> +       .irq_request_resources  = thunderx_gpio_irq_request_resources,
> +       .irq_release_resources  = thunderx_gpio_irq_release_resources,
> +       .flags                  = IRQCHIP_SET_TYPE_MASKED
> +};

This looks wrong.

If you're calling devm_request_irq() on *every* *single* *irq* like you
do here, you are dealing with a hieararchical irqdomain, not a linear one,
and GPIOLIB_IRQCHIP may not be used.

Look at drivers/gpio/gpio-xgene-sb.c for inspiration. That is the only
hierarchical GPIO irqdomain I have right now.

Consult Marc Zyngier's IRQ domain lecture if you have time:
https://www.youtube.com/watch?v=YE8cRHVIM4E

If you have ideas how to combine hierarchical irqdomain and GPIOLIB_IRQCHIP
pls help out.

> +       gpio->irqdev_entries = devm_kzalloc(dev,
> +                                           sizeof(struct thunderx_irqdev) * ngpio,
> +                                           GFP_KERNEL);
> +       if (!gpio->irqdev_entries) {
> +               err = -ENOMEM;
> +               goto out;
> +       }

I think this is overkill. Use hierarchical irqdomain.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
