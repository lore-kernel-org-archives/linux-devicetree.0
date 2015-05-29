From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: l2c: add options to overwrite prefetching behavior
Date: Fri, 29 May 2015 10:52:05 -0700
Message-ID: <5568A745.7020502@gmail.com>
References: <1431726751-9169-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431726751-9169-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/05/15 14:52, Hauke Mehrtens wrote:
> These options make it possible to overwrites the data and instruction
> prefetching behavior of the arm pl310 cache controller.
> 
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> ---
> v2: only set prefetch
> v1: set prefetch and aux
> 
>  Documentation/devicetree/bindings/arm/l2cc.txt |  4 ++++
>  arch/arm/mm/cache-l2x0.c                       | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> index 0dbabe9..528821a 100644
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -67,6 +67,10 @@ Optional properties:
>    disable if zero.
>  - arm,prefetch-offset : Override prefetch offset value. Valid values are
>    0-7, 15, 23, and 31.
> +- arm,prefetch-data : Enable data prefetch. Enabling prefetching
> +  can improve performance.

I do not think the "can improve performance" has a place in a binding,
this is either not technical enough about what this does, or marketing
enough it does not buy us much.

data/instruction pre-fetching are commonly found on cache controller
these days, so I would be tempted to remove the "arm," prefixing here
since this can be generalized to other kinds of cache controllers.
Documenting that this can be either a boolean, or accept a value (see
below) could help.

> +- arm,prefetch-instr : Enable instruction prefetch. Enabling prefetching
> +  can improve performance.
>  
>  Example:
>  
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index e309c8f..1aa970a 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -1199,6 +1199,26 @@ static void __init l2c310_of_parse(const struct device_node *np,
>  		pr_err("L2C-310 OF arm,prefetch-offset property value is missing\n");
>  	}
>  
> +	ret = of_property_read_u32(np, "arm,prefetch-data", &val);
> +	if (ret == 0) {
> +		if (val)
> +			prefetch |= L310_PREFETCH_CTRL_DATA_PREFETCH;
> +		else
> +			prefetch &= ~L310_PREFETCH_CTRL_DATA_PREFETCH;
> +	} else if (ret != -EINVAL) {
> +		pr_err("L2C-310 OF arm,prefetch-data property value is missing\n");
> +	}

If we want to generalize the use of this property, there could indeed be
a value associated with it, if the cache controller supports different
pre-fetching strides, however this is not the cache for these cache
controllers it seems, are not we going to show error messages more often
than desired?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
