From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 3/7] usb: chipidea: usbmisc: fix a potential race
 condition
Date: Fri, 23 Nov 2012 13:36:36 +0800
Message-ID: <20121123053635.GB22420@nchen-desktop>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de>
 <1353506793-8354-4-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353506793-8354-4-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2012 at 03:06:29PM +0100, Michael Grzeschik wrote:
> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> This fixes a potential race condition where the ci13xxx_imx glue code
> could be fast enough to call one of the usbmisc_ops before he got a
> valid value on the static usbmisc pointer. To fix that we first set
> usbmisc, then call usbmisc_set_ops().

usbmisc is subsys_initcall, and cil13xxx_imx is module_init. Any
potential situation that the ci13xxx_imx's probe is ran before the
usbmisc's probe is completed? Besides, there is usbmisc_ops value
check at the beginning of cil13xxx_imx's probe.
> 
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v1:
> * split previous patch into two seperate.
> 
>  drivers/usb/chipidea/usbmisc_imx.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 552c63f..9145e04 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -116,14 +116,14 @@ static int __devinit usbmisc_imx_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	usbmisc = data;
>  	ret = usbmisc_set_ops(&imx6q_usbmisc_ops);
>  	if (ret) {
> +		usbmisc = NULL;
>  		clk_disable_unprepare(data->clk);
>  		return ret;
>  	}
>  
> -	usbmisc = data;
> -
>  	return 0;
>  }
>  
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
