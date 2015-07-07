From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 23/23] usb: gadget: zero: allocate and init otg descriptor
 by otg capabilities
Date: Tue, 7 Jul 2015 16:55:16 +0300
Message-ID: <559BDA44.4040700@ti.com>
References: <1435564082-14583-1-git-send-email-jun.li@freescale.com> <1435564082-14583-24-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435564082-14583-24-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 29/06/15 10:48, Li Jun wrote:
> Allocate and initialize usb otg descriptor according to gadget otg
> capabilities, add it for each usb configurations. If otg capability
> is not defined, keep its original otg descriptor unchanged.
>
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>   drivers/usb/gadget/legacy/zero.c | 32 ++++++++++++++------------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
> index c986e8a..695c2cb 100644
> --- a/drivers/usb/gadget/legacy/zero.c
> +++ b/drivers/usb/gadget/legacy/zero.c
> @@ -121,24 +121,7 @@ static struct usb_device_descriptor device_desc = {
>   	.bNumConfigurations =	2,
>   };
>
> -#ifdef CONFIG_USB_OTG
> -static struct usb_otg_descriptor otg_descriptor = {
> -	.bLength =		sizeof otg_descriptor,
> -	.bDescriptorType =	USB_DT_OTG,
> -
> -	/* REVISIT SRP-only hardware is possible, although
> -	 * it would not be called "OTG" ...
> -	 */
> -	.bmAttributes =		USB_OTG_SRP | USB_OTG_HNP,
> -};
> -
> -static const struct usb_descriptor_header *otg_desc[] = {
> -	(struct usb_descriptor_header *) &otg_descriptor,
> -	NULL,
> -};
> -#else
> -#define otg_desc	NULL
> -#endif
> +static const struct usb_descriptor_header *otg_desc[2];
>
>   /* string IDs are assigned dynamically */
>   /* default serial number takes at least two packets */
> @@ -341,6 +324,16 @@ static int zero_bind(struct usb_composite_dev *cdev)
>
>   	/* support OTG systems */
>   	if (gadget_is_otg(cdev->gadget)) {
> +		if (!otg_desc[0]) {
> +			struct usb_descriptor_header *usb_desc;
> +
> +			usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
> +			if (!usb_desc)
> +				return -ENOMEM;
> +			usb_otg_descriptor_init(cdev->gadget, usb_desc);
> +			otg_desc[0] = usb_desc;
> +			otg_desc[1] = NULL;
> +		}

There is an error condition in zero_bind(). You need to free the
otg_descriptor there.

>   		sourcesink_driver.descriptors = otg_desc;
>   		sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
>   		loopback_driver.descriptors = otg_desc;
> @@ -397,6 +390,9 @@ static int zero_unbind(struct usb_composite_dev *cdev)
>   	if (!IS_ERR_OR_NULL(func_lb))
>   		usb_put_function(func_lb);
>   	usb_put_function_instance(func_inst_lb);
> +	kfree(otg_desc[0]);
> +	otg_desc[0] = NULL;
> +
>   	return 0;
>   }
>
>

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
