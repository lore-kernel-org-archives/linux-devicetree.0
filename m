From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: at91: add the config GPIO_OUTPUT_x
Date: Tue, 11 Mar 2014 18:37:07 +0100
Message-ID: <531F49C3.2020506@atmel.com>
References: <1393984400-14687-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393984400-14687-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/03/2014 02:53, Wenyou Yang :
> In order to support the pinctrl sleep state.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Wenyou,

This patch has been discussed here:
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-August/194975.html

I even gave my Acknowledgement on Boris' patch. Can you please check the
differences between Boris' patch and yours?

Linus,

For the nature of this feature, I would like to have your clear advice
as this is needed and has been proposed twice (at least). This feature
is needed for power management states of GPIOs.

Best regards,


> ---
> Hi Linus,
> 
> The patch is based on branch: for-next
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> 
> Best Regards,
> Wenyou Yang
> 
>  drivers/pinctrl/pinctrl-at91.c     |   31 +++++++++++++++++++++++++++++++
>  include/dt-bindings/pinctrl/at91.h |    2 ++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 5d24aae..fc51e59 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -62,6 +62,8 @@ static int gpio_banks;
>  #define DEGLITCH	(1 << 2)
>  #define PULL_DOWN	(1 << 3)
>  #define DIS_SCHMIT	(1 << 4)
> +#define GPIO_OUTPUT_HIGH	(1 << 5)
> +#define GPIO_OUTPUT_LOW		(1 << 6)
>  #define DEBOUNCE	(1 << 16)
>  #define DEBOUNCE_VAL_SHIFT	17
>  #define DEBOUNCE_VAL	(0x3fff << DEBOUNCE_VAL_SHIFT)
> @@ -152,12 +154,15 @@ struct at91_pinctrl_mux_ops {
>  	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool is_on);
>  	bool (*get_schmitt_trig)(void __iomem *pio, unsigned pin);
>  	void (*disable_schmitt_trig)(void __iomem *pio, unsigned mask);
> +	bool (*get_gpio_output)(void __iomem *pio, unsigned mask);
> +	void (*set_gpio_output)(void __iomem *pio, unsigned mask, bool is_high);
>  	/* irq */
>  	int (*irq_type)(struct irq_data *d, unsigned type);
>  };
>  
>  static int gpio_irq_type(struct irq_data *d, unsigned type);
>  static int alt_gpio_irq_type(struct irq_data *d, unsigned type);
> +static void at91_mux_gpio_enable(void __iomem *pio, unsigned mask, bool input);
>  
>  struct at91_pinctrl {
>  	struct device		*dev;
> @@ -472,6 +477,20 @@ static bool at91_mux_pio3_get_schmitt_trig(void __iomem *pio, unsigned pin)
>  	return (__raw_readl(pio + PIO_SCHMITT) >> pin) & 0x1;
>  }
>  
> +static bool at91_mux_pio3_get_gpio_output(void __iomem *pio, unsigned pin)
> +{
> +	return (__raw_readl(pio + PIO_ODSR) >> pin) & 0x1;
> +}
> +
> +static void at91_mux_pio3_set_gpio_output(void __iomem *pio,
> +						unsigned mask,
> +						bool is_high)
> +{
> +	at91_mux_gpio_enable(pio, mask, 0);
> +	writel_relaxed(mask, pio + (is_high ? PIO_SODR : PIO_CODR));
> +}
> +
> +
>  static struct at91_pinctrl_mux_ops at91rm9200_ops = {
>  	.get_periph	= at91_mux_get_periph,
>  	.mux_A_periph	= at91_mux_set_A_periph,
> @@ -495,6 +514,8 @@ static struct at91_pinctrl_mux_ops at91sam9x5_ops = {
>  	.set_pulldown	= at91_mux_pio3_set_pulldown,
>  	.get_schmitt_trig = at91_mux_pio3_get_schmitt_trig,
>  	.disable_schmitt_trig = at91_mux_pio3_disable_schmitt_trig,
> +	.get_gpio_output = at91_mux_pio3_get_gpio_output,
> +	.set_gpio_output = at91_mux_pio3_set_gpio_output,
>  	.irq_type	= alt_gpio_irq_type,
>  };
>  
> @@ -741,6 +762,10 @@ static int at91_pinconf_get(struct pinctrl_dev *pctldev,
>  		*config |= PULL_DOWN;
>  	if (info->ops->get_schmitt_trig && info->ops->get_schmitt_trig(pio, pin))
>  		*config |= DIS_SCHMIT;
> +	if (info->ops->get_gpio_output) {
> +		*config |= info->ops->get_gpio_output(pio, pin) ?
> +					GPIO_OUTPUT_HIGH : GPIO_OUTPUT_LOW;
> +	}
>  
>  	return 0;
>  }
> @@ -778,6 +803,12 @@ static int at91_pinconf_set(struct pinctrl_dev *pctldev,
>  			info->ops->set_pulldown(pio, mask, config & PULL_DOWN);
>  		if (info->ops->disable_schmitt_trig && config & DIS_SCHMIT)
>  			info->ops->disable_schmitt_trig(pio, mask);
> +		if (info->ops->set_gpio_output) {
> +			if (config & GPIO_OUTPUT_HIGH)
> +				info->ops->set_gpio_output(pio, mask, 1);
> +			if (config & GPIO_OUTPUT_LOW)
> +				info->ops->set_gpio_output(pio, mask, 0);
> +		};
>  
>  	} /* for each config */
>  
> diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> index 0fee6ff..e799268 100644
> --- a/include/dt-bindings/pinctrl/at91.h
> +++ b/include/dt-bindings/pinctrl/at91.h
> @@ -15,6 +15,8 @@
>  #define AT91_PINCTRL_DEGLITCH		(1 << 2)
>  #define AT91_PINCTRL_PULL_DOWN		(1 << 3)
>  #define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
> +#define AT91_PINCTRL_OUTPUT_HIGH	(1 << 5)
> +#define AT91_PINCTRL_OUTPUT_LOW		(1 << 6)
>  #define AT91_PINCTRL_DEBOUNCE		(1 << 16)
>  #define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
>  
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
