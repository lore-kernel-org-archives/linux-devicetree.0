From: Tien Hock Loh <thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 2/2] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 5 Feb 2015 02:32:02 -0800
Message-ID: <1423132322.1110.13.camel@ubuntu>
References: <1419409345-8297-1-git-send-email-thloh@altera.com>
	 <1419409345-8297-3-git-send-email-thloh@altera.com>
	 <1419419050.6157.11.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419419050.6157.11.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: thloh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-12-24 at 03:04 -0800, Joe Perches wrote:
> On Wed, 2014-12-24 at 00:22 -0800, thloh-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> > Adds a new driver for Altera soft GPIO IP. The driver is able to
> > do read/write and allows GPIO to be a interrupt controller.
> 
> Some trivial comments, some not quite so trivial.
> 
> > diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> []
> > +static int altera_gpio_irq_set_type(struct irq_data *d,
> > +				   unsigned int type)
> > +{
> > +	struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
> > +
> > +	altera_gc = irq_data_get_irq_chip_data(d);
> 
> I presume this multiple initialization of altera_gc
> is unnecessary duplication.

I'll remove this.

> 
> > +static void altera_gpio_irq_edge_handler(unsigned int irq,
> > +					struct irq_desc *desc)
> > +{
> > +	struct altera_gpio_chip *altera_gc;
> > +	struct irq_chip *chip;
> > +	struct of_mm_gpio_chip *mm_gc;
> > +	unsigned long status;
> > +	int i;
> > +
> > +	altera_gc = irq_desc_get_handler_data(desc);
> > +	chip = irq_desc_get_chip(desc);
> > +	mm_gc = &altera_gc->mmchip;
> > +
> > +	chained_irq_enter(chip, desc);
> > +
> > +	while ((status =
> > +	      (readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
> > +	      readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
> > +		writel(status, mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
> > +		for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
> > +			generic_handle_irq(
> > +				irq_find_mapping(altera_gc->mmchip.gc.irqdomain
> > +						, i));
> 
> That's kind of unpleasant to read.
> It might be better to use a separate these statements
> and use a temporary for irq_find_mapping()
> 

OK I'll fix it.

> > +static void altera_gpio_irq_leveL_high_handler(unsigned int irq,
> > +					      struct irq_desc *desc)
> > +{
> > +	struct altera_gpio_chip *altera_gc;
> > +	struct irq_chip *chip;
> > +	struct of_mm_gpio_chip *mm_gc;
> > +	unsigned long status;
> > +	int i;
> > +
> > +	altera_gc = irq_desc_get_handler_data(desc);
> > +	chip = irq_desc_get_chip(desc);
> > +	mm_gc = &altera_gc->mmchip;
> > +
> > +	chained_irq_enter(chip, desc);
> > +
> > +	status = readl(mm_gc->regs + ALTERA_GPIO_DATA);
> > +	status &= readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
> > +
> > +	for_each_set_bit(i, &status, mm_gc->gc.ngpio) {
> > +		generic_handle_irq(
> > +			irq_find_mapping(altera_gc->mmchip.gc.irqdomain, i));
> 
> Maybe a temporary here too
> 

Yup 

> > +int altera_gpio_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *node = pdev->dev.of_node;
> > +	int id, reg, ret;
> > +	struct altera_gpio_chip *altera_gc;
> > +
> > +	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
> > +
> > +	if (altera_gc == NULL)
> > +		return -ENOMEM;
> 
> No blank line after the devm_kzalloc please and
> 	if (!altera_gc)
> is more common.
> 
> 

OK noted. 

> > +	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH) {
> > +		gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
> > +			&altera_irq_chip,
> > +			altera_gc->mapped_irq,
> > +			altera_gpio_irq_leveL_high_handler);
> > +	} else {
> > +		gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
> > +			&altera_irq_chip,
> > +			altera_gc->mapped_irq,
> > +			altera_gpio_irq_edge_handler);
> > +	}
> 
> Sometimes using a ?: ternary is smaller code
> 
> 	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
> 				     &altera_irq_chip,
> 				     altera_gc->mapped_irq,
> 				     altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
> 				     altera_gpio_irq_leveL_high_handler :
> 				     altera_gpio_irq_edge_handler);
> > 
> 
Yup I'll fix it.

Regards,
Tien Hock Loh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
