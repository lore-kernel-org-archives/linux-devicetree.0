From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/4 v4] GPIO: gpio-dwapb: Support Debounce
Date: Tue, 16 Sep 2014 11:37:49 +0300
Message-ID: <1410856669.7023.54.camel@linux.intel.com>
References: <1410859335-11080-1-git-send-email-alvin.chen@intel.com>
	 <1410859335-11080-4-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410859335-11080-4-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-09-16 at 02:22 -0700, Weike Chen wrote:
> This patch enables 'debounce' for the designware GPIO, and
> it is based on Josef Ahmad's previous work.
> 
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko@intel.com>

This line is wrong. How come?

Couple of minor comments below, and after addressing them, please, use 
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Weike Chen <alvin.chen@intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 534945c..9a76e3c 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -37,6 +37,7 @@
>  #define GPIO_INTTYPE_LEVEL	0x38
>  #define GPIO_INT_POLARITY	0x3c
>  #define GPIO_INTSTATUS		0x40
> +#define GPIO_PORTA_DEBOUNCE	0x48
>  #define GPIO_PORTA_EOI		0x4c
>  #define GPIO_EXT_PORTA		0x50
>  #define GPIO_EXT_PORTB		0x54
> @@ -235,6 +236,29 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	return 0;
>  }
>  
> +static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
> +				   unsigned offset, unsigned debounce)
> +{
> +	struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +	struct dwapb_gpio_port *port =
> +			container_of(bgc, struct dwapb_gpio_port, bgc);

Does it make sense to introduce an inline helper like

static inline struct dwapb_gpio_port *to_dwapb_gpio_port(struct
bgpio_chip *gc)
{...}

?

There is also another place where it could be used.

> +	struct dwapb_gpio *gpio = port->gpio;
> +	unsigned long flags, val_deb;
> +	unsigned long mask = bgc->pin2mask(bgc, offset);
> +
> +	spin_lock_irqsave(&bgc->lock, flags);
> +
> +	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
> +	if (debounce)
> +		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, mask | val_deb);

May you put value on the first place? Like 'val_deb | mask'.

> +	else
> +		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, ~mask & val_deb);

Ditto.

> +

> +	spin_unlock_irqrestore(&bgc->lock, flags);
> +
> +	return 0;
> +}
> +
>  static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
>  {
>  	u32 worked;
> @@ -373,6 +397,10 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  	port->bgc.gc.ngpio = pp->ngpio;
>  	port->bgc.gc.base = pp->gpio_base;
>  
> +	/* Only port A support debounce */
> +	if (pp->idx == 0)
> +		port->bgc.gc.set_debounce = dwapb_gpio_set_debounce;
> +
>  	if (pp->irq)
>  		dwapb_configure_irqs(gpio, port, pp);
>  


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

