From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/6] gpio: brcmstb: Allow GPIOs to be wakeup sources
Date: Fri, 29 May 2015 17:43:43 -0700
Message-ID: <20150530004343.GX27753@ld-irv-0074>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
 <1432865650-4062-5-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432865650-4062-5-git-send-email-gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2015 at 07:14:08PM -0700, Gregory Fong wrote:
> Several drivers (e.g. gpio-keys) allow for GPIOs to be configured as
> wakeup sources, and this GPIO controller supports that through a
> separate interrupt path.
> 
> The de-facto standard DT property "wakeup-source" is checked, since
> that indicates whether the GPIO controller hardware can wake.  Uses
> the IRQCHIP_MASK_ON_SUSPEND irq_chip flag because UPG GIO doesn't have
> any of its own wakeup source configuration.
> 
> Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> New in v2.
> 
>  drivers/gpio/gpio-brcmstb.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index b9962ff..2598c1e 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -19,6 +19,7 @@
>  #include <linux/basic_mmio_gpio.h>
>  #include <linux/irqdomain.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/interrupt.h>
>  
>  #define GIO_BANK_SIZE           0x20
>  #define GIO_ODEN(bank)          (((bank) * GIO_BANK_SIZE) + 0x00)
> @@ -48,6 +49,7 @@ struct brcmstb_gpio_priv {
>  	struct irq_domain *irq_domain;
>  	int parent_irq;
>  	int gpio_base;
> +	int parent_wake_irq;
>  };
>  
>  #define MAX_GPIO_PER_BANK           32
> @@ -183,6 +185,31 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	return 0;
>  }
>  
> +static int brcmstb_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
> +{
> +	struct brcmstb_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> +	struct brcmstb_gpio_priv *priv = bank->parent_priv;
> +
> +	/*
> +	 * Only enable wake IRQ once for however many hwirqs can wake
> +	 * since they all use the same wake IRQ.  Mask will be set
> +	 * up appropriately thanks to IRQCHIP_MASK_ON_SUSPEND flag.
> +	 */
> +	if (enable)
> +		enable_irq_wake(priv->parent_wake_irq);
> +	else
> +		disable_irq_wake(priv->parent_wake_irq);
> +	return 0;
> +}
> +
> +static irqreturn_t brcmstb_gpio_wake_irq_handler(int irq, void *data)
> +{
> +	struct brcmstb_gpio_priv *priv = data;
> +
> +	pm_wakeup_event(&priv->pdev->dev, 0);
> +	return IRQ_HANDLED;
> +}
> +
>  static void brcmstb_gpio_irq_bank_handler(int irq,
>  		struct brcmstb_gpio_bank *bank)
>  {
> @@ -369,6 +396,32 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
>  	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
>  	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
>  	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
> +
> +	/* Ensures that all non-wakeup IRQs are disabled at suspend */
> +	priv->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND;
> +
> +	if (IS_ENABLED(CONFIG_PM_SLEEP) &&
> +			of_get_property(np, "wakeup-source", NULL)) {

of_property_read_bool()?

> +		priv->parent_wake_irq = platform_get_irq(pdev, 1);
> +		if (priv->parent_wake_irq < 0)  {
> +			dev_warn(dev,
> +				"Couldn't get wake IRQ - GPIOs will not be able to wake from sleep");
> +		} else {
> +			int err = devm_request_irq(dev, priv->parent_wake_irq,
> +					brcmstb_gpio_wake_irq_handler, 0,
> +					"brcmstb-gpio-wake", priv);
> +
> +			if (err < 0) {
> +				dev_err(dev, "Couldn't request wake IRQ");
> +				return err;
> +			}
> +
> +			device_set_wakeup_capable(dev, true);
> +			device_wakeup_enable(dev);

Might want to move these two lines above the devm_request_irq(), so that
you're ready to record PM events immediately at probe time. This is
important when waking from S5 states, where we sometimes want to be able
to check the /sys/devices/.../wakeup_count stats to see what woke us up.

> +			priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
> +		}
> +	}
> +
>  	priv->irq_domain =
>  		irq_domain_add_linear(np, priv->num_gpios,
>  				      &brcmstb_gpio_irq_domain_ops,

With that:

Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
