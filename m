From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Thu, 04 Feb 2016 14:37:52 +0100
Message-ID: <2084444.JalqY5vdCm@wuerfel>
References: <1454590807-26566-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454590807-26566-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 04 February 2016 14:00:07 Petr Kulhavy wrote:
> @@ -560,6 +626,97 @@ static int da8xx_probe(struct platform_device *pdev)
>  	glue->dev			= &pdev->dev;
>  	glue->clk			= clk;
> 
> +	if (np) {
> +		struct musb_hdrc_config *config;
> +		struct musb_hdrc_platform_data *data;
> +		u32 phy20_refclock_freq, phy20_clkmux_cfg;
> +
> +		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata) {
> +			ret = -ENOMEM;
> +			goto err5;
> +		}

So all the code here is built unconditionally...

> @@ -627,11 +784,22 @@ static int da8xx_remove(struct platform_device *pdev)
>  	return 0;
>  }
> 
> +#ifdef CONFIG_OF
> +static const struct of_device_id da8xx_id_table[] = {
> +	{
> +		.compatible = "ti,da8xx-musb"
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, da8xx_id_table);
> +#endif
> +

but this is in an #ifdef?

I would suggest you do the opposite and leave the id table in there
but change the first check to

	if (IS_ENABLED(CONFIG_OF) && np)

So the compiler can discard that code when CONFIG_OF is disabled.

> +		pdev->dev.dma_mask = &da8xx_dmamask;
> +		pdev->dev.coherent_dma_mask = da8xx_dmamask;

Don't hardcode DMA masks like this, the mask should be set to a 32-bit
mask whenever the device is created, and the driver can override it
by calling dma_set_mask().

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
