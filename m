From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 13/23] usb: gadget: acm_ms: allocate and init otg
 descriptor by otg capabilities
Date: Wed, 17 Jun 2015 12:11:01 +0300
Message-ID: <20150617121101.2cd431c5@rockdesk>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
	<1434519835-27745-14-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-14-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wed, 17 Jun 2015 13:43:45 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Allocate and initialize usb otg descriptor according to gadget otg
> capabilities, add it for each usb configurations, free it while
> composite unbind. If otg capability is not defined, keep its otg

there is no composite unbind in acm_ms.c.

> descriptor unchanged.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/gadget/legacy/acm_ms.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/acm_ms.c b/drivers/usb/gadget/legacy/acm_ms.c
> index 1194b09..f9b7b31 100644
> --- a/drivers/usb/gadget/legacy/acm_ms.c
> +++ b/drivers/usb/gadget/legacy/acm_ms.c
> @@ -58,21 +58,7 @@ static struct usb_device_descriptor device_desc = {
>  	/*.bNumConfigurations =	DYNAMIC*/
>  };
>  
> -static struct usb_otg_descriptor otg_descriptor = {
> -	.bLength =		sizeof otg_descriptor,
> -	.bDescriptorType =	USB_DT_OTG,
> -
> -	/*
> -	 * REVISIT SRP-only hardware is possible, although
> -	 * it would not be called "OTG" ...
> -	 */
> -	.bmAttributes =		USB_OTG_SRP | USB_OTG_HNP,
> -};
> -
> -static const struct usb_descriptor_header *otg_desc[] = {
> -	(struct usb_descriptor_header *) &otg_descriptor,
> -	NULL,
> -};
> +static const struct usb_descriptor_header *otg_desc[2];
>  
>  /* string IDs are assigned dynamically */
>  static struct usb_string strings_dev[] = {
> @@ -127,6 +113,16 @@ static int acm_ms_do_config(struct usb_configuration *c)
>  	int	status;
>  
>  	if (gadget_is_otg(c->cdev->gadget)) {
> +		if (!otg_desc[0]) {
> +			struct usb_descriptor_header *usb_desc;
> +
> +			usb_desc = usb_otg_descriptor_alloc(c->cdev->gadget);
> +			if (!usb_desc)
> +				return -ENOMEM;
> +			usb_otg_descriptor_init(c->cdev->gadget, usb_desc);
> +			otg_desc[0] = usb_desc;
> +			otg_desc[1] = NULL;

I think it is symmetric to put this code in acm_ms_bind()
as you are freeing the descriptor in acm_ms_unbind().

Same applies for all other gadgets as well.

> +		}
>  		c->descriptors = otg_desc;
>  		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
>  	}
> @@ -255,6 +251,9 @@ static int acm_ms_unbind(struct usb_composite_dev *cdev)
>  	usb_put_function_instance(fi_msg);
>  	usb_put_function(f_acm);
>  	usb_put_function_instance(f_acm_inst);
> +	kfree(otg_desc[0]);
> +	otg_desc[0] = NULL;
> +
>  	return 0;
>  }
>  

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
