From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 03/23] usb: otg: add usb_otg_caps structure for otg
 capabilities
Date: Wed, 17 Jun 2015 11:25:49 +0300
Message-ID: <20150617112549.14f1bde5@rockdesk>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
	<1434519835-27745-4-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434519835-27745-4-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wed, 17 Jun 2015 13:43:35 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> This patch adds a structure usb_otg_caps to cover all otg related
> capabilities of the device, including otg revision, and if hnp/srp/adp
> is supported.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>

cheers,
-roger

> ---
>  include/linux/usb/otg.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 52661c5..bd1dcf8 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -41,6 +41,21 @@ struct usb_otg {
>  
>  };
>  
> +/**
> + * struct usb_otg_caps - describes the otg capabilities of the device
> + * @otg_rev: The OTG revision number the device is compliant with, it's
> + *		in binary-coded decimal (i.e. 2.0 is 0200H).
> + * @hnp_support: Indicates if the device supports HNP.
> + * @srp_support: Indicates if the device supports SRP.
> + * @adp_support: Indicates if the device supports ADP.
> + */
> +struct usb_otg_caps {
> +	u16 otg_rev;
> +	bool hnp_support;
> +	bool srp_support;
> +	bool adp_support;
> +};
> +
>  extern const char *usb_otg_state_string(enum usb_otg_state state);
>  
>  /* Context: can sleep */

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
