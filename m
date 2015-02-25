From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: mediatek: Add config option for mt8173.
Date: Wed, 25 Feb 2015 17:07:22 +0800
Message-ID: <1424855242.7845.9.camel@mtksdaap41>
References: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
	 <1422342836-27689-2-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422342836-27689-2-git-send-email-hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-27 at 15:13 +0800, Hongzhou Yang wrote:
> From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> The upcoming MTK pinctrl driver have a big pin table for each SoC,
> and we don't want to bloat the kernel binary if we don't need it.
> Add config options so we can build for one SoC only.
> 
> Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e627ead..6213dac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -151,9 +151,15 @@ menu "Platform selection"
>  config ARCH_MEDIATEK
>  	bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
>  	select ARM_GIC
> +	select PINCTRL
>  	help
>  	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
>  
> +config MACH_MT8173
> +	bool "Mediatek 8173 Soc Supprt"
> +	depends on ARCH_MEDIATEK
> +	default y
> +
>  config ARCH_SEATTLE
>  	bool "AMD Seattle SoC Family"
>  	help

Hi Arnd/Matthias,

Any comments on this patch?

Joe.C



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
