From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/7] clk: mediatek: Fix rate and dependency of MT8173
 clocks
Date: Tue, 28 Jul 2015 13:19:42 +0800
Message-ID: <1438060782.17770.18.camel@mtksdaap41>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	 <20150727055232.GW18700@pengutronix.de>
	 <CAGS+omDjr6d9=+d-uphrENu3Kenr8QUc3VgbaWTd45wqWzi7tg@mail.gmail.com>
	 <18677675.jZ2GEqS3sy@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <18677675.jZ2GEqS3sy@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 2015-07-27 at 09:52 +0200, Heiko St=FCbner wrote:
> Am Montag, 27. Juli 2015, 14:19:41 schrieb Daniel Kurtz:
> > On Jul 27, 2015 12:52, "Sascha Hauer" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrot=
e:
> > > On Fri, Jul 24, 2015 at 07:10:14PM +0800, Daniel Kurtz wrote:

> > > > >  /* TOPCKGEN */
> > > > > =20
> > > > >  #define CLK_TOP_CLKPH_MCK_O            1
> > > > >=20
> > > > > -#define CLK_TOP_DPI                    2
> > > > >=20
> > > > >  #define CLK_TOP_USB_SYSPLL_125M                3
> > > >=20
> > > > I think we should renumber the rest of the CLK_TOP_*
> > >=20
> > > They shouldn't be renumbered at all as this makes all binary devi=
ce
> > > trees out there useless. That may not be a big issue with the MT8=
173
> > > at the moment as there are hardly any binary device trees with th=
e
> > > mainline device trees shipped, but still we should get used to no=
t
> > > break existing device trees without need.
> >=20
> > As you mention, there are no devices shipped with mainline binary d=
evice
> > trees.  So, let's just correct the numbering now while we still can=
 do it
> > painlessly.  It seems a bit unnecessary to preserve backwards compa=
tibility
> > when we are still landing basic device support, like the clock tree=
=2E
>=20
> in general I'm with Sascha on this regarding breaking the dt, and I g=
uess
> the empty number does not hurt this much. Another argument against
> renumbering would be that the clock is there, it's just not used in t=
he
> code anymore, but the clock is acutally still there.
>=20
>=20
> But on the other hand, the clock hasn't been part of an official kern=
el
> release yet (not in 4.1), and if we want to follow protocol to the le=
tter,
> the removal of the clock id itself is already breakage, because the
> binding-header is considered part of the dt and removing a constant
> could already cause breakage in some universe far far away :-)
>=20
> So you could try to convince the clock maintainers, that this might s=
till
> be 4.2 material. Or do a smaller patch for 4.2 like the following, to=
 at
> least follow the dt-protocol.
>=20
> Please also take a look at the mt8135 clock tree, to maybe fix this
> already too, before it becomes part of a release.

There is no non-existed clock in current MT8135 clock implementation. S=
o
we just need to remove dpi_ck from MT8173 clocks.

I'll send a new patchset to remove dpi_ck in a small separated patch.


Best regards,
James


> --------------- 8< -----------------
> From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Date: Mon, 27 Jul 2015 09:41:56 +0200
> Subject: [PATCH] clk: mediatek: mt8173: remove unused dpi_ck clock
>=20
> The dpi_ck clock is not actually used and its source isn't 100% clear=
 too.
> So remove it for the time being.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/clk/mediatek/clk-mt8173.c      | 1 -
>  include/dt-bindings/clock/mt8173-clk.h | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek=
/clk-mt8173.c
> index 8b6523d..80871e2 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -26,7 +26,6 @@ static DEFINE_SPINLOCK(mt8173_clk_lock);
> =20
>  static const struct mtk_fixed_factor root_clk_alias[] __initconst =3D=
 {
>  	FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
> -	FACTOR(CLK_TOP_DPI, "dpi_ck", "clk_null", 1, 1),
>  	FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk_null", 1, 1=
),
>  	FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null", 1, 1),
>  };
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bind=
ings/clock/mt8173-clk.h
> index 4ad76ed..7230c38 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -18,7 +18,6 @@
>  /* TOPCKGEN */
> =20
>  #define CLK_TOP_CLKPH_MCK_O		1
> -#define CLK_TOP_DPI			2
>  #define CLK_TOP_USB_SYSPLL_125M		3
>  #define CLK_TOP_HDMITX_DIG_CTS		4
>  #define CLK_TOP_ARMCA7PLL_754M		5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
