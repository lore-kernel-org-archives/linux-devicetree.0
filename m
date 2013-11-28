From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH V4 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 28 Nov 2013 21:24:24 +0100
Message-ID: <20131128202424.GC2982@book.gsilab.sittig.org>
References: <1385524192-21501-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385524192-21501-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: thloh@altera.com
Cc: linus.walleij@linaro.org, rob.herring@calxeda.com, rob@landley.net, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, thloh.linux@gmail.com, lftan@altera.com
List-Id: devicetree@vger.kernel.org

On Wed, Nov 27, 2013 at 11:49 +0800, thloh@altera.com wrote:
> 
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> @@ -0,0 +1,35 @@
> +[ ... ]
> +
> +Example:
> +
> +gpio_altr: gpio_altr {
> +    compatible = "altr,pio-1.0";
> +    reg = <0xff200000 0x10>;

This length appears to be less than what the code defines (the
latter has offsets beyond 0x10).

> +    interrupts = <0 45 4>;
> +    altr,gpio-bank-width = <32>;
> +    altr,interrupt_trigger = <0>;

The numerical value of zero is not one of the valid options.
Strictly speaking, "none" is zero -- but if the GPIO chip is an
IRQ controller, the value should be _some_ trigger type, I guess.

Is it useful to drop numerical specs and use symbolic names, when
you already refer to dt-bindings header files in your reply?
And/or reference common GPIO and IRQ related documentation.

> +    #gpio-cells = <1>;
> +    gpio-controller;
> +    #interrupt-cells = <1>;
> +    interrupt-controller;
> +};


> --- /dev/null
> +++ b/drivers/gpio/gpio-altera.c
> @@ -0,0 +1,395 @@
> +[ ... ]
> +
> +#define ALTERA_GPIO_DATA		0x0
> +#define ALTERA_GPIO_DIR			0x4
> +#define ALTERA_GPIO_IRQ_MASK		0x8
> +#define ALTERA_GPIO_EDGE_CAP		0xc
> +#define ALTERA_GPIO_OUTSET		0x10
> +#define ALTERA_GPIO_OUTCLEAR		0x14

See above.  These aren't used in the code, but they suggest that
the register window is larger than 0x10.

> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
> +	unsigned long status;
> +
> +	int i;
> +	chip->irq_mask(&desc->irq_data);
> +
> +	/* Handling for level trigger and edge trigger is different */
> +	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
> +		status = readl_relaxed(mm_gc->regs + ALTERA_GPIO_DATA);
> +		status &= readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> +
> +		for (i = 0; i < mm_gc->gc.ngpio; i++) {
> +			if (BIT(i) & status) {
> +				generic_handle_irq(irq_linear_revmap(
> +					altera_gc->irq,	i));
> +			}
> +		}

for_each_set_bit()

> +	} else {
> +		while ((status =
> +			(readl_relaxed(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> +			readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> +			writel_relaxed(status,
> +				mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
> +			for (i = 0; i < mm_gc->gc.ngpio; i++) {
> +				if (BIT(i) & status) {
> +					generic_handle_irq(irq_linear_revmap(
> +						altera_gc->irq,	i));
> +				}
> +			}
> +		}
> +	}

Is the "level low" trigger missing?  Or is it not supported (in
the hardware) and is this worth documenting?  OTOH later versions
of the IP block may support all types of triggers, so the main
concern is that the driver's setup and handling are consistent,
which they are from a quick glance.

> +
> +	chip->irq_eoi(irq_desc_get_irq_data(desc));
> +	chip->irq_unmask(&desc->irq_data);
> +}


> +int altera_gpio_probe(struct platform_device *pdev)
> +{
> +[ ... ]
> +
> +	altera_gc->mapped_irq = irq_of_parse_and_map(node, 0);
> +
> +	if (!altera_gc->mapped_irq)
> +		goto skip_irq;

Personally I would not eliminate this goto instruction, but would
put the skip_irq label into the regular probe() path.  After all
it's a shortcut when an option does not apply, it's not an error
path.

> +
> +	altera_gc->irq = irq_domain_add_linear(node, altera_gc->mmchip.gc.ngpio,
> +				&altera_gpio_irq_ops, altera_gc);
> +
> +	if (!altera_gc->irq) {
> +		ret = -ENODEV;
> +		goto dispose_irq;
> +	}
> +
> +	if (of_property_read_u32(node, "altr,interrupt_trigger", &reg)) {
> +		ret = -EINVAL;
> +		pr_err("%s: interrupt_trigger value not set in device tree\n",
> +			node->full_name);
> +		goto teardown;
> +	}
> +	altera_gc->interrupt_trigger = reg;
> +
> +	irq_set_handler_data(altera_gc->mapped_irq, altera_gc);
> +	irq_set_chained_handler(altera_gc->mapped_irq, altera_gpio_irq_handler);
> +
> +	return 0;

I'd put skip_irq here, right before the return (as other GPIO
drivers do).  The remaining lines of this routine all can be
considered "exceptions" and "bail out" paths.

> +
> +teardown:
> +	irq_domain_remove(altera_gc->irq);
> +dispose_irq:
> +	irq_dispose_mapping(altera_gc->mapped_irq);
> +	WARN_ON(gpiochip_remove(&altera_gc->mmchip.gc) < 0);
> +
> +	pr_err("%s: registration failed with status %d\n",
> +		node->full_name, ret);
> +
> +	return ret;
> +skip_irq:
> +	return 0;
> +}


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
