From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 1/4] soc: brcmstb: Add Product ID and Family ID helper
 functions
Date: Fri, 1 Sep 2017 19:15:12 -0700
Message-ID: <3aefb1ca-827d-6ebf-03c6-1f0d41e5da5c@gmail.com>
References: <1503683495-11766-1-git-send-email-alcooperx@gmail.com>
 <1503683495-11766-2-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503683495-11766-2-git-send-email-alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/25/2017 10:51 AM, Al Cooper wrote:
> Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/soc/bcm/brcmstb/common.c    | 12 ++++++++++++
>  include/linux/soc/brcmstb/brcmstb.h | 10 ++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/bcm/brcmstb/common.c b/drivers/soc/bcm/brcmstb/common.c
> index b6195fd..184dbf5 100644
> --- a/drivers/soc/bcm/brcmstb/common.c
> +++ b/drivers/soc/bcm/brcmstb/common.c
> @@ -40,6 +40,18 @@ bool soc_is_brcmstb(void)
>  	return of_match_node(brcmstb_machine_match, root) != NULL;
>  }
>  
> +u32 brcmstb_get_family_id(void)
> +{
> +	return family_id;
> +}
> +EXPORT_SYMBOL(brcmstb_get_family_id);
> +
> +u32 brcmstb_get_product_id(void)
> +{
> +	return product_id;
> +}
> +EXPORT_SYMBOL(brcmstb_get_product_id);
> +
>  static const struct of_device_id sun_top_ctrl_match[] = {
>  	{ .compatible = "brcm,bcm7125-sun-top-ctrl", },
>  	{ .compatible = "brcm,bcm7346-sun-top-ctrl", },
> diff --git a/include/linux/soc/brcmstb/brcmstb.h b/include/linux/soc/brcmstb/brcmstb.h
> index 337ce41..23e4dc9 100644
> --- a/include/linux/soc/brcmstb/brcmstb.h
> +++ b/include/linux/soc/brcmstb/brcmstb.h
> @@ -1,10 +1,20 @@
>  #ifndef __BRCMSTB_SOC_H
>  #define __BRCMSTB_SOC_H
>  
> +#define BRCM_ID(reg)	((u32)reg >> 28 ? (u32)reg >> 16 : (u32)reg >> 8)
> +#define BRCM_REV(reg)	((u32)reg & 0xff)
> +
>  /*
>   * Bus Interface Unit control register setup, must happen early during boot,
>   * before SMP is brought up, called by machine entry point.
>   */
>  void brcmstb_biuctrl_init(void);
>  
> +/*
> + * Helper functions for getting family or product id from the
> + * SoC driver.
> + */
> +u32 brcmstb_get_family_id(void);
> +u32 brcmstb_get_product_id(void);
> +
>  #endif /* __BRCMSTB_SOC_H */
> 

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
