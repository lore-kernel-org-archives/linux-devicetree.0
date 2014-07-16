From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: rockchip: enable support for RK3288 SoCs
Date: Wed, 16 Jul 2014 12:57:21 -0700
Message-ID: <CAD=FV=Vp2GqwEsLt5n5176ZRvDgNLSYFSUC6G+7pV6cuATuFTw@mail.gmail.com>
References: <1471578.ILeMmG2DL6@diego>
	<4355781.cnmcVo5AVu@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4355781.cnmcVo5AVu@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Tue, Jul 15, 2014 at 4:01 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Enable HAVE_ARM_ARCH_TIMER and add a rockchip,rk3288 compatible.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  arch/arm/mach-rockchip/Kconfig    | 1 +
>  arch/arm/mach-rockchip/rockchip.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/=
Kconfig
> index e4564c2..d168669 100644
> --- a/arch/arm/mach-rockchip/Kconfig
> +++ b/arch/arm/mach-rockchip/Kconfig
> @@ -6,6 +6,7 @@ config ARCH_ROCKCHIP
>         select ARCH_REQUIRE_GPIOLIB
>         select ARM_GIC
>         select CACHE_L2X0
> +       select HAVE_ARM_ARCH_TIMER

Do we want to think about allowing someone to enable the A9-based
Rockchip SoCs separately than the A12-based ones?  I know it doesn't
hurt to have the arch timer code present on A9 SoCs (it will figure
things out at runtime), but people trying to build an A9-based system
might not want the extra code?

Anyway, I don't feel strongly about it, so:

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
