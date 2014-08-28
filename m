From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 2/3] GPIO: gpio-dwapb: Support Debounce
Date: Thu, 28 Aug 2014 10:11:56 -0500
Message-ID: <alpine.DEB.2.02.1408281007290.26299@atx-linux-37>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com> <1409161588-19417-3-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1409161588-19417-3-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Mika Westerberg <mika.westerberg@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Aug 2014, Weike Chen wrote:

> This patch enables 'debounce' for the designware GPIO, and
> it is based on Josef Ahmad's previous work.
> 
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c |   42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 155a64b..e0ab988 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -36,6 +36,7 @@
>  #define GPIO_INTTYPE_LEVEL	0x38
>  #define GPIO_INT_POLARITY	0x3c
>  #define GPIO_INTSTATUS		0x40
> +#define GPIO_PORTA_DEBOUNCE	0x48
>  #define GPIO_PORTA_EOI		0x4c
>  #define GPIO_EXT_PORTA		0x50
>  #define GPIO_EXT_PORTB		0x54
> @@ -64,6 +65,23 @@ struct dwapb_gpio {
>  	const struct dwapb_gpio_platform_data	*pdata;
>  };
>  
> +static inline u32 dwapb_read(struct dwapb_gpio *gpio, unsigned int offset)
> +{
> +	struct bgpio_chip *bgc	= &gpio->ports[0].bgc;
> +	void __iomem *reg_base	= gpio->regs;
> +
> +	return bgc->read_reg(reg_base + offset);
> +}
> +
> +static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
> +			       u32 val)
> +{
> +	struct bgpio_chip *bgc	= &gpio->ports[0].bgc;
> +	void __iomem *reg_base	= gpio->regs;
> +
> +	bgc->write_reg(reg_base + offset, val);
> +}
> +

Hello,

I don't understand the reason for adding dwapb_read and dwapb_write here.  
The rest of the driver is using readl and writel.  I'd rather not see two 
different methods being used in the same driver for register access.  
Maybe I'm missing something, but if we need to add dwapb_read/write, then
it should be used for all register access.

Alan

>  static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  {
>  	struct bgpio_chip *bgc = to_bgpio_chip(gc);
> @@ -209,6 +227,29 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	return 0;
>  }
>  
> +static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
> +				   unsigned offset, unsigned debounce)
> +{
> +	struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +	struct dwapb_gpio_port *port =
> +			container_of(bgc, struct dwapb_gpio_port, bgc);
> +	struct dwapb_gpio *gpio = port->gpio;
> +	unsigned long flags, val_deb;
> +	unsigned long mask = bgc->pin2mask(bgc, offset);
> +
> +	spin_lock_irqsave(&bgc->lock, flags);
> +
> +	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
> +	if (debounce)
> +		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, mask | val_deb);
> +	else
> +		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, ~mask & val_deb);
> +
> +	spin_unlock_irqrestore(&bgc->lock, flags);
> +
> +	return 0;
> +}
> +
>  static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
>  {
>  	struct irq_desc *desc = irq_to_desc(irq);
> @@ -342,6 +383,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  
>  	port->bgc.gc.ngpio = pp->ngpio;
>  	port->bgc.gc.base = pp->gpio_base;
> +	port->bgc.gc.set_debounce = dwapb_gpio_set_debounce;
>  
>  	/*
>  	 * Only port A can provide interrupts in all configurations of the IP.
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
