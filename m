From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: multi_v7_defconfig: enable UniPhier SoC family
Date: Fri, 17 Apr 2015 18:04:06 +0200
Message-ID: <102719016.qQcFI3ycIX@wuerfel>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com> <3561768.u8t9ftxvsL@wuerfel> <CAK7LNAQ7rX7+YQHNmuXvRH7TKcVpNUdDRr5qUS6PYxPa=NYP0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAQ7rX7+YQHNmuXvRH7TKcVpNUdDRr5qUS6PYxPa=NYP0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 18 April 2015 01:00:16 Masahiro Yamada wrote:
> 2015-04-16 18:42 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > On Thursday 16 April 2015 16:40:36 Masahiro Yamada wrote:
> >> Add UniPhier, a new citizen in the ARM multi platform.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> >> ---
> >>
> >>  arch/arm/configs/multi_v7_defconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> >> index d7f038d..24005cf 100644
> >> --- a/arch/arm/configs/multi_v7_defconfig
> >> +++ b/arch/arm/configs/multi_v7_defconfig
> >> @@ -81,6 +81,7 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
> >>  CONFIG_ARCH_TEGRA_114_SOC=y
> >>  CONFIG_ARCH_TEGRA_124_SOC=y
> >>  CONFIG_TEGRA_EMC_SCALING_ENABLE=y
> >> +CONFIG_ARCH_UNIPHIER=y
> >>  CONFIG_ARCH_U8500=y
> >>  CONFIG_MACH_HREFV60=y
> >>  CONFIG_MACH_SNOWBALL=y
> >>
> >
> > Any additional device drivers you need?
> >
> 
> Our drivers are still based-on old kernel version (pre-DT) with local
> ugly hacking.
> I need more time to re-write them based on the current coding style
> (almost from scratch),
> so I'd like to do it as a second round.
> 
> This series is just mainlining a minimal support with a serial console.
> I think it is a good starting point.
> The UART device is 16550-compatible, so I do not need any additional driver.
> 

Ok, seems fine then.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
