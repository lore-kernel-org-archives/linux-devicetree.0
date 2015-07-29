From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock
 from MT8173
Date: Wed, 29 Jul 2015 15:17:13 +0800
Message-ID: <1438154233.17770.39.camel@mtksdaap41>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1438152754-11970-2-git-send-email-jamesjj.liao@mediatek.com>
	 <6282882.pftQBj38E3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6282882.pftQBj38E3@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Could you help to apply this patch into 4.2?


Best regards,

James

On Wed, 2015-07-29 at 09:05 +0200, Heiko St=FCbner wrote:
> Am Mittwoch, 29. Juli 2015, 14:52:25 schrieb James Liao:
> > The dpi_ck clock can be removed because it not actually used
> > in topckgen and subsystems.
> >=20
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>=20
> From our past discussions this change looks about right, and should s=
till=20
> become _part of 4.2_, to not have the CLK_TOP_DPI become part of the=20
> devicetree CLK_TOP_DPI.
>=20
> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20
> > ---
> >  drivers/clk/mediatek/clk-mt8173.c      | 1 -
> >  include/dt-bindings/clock/mt8173-clk.h | 1 -
> >  2 files changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/mediatek/clk-mt8173.c
> > b/drivers/clk/mediatek/clk-mt8173.c index 4b9e04c..4486f8f 100644
> > --- a/drivers/clk/mediatek/clk-mt8173.c
> > +++ b/drivers/clk/mediatek/clk-mt8173.c
> > @@ -26,7 +26,6 @@ static DEFINE_SPINLOCK(mt8173_clk_lock);
> >=20
> >  static const struct mtk_fixed_factor root_clk_alias[] __initconst =
=3D {
> >  	FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
> > -	FACTOR(CLK_TOP_DPI, "dpi_ck", "clk_null", 1, 1),
> >  	FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk_null", 1,=
 1),
> >  	FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null", 1, 1=
),
> >  };
> > diff --git a/include/dt-bindings/clock/mt8173-clk.h
> > b/include/dt-bindings/clock/mt8173-clk.h index 4ad76ed..7230c38 100=
644
> > --- a/include/dt-bindings/clock/mt8173-clk.h
> > +++ b/include/dt-bindings/clock/mt8173-clk.h
> > @@ -18,7 +18,6 @@
> >  /* TOPCKGEN */
> >=20
> >  #define CLK_TOP_CLKPH_MCK_O		1
> > -#define CLK_TOP_DPI			2
> >  #define CLK_TOP_USB_SYSPLL_125M		3
> >  #define CLK_TOP_HDMITX_DIG_CTS		4
> >  #define CLK_TOP_ARMCA7PLL_754M		5
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
