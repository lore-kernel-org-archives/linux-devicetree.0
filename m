From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 3/9] usb: chipidea: ci13xxx-imx: create dynamic platformdata
Date: Fri, 16 Nov 2012 12:14:43 +0200
Message-ID: <87ehjt7t2k.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-4-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352909950-32555-4-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> This patch removes the limitation of having only one instance of the
> ci13xxx-imx platformdata and makes different configurations possible.

In more honest wording it should probably say: "makes using different
phys possible", but this is fine too. :)

>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/chipidea/ci13xxx_imx.c |   27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
> index 570aedf..7b99c96 100644
> --- a/drivers/usb/chipidea/ci13xxx_imx.c
> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
> @@ -87,15 +87,6 @@ EXPORT_SYMBOL_GPL(usbmisc_get_init_data);
>  
>  /* End of common functions shared by usbmisc drivers*/
>  
> -static struct ci13xxx_platform_data ci13xxx_imx_platdata __devinitdata  = {
> -	.name			= "ci13xxx_imx",
> -	.flags			= CI13XXX_REQUIRE_TRANSCEIVER |
> -				  CI13XXX_PULLUP_ON_VBUS |
> -				  CI13XXX_DISABLE_STREAMING |
> -				  CI13XXX_REGS_SHARED,
> -	.capoffset		= DEF_CAPOFFSET,
> -};
> -
>  static int ci13xxx_otg_set_vbus(struct usb_otg *otg, bool enabled)
>  {
>  
> @@ -117,6 +108,7 @@ static int ci13xxx_otg_set_vbus(struct usb_otg *otg, bool enabled)
>  static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci13xxx_imx_data *data;
> +	struct ci13xxx_platform_data *pdata;
>  	struct platform_device *plat_ci, *phy_pdev;
>  	struct ci13xxx	*ci;
>  	struct device_node *phy_np;
> @@ -129,6 +121,19 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>  		&& !usbmisc_ops)
>  		return -EPROBE_DEFER;
>  
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata) {
> +		dev_err(&pdev->dev, "Failed to allocate CI13xxx-IMX pdata!\n");
> +		return -ENOMEM;
> +	}
> +
> +	pdata->name = "ci13xxx_imx";
> +	pdata->capoffset = DEF_CAPOFFSET;
> +	pdata->flags = CI13XXX_REQUIRE_TRANSCEIVER |
> +		       CI13XXX_PULLUP_ON_VBUS |
> +		       CI13XXX_DISABLE_STREAMING |
> +		       CI13XXX_REGS_SHARED,
> +
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data) {
>  		dev_err(&pdev->dev, "Failed to allocate CI13xxx-IMX data!\n");
> @@ -209,7 +214,7 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>  	else
>  		reg_vbus = NULL;
>  
> -	ci13xxx_imx_platdata.phy = data->phy;
> +	pdata->phy = data->phy;
>  
>  	if (!pdev->dev.dma_mask) {
>  		pdev->dev.dma_mask = devm_kzalloc(&pdev->dev,
> @@ -234,7 +239,7 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
>  
>  	plat_ci = ci13xxx_add_device(&pdev->dev,
>  				pdev->resource, pdev->num_resources,
> -				&ci13xxx_imx_platdata);
> +				pdata);
>  	if (IS_ERR(plat_ci)) {
>  		ret = PTR_ERR(plat_ci);
>  		dev_err(&pdev->dev,
> -- 
> 1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
