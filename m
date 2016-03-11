From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 5/6] clk: rockchip: rk3036: fix and add node id for emac clock
Date: Fri, 11 Mar 2016 13:28:43 +0100
Message-ID: <2353919.k6rGxijjr1@diego>
References: <1457693731-6966-1-git-send-email-wxt@rock-chips.com> <2005499.uduk6By3kM@diego> <56E2B386.7060107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56E2B386.7060107@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Caesar Wang <caesar.upstream@gmail.com>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, zhengxing <zhengxing@rock-chips.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michael Turquette <mturquette@baylibre.com>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, keescook@google.com, "David S. Miller" <davem@davemloft.net>, leozwang@google.com
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Freitag, 11. M=C3=A4rz 2016, 20:01:10 schrieb Caesar Wang:
> The link [0] need a bit changes if we want the emac to be happy work.
>=20
> -RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 4, 5, DFLAGS),
>=20
> +RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 9, 5, DFLAGS),

ah, then that is probably the reason I don't get connectivity. Thanks f=
or=20
noticing this.


> I will need resend the series patches with your change in link[0], OK=
?
>=20
> Since the Mr.rebot just notice the build error, I will check and rese=
nd
> with your emac changing.

ok, great :-D


Thanks
Heiko


> =E5=9C=A8 2016=E5=B9=B403=E6=9C=8811=E6=97=A5 19:15, Heiko St=C3=BCbn=
er =E5=86=99=E9=81=93:
> > Hi Caesar,
> >=20
> > Am Freitag, 11. M=C3=A4rz 2016, 18:55:30 schrieb Caesar Wang:
> >> From: zhengxing <zhengxing@rock-chips.com>
> >>=20
> >> In the emac driver, we need to refer HCLK_MAC since there are
> >> only 3PLLs (APLL/GPLL/DPLL) on the rk3036, most clocks are under t=
he
> >> GPLL, and it is unable to provide the accurate rate for mac_ref wh=
ich
> >> need to 50MHz probability, we should let it under the DPLL and are
> >> able to set the freq which integer multiples of 50MHz, so we add t=
hese
> >> emac node for reference.
> >>=20
> >> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> >> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> >=20
> > I think I mentioned it somewhere before, but I'd like to do this
> > differently, like in [0].
> >=20
> > That should work in a similar way and at least in my tests the repo=
rted
> > clock rate seems to be correct. As I said as well I haven't been ab=
le to
> > make the emac detect a link on my kylin boards, so it would be cool
> > if you could test if this different approach works in practice as w=
ell.
>=20
> I fetch your branch patches, it doesn't work for me.
> c467a5f clk: rockchip: associate SCLK_MAC_PLL and disable reparenting=
 on
> rk3036
> ae7ed09 clk: rockchip: add clock-id for rk3036 emac pll source clock
> f876a7e clk: rockchip: associate the rk3036 HCLK_EMAC clock-id
> 5093371 clk: rockchip: add node-id for rk3036 emac hclk
>=20
> f44eeee Revert "clk: rockchip: rk3036: fix and add node id for emac c=
lock"
> ..
>=20
> It works if the patch
> c467a5f clk: rockchip: associate SCLK_MAC_PLL and disable reparenting=
 on
> rk3036 to change as following
>=20
> --- a/drivers/clk/rockchip/clk-rk3036.c
> +++ b/drivers/clk/rockchip/clk-rk3036.c
> @@ -348,8 +348,8 @@ static struct rockchip_clk_branch
> rk3036_clk_branches[] __initdata =3D {
>                          RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, D=
=46LAGS,
>                          RK2928_CLKGATE_CON(10), 5, GFLAGS),
>=20
> -       COMPOSITE_NOGATE(0, "mac_pll_src", mux_pll_src_3plls_p, 0,
> -                       RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 9, 5, DF=
LAGS),
> +       COMPOSITE_NOGATE(SCLK_MACPLL, "mac_pll_src",
> mux_pll_src_3plls_p, CLK_SET_RATE_NO_REPARENT,
> +                       RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 9, 5, DF=
LAGS),
>=20
> > Thanks
> > Heiko
> >=20
> > ------ 8< ---------
> >=20
> >  From e83a8b19dbf95c40d2c908727c342fbc6b167ea1 Mon Sep 17 00:00:00 =
2001
> >=20
> > From: Heiko Stuebner <heiko@sntech.de>
> > Date: Fri, 19 Feb 2016 21:31:43 +0100
> > Subject: [PATCH] clk: rockchip: associate SCLK_MAC_PLL and disable
> > reparenting>=20
> >   on rk3036
> >=20
> > The emac needs constant and very specific rate but the possible
> > PLL-sources
> > are very limited, so we expect the PLL source to be set manually on=
 per
> > board and don't want it to get changed in an automatic way later.
> > So add the necessary clock-id and disable reparenting on set_rate c=
alls.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >   drivers/clk/rockchip/clk-rk3036.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/rockchip/clk-rk3036.c
> > b/drivers/clk/rockchip/clk-rk3036.c index 3c742bf..0084c57 100644
> > --- a/drivers/clk/rockchip/clk-rk3036.c
> > +++ b/drivers/clk/rockchip/clk-rk3036.c
> > @@ -348,7 +348,7 @@ static struct rockchip_clk_branch
> > rk3036_clk_branches[] __initdata =3D {>=20
> >   			RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, DFLAGS,
> >   			RK2928_CLKGATE_CON(10), 5, GFLAGS),
> >=20
> > -	COMPOSITE_NOGATE(0, "mac_pll_src", mux_pll_src_3plls_p, 0,
> > +	COMPOSITE_NOGATE(SCLK_MACPLL, "mac_pll_src", mux_pll_src_3plls_p,
> > CLK_SET_RATE_NO_REPARENT,>=20
> >   			RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 4, 5, DFLAGS),
>=20
> -RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 4, 5, DFLAGS),
>=20
> +RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 9, 5, DFLAGS),
>=20
> >   	MUX(SCLK_MACREF, "mac_clk_ref", mux_mac_p, CLK_SET_RATE_PARENT,
> >   =09
> >   			RK2928_CLKSEL_CON(21), 3, 1, MFLAGS),
> >=20
> > ------ 8< ---------
> >=20
> >=20
> > [0]
> > https://github.com/mmind/linux-rockchip/commit/e83a8b19dbf95c40d2c9=
08727c
> > 342fbc6b167ea1>=20
> >> ---
> >>=20
> >>   drivers/clk/rockchip/clk-rk3036.c      | 9 ++++++---
> >>   include/dt-bindings/clock/rk3036-cru.h | 2 ++
> >>   2 files changed, 8 insertions(+), 3 deletions(-)
> >>=20
> >> diff --git a/drivers/clk/rockchip/clk-rk3036.c
> >> b/drivers/clk/rockchip/clk-rk3036.c index 0703c8f..27c35fa 100644
> >> --- a/drivers/clk/rockchip/clk-rk3036.c
> >> +++ b/drivers/clk/rockchip/clk-rk3036.c
> >> @@ -348,8 +348,11 @@ static struct rockchip_clk_branch
> >> rk3036_clk_branches[] __initdata =3D { RK2928_CLKSEL_CON(16), 0, 2=
,
> >> MFLAGS, 2, 5, DFLAGS,
> >>=20
> >>   			RK2928_CLKGATE_CON(10), 5, GFLAGS),
> >>=20
> >> -	COMPOSITE_NOGATE(0, "mac_pll_src", mux_pll_src_3plls_p, 0,
> >> -			RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 9, 5, DFLAGS),
> >> +	MUX(SCLK_MACPLL, "mac_pll_pre", mux_pll_src_3plls_p, 0,
> >> +			RK2928_CLKSEL_CON(21), 0, 2, MFLAGS),
> >> +	DIV(0, "mac_pll_src", "mac_pll_pre", 0,
> >> +			RK2928_CLKSEL_CON(21), 9, 5, DFLAGS),
> >> +
> >>=20
> >>   	MUX(SCLK_MACREF, "mac_clk_ref", mux_mac_p, CLK_SET_RATE_PARENT,
> >>   =09
> >>   			RK2928_CLKSEL_CON(21), 3, 1, MFLAGS),
> >>=20
> >> @@ -408,7 +411,7 @@ static struct rockchip_clk_branch
> >> rk3036_clk_branches[]
> >> __initdata =3D { GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri",
> >> CLK_IGNORE_UNUSED,
> >> RK2928_CLKGATE_CON(7), 3, GFLAGS), GATE(HCLK_I2S, "hclk_i2s",
> >> "hclk_peri",
> >> 0, RK2928_CLKGATE_CON(7), 2, GFLAGS), GATE(0, "hclk_sfc", "hclk_pe=
ri",
> >> CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS), -	GATE(0,
> >> "hclk_mac", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3),=
 15,
> >> GFLAGS), +	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", 0,
> >> RK2928_CLKGATE_CON(3), 5, GFLAGS),
> >>=20
> >>   	/* pclk_peri gates */
> >>   	GATE(0, "pclk_peri_matrix", "pclk_peri", CLK_IGNORE_UNUSED,
> >>=20
> >> RK2928_CLKGATE_CON(4), 1, GFLAGS), diff --git
> >> a/include/dt-bindings/clock/rk3036-cru.h
> >> b/include/dt-bindings/clock/rk3036-cru.h index ebc7a7b..de44109 10=
0644
> >> --- a/include/dt-bindings/clock/rk3036-cru.h
> >> +++ b/include/dt-bindings/clock/rk3036-cru.h
> >> @@ -54,6 +54,7 @@
> >>=20
> >>   #define SCLK_PVTM_VIDEO		125
> >>   #define SCLK_MAC		151
> >>   #define SCLK_MACREF		152
> >>=20
> >> +#define SCLK_MACPLL		153
> >>=20
> >>   #define SCLK_SFC		160
> >>  =20
> >>   /* aclk gates */
> >>=20
> >> @@ -92,6 +93,7 @@
> >>=20
> >>   #define HCLK_SDMMC		456
> >>   #define HCLK_SDIO		457
> >>   #define HCLK_EMMC		459
> >>=20
> >> +#define HCLK_MAC		460
> >>=20
> >>   #define HCLK_I2S		462
> >>   #define HCLK_LCDC		465
> >>   #define HCLK_ROM		467
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip

