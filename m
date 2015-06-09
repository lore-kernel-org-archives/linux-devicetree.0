From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 01/22] usb: add OTG version number in
 usb_otg_descriptor
Date: Tue, 9 Jun 2015 15:25:47 +0300
Message-ID: <20150609152547.205ba5b0@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-2-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-2-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 8 Jun 2015 23:01:56 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> OTG 2.0 introduces bcdOTG to identify the OTG and EH supplement release
> number with which the OTG device is compliant, so adds it for
> usb_otg_descriptor.
> 
> Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  include/uapi/linux/usb/ch9.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index aa33fd1..ce405fb 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -665,13 +665,17 @@ struct usb_qualifier_descriptor {
>  
>  
>  /*-------------------------------------------------------------------------*/
> +struct bcdOTG {
> +	__le16 bcdOTG;
> +};
>  
> -/* USB_DT_OTG (from OTG 1.0a supplement) */
> +/* USB_DT_OTG */
>  struct usb_otg_descriptor {
>  	__u8  bLength;
>  	__u8  bDescriptorType;
>  
>  	__u8  bmAttributes;	/* support for HNP, SRP, etc */
> +	struct bcdOTG otg_rev[0];
>  } __attribute__ ((packed));

This change by itself breaks existing users that depend
on sizeof(struct usb_otg_descriptor) and are USB OTG v1.0 compliant.

For otg v1.0 length of otg descriptor is 3
for otg v2.0 it is 5.

>  
>  /* from usb_otg_descriptor.bmAttributes */

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
