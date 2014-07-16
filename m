From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: rockchip: enable support for RK3288 SoCs
Date: Wed, 16 Jul 2014 22:22:56 +0200
Message-ID: <2681748.x2jAk95I37@diego>
References: <1471578.ILeMmG2DL6@diego> <4355781.cnmcVo5AVu@diego> <CAD=FV=Vp2GqwEsLt5n5176ZRvDgNLSYFSUC6G+7pV6cuATuFTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Vp2GqwEsLt5n5176ZRvDgNLSYFSUC6G+7pV6cuATuFTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. Juli 2014, 12:57:21 schrieb Doug Anderson:
> Heiko,
>=20
> On Tue, Jul 15, 2014 at 4:01 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Enable HAVE_ARM_ARCH_TIMER and add a rockchip,rk3288 compatible.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> >=20
> >  arch/arm/mach-rockchip/Kconfig    | 1 +
> >  arch/arm/mach-rockchip/rockchip.c | 1 +
> >  2 files changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/mach-rockchip/Kconfig
> > b/arch/arm/mach-rockchip/Kconfig index e4564c2..d168669 100644
> > --- a/arch/arm/mach-rockchip/Kconfig
> > +++ b/arch/arm/mach-rockchip/Kconfig
> > @@ -6,6 +6,7 @@ config ARCH_ROCKCHIP
> >=20
> >         select ARCH_REQUIRE_GPIOLIB
> >         select ARM_GIC
> >         select CACHE_L2X0
> >=20
> > +       select HAVE_ARM_ARCH_TIMER
>=20
> Do we want to think about allowing someone to enable the A9-based
> Rockchip SoCs separately than the A12-based ones?  I know it doesn't
> hurt to have the arch timer code present on A9 SoCs (it will figure
> things out at runtime), but people trying to build an A9-based system
> might not want the extra code?
>=20
> Anyway, I don't feel strongly about it, so:

I've also thought about this previously. Personally I would want to wai=
t with=20
introducing more complexity here until someone comes along with a use c=
ase.
Simply because we're talking about 7kb (stripped) for the arch-timer an=
d=20
machines with >1GB of memory.
So I'm not adverse to it, but I guess it will make more sense when more=
 soc-
specific code lands - suspend stuff for example.


But I think we should be able to drop the dw_apb_timer altogether, as i=
t stems=20
from a time before I found the global-timer informations and all A9 SoC=
s=20
should be able to use this one instead.




>=20
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
