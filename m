From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 3/3] clk: sunxi: Add sun8i PLL audio support
Date: Sun, 10 Apr 2016 18:55:47 +0200
Message-ID: <20160410185547.2829e5f3aee51d50ee454a91@free.fr>
References: <cover.1459358017.git.moinejf@free.fr>
	<8ba2e0d78c70ea4c54fb25969956fc31674df612.1459358017.git.moinejf@free.fr>
	<20160410095322.GZ4227@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160410095322.GZ4227@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 10 Apr 2016 02:53:22 -0700
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Hi,
>=20
> On Wed, Mar 30, 2016 at 06:57:16PM +0200, Jean-Francois Moine wrote:
> > Add the PLL type which is used by the sun8i family for audio.
> >=20
> > Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
> >  drivers/clk/sunxi/clk-sunxi.c                     | 48 +++++++++++=
++++++++++++
> >  2 files changed, 49 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Do=
cumentation/devicetree/bindings/clock/sunxi.txt
> > index ff93aee..917d4aa 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -10,6 +10,7 @@ Required properties:
> >  	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
> >  	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
> >  	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
> > +	"allwinner,sun8i-pll2-clk" - for the audio PLL clock
>=20
> You should mention the name of the first SoC that introduced it.

As I know only the pll2 of the H3, is it OK for
	"allwinner,sun8i-h3-pll2-clk"
?

> >  	"allwinner,sun6i-a31-pll3-clk" - for the video PLL clock
> >  	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
> >  	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
> > diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-=
sunxi.c
> > index 270f2a9..7386141 100644
> > --- a/drivers/clk/sunxi/clk-sunxi.c
> > +++ b/drivers/clk/sunxi/clk-sunxi.c
> > @@ -1130,6 +1130,54 @@ CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-=
a31-pll6-clk",
> >  	       sun6i_pll6_clk_setup);
> > =20
> >  /*
> > + * sun8i pll2
> > + *
> > + * rate =3D parent_rate / (m + 1) * (n + 1) / (p + 1);
>=20
>                          ^ I'm guessing it's a "*" instead?

No, 'm' is a divider, as 'p'.

> > + */
> > +static void sun8i_pll2_factors(struct factors_request *req)
> > +{
> > +	unsigned long n, m;
> > +
> > +	/* set p =3D 4 so that pll2 =3D pll2x8 / 8 */
> > +	req->p =3D 4 - 1;
> > +	rational_best_approximation(req->rate,
> > +				req->parent_rate / 4,
> > +				1 << 7, 1 << 5, &n, &m);
> > +	req->rate =3D req->parent_rate / m * n / 4;
> > +	req->m =3D m - 1;
> > +	req->n =3D n - 1;
> > +}
> > +
> > +static void sun8i_pll2_recalc(struct factors_request *req)
> > +{
> > +	req->rate =3D req->parent_rate / (req->m + 1) * (req->n + 1) /
> > +						(req->p + 1);
> > +}
> > +
> > +static const struct clk_factors_config sun8i_pll2_config =3D {
> > +	.mshift =3D 0,
> > +	.mwidth =3D 5,
> > +	.nshift =3D 8,
> > +	.nwidth =3D 7,
> > +	.pshift =3D 16,
> > +	.pwidth =3D 4,
> > +};
> > +
> > +static const struct factors_data sun8i_pll2_data __initconst =3D {
> > +	.enable =3D 31,
> > +	.table =3D &sun8i_pll2_config,
> > +	.getter =3D sun8i_pll2_factors,
> > +	.recalc =3D sun8i_pll2_recalc,
> > +};
> > +
> > +static void __init sun8i_pll2_setup(struct device_node *node)
> > +{
> > +	sunxi_factors_clk_setup(node, &sun8i_pll2_data);
> > +}
> > +CLK_OF_DECLARE(sun8i_pll2, "allwinner,sun8i-pll2-clk",
> > +	       sun8i_pll2_setup);
>=20
> How do you plan on supporting the multiple pll2 output?

Using fixed-clocks in the DTS if needed.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
