From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] usb: gadget: pxa27x_udc: add devicetree support
Date: Wed, 25 Jun 2014 11:41:25 +0100
Message-ID: <20140625104125.GD14495@leverpostej>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403427899-32154-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 22, 2014 at 10:04:57AM +0100, Robert Jarzmik wrote:
> Add support for device-tree device discovery. If devicetree is not
> provided, fallback to legacy platform data "discovery".
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> ---
> Since V1: change OF id mrvl,pxa27x_udc -> marvell,pxa27x-udc
>           This is a consequence of other DT reviews on the marvell
>           namings.
> ---
>  drivers/usb/gadget/pxa27x_udc.c | 105 ++++++++++++++++++++++++++++++++--------
>  drivers/usb/gadget/pxa27x_udc.h |   4 ++
>  2 files changed, 90 insertions(+), 19 deletions(-)

[...]

> +/**
> + * pxa_udc_probe_dt - device tree specific probe
> + * @pdev: platform data
> + * @udc: pxa_udc structure to fill
> + *
> + * Fills udc from platform data out of device tree.
> + *
> + * Returns 0 if DT found, 1 if DT not found, and <0 on error

That's impossible as this function is marked as returning bool.

Make this an int and return negative error codes.

> + */
> +bool pxa_udc_probe_dt(struct platform_device *pdev, struct pxa_udc *udc)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	const struct of_device_id *of_id =
> +			of_match_device(udc_pxa_dt_ids, &pdev->dev);
> +	int ret;
> +	u32 gpio_pullup;
> +
> +	if (!np || !of_id)
> +		return 1;
> +	ret = of_alias_get_id(np, "udc");
> +	pdev->id = (ret >= 0) ? ret : -1;

The alias name wasn't mentioned in the binding...

> +
> +	if (!of_property_read_u32(np, "udc-pullup-gpio", &gpio_pullup))
> +		udc->gpio_pullup = gpio_pullup;

This number is a Linux internal detail. Use the GPIO bindings.

> +	udc->gpio_pullup_inverted =
> +		of_property_read_bool(np, "udc-pullup-gpio-inverted");

The GPIO bindings can describe this.

> @@ -2415,7 +2469,13 @@ static int pxa_udc_probe(struct platform_device *pdev)
>  {
>  	struct resource *regs;
>  	struct pxa_udc *udc = &memory;
> -	int retval = 0, gpio;
> +	int retval = 0;
> +
> +	retval = pxa_udc_probe_dt(pdev, udc);
> +	if (retval < 0)
> +		return retval;

This case can never happen given the prototype of pxa_udc_probe_dt.

> @@ -2446,6 +2504,9 @@ static int pxa_udc_probe(struct platform_device *pdev)
>  		retval = PTR_ERR(udc->clk);
>  		goto err_clk;
>  	}
> +	retval = clk_prepare(udc->clk);
> +	if (retval)
> +		goto err_clk_prepare;
>  
>  	retval = -ENOMEM;
>  	udc->regs = ioremap(regs->start, resource_size(regs));
> @@ -2483,9 +2544,13 @@ err_add_udc:
>  err_irq:
>  	iounmap(udc->regs);
>  err_map:
> +	clk_unprepare(udc->clk);
> +err_clk_prepare:
>  	clk_put(udc->clk);
>  	udc->clk = NULL;
>  err_clk:
> +	if (gpio_is_valid(udc->gpio_pullup))
> +		gpio_free(udc->gpio_pullup);
>  	return retval;
>  }
>  
> @@ -2509,6 +2574,7 @@ static int pxa_udc_remove(struct platform_device *_dev)
>  
>  	udc->transceiver = NULL;
>  	the_controller = NULL;
> +	clk_unprepare(udc->clk);
>  	clk_put(udc->clk);

I don't see why these clock changes should be in the same patch as the
DT support. They might be a prerequisite, but as far as I can tell they
are required even without DT probing.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
