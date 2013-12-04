From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Wed, 4 Dec 2013 10:35:14 +0100
Message-ID: <CACRpkdYrPGma0yZPKJdqZU6yqbVw95mmdGmSAUVymfZXNe97KQ@mail.gmail.com>
References: <1385608557-22354-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1385608557-22354-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tien Hock Loh <thloh.linux@gmail.com>, Dinh Nguyen <dinguyen@altera.com>, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 28, 2013 at 4:15 AM,  <thloh@altera.com> wrote:

> From: Tien Hock Loh <thloh@altera.com>
>
> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>
> Signed-off-by: Tien Hock Loh <thloh@altera.com>

Overall it looks good (some stuff to fix below).

I want an ACK from some device tree maintainer on the bindings,
ideally.

> +- altr,interrupt_trigger: Specifies the interrupt trigger type the GPIO
> +  hardware is synthesized. This field is required if the Altera GPIO controller
> +  used has IRQ enabled as the interrupt type is not software controlled,
> +  but hardware synthesized. Required if GPIO is used as an interrupt
> +  controller. The value is defined in <dt-bindings/interrupt-controller/irq.h>
> +  Only the following flags are supported:
> +    IRQ_TYPE_EDGE_RISING
> +    IRQ_TYPE_EDGE_FALLING
> +    IRQ_TYPE_EDGE_BOTH
> +    IRQ_TYPE_LEVEL_HIGH

I remember discussing this, and it's OK from my side.

> +/**
> +* struct altera_gpio_chip
> +* @mmchip              : memory mapped chip structure.
> +* @irq                 : irq domain that this driver is registered to.
> +* @gpio_lock           : synchronization lock so that new irq/set/get requests
> +                         will be blocked until the current one completes.
> +* @interrupt_trigger   : specifies the hardware configured IRQ trigger type
> +                         (rising, falling, both, high)
> +* @mapped_irq          : kernel mapped irq number.
> +*/
> +struct altera_gpio_chip {
> +       struct of_mm_gpio_chip mmchip;
> +       struct irq_domain *irq;

Argh that's a bad member name for an irqdomain, please just
call this "domain" like the other drivers do.

> +       spinlock_t gpio_lock;
> +       int interrupt_trigger;
> +       int edge_type;
> +       int mapped_irq;

Why are you keeping this around? Well I guess I might figure out...

> +static int altera_gpio_irq_set_type(struct irq_data *d,
> +                               unsigned int type)
> +{
> +       struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
> +
> +       if (type == IRQ_TYPE_NONE)
> +               return 0;
> +
> +       if (type == IRQ_TYPE_LEVEL_HIGH &&
> +               altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
> +               return 0;
> +       } else {
> +               if (type == IRQ_TYPE_EDGE_RISING &&
> +                       altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_RISING)
> +                       return 0;
> +               else if (type == IRQ_TYPE_EDGE_FALLING &&
> +                       altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_FALLING)
> +                       return 0;
> +               else if (type == IRQ_TYPE_EDGE_BOTH &&
> +                       altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_BOTH)
> +                       return 0;
> +       }

There is something very convoluted about this non-special else clause.
It can be just a else if like all the others, right?

> +static struct irq_chip altera_irq_chip = {
> +       .name           = "altera-gpio",
> +       .irq_mask       = altera_gpio_irq_mask,
> +       .irq_unmask     = altera_gpio_irq_unmask,
> +       .irq_set_type   = altera_gpio_irq_set_type,
> +};

We have added new APIs to flag GPIO lines as IRQs.
Please implement this in the .irq_startup()/.irq_shutdown()
callbacks in accordance with the style of
e.g. this patch:
http://marc.info/?l=linux-gpio&m=138571851304612&w=2

Note that you need to call unmask/mask from these callbacks.

> +static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +
> +       return (readl(mm_gc->regs + ALTERA_GPIO_DATA) >> offset) & 1;

Use this style to clamp a bit to {0,1}:

return !!(readl(mm_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));

> +static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +       struct altera_gpio_chip *chip = container_of(mm_gc,
> +                               struct altera_gpio_chip, mmchip);
> +       unsigned long flags;
> +       unsigned int data_reg;
> +
> +       spin_lock_irqsave(&chip->gpio_lock, flags);
> +       data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
> +       data_reg = (data_reg & ~BIT(offset)) | (value << offset);

This has the same arithmetic effect but is easier to read:

if (value)
   data_reg |= BIT(offset);
else
   data_reg &= ~BIT(offset);

> +static int altera_gpio_direction_output(struct gpio_chip *gc,
> +               unsigned offset, int value)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +       struct altera_gpio_chip *chip = container_of(mm_gc,
> +                               struct altera_gpio_chip, mmchip);
> +       unsigned long flags;
> +       unsigned int data_reg, gpio_ddr;
> +
> +       spin_lock_irqsave(&chip->gpio_lock, flags);
> +       /* Sets the GPIO value */
> +       data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
> +       data_reg = (data_reg & ~BIT(offset)) | (value << offset);

Same comment. As for set().

> +static int altera_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> +       struct altera_gpio_chip *altera_gc = container_of(mm_gc,
> +                               struct altera_gpio_chip, mmchip);
> +
> +       if (!altera_gc->irq)
> +               return -ENXIO;
> +       if (offset < altera_gc->mmchip.gc.ngpio)
> +               return irq_create_mapping(altera_gc->irq, offset);

Recently we have established that you should call irq_create_mapping()
for all valid IRQs in probe() and just use irq_find_mapping() here,
as it is valid semantics to use an IRQ in an irq_chip without converting
it from a GPIO line first.

This is because in DT use cases you may use an interrupt from an
interrupt-controller without first calling gpio_to_irq() and then this
explodes.

So please fix this...

> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +       struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
> +       unsigned long status;
> +
> +       int i;
> +       chip->irq_mask(&desc->irq_data);

Why do you call mask()/unmask()?

All interrupt handlers are called with interrupts disabled, I bet
you can just delete these two calls.

> +
> +       /* Handling for level trigger and edge trigger is different */
> +       if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
> +               status = readl_relaxed(mm_gc->regs + ALTERA_GPIO_DATA);
> +               status &= readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> +
> +               for (i = 0; i < mm_gc->gc.ngpio; i++) {
> +                       if (BIT(i) & status) {
> +                               generic_handle_irq(irq_linear_revmap(
> +                                       altera_gc->irq, i));

Why do you do it like that?

What us wrong with this:

generic_handle_irq(irq_find_mapping(altera_gc->domain, i))

?

> +                       }
> +               }
> +       } else {
> +               while ((status =
> +                       (readl_relaxed(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> +                       readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> +                       writel_relaxed(status,
> +                               mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
> +                       for (i = 0; i < mm_gc->gc.ngpio; i++) {
> +                               if (BIT(i) & status) {
> +                                       generic_handle_irq(irq_linear_revmap(
> +                                               altera_gc->irq, i));

Dito.

> +                               }
> +                       }
> +               }
> +       }
> +
> +       chip->irq_eoi(irq_desc_get_irq_data(desc));

I don't think you should call that directly either. Why do you
do this?

> +       chip->irq_unmask(&desc->irq_data);

See above about mask/unmask.

> +static int altera_gpio_irq_map(struct irq_domain *h, unsigned int virq,
> +                               irq_hw_number_t hw_irq_num)
> +{
> +       irq_set_chip_data(virq, h->host_data);
> +       irq_set_chip_and_handler(virq, &altera_irq_chip, handle_level_irq);
> +       irq_set_irq_type(virq, IRQ_TYPE_NONE);
> +
> +       return 0;
> +}

Rename the argument "virq" to just irq. These IRQs are not
really virtual any more than any other Linux IRQ.

(...)
> +       altera_gc->irq = irq_domain_add_linear(node, altera_gc->mmchip.gc.ngpio,
> +                               &altera_gpio_irq_ops, altera_gc);

Here you should call irq_create_map() for all valid IRQs.

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
> +               irq_dispose_mapping(altera_gc->mapped_irq);
> +
> +               for (i = 0; i < altera_gc->mmchip.gc.ngpio; i++) {
> +                       irq = irq_find_mapping(altera_gc->irq, i);
> +                       if (irq > 0)
> +                               irq_dispose_mapping(irq);
> +               }

Look, you're already disposing all mappings properly :-)

Yours,
Linus Walleij
