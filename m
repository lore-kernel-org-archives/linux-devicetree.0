From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 7/7] arm: mediatek: Add earlyprintk support for mt8127
 & mt8135
Date: Thu, 18 Sep 2014 15:01:22 +0200
Message-ID: <541AD7A2.9020008@gmail.com>
References: <1410963854-17154-1-git-send-email-srv_yingjoe.chen@mediatek.com> <1410963854-17154-8-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410963854-17154-8-git-send-email-srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 17/09/14 16:24, Joe.C wrote:
> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Enable low-level debug for Mediatek mt8127 & mt8135 SoC.
> 
> Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index cfdd1c0..3888d17 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -842,6 +842,22 @@ choice
>  		  Say Y here if you want kernel low-level debugging support
>  		  for Mediatek mt6589 based platforms on UART0.
>  
> +	config DEBUG_MT8127_UART0
> +		bool "Mediatek mt8127 UART0"
> +		depends on ARCH_MEDIATEK
> +		select DEBUG_UART_8250
> +		help
> +		  Say Y here if you want kernel low-level debugging support
> +		  for Mediatek mt8127 based platforms on UART0.
> +
> +	config DEBUG_MT8135_UART3
> +		bool "Mediatek mt8135 UART3"
> +		depends on ARCH_MEDIATEK
> +		select DEBUG_UART_8250
> +		help
> +		  Say Y here if you want kernel low-level debugging support
> +		  for Mediatek mt8135 based platforms on UART3.
> +
>  	config DEBUG_VEXPRESS_UART0_DETECT
>  		bool "Autodetect UART0 on Versatile Express Cortex-A core tiles"
>  		depends on ARCH_VEXPRESS && CPU_CP15_MMU
> @@ -1084,6 +1100,8 @@ config DEBUG_UART_PHYS
>  	default 0x101f1000 if ARCH_VERSATILE
>  	default 0x101fb000 if DEBUG_NOMADIK_UART
>  	default 0x11006000 if DEBUG_MT6589_UART0
> +	default 0x11002000 if DEBUG_MT8127_UART0
> +	default 0x11009000 if DEBUG_MT8135_UART3

These lines are ordered by the address.

>  	default 0x16000000 if ARCH_INTEGRATOR
>  	default 0x18000300 if DEBUG_BCM_5301X
>  	default 0x1c090000 if DEBUG_VEXPRESS_UART0_RS1
> @@ -1147,6 +1165,8 @@ config DEBUG_UART_VIRT
>  	default 0xf0201000 if DEBUG_BCM2835
>  	default 0xf1000300 if DEBUG_BCM_5301X
>  	default 0xf1006000 if DEBUG_MT6589_UART0
> +	default 0xf1002000 if DEBUG_MT8127_UART0
> +	default 0xf1009000 if DEBUG_MT8135_UART3

Same here.
Apart from that the patches look fine to me.

Cheers,
Matthias

>  	default 0xf11f1000 if ARCH_VERSATILE
>  	default 0xf1600000 if ARCH_INTEGRATOR
>  	default 0xf1c28000 if DEBUG_SUNXI_UART0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
