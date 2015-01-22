From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/5] ARM: mediatek: Add config options for mediatek SoCs.
Date: Thu, 22 Jan 2015 13:54:12 +0100
Message-ID: <CABuKBeJGigY5ym9cJy=PYK8jbdsOLLtkmovHq6xho4gYseCAWg@mail.gmail.com>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
	<1421818097-9281-2-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421818097-9281-2-git-send-email-hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe
List-Id: devicetree@vger.kernel.org

2015-01-21 6:28 GMT+01:00 Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> The upcoming MTK pinctrl driver have a big pin table for each SoC
> and we don't want to bloat the kernel binary if we don't need it.
> Add config options so we can build for one SoC only.
>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied to v3.20-next/soc

> ---
>  arch/arm/mach-mediatek/Kconfig | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index f73f588..f7e463c 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -1,6 +1,26 @@
> -config ARCH_MEDIATEK
> +menuconfig ARCH_MEDIATEK
>         bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
>         select ARM_GIC
>         select MTK_TIMER
>         help
>           Support for Mediatek MT65xx & MT81xx SoCs
> +
> +if ARCH_MEDIATEK
> +
> +config MACH_MT6589
> +       bool "MediaTek MT6589 SoCs support"
> +       default ARCH_MEDIATEK
> +
> +config MACH_MT6592
> +       bool "MediaTek MT6592 SoCs support"
> +       default ARCH_MEDIATEK
> +
> +config MACH_MT8127
> +       bool "MediaTek MT8127 SoCs support"
> +       default ARCH_MEDIATEK
> +
> +config MACH_MT8135
> +       bool "MediaTek MT8135 SoCs support"
> +       default ARCH_MEDIATEK
> +
> +endif
> --
> 1.8.1.1.dirty
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
