From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Date: Wed, 25 Jan 2017 21:31:19 +0100
Message-ID: <20170125213119.6409083e@bbrezillon>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
        <1485368255-12038-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485368255-12038-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 25 Jan 2017 19:17:34 +0100
Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
> 
> Drivers wanting to support this new label property will benefit from
> it without a change. They might want to check in the future that
> mtd->name is NULL before assigning a default name to the mtd device.
> Other drivers will keep the current behavior, which is to override
> mtd->name with their own value.
> 
> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Brian, can you have a look at this patch, and if you're okay with it,
queue it for 4.11. I'll soon post the atmel NAND controller driver
rework which will depend on this patch, and that'd be great to have
this dependency already applied.

Thanks,

Boris

> ---
> 
>  Changes since v1:
> 
>  - moved the use of the "label" property from mtd_set_dev_defaults()
>    to mtd_set_of_node() to let drivers keep control on how mtd->name
>    is set and allocated.
> 
>  include/linux/mtd/mtd.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..f4fe15517295 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -24,6 +24,7 @@
>  #include <linux/uio.h>
>  #include <linux/notifier.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
>  
>  #include <mtd/mtd-abi.h>
>  
> @@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>  				   struct device_node *np)
>  {
>  	mtd->dev.of_node = np;
> +	of_property_read_string(np, "label", &mtd->name);
>  }
>  
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
