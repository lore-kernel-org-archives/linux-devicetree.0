From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/7] USB: chipidea: ci13xxx-imx: move static pdata into
 probe function
Date: Wed, 5 Jun 2013 14:29:06 +0200
Message-ID: <20130605122906.GB20095@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-3-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370025529-7414-3-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On Fri, May 31, 2013 at 08:38:44PM +0200, Michael Grzeschik wrote:
> From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> The pdata structure gets copied anyway inside ci13xxx_add_device
> by platform_device_add. We don't need to have it static.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/chipidea/ci13xxx_imx.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
> index 73f9d5f..4d64541 100644
> --- a/drivers/usb/chipidea/ci13xxx_imx.c
> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
> @@ -88,17 +88,16 @@ EXPORT_SYMBOL_GPL(usbmisc_get_init_data);
>  
>  /* End of common functions shared by usbmisc drivers*/
>  
> -static struct ci13xxx_platform_data ci13xxx_imx_platdata  = {
> -	.name			= "ci13xxx_imx",
> -	.flags			= CI13XXX_REQUIRE_TRANSCEIVER |
> -				  CI13XXX_PULLUP_ON_VBUS |
> -				  CI13XXX_DISABLE_STREAMING,
> -	.capoffset		= DEF_CAPOFFSET,
> -};
> -
>  static int ci13xxx_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci13xxx_imx_data *data;
> +	struct ci13xxx_platform_data pdata = {
> +		.name		= "ci13xxx_imx",
> +		.capoffset	= DEF_CAPOFFSET,
> +		.flags		= CI13XXX_REQUIRE_TRANSCEIVER |
> +				  CI13XXX_PULLUP_ON_VBUS |
> +				  CI13XXX_DISABLE_STREAMING,
> +	};
>  	struct platform_device *plat_ci, *phy_pdev;
>  	struct device_node *phy_np;
>  	struct resource *res;
> @@ -171,7 +170,7 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
>  		reg_vbus = NULL;
>  	}
>  
> -	ci13xxx_imx_platdata.phy = data->phy;
> +	pdata.phy = data->phy;
>  
>  	if (!pdev->dev.dma_mask)
>  		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> @@ -189,7 +188,7 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
>  
>  	plat_ci = ci13xxx_add_device(&pdev->dev,
>  				pdev->resource, pdev->num_resources,
> -				&ci13xxx_imx_platdata);
> +				&pdata);
>  	if (IS_ERR(plat_ci)) {
>  		ret = PTR_ERR(plat_ci);
>  		dev_err(&pdev->dev,

This and Patch 5, 6 and 7 of this series doesn't got much to do with
the the dr_mode/phy_type features. I will repost them in another series.
Beside the others, this one is missing any comments. If it's already good
to be taken, will you directly apply it?

Regards,
Michael

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
