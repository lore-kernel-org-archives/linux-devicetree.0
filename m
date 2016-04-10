From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 2/3] clk: sunxi: Add sun6i/8i PLL video support
Date: Sun, 10 Apr 2016 19:11:21 +0200
Message-ID: <20160410191121.6f791f375110cf358b0ee1ab@free.fr>
References: <cover.1459358017.git.moinejf@free.fr>
	<e63499f789971b8c45a0ae5e90bd127371cbcf19.1459358017.git.moinejf@free.fr>
	<20160410095006.GY4227@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160410095006.GY4227@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 10 Apr 2016 02:50:06 -0700
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Hi,
>=20
> On Wed, Mar 30, 2016 at 06:50:43PM +0200, Jean-Francois Moine wrote:
> > Add the PLL type which is used by the sun6i/8i families for video d=
isplay.
> >=20
> > Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
> >  drivers/clk/sunxi/clk-sunxi.c                     | 65 +++++++++++=
++++++++++++
> >  2 files changed, 66 insertions(+)
	[snip]
> > diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-=
sunxi.c
> > index 0581e1b..270f2a9 100644
> > --- a/drivers/clk/sunxi/clk-sunxi.c
> > +++ b/drivers/clk/sunxi/clk-sunxi.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/log2.h>
> > +#include <linux/rational.h>
> > =20
> >  #include "clk-factors.h"
> > =20
> > @@ -1129,6 +1130,70 @@ CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-=
a31-pll6-clk",
> >  	       sun6i_pll6_clk_setup);
> > =20
> >  /*
> > + * sun6i pll3
> > + *
> > + * if (p =3D=3D 0) rate =3D k ? 270MHz : 297MHz
> > + * else rate =3D parent_rate / (m + 1) * (n + 1);
> > + */
> > +static void sun6i_pll3_factors(struct factors_request *req)
> > +{
> > +	unsigned long n, m;
> > +
> > +	if (req->rate =3D=3D 270000000) {
> > +		req->m =3D 0;
> > +		req->p =3D 0;
> > +		req->k =3D 0;
> > +	} else if (req->rate =3D=3D 297000000) {
> > +		req->m =3D 0;
> > +		req->p =3D 0;
> > +		req->k =3D 1;
> > +	} else {
> > +		rational_best_approximation(req->rate,
> > +					req->parent_rate,
> > +					1 << 7, 1 << 4, &n, &m);
> > +		req->rate =3D req->parent_rate / m * n;
> > +		req->p =3D 1;
> > +		req->m =3D m - 1;
> > +		req->n =3D n - 1;
> > +	}
> > +}
> > +
> > +static void sun6i_pll3_recalc(struct factors_request *req)
> > +{
> > +	if (req->p)
> > +		req->rate =3D req->parent_rate / (req->m + 1) * (req->n + 1);
> > +	else if (req->k)
> > +		req->rate =3D 270000000;
> > +	else
> > +		req->rate =3D 297000000;
> > +}
> > +
> > +static const struct clk_factors_config sun6i_pll3_config =3D {
> > +	.mshift =3D 0,
> > +	.mwidth =3D 4,
> > +	.nshift =3D 8,
> > +	.nwidth =3D 7,
> > +	.pshift =3D 24,	/* mode selection fractional / integer */
> > +	.pwidth =3D 1,
> > +	.kshift =3D 25,	/* fraction 270 / 297 MHz */
> > +	.kwidth =3D 1,
> > +};
>=20
> That's not what p and k are.
>=20
> Please add extra parameters to deal with fractional rates in the
> clk_factors_config (like an extra bit + an array with the two rate
> exposed.
>=20
> That way, you can also deal with it in the core, instead of doing a
> hack.

It is really a good way to add generic code for only one clock?
Otherwise, there is no 'P' nor 'K' in the pll3 documentation, what is
the trouble of using the variables 'p' and 'k' for other functions? And
noone said that the variables should have the same name as those of the
documentation.
Anyway, I am stupid and obedient: this code was proposed by Chen-Yu Tsa=
i
on Sat, 6 Feb 2016 17:56:00 +0800:

> clk-factors now supports a custom .recalc callback. Along with get_fa=
ctors,
> you can support pretty much any clock that has four variables, not in=
cluding
> the mux and clock gate.
>=20
> So for this you'd have the div as factor m, and the integer mode bit =
as p,
> and the fraction bit as n, and recalc would be somewhat like this:
>=20
> if (p) {
>         rate =3D parent_rate / (m + 1);
> } else if (n) {
>         rate =3D 297000000;
> } else {
>         rate =3D 270000000;
> }
>=20
> get_factors should be easy enough to figure out.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
