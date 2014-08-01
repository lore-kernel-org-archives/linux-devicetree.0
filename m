From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: rockchip: protect critical clocks from getting disabled
Date: Fri, 01 Aug 2014 10:15:57 +0200
Message-ID: <2434370.xFIeZvuJnT@diego>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <4047366.k35vzjcKGH@diego> <20140801003025.4463.76384@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140801003025.4463.76384@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 31. Juli 2014, 17:30:25 schrieb Mike Turquette:
> Quoting Heiko St=FCbner (2014-07-31 16:29:34)
>=20
> > Hi Mike,
> >=20
> > Am Donnerstag, 31. Juli 2014, 15:45:23 schrieb Mike Turquette:
> > > Quoting Heiko Stuebner (2014-07-29 12:12:05)
> > >=20
> > > > The clock-tree contains clocks that should never get disabled
> > > > automatically. One example are the base ACLKs, the base supplie=
s for
> > > > all
> > > > peripherals.
> > > >=20
> > > > Therefore add a structure similar to the sunxi clock-tree to pr=
otect
> > > > these
> > > > special clocks from being disabled.
> > > >=20
> > > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > > ---
> > > >=20
> > > >  drivers/clk/rockchip/clk-rk3188.c |  7 +++++++
> > > >  drivers/clk/rockchip/clk-rk3288.c |  7 +++++++
> > > >  drivers/clk/rockchip/clk.c        | 13 +++++++++++++
> > > >  drivers/clk/rockchip/clk.h        |  1 +
> > > >  4 files changed, 28 insertions(+)
> > > >=20
> > > > diff --git a/drivers/clk/rockchip/clk-rk3188.c
> > > > b/drivers/clk/rockchip/clk-rk3188.c index a83a6d8..5aef277 1006=
44
> > > > --- a/drivers/clk/rockchip/clk-rk3188.c
> > > > +++ b/drivers/clk/rockchip/clk-rk3188.c
> > > > @@ -599,6 +599,11 @@ static struct rockchip_clk_branch
> > > > rk3188_clk_branches[] __initdata =3D {>
> > > >=20
> > > >         GATE(ACLK_GPS, "aclk_gps", "aclk_peri", 0,
> > > >         RK2928_CLKGATE_CON(8),
> > > >         13, GFLAGS),>
> > > > =20
> > > >  };
> > > >=20
> > > > +static const char *rk3188_critical_clocks[] __initconst =3D {
> > > > +       "aclk_cpu",
> > > > +       "aclk_peri",
> > >=20
> > > I'm not against the idea of critical clocks, but I want to verify=
 that
> > > there is no other driver out there that is a better fit for claim=
ing
> > > these clks via clk_get and enabling them the normal way via clk_e=
nable?
> >=20
> > In the clock hierarchy of Rockchip SoCs, both aclks listed here, ar=
e
> > sources for pclk and hclk, as well as sourcing some other periphera=
l
> > gates further below too. So from what I've seen from the clock diag=
rams,
> > there is nothing that would claim these clocks directly, and it wou=
ldn't
> > also make any sense to let them get disabled as there will always b=
e
> > something using them (for example the dram-controller).
>=20
> Sounds good. Just out of curiosity, under what circumstances would yo=
u
> want to gate them? Is there a use case for it?

hmm, I don't see a use-case for gating these at runtime right now, simp=
ly=20
because there should be a user for them all the time. (both aclks combi=
ned=20
have at least 68 consumers on the rk3288 and a similar number on the pr=
evious=20
socs)

The only thing I could think of would be something suspend related - wh=
ich we=20
don't have yet. But then this would probably happen in the clock contro=
ller=20
itself anyway in some late suspend-related action, so it could take int=
o=20
account them being defined as critical clocks.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
