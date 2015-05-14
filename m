From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: l2c: add options to overwrite prefetching behavior
Date: Thu, 14 May 2015 10:58:56 +0100
Message-ID: <20150514095856.GU2067@n2100.arm.linux.org.uk>
References: <1431560520-12544-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431560520-12544-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 01:42:00AM +0200, Hauke Mehrtens wrote:
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index e309c8f..f919548 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -1149,6 +1149,16 @@ static void __init l2c310_of_parse(const struct device_node *np,
>  		}
>  	}
>  
> +	if (of_property_read_bool(np, "arm,prefetch-data")) {
> +		*aux_val |= L310_AUX_CTRL_DATA_PREFETCH;
> +		*aux_mask &= ~L310_AUX_CTRL_DATA_PREFETCH;
> +	}
> +
> +	if (of_property_read_bool(np, "arm,prefetch-instr")) {
> +		*aux_val |= L310_AUX_CTRL_INSTR_PREFETCH;
> +		*aux_mask &= ~L310_AUX_CTRL_INSTR_PREFETCH;
> +	}
> +
>  	prefetch = l2x0_saved_regs.prefetch_ctrl;
>  
>  	ret = of_property_read_u32(np, "arm,double-linefill", &val);

Please move these down along-side the "arm,prefetch-offset" property
parsing, and please update the prefetch value using
L310_PREFETCH_CTRL_DATA_PREFETCH and L310_PREFETCH_CTRL_INSTR_PREFETCH
instead.

These are in fact the same bit, but let's try to keep the prefetch
configuration all in one place and via the same method.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
