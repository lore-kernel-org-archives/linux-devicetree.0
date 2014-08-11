From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: rockchip: enable the AMBA bus
Date: Mon, 11 Aug 2014 09:50:12 +0200
Message-ID: <16000182.xrvOKsDCOX@diego>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <1406661128-7614-3-git-send-email-heiko@sntech.de> <53E839F3.7040208@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53E839F3.7040208-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 11. August 2014, 11:35:15 schrieb Kever Yang:
> Heiko:
> 
> On 07/30/2014 03:12 AM, Heiko Stuebner wrote:
> > This is needed to access the pl330 dma controllers on Rockchip SoCs.
> > 
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> > 
> >   arch/arm/mach-rockchip/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/mach-rockchip/Kconfig
> > b/arch/arm/mach-rockchip/Kconfig index d168669..ac5803c 100644
> > --- a/arch/arm/mach-rockchip/Kconfig
> > +++ b/arch/arm/mach-rockchip/Kconfig
> > @@ -4,6 +4,7 @@ config ARCH_ROCKCHIP
> > 
> >   	select PINCTRL_ROCKCHIP
> >   	select ARCH_HAS_RESET_CONTROLLER
> >   	select ARCH_REQUIRE_GPIOLIB
> > 
> > +	select ARM_AMBA
> 
> These two config is also needed by pl330 dma driver. Can we add it here?
>      DMADEVICES
>      PL330_DMA

I guess this should simply be done via the regular Kconfig (and _defconfig) and 
not be automatically selected. There may always be use-cases where people do 
not want to use dma operations and drivers needing them.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
