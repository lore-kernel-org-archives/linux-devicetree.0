From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v8 2/2] drivers/gpio: Altera soft IP GPIO driver
Date: Wed, 24 Dec 2014 03:04:10 -0800
Message-ID: <1419419050.6157.11.camel@perches.com>
References: <1419409345-8297-1-git-send-email-thloh@altera.com>
	 <1419409345-8297-3-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1419409345-8297-3-git-send-email-thloh@altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: thloh@altera.com
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Antti Palosaari <crope@iki.fi>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-12-24 at 00:22 -0800, thloh@altera.com wrote:
> Adds a new driver for Altera soft GPIO IP. The driver is able to
> do read/write and allows GPIO to be a interrupt controller.

Some trivial comments, some not quite so trivial.

> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
[]
> +static int altera_gpio_irq_set_type(struct irq_data *d,
> +				   unsigned int type)
> +{
> +	struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
> +
> +	altera_gc = irq_data_get_irq_chip_data(d);

I presume this multiple initialization of altera_gc
is unnecessary duplication.

> +static void altera_gpio_irq_edge_handler(unsigned int irq,
> +					struct irq_desc *desc)
> +{
> +	struct altera_gpio_chip *altera_gc;
> +	struct irq_chip *chip;
> +	struct of_mm_gpio_chip *mm_gc;
> +	unsigned long status;
> +	int i;
> +
> +	altera_gc = irq_desc_get_handler_data(desc);
> +	chip = irq_desc_get_chip(desc);
> +	mm_gc = &altera_gc->mmchip;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	while ((status =
> +	      (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> +	      readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> +		writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
> +		for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
> +			generic_handle_irq(
> +				irq_find_mapping(altera_gc->mmchip.gc.irqdomain
> +						, i));

That's kind of unpleasant to read.
It might be better to use a separate these statements
and use a temporary for irq_find_mapping()

> +static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
> +					      struct irq_desc *desc)
> +{
> +	struct altera_gpio_chip *altera_gc;
> +	struct irq_chip *chip;
> +	struct of_mm_gpio_chip *mm_gc;
> +	unsigned long status;
> +	int i;
> +
> +	altera_gc = irq_desc_get_handler_data(desc);
> +	chip = irq_desc_get_chip(desc);
> +	mm_gc = &altera_gc->mmchip;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
> +	status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> +
> +	for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
> +		generic_handle_irq(
> +			irq_find_mapping(altera_gc->mmchip.gc.irqdomain, i));

Maybe a temporary here too

> +int altera_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	int id, reg, ret;
> +	struct altera_gpio_chip *altera_gc;
> +
> +	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
> +
> +	if (altera_gc == NULL)
> +		return -ENOMEM;

No blank line after the devm_kzalloc please and
	if (!altera_gc)
is more common.


> +	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
> +		gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
> +			&altera_irq_chip,
> +			altera_gc->mapped_irq,
> +			altera_gpio_irq_leveL_high_handler);
> +	} else {
> +		gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
> +			&altera_irq_chip,
> +			altera_gc->mapped_irq,
> +			altera_gpio_irq_edge_handler);
> +	}

Sometimes using a ?: ternary is smaller code

	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
				     &altera_irq_chip,
				     altera_gc->mapped_irq,
				     altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
				     altera_gpio_irq_leveL_high_handler :
				     altera_gpio_irq_edge_handler);
> 

