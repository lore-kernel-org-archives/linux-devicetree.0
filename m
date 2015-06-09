From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 04/22] usb: gadget: composite: add USB_DT_OTG request
 handling
Date: Tue, 9 Jun 2015 15:27:29 +0300
Message-ID: <20150609152729.1daa7aa5@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-5-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-5-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 8 Jun 2015 23:01:59 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Copy usb_otg_descriptor from config's descriptor if host requests
> USB_DT_OTG.
> 
> Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/gadget/composite.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 4e3447b..6b5a0c6 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1534,6 +1534,27 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  				value = min(w_length, (u16) value);
>  			}
>  			break;
> +		case USB_DT_OTG:
> +			if (gadget_is_otg(gadget)) {
> +				struct usb_configuration *config;
> +				int otg_desc_len =
> +					sizeof(struct usb_otg_descriptor);

This evaluates to 5 which is wrong for otg v1.0

> +
> +				if (cdev->config)
> +					config = cdev->config;
> +				else
> +					config = list_first_entry(
> +							&cdev->configs,
> +						struct usb_configuration, list);
> +				if (!config)
> +					goto done;
> +
> +				if (gadget->otg_rev >= 0x0200)
> +					otg_desc_len += sizeof(struct bcdOTG);

This will become 5 + 2 which is wrong for otg v2.0

> +				value = min_t(int, w_length, otg_desc_len);
> +				memcpy(req->buf, config->descriptors[0], value);
> +			}
> +			break;
>  		}
>  		break;
>  

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
