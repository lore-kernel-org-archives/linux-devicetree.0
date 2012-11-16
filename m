From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 6/7] usb: chipidea: usbmisc: add mx53 support
Date: Fri, 16 Nov 2012 15:22:34 +0200
Message-ID: <87obix65t1.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352981028-14312-1-git-send-email-m.grzeschik@pengutronix.de> <1352981028-14312-7-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352981028-14312-7-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> This adds mx53 as the next user of the usbmisc driver and makes it
> possible to disable the overcurrent-detection of the internal phy.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 913e414..9718500 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -54,6 +54,29 @@ static struct usbmisc_usb_device *get_usbdev(struct device *dev)
>  	return &usbmisc->usbdev[i];
>  }
>  
> +static int usbmisc_imx53_init(struct device *dev)
> +{
> +	struct usbmisc_usb_device *usbdev;
> +	void __iomem *reg;
> +	unsigned long flags;
> +	u32 val;
> +
> +	usbdev = get_usbdev(dev);
> +	if (IS_ERR(usbdev))
> +		return PTR_ERR(usbdev);
> +
> +	reg = usbmisc->base + usbdev->index * 8;
> +
> +	if (usbdev->disable_oc) {
> +		spin_lock_irqsave(&usbmisc->lock, flags);
> +		val = readl(reg);
> +		writel(val | (1 << 5), reg);

We know now that (1 << 5) probably means "disable overcurrent
detection", but is there a definition for this register's bits
somewhere?

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
