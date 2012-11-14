From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 9/9] usb: chipidea: udc: configure iso endpoints
Date: Wed, 14 Nov 2012 21:04:29 +0300
Message-ID: <50A3DD2D.7050500@mvista.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-10-git-send-email-m.grzeschik@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352909950-32555-10-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/14/2012 07:19 PM, Michael Grzeschik wrote:

> The implementation is derived from the fsl_udc_core code in
> fsl_ep_enable and makes basic iso handling possible.

> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/usb/chipidea/udc.c |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 2999b0d..0bc4308 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1058,6 +1058,9 @@ static int ep_enable(struct usb_ep *ep,
>  	int retval = 0;
>  	unsigned long flags;
>  
> +	unsigned short max = 0;

   It doesn't look like this initialization is necessary.

> +	unsigned char mult = 0;
> +
>  	if (ep == NULL || desc == NULL)
>  		return -EINVAL;
>  
> @@ -1075,6 +1078,7 @@ static int ep_enable(struct usb_ep *ep,
>  	mEp->type = usb_endpoint_type(desc);
>  
>  	mEp->ep.maxpacket = usb_endpoint_maxp(desc);
> +	max = usb_endpoint_maxp(desc);
>  
>  	dbg_event(_usb_addr(mEp), "ENABLE", 0);
>  
> @@ -1082,8 +1086,12 @@ static int ep_enable(struct usb_ep *ep,
>  
>  	if (mEp->type == USB_ENDPOINT_XFER_CONTROL)
>  		mEp->qh.ptr->cap |=  QH_IOS;
> -	else if (mEp->type == USB_ENDPOINT_XFER_ISOC)
> -		mEp->qh.ptr->cap &= ~QH_MULT;
> +	else if (mEp->type == USB_ENDPOINT_XFER_ISOC) {
> +		/* Calculate transactions needed for high bandwidth iso */
> +		mult = (unsigned char)(1 + ((max >> 11) & 0x03));
> +		max = max & 0x7ff;	/* bit 0~10 */

	max &= 0x7ff;

> +		mEp->qh.ptr->cap |= (mult << 30);

   Parens not needed.

> +	}
>  	else
>  		mEp->qh.ptr->cap &= ~QH_ZLT;
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
