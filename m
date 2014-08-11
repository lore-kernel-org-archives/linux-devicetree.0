From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: rockchip: enable the AMBA bus
Date: Mon, 11 Aug 2014 11:35:15 +0800
Message-ID: <53E839F3.7040208@rock-chips.com>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <1406661128-7614-3-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406661128-7614-3-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Heiko:

On 07/30/2014 03:12 AM, Heiko Stuebner wrote:
> This is needed to access the pl330 dma controllers on Rockchip SoCs.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>   arch/arm/mach-rockchip/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
> index d168669..ac5803c 100644
> --- a/arch/arm/mach-rockchip/Kconfig
> +++ b/arch/arm/mach-rockchip/Kconfig
> @@ -4,6 +4,7 @@ config ARCH_ROCKCHIP
>   	select PINCTRL_ROCKCHIP
>   	select ARCH_HAS_RESET_CONTROLLER
>   	select ARCH_REQUIRE_GPIOLIB
> +	select ARM_AMBA
These two config is also needed by pl330 dma driver. Can we add it here?
     DMADEVICES
     PL330_DMA
>   	select ARM_GIC
>   	select CACHE_L2X0
>   	select HAVE_ARM_ARCH_TIMER


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
