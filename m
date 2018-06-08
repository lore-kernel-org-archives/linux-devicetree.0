From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mediatek: add driver for MT7621
Date: Fri, 8 Jun 2018 13:59:45 +0200
Message-ID: <CACRpkdaw9O6TbZie5AOTmQJ9-3=yHETFFX7YVkPBEL72EZzZ=g@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-2-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1527924610-13135-2-git-send-email-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi Sergio!

Thanks for your patch!

Given that we have combined pin control and GPIO drivers for
almost all Mediatek chips in drivers/pinctrl/mediatek/*
I would ideally like to have some input from the Mediatek
maintainers (especially Sean Wang) on this, especially:

- Is MT7621 a non-pincontrol GPIO controller, or can it
  eventually use pin control as a back-end? Will a separate
  pin control driver appear later for this SoC?

- Would it make sense to have a combined driver just like
  for the other Mediatek SoCs in drivers/pinctrl/mediatek?
  If this GPIO controller does not do pin control I understand
  why it is submitted as a GPIO driver only.

drivers/pinctrl/mediatek/pinctrl-mt7622.c is suspiciously
similarly named. Is this a relative or just as different as
night and day?

Also you can see that this driver has a built-in GPIO driver,
using an external interrupt.

On Sat, Jun 2, 2018 at 9:30 AM, Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Add driver support for gpio of MT7621 SoC.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Reviewed-by: NeilBrown <neil@brown.name>

> +config GPIO_MT7621
> +       bool "Mediatek GPIO Support"

Specify in the option that it is for MT7621 as there are so
many of these now.

> +       depends on SOC_MT7620 || SOC_MT7621

Can we enable COMPILE_TEST?

> +       select GPIOLIB_IRQCHIP

You are not using this so I guess remove that line.

> +       help
> +         Say yes here to support the Mediatek SoC GPIO device

Elaborate on SoC type please.

> +#include <linux/err.h>
> +#include <linux/gpio.h>

This should not be included in new code, just remove it
(should be fine).

> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define MTK_BANK_CNT           3
> +#define MTK_BANK_WIDTH         32
> +#define PIN_MASK(nr)           (1UL << ((nr % MTK_BANK_WIDTH)))
> +
> +enum mediatek_gpio_reg {
> +       GPIO_REG_CTRL = 0,
> +       GPIO_REG_POL,
> +       GPIO_REG_DATA,
> +       GPIO_REG_DSET,
> +       GPIO_REG_DCLR,
> +       GPIO_REG_REDGE,
> +       GPIO_REG_FEDGE,
> +       GPIO_REG_HLVL,
> +       GPIO_REG_LLVL,
> +       GPIO_REG_STAT,
> +       GPIO_REG_EDGE,
> +};

So these are all registers? I usually prefer some #defines
for each offset.

In this case I definately think you should define them all
relative the memory base:

#define GPIO_REG_CTRL0 0x00
#define GPIO_REG_CTRL1 0x04
(...)

as that makes it easier to use GPIO_GENERIC as described
below.

> +struct mtk_gc {
> +       struct gpio_chip chip;
> +       spinlock_t lock;
> +       int bank;
> +       u32 rising;
> +       u32 falling;
> +};

> +struct mtk_data {
> +       void __iomem *gpio_membase;
> +       int gpio_irq;
> +       struct irq_domain *gpio_irq_domain;
> +       struct mtk_gc gc_map[MTK_BANK_CNT];
> +};

These two state containers make it a bit confusing, maybe it
can be alleviated with a bit of comments explaining what is
going on?

> +static inline struct mtk_gc *
> +to_mediatek_gpio(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct mtk_gc, chip);
> +}

This is a bit confusing as the other state container comes
out of the gpio_chip, but that is a member of the mtk_gc.
But maybe this is the only way to do it.

> +static inline void
> +mtk_gpio_w32(struct mtk_gc *rg, u8 reg, u32 val)
> +{
> +       struct mtk_data *gpio_data = gpiochip_get_data(&rg->chip);
> +       u32 offset = (reg * 0x10) + (rg->bank * 0x4);

So the register stride is 0x10 and the bank is 0x4 wide?

Following this gets terse so I guess that is why I prefer to
just #define the registers and have them relate directly
to membase and no reader/writer functions like this.
But it's not a strong opinion, maybe you have
good reasons for having it like this.

> +       iowrite32(val, gpio_data->gpio_membase + offset);
> +}
> +
> +static inline u32
> +mtk_gpio_r32(struct mtk_gc *rg, u8 reg)
> +{
> +       struct mtk_data *gpio_data = gpiochip_get_data(&rg->chip);
> +       u32 offset = (reg * 0x10) + (rg->bank * 0x4);
> +
> +       return ioread32(gpio_data->gpio_membase + offset);
> +}

These two could possibly be wrapped into a custom regmap
as well, that makes for nice abstraction. Just an idea.

> +static void
> +mediatek_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +{
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +
> +       mtk_gpio_w32(rg, (value) ? GPIO_REG_DSET : GPIO_REG_DCLR, BIT(offset));
> +}
> +
> +static int
> +mediatek_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +
> +       return !!(mtk_gpio_r32(rg, GPIO_REG_DATA) & BIT(offset));
> +}
> +
> +static int
> +mediatek_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +       unsigned long flags;
> +       u32 t;
> +
> +       spin_lock_irqsave(&rg->lock, flags);
> +       t = mtk_gpio_r32(rg, GPIO_REG_CTRL);
> +       t &= ~BIT(offset);
> +       mtk_gpio_w32(rg, GPIO_REG_CTRL, t);
> +       spin_unlock_irqrestore(&rg->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int
> +mediatek_gpio_direction_output(struct gpio_chip *chip,
> +                                       unsigned int offset, int value)
> +{
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +       unsigned long flags;
> +       u32 t;
> +
> +       spin_lock_irqsave(&rg->lock, flags);
> +       t = mtk_gpio_r32(rg, GPIO_REG_CTRL);
> +       t |= BIT(offset);
> +       mtk_gpio_w32(rg, GPIO_REG_CTRL, t);
> +       mediatek_gpio_set(chip, offset, value);
> +       spin_unlock_irqrestore(&rg->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int
> +mediatek_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +       u32 t = mtk_gpio_r32(rg, GPIO_REG_CTRL);
> +
> +       return (t & BIT(offset)) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;
> +}

How do these calls end up?

If this complexity is just masking the fact that offset is always
0..n and writes to bits 0..n of some memory address, this whole
thing can just me converted to use GPIO_GENERIC and replace all
the code from mtk_gpio_w32() to here.

Given that MTK_BANK_WIDTH is 32, I think it's very likely that
you can just use GPIO_GENERIC and send in the memory
offsets for all these registers to bgpio_init().

As bonus you get a proven implementation supporting
.get/set_multiple() at the same time.

> +static int
> +mediatek_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
> +{
> +       struct mtk_data *gpio_data = gpiochip_get_data(chip);
> +       struct mtk_gc *rg = to_mediatek_gpio(chip);
> +
> +       return irq_create_mapping(gpio_data->gpio_irq_domain,
> +                                 pin + (rg->bank * MTK_BANK_WIDTH));
> +}

So this is the result of a custom IRQdomain because you
can't use the generic GPIO IRQ lib.  Oh well, we have to live
with it I guess.

> +static int
> +mediatek_gpio_bank_probe(struct platform_device *pdev, struct device_node *bank)
> +{
> +       struct mtk_data *gpio_data = dev_get_drvdata(&pdev->dev);
> +       const __be32 *id = of_get_property(bank, "reg", NULL);
> +       struct mtk_gc *rg;
> +       int ret;
> +
> +       if (!id || be32_to_cpu(*id) >= MTK_BANK_CNT)
> +               return -EINVAL;
> +
> +       rg = &gpio_data->gc_map[be32_to_cpu(*id)];
> +       memset(rg, 0, sizeof(*rg));
> +
> +       spin_lock_init(&rg->lock);
> +
> +       rg->chip.parent = &pdev->dev;
> +       rg->chip.label = dev_name(&pdev->dev);
> +       rg->chip.of_node = bank;
> +       rg->chip.base = MTK_BANK_WIDTH * be32_to_cpu(*id);

Nope, do not ever assign base in a new driver. Set this to -1.

New systems should use dynamic IRQ base assignment, and
userspace should use the character device to access GPIOs
if need be.

> +       rg->chip.ngpio = MTK_BANK_WIDTH;
> +       rg->chip.direction_input = mediatek_gpio_direction_input;
> +       rg->chip.direction_output = mediatek_gpio_direction_output;
> +       rg->chip.get_direction = mediatek_gpio_get_direction;
> +       rg->chip.get = mediatek_gpio_get;
> +       rg->chip.set = mediatek_gpio_set;
> +       if (gpio_data->gpio_irq_domain)
> +               rg->chip.to_irq = mediatek_gpio_to_irq;
> +       rg->bank = be32_to_cpu(*id);

As stated I think this can be replaced with bgpio_init() and
selecting GPIOCHIP_GENERIC.

> +static void
> +mediatek_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct mtk_data *gpio_data = irq_desc_get_handler_data(desc);
> +       int i;
> +
> +       for (i = 0; i < MTK_BANK_CNT; i++) {
> +               struct mtk_gc *rg = &gpio_data->gc_map[i];
> +               unsigned long pending;
> +               int bit;
> +
> +               if (!rg)
> +                       continue;
> +
> +               pending = mtk_gpio_r32(rg, GPIO_REG_STAT);
> +
> +               for_each_set_bit(bit, &pending, MTK_BANK_WIDTH) {
> +                       u32 map = irq_find_mapping(gpio_data->gpio_irq_domain,
> +                                                  (MTK_BANK_WIDTH * i) + bit);
> +
> +                       generic_handle_irq(map);
> +                       mtk_gpio_w32(rg, GPIO_REG_STAT, BIT(bit));
> +               }
> +       }
> +}
> +
> +static void
> +mediatek_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct mtk_data *gpio_data = irq_data_get_irq_chip_data(d);
> +       int pin = d->hwirq;
> +       int bank = pin / MTK_BANK_WIDTH;
> +       struct mtk_gc *rg = &gpio_data->gc_map[bank];
> +       unsigned long flags;
> +       u32 rise, fall;
> +
> +       if (!rg)
> +               return;
> +
> +       spin_lock_irqsave(&rg->lock, flags);
> +       rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
> +       fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
> +       mtk_gpio_w32(rg, GPIO_REG_REDGE, rise | (PIN_MASK(pin) & rg->rising));
> +       mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall | (PIN_MASK(pin) & rg->falling));
> +       spin_unlock_irqrestore(&rg->lock, flags);
> +}
> +
> +static void
> +mediatek_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct mtk_data *gpio_data = irq_data_get_irq_chip_data(d);
> +       int pin = d->hwirq;
> +       int bank = pin / MTK_BANK_WIDTH;
> +       struct mtk_gc *rg = &gpio_data->gc_map[bank];
> +       unsigned long flags;
> +       u32 rise, fall;
> +
> +       if (!rg)
> +               return;
> +
> +       spin_lock_irqsave(&rg->lock, flags);
> +       rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
> +       fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
> +       mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~PIN_MASK(pin));
> +       mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~PIN_MASK(pin));
> +       spin_unlock_irqrestore(&rg->lock, flags);
> +}


Looks OK.

> +static int
> +mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +       struct mtk_data *gpio_data = irq_data_get_irq_chip_data(d);
> +       int pin = d->hwirq;
> +       int bank = pin / MTK_BANK_WIDTH;
> +       struct mtk_gc *rg = &gpio_data->gc_map[bank];
> +       u32 mask = PIN_MASK(pin);
> +
> +       if (!rg)
> +               return -1;
> +
> +       if (type == IRQ_TYPE_PROBE) {
> +               if ((rg->rising | rg->falling) & mask)
> +                       return 0;
> +
> +               type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +       }
> +
> +       if (type & IRQ_TYPE_EDGE_RISING)
> +               rg->rising |= mask;
> +       else
> +               rg->rising &= ~mask;
> +
> +       if (type & IRQ_TYPE_EDGE_FALLING)
> +               rg->falling |= mask;
> +       else
> +               rg->falling &= ~mask;

I don't understand this, the register map contains:
GPIO_REG_HLVL, GPIO_REG_LLVL, yet high/low level
interrupts are not implemented? Why not? Can't be that hard
now that you fixed everything else!

> +static struct irq_chip mediatek_gpio_irq_chip = {
> +       .name           = "GPIO",
> +       .irq_unmask     = mediatek_gpio_irq_unmask,
> +       .irq_mask       = mediatek_gpio_irq_mask,
> +       .irq_mask_ack   = mediatek_gpio_irq_mask,
> +       .irq_set_type   = mediatek_gpio_irq_type,
> +};

When implementing custom irqchips it is important to also
implement .irq_request_resources() and
.irq_release_resources() and make sure these call
gpiochip_[un]lock_as_irq().

See for example
drivers/gpio/gpio-dwapb.c

for an example.

> +static const struct of_device_id mediatek_gpio_match[] = {
> +       { .compatible = "mediatek,mt7621-gpio" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mediatek_gpio_match);
> +
> +static struct platform_driver mediatek_gpio_driver = {
> +       .probe = mediatek_gpio_probe,
> +       .driver = {
> +               .name = "mt7621_gpio",
> +               .of_match_table = mediatek_gpio_match,
> +       },
> +};
> +
> +module_platform_driver(mediatek_gpio_driver);

If you're not implementing .remove() I don't think this will
really work fine as a module. Also the Kconfig is a bool.

I guess you want to use
builtin_platform_driver()?

Yours,
Linus Walleij
