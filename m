From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] usb: musb: core: added helper function for parsing DT
Date: Sun, 30 Oct 2016 06:35:57 -0700
Message-ID: <m2wpgq2c3m.fsf@baylibre.com>
References: <1477560847-8929-1-git-send-email-abailon@baylibre.com>
        <1477560847-8929-3-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477560847-8929-3-git-send-email-abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
        (Alexandre Bailon's message of "Thu, 27 Oct 2016 11:34:05 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
>
> This adds the function musb_get_mode() to get the DT property "dr_mode"
>
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> Acked-by: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Tested-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  drivers/usb/musb/musb_core.c | 19 +++++++++++++++++++
>  drivers/usb/musb/musb_core.h |  5 +++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 27dadc0..bba07e7 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -100,6 +100,7 @@
>  #include <linux/io.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/usb.h>
> +#include <linux/usb/of.h>
>  
>  #include "musb_core.h"
>  #include "musb_trace.h"
> @@ -130,6 +131,24 @@ static inline struct musb *dev_to_musb(struct device *dev)
>  	return dev_get_drvdata(dev);
>  }
>  
> +enum musb_mode musb_get_mode(struct device *dev)
> +{
> +	enum usb_dr_mode mode;
> +
> +	mode = usb_get_dr_mode(dev);
> +	switch (mode) {
> +	case USB_DR_MODE_HOST:
> +		return MUSB_HOST;
> +	case USB_DR_MODE_PERIPHERAL:
> +		return MUSB_PERIPHERAL;
> +	case USB_DR_MODE_OTG:
> +	case USB_DR_MODE_UNKNOWN:
> +	default:
> +		return MUSB_OTG;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(musb_get_mode);
> +
>  /*-------------------------------------------------------------------------*/
>  
>  #ifndef CONFIG_BLACKFIN
> diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
> index 2cb88a49..a406468 100644
> --- a/drivers/usb/musb/musb_core.h
> +++ b/drivers/usb/musb/musb_core.h
> @@ -617,4 +617,9 @@ static inline void musb_platform_post_root_reset_end(struct musb *musb)
>  		musb->ops->post_root_reset_end(musb);
>  }
>  
> +/* gets the "dr_mode" property from DT and converts it into musb_mode
> + * if the property is not found or not recognized returns MUSB_OTG
> + */

nit: multi-line comment style

> +extern enum musb_mode musb_get_mode(struct device *dev);
> +
>  #endif	/* __MUSB_CORE_H__ */

Otherwise,

Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
