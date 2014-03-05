From: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH] pinctrl: at91: add the config GPIO_OUTPUT_x
Date: Wed, 5 Mar 2014 05:31:58 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364172FF4EC4@penmbx01>
References: <1393984400-14687-1-git-send-email-wenyou.yang@atmel.com>
 <635C1A75-4651-4B2C-AB64-E1D170A1F5F9@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <635C1A75-4651-4B2C-AB64-E1D170A1F5F9-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org" <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, "<linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org> mailing list" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi JC,

> -----Original Message-----
> From: Jean-Christophe PLAGNIOL-VILLARD [mailto:plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org]
> Sent: Wednesday, March 05, 2014 12:58 PM
> To: Yang, Wenyou
> Cc: Jean-Christophe PLAGNIOL-VILLARD; linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org; <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org> mailing
> list; Linux Kernel list; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org;
> galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
> Subject: Re: [PATCH] pinctrl: at91: add the config GPIO_OUTPUT_x
> 
> 
> On Mar 5, 2014, at 9:53 AM, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> 
> > In order to support the pinctrl sleep state.
> 
> As I said before NACK
> 
> this is not the job of the pinctrl to describe gpio output or input
> state
But according to what said in the section "GPIO mode pitfalls" of Documentation/pinctrl.txt.
It should be handle by the pinctrl.

If not, to deal with the sleep state will be very complicated. 
Muxing the pins for FUNCTION to enable peripheral, then twist them over to GPIO mode
and use gpio_direction_output() to drive it HIGH or LOW during sleep.

--->8 ------------
The solution is to not think that what the datasheet calls "GPIO mode"
has to be handled by the <linux/gpio.h> interface. Instead view this as
a certain pin config setting. Look in e.g. <linux/pinctrl/pinconf-generic.h>
and you find this in the documentation:

  PIN_CONFIG_OUTPUT: this will configure the pin in output, use argument
     1 to indicate high level, argument 0 to indicate low level.

So it is perfectly possible to push a pin into "GPIO mode" and drive the
line low as part of the usual pin control map.
---<8 ------------

Best Regards,
Wenyou Yang

> 
> Best Regards,
> J.
> >
> > Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> > Hi Linus,
> >
> > The patch is based on branch: for-next
> > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> >
> > Best Regards,
> > Wenyou Yang
> >
> > drivers/pinctrl/pinctrl-at91.c     |   31
> +++++++++++++++++++++++++++++++
> > include/dt-bindings/pinctrl/at91.h |    2 ++
> > 2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/pinctrl/pinctrl-at91.c
> > b/drivers/pinctrl/pinctrl-at91.c index 5d24aae..fc51e59 100644
> > --- a/drivers/pinctrl/pinctrl-at91.c
> > +++ b/drivers/pinctrl/pinctrl-at91.c
> > @@ -62,6 +62,8 @@ static int gpio_banks;
> > #define DEGLITCH	(1 << 2)
> > #define PULL_DOWN	(1 << 3)
> > #define DIS_SCHMIT	(1 << 4)
> > +#define GPIO_OUTPUT_HIGH	(1 << 5)
> > +#define GPIO_OUTPUT_LOW		(1 << 6)
> > #define DEBOUNCE	(1 << 16)
> > #define DEBOUNCE_VAL_SHIFT	17
> > #define DEBOUNCE_VAL	(0x3fff << DEBOUNCE_VAL_SHIFT)
> > @@ -152,12 +154,15 @@ struct at91_pinctrl_mux_ops {
> > 	void (*set_pulldown)(void __iomem *pio, unsigned mask, bool is_on);
> > 	bool (*get_schmitt_trig)(void __iomem *pio, unsigned pin);
> > 	void (*disable_schmitt_trig)(void __iomem *pio, unsigned mask);
> > +	bool (*get_gpio_output)(void __iomem *pio, unsigned mask);
> > +	void (*set_gpio_output)(void __iomem *pio, unsigned mask, bool
> > +is_high);
> > 	/* irq */
> > 	int (*irq_type)(struct irq_data *d, unsigned type); };
> >
> > static int gpio_irq_type(struct irq_data *d, unsigned type); static
> > int alt_gpio_irq_type(struct irq_data *d, unsigned type);
> > +static void at91_mux_gpio_enable(void __iomem *pio, unsigned mask,
> > +bool input);
> >
> > struct at91_pinctrl {
> > 	struct device		*dev;
> > @@ -472,6 +477,20 @@ static bool at91_mux_pio3_get_schmitt_trig(void
> __iomem *pio, unsigned pin)
> > 	return (__raw_readl(pio + PIO_SCHMITT) >> pin) & 0x1; }
> >
> > +static bool at91_mux_pio3_get_gpio_output(void __iomem *pio, unsigned
> > +pin) {
> > +	return (__raw_readl(pio + PIO_ODSR) >> pin) & 0x1; }
> > +
> > +static void at91_mux_pio3_set_gpio_output(void __iomem *pio,
> > +						unsigned mask,
> > +						bool is_high)
> > +{
> > +	at91_mux_gpio_enable(pio, mask, 0);
> > +	writel_relaxed(mask, pio + (is_high ? PIO_SODR : PIO_CODR)); }
> > +
> > +
> > static struct at91_pinctrl_mux_ops at91rm9200_ops = {
> > 	.get_periph	= at91_mux_get_periph,
> > 	.mux_A_periph	= at91_mux_set_A_periph,
> > @@ -495,6 +514,8 @@ static struct at91_pinctrl_mux_ops at91sam9x5_ops
> = {
> > 	.set_pulldown	= at91_mux_pio3_set_pulldown,
> > 	.get_schmitt_trig = at91_mux_pio3_get_schmitt_trig,
> > 	.disable_schmitt_trig = at91_mux_pio3_disable_schmitt_trig,
> > +	.get_gpio_output = at91_mux_pio3_get_gpio_output,
> > +	.set_gpio_output = at91_mux_pio3_set_gpio_output,
> > 	.irq_type	= alt_gpio_irq_type,
> > };
> >
> > @@ -741,6 +762,10 @@ static int at91_pinconf_get(struct pinctrl_dev
> *pctldev,
> > 		*config |= PULL_DOWN;
> > 	if (info->ops->get_schmitt_trig && info->ops->get_schmitt_trig(pio,
> pin))
> > 		*config |= DIS_SCHMIT;
> > +	if (info->ops->get_gpio_output) {
> > +		*config |= info->ops->get_gpio_output(pio, pin) ?
> > +					GPIO_OUTPUT_HIGH : GPIO_OUTPUT_LOW;
> > +	}
> >
> > 	return 0;
> > }
> > @@ -778,6 +803,12 @@ static int at91_pinconf_set(struct pinctrl_dev
> *pctldev,
> > 			info->ops->set_pulldown(pio, mask, config & PULL_DOWN);
> > 		if (info->ops->disable_schmitt_trig && config & DIS_SCHMIT)
> > 			info->ops->disable_schmitt_trig(pio, mask);
> > +		if (info->ops->set_gpio_output) {
> > +			if (config & GPIO_OUTPUT_HIGH)
> > +				info->ops->set_gpio_output(pio, mask, 1);
> > +			if (config & GPIO_OUTPUT_LOW)
> > +				info->ops->set_gpio_output(pio, mask, 0);
> > +		};
> >
> > 	} /* for each config */
> >
> > diff --git a/include/dt-bindings/pinctrl/at91.h
> > b/include/dt-bindings/pinctrl/at91.h
> > index 0fee6ff..e799268 100644
> > --- a/include/dt-bindings/pinctrl/at91.h
> > +++ b/include/dt-bindings/pinctrl/at91.h
> > @@ -15,6 +15,8 @@
> > #define AT91_PINCTRL_DEGLITCH		(1 << 2)
> > #define AT91_PINCTRL_PULL_DOWN		(1 << 3)
> > #define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
> > +#define AT91_PINCTRL_OUTPUT_HIGH	(1 << 5)
> > +#define AT91_PINCTRL_OUTPUT_LOW		(1 << 6)
> > #define AT91_PINCTRL_DEBOUNCE		(1 << 16)
> > #define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
> >
> > --
> > 1.7.9.5
> >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
