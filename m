From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 4/6] usb: chipidea: usbmisc: add support for ahb, ipg and per clock
Date: Wed, 14 Nov 2012 15:39:11 +0200
Message-ID: <87mwyk718g.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de> <1352894137-2050-5-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352894137-2050-5-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> This patch adds support for ahb, ipg and per clock, which is needed to support
> imx53.

I would also suggest using a more elaborate wording here, some people
might also be interested what are the different clocks for (like,
interface, peripheral, etc etc).

>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c |   60 +++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 72445f7..239b752 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -24,7 +24,9 @@
>  struct imx_usbmisc {
>  	void __iomem *base;
>  	spinlock_t lock;
> -	struct clk *clk;
> +	struct clk *clk_ahb;
> +	struct clk *clk_ipg;
> +	struct clk *clk_per;
>  	struct usbmisc_usb_device usbdev[USB_DEV_MAX];
>  	const struct usbmisc_ops *ops;
>  };
> @@ -104,38 +106,66 @@ static int __devinit usbmisc_imx_probe(struct platform_device *pdev)
>  	if (!data->base)
>  		return -EADDRNOTAVAIL;
>  
> -	data->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(data->clk)) {
> +	data->clk_ahb = devm_clk_get(&pdev->dev, "ahb");

I suppose the clock names are also being added/changed in the platform
code in another patchset that's also being queued? What's the target
merge window (if there's a dependency)?

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
