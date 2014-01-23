From: Tien Hock Loh <thloh@altera.com>
Subject: Re: [PATCH V6 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 23 Jan 2014 09:57:05 +0800
Message-ID: <CAOLUe6bbGQOdR1gMYwoVaRoFhEAv5kWm0KaumXur=r7MmZjgQw@mail.gmail.com>
References: <1390359265-22808-1-git-send-email-thloh@altera.com>
	<20140122182420.GO20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140122182420.GO20094@book.gsilab.sittig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dinguyen@altera.com, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 2:24 AM, Gerhard Sittig <gsi@denx.de> wrote:
> [ this reply is related to the Linux driver source code,
>   I kept device tree and doc concerns in the other reply ]
>
> you introduce a Linux driver, yet I don't see any Linux
> development ML in the Cc: list (only the GPIO maintainer and
> doc/DT related lists) -- am I missing something?

Totally my fault. Do I add them in now or do I create a v7 patch in this case?

>
> On Wed, Jan 22, 2014 at 10:54 +0800, thloh@altera.com wrote:
>>
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-altera.c
>> [ ... ]
>> +
>> +static int altera_gpio_irq_set_type(struct irq_data *d,
>> +                             unsigned int type)
>> +{
>> +     struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
>> +
>> +     if (type == IRQ_TYPE_NONE)
>> +             return 0;
>> +
>> +     if (type == IRQ_TYPE_LEVEL_HIGH &&
>> +             altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
>> +             return 0;
>> +     } else {
>> +             if (type == IRQ_TYPE_EDGE_RISING &&
>> +                     altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_RISING)
>> +                     return 0;
>> +             else if (type == IRQ_TYPE_EDGE_FALLING &&
>> +                     altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_FALLING)
>> +                     return 0;
>> +             else if (type == IRQ_TYPE_EDGE_BOTH &&
>> +                     altera_gc->interrupt_trigger == IRQ_TYPE_EDGE_BOTH)
>> +                     return 0;
>> +     }
>> +
>> +     return -EINVAL;
>> +}
>
> This style of indentation makes readers miss the fact that the
> condition is multi-line and the body is just a single line.  From
> a quick look one might assume broken code due to missing braces.
> Please adjust the alignment.

Okay, will fix the alignment.

>
>> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>> +{
>> +     struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
>> +     struct irq_chip *chip = irq_desc_get_chip(desc);
>> +     struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
>> +     unsigned long status;
>> +
>> +     int i;
>> +
>> +     chained_irq_enter(chip, desc);
>> +     /* Handling for level trigger and edge trigger is different */
>> +     if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
>> +             status = readl_relaxed(mm_gc->regs + ALTERA_GPIO_DATA);
>> +             status &= readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
>> +
>> +             for (i = 0; i < mm_gc->gc.ngpio; i++) {
>> +                     if (BIT(i) & status) {
>
> this looks like "Yoda programming" :)  checking the constant
> value against a variable, making readers stop and wonder

Fix this I will.

>
>> +                             generic_handle_irq(irq_find_mapping(
>> +                                     altera_gc->domain, i));
>> +                     }
>> +             }
>> +     } else {
>> +             while ((status =
>> +                     (readl_relaxed(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
>> +                     readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
>> +                     writel_relaxed(status,
>> +                             mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
>> +                     for (i = 0; i < mm_gc->gc.ngpio; i++) {
>> +                             if (BIT(i) & status) {
>> +                                     generic_handle_irq(irq_find_mapping(
>> +                                             altera_gc->domain, i));
>> +                             }
>> +                     }
>> +             }
>> +     }
>> +
>> +     chained_irq_exit(chip, desc);
>> +}
>
>> +int altera_gpio_probe(struct platform_device *pdev)
>> +{
>> +     struct device_node *node = pdev->dev.of_node;
>> +     int i, id, reg, ret;
>> +     struct altera_gpio_chip *altera_gc = devm_kzalloc(&pdev->dev,
>> +                             sizeof(*altera_gc), GFP_KERNEL);
>> +     if (altera_gc == NULL) {
>> +             pr_err("%s: out of memory\n", node->full_name);
>> +             return -ENOMEM;
>> +     }
>> +     altera_gc->domain = 0;
>> +
>> +     spin_lock_init(&altera_gc->gpio_lock);
>> +
>> +     id = pdev->id;
>> +
>> +     if (of_property_read_u32(node, "altr,gpio-bank-width", &reg))
>> +             /*By default assume full GPIO controller*/
>> +             altera_gc->mmchip.gc.ngpio = 32;
>> +     else
>> +             altera_gc->mmchip.gc.ngpio = reg;
>> +
>> +     if (altera_gc->mmchip.gc.ngpio > 32) {
>> +             pr_warn("%s: ngpio is greater than 32, defaulting to 32\n",
>> +                     node->full_name);
>
> use dev_warn() so users can better identify the instance?
> hand-rolling this with pr_warn() and node->full_name is
> unexpected

Yeah makes sense. I'll update this.

>
>> +             altera_gc->mmchip.gc.ngpio = 32;
>> +     }
>> +
>> +     altera_gc->mmchip.gc.direction_input    = altera_gpio_direction_input;
>> +     altera_gc->mmchip.gc.direction_output   = altera_gpio_direction_output;
>> +     altera_gc->mmchip.gc.get                = altera_gpio_get;
>> +     altera_gc->mmchip.gc.set                = altera_gpio_set;
>> +     altera_gc->mmchip.gc.to_irq             = altera_gpio_to_irq;
>> +     altera_gc->mmchip.gc.owner              = THIS_MODULE;
>> +
>> +     ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
>> +     if (ret) {
>> +             pr_err("%s: Failed adding memory mapped gpiochip\n",
>> +                     node->full_name);
>> +             return ret;
>> +     }
>> +
>> +     platform_set_drvdata(pdev, altera_gc);
>> +
>> +     altera_gc->mapped_irq = irq_of_parse_and_map(node, 0);
>> +
>> +     if (!altera_gc->mapped_irq)
>> +             goto skip_irq;
>
> interrupt controller support is optional in the code, too -- good
>
>> +
>> +     altera_gc->domain = irq_domain_add_linear(node,
>> +             altera_gc->mmchip.gc.ngpio, &altera_gpio_irq_ops, altera_gc);
>> +
>> +     for (i = 0; i < altera_gc->mmchip.gc.ngpio; i++)
>> +             irq_create_mapping(altera_gc->domain, i);
>> +
>> +     if (!altera_gc->domain) {
>> +             ret = -ENODEV;
>> +             goto dispose_irq;
>> +     }
>
> do you reference the domain already between allocation and the
> check for successful allocation?

Good catch. The irq_create_mapping was added from the last patch and I
totally overlooked this.

>
>> +
>> +     if (of_property_read_u32(node, "altr,interrupt_trigger", &reg)) {
>> +             ret = -EINVAL;
>> +             pr_err("%s: interrupt_trigger value not set in device tree\n",
>> +                     node->full_name);
>> +             goto teardown;
>> +     }
>> +     altera_gc->interrupt_trigger = reg;
>> +
>> +     irq_set_handler_data(altera_gc->mapped_irq, altera_gc);
>> +     irq_set_chained_handler(altera_gc->mapped_irq, altera_gpio_irq_handler);
>> +
>> +     return 0;
>> +
>> +teardown:
>> +     irq_domain_remove(altera_gc->domain);
>> +dispose_irq:
>> +     irq_dispose_mapping(altera_gc->mapped_irq);
>> +     WARN_ON(gpiochip_remove(&altera_gc->mmchip.gc) < 0);
>> +
>> +     pr_err("%s: registration failed with status %d\n",
>> +             node->full_name, ret);
>> +
>> +     return ret;
>> +skip_irq:
>> +     return 0;
>> +}
>
>
> virtually yours
> Gerhard Sittig
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

Tien Hock Loh
