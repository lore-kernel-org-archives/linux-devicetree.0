From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: rockchip: protect critical clocks from getting disabled
Date: Sat, 09 Aug 2014 00:20:46 +0200
Message-ID: <3332039.dxD4mlCSgf@diego>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <2434370.xFIeZvuJnT@diego> <CAD=FV=XA31T9i6nLaDhVS+BkJ=U-PiMye_ouC1QY8EMoKqMCiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XA31T9i6nLaDhVS+BkJ=U-PiMye_ouC1QY8EMoKqMCiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 8. August 2014, 14:58:11 schrieb Doug Anderson:
> Heiko,
>=20
> On Fri, Aug 1, 2014 at 1:15 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wro=
te:
> > Am Donnerstag, 31. Juli 2014, 17:30:25 schrieb Mike Turquette:
> >> Quoting Heiko St=FCbner (2014-07-31 16:29:34)
> >>=20
> >> > Hi Mike,
> >> >=20
> >> > Am Donnerstag, 31. Juli 2014, 15:45:23 schrieb Mike Turquette:
> >> > > Quoting Heiko Stuebner (2014-07-29 12:12:05)
> >> > >=20
> >> > > > The clock-tree contains clocks that should never get disable=
d
> >> > > > automatically. One example are the base ACLKs, the base supp=
lies
> >> > > > for
> >> > > > all
> >> > > > peripherals.
> >> > > >=20
> >> > > > Therefore add a structure similar to the sunxi clock-tree to
> >> > > > protect
> >> > > > these
> >> > > > special clocks from being disabled.
> >> > > >=20
> >> > > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >> > > > ---
> >> > > >=20
> >> > > >  drivers/clk/rockchip/clk-rk3188.c |  7 +++++++
> >> > > >  drivers/clk/rockchip/clk-rk3288.c |  7 +++++++
> >> > > >  drivers/clk/rockchip/clk.c        | 13 +++++++++++++
> >> > > >  drivers/clk/rockchip/clk.h        |  1 +
> >> > > >  4 files changed, 28 insertions(+)
> >> > > >=20
> >> > > > diff --git a/drivers/clk/rockchip/clk-rk3188.c
> >> > > > b/drivers/clk/rockchip/clk-rk3188.c index a83a6d8..5aef277 1=
00644
> >> > > > --- a/drivers/clk/rockchip/clk-rk3188.c
> >> > > > +++ b/drivers/clk/rockchip/clk-rk3188.c
> >> > > > @@ -599,6 +599,11 @@ static struct rockchip_clk_branch
> >> > > > rk3188_clk_branches[] __initdata =3D {>
> >> > > >=20
> >> > > >         GATE(ACLK_GPS, "aclk_gps", "aclk_peri", 0,
> >> > > >         RK2928_CLKGATE_CON(8),
> >> > > >         13, GFLAGS),>
> >> > > > =20
> >> > > >  };
> >> > > >=20
> >> > > > +static const char *rk3188_critical_clocks[] __initconst =3D=
 {
> >> > > > +       "aclk_cpu",
> >> > > > +       "aclk_peri",
> >> > >=20
> >> > > I'm not against the idea of critical clocks, but I want to ver=
ify
> >> > > that
> >> > > there is no other driver out there that is a better fit for cl=
aiming
> >> > > these clks via clk_get and enabling them the normal way via
> >> > > clk_enable?
> >> >=20
> >> > In the clock hierarchy of Rockchip SoCs, both aclks listed here,=
 are
> >> > sources for pclk and hclk, as well as sourcing some other periph=
eral
> >> > gates further below too. So from what I've seen from the clock
> >> > diagrams,
> >> > there is nothing that would claim these clocks directly, and it
> >> > wouldn't
> >> > also make any sense to let them get disabled as there will alway=
s be
> >> > something using them (for example the dram-controller).
> >>=20
> >> Sounds good. Just out of curiosity, under what circumstances would=
 you
> >> want to gate them? Is there a use case for it?
> >=20
> > hmm, I don't see a use-case for gating these at runtime right now, =
simply
> > because there should be a user for them all the time. (both aclks c=
ombined
> > have at least 68 consumers on the rk3288 and a similar number on th=
e
> > previous socs)
> >=20
> > The only thing I could think of would be something suspend related =
- which
> > we don't have yet. But then this would probably happen in the clock
> > controller itself anyway in some late suspend-related action, so it=
 could
> > take into account them being defined as critical clocks.
>=20
> I know Rockchip has some funky stuff planned for memory scaling too.
> Perhaps Kever can comment whether these two clocks might need to be
> disabled in that case?

hmm looking at the core clock tree, I wouldn't think so.

The only intersection between the ddr-clk, aclk_cpu and aclk_peri is th=
e gpll=20
which can be a source to both. But the ddr-clk is mainly sourced from t=
he dpll=20
anyway.

In any case, turning off aclk_cpu/aclk_peri in this scenario wouldn't n=
ormally=20
be possible anyway, as most of the time some pclk_* would be active any=
way.


> In any case, this patch fixes a hang at boot when using the PWM drive=
r
> that just landed, so:
>=20
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

thanks


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
