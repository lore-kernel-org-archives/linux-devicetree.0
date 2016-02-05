From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 1/2] clk: sunxi: Add sun6i/8i video support
Date: Fri, 5 Feb 2016 10:39:15 +0100
Message-ID: <20160205093915.GF1139@lukather>
References: <cover.1454435944.git.moinejf@free.fr>
 <3c0e2cdea659e9e682f80ecf42b252c740095f15.1454435944.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1524888962=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3c0e2cdea659e9e682f80ecf42b252c740095f15.1454435944.git.moinejf@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1524888962==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline


--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 02, 2016 at 06:35:10PM +0100, Jean-Francois Moine wrote:
> Add the clock types which are used by the sun6i/8i families for video.
>=20
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
> v4:
> 	- drivers/clk/sunxi/Makefile was missing (Emil Velikov)
> v3: (no change)
> v2:
> 	- remarks from Chen-Yu Tsai
> 	- DT documentation added
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
>  drivers/clk/sunxi/Makefile                        |   2 +
>  drivers/clk/sunxi/clk-sun6i-display.c             | 106 +++++++++++++
>  drivers/clk/sunxi/clk-sun6i-pll3.c                | 174 ++++++++++++++++=
++++++
>  4 files changed, 284 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-display.c
>  create mode 100644 drivers/clk/sunxi/clk-sun6i-pll3.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index e59f57b..a22b92f 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -11,6 +11,7 @@ Required properties:
>  	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
>  	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
>  	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
> +	"allwinner,sun6i-pll3-clk" - for the video PLLs clock

sun6i-a31

>  	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
>  	"allwinner,sun4i-a10-pll6-clk" - for the PLL6 clock
>  	"allwinner,sun6i-a31-pll6-clk" - for the PLL6 clock on A31
> @@ -77,6 +78,7 @@ Required properties:
>  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
>  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
>  	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
> +	"allwinner,sun6i-display-clk" - for the display clocks

Ditto

>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 3fd7901..6fe336f 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -11,6 +11,8 @@ obj-y +=3D clk-a10-ve.o
>  obj-y +=3D clk-a20-gmac.o
>  obj-y +=3D clk-mod0.o
>  obj-y +=3D clk-simple-gates.o
> +obj-y +=3D clk-sun6i-display.o
> +obj-y +=3D clk-sun6i-pll3.o
>  obj-y +=3D clk-sun8i-bus-gates.o
>  obj-y +=3D clk-sun8i-mbus.o
>  obj-y +=3D clk-sun9i-core.o
> diff --git a/drivers/clk/sunxi/clk-sun6i-display.c b/drivers/clk/sunxi/cl=
k-sun6i-display.c
> new file mode 100644
> index 0000000..48356e3
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-sun6i-display.c
> @@ -0,0 +1,106 @@
> +/*
> + * Copyright 2016 Jean-Francois Moine <moinejf@free.fr>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/rational.h>
> +#include <linux/delay.h>
> +
> +static DEFINE_SPINLOCK(sun6i_display_lock);
> +
> +#define SUN6I_DISPLAY_GATE_BIT	31
> +#define SUN6I_DISPLAY_SEL_SHIFT	24
> +#define SUN6I_DISPLAY_SEL_MASK	GENMASK(2, 0)
> +#define SUN6I_DISPLAY_MSHIFT	0
> +#define SUN6I_DISPLAY_MWIDTH	4
> +
> +static void __init sun6i_display_setup(struct device_node *node)
> +{
> +	const char *clk_name =3D node->name;
> +	const char *parents[8];
> +	struct clk_mux *mux =3D NULL;
> +	struct clk_divider *div;
> +	struct clk_gate *gate;
> +	struct resource res;
> +	void __iomem *mmio;
> +	struct clk *clk;
> +	int n;
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	mmio =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(mmio)) {
> +		pr_err("%s: Could not map the clock registers\n", clk_name);
> +		return;
> +	}
> +
> +	n =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
> +
> +	if (n > 1) {				/* many possible sources */
> +		mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> +		if (!mux)
> +			goto free_io;
> +		mux->reg =3D mmio;
> +		mux->shift =3D SUN6I_DISPLAY_SEL_SHIFT;
> +		mux->mask =3D SUN6I_DISPLAY_SEL_MASK;
> +		mux->lock =3D &sun6i_display_lock;
> +	}
> +
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		goto free_mux;
> +
> +	gate->reg =3D mmio;
> +	gate->bit_idx =3D SUN6I_DISPLAY_GATE_BIT;
> +	gate->lock =3D &sun6i_display_lock;
> +
> +	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> +	if (!div)
> +		goto free_gate;
> +
> +	div->reg =3D mmio;
> +	div->shift =3D SUN6I_DISPLAY_MSHIFT;
> +	div->width =3D SUN6I_DISPLAY_MWIDTH;
> +	div->lock =3D &sun6i_display_lock;
> +
> +	clk =3D clk_register_composite(NULL, clk_name,
> +				     parents, n,
> +				     mux ? &mux->hw : NULL, &clk_mux_ops,
> +				     &div->hw, &clk_divider_ops,
> +				     &gate->hw, &clk_gate_ops,
> +				     0);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: Couldn't register the clock\n", clk_name);
> +		goto free_div;
> +	}
> +
> +	of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return;
> +
> +free_div:
> +	kfree(div);
> +free_gate:
> +	kfree(gate);
> +free_mux:
> +	kfree(mux);
> +free_io:
> +	iounmap(mmio);
> +	of_address_to_resource(node, 0, &res);
> +	release_mem_region(res.start, resource_size(&res));
> +}
> +
> +CLK_OF_DECLARE(sun6i_display, "allwinner,sun6i-display-clk", sun6i_displ=
ay_setup);

Please use the display driver from my DRM serie, it covers everything
you need here.

> diff --git a/drivers/clk/sunxi/clk-sun6i-pll3.c b/drivers/clk/sunxi/clk-s=
un6i-pll3.c
> new file mode 100644
> index 0000000..3c128a4
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-sun6i-pll3.c
> @@ -0,0 +1,174 @@
> +/*
> + * Allwinner video PLL clocks
> + *
> + * Copyright 2016 Jean-Francois Moine <moinejf@free.fr>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/rational.h>
> +#include <linux/iopoll.h>
> +
> +static DEFINE_SPINLOCK(sun6i_pll3_lock);
> +
> +struct clk_fact {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +};
> +#define to_clk_fact(_hw) container_of(_hw, struct clk_fact, hw)
> +
> +#define SUN6I_PLL3_MSHIFT	0
> +#define SUN6I_PLL3_MMASK	GENMASK(3, 0)
> +#define SUN6I_PLL3_NSHIFT	8
> +#define SUN6I_PLL3_NMASK	GENMASK(7, 0)
> +#define SUN6I_PLL3_MODE_SEL	BIT(24)
> +#define SUN6I_PLL3_FRAC_CLK	BIT(25)
> +#define SUN6I_PLL3_LOCK_BIT	28
> +#define SUN6I_PLL3_GATE_BIT	31
> +
> +static u32 sun6i_pll3_get_fact(unsigned long rate,
> +			unsigned long parent_rate,
> +			unsigned long *n, unsigned long *m)
> +{
> +	if (rate =3D=3D 297000000)
> +		return SUN6I_PLL3_FRAC_CLK;
> +	if (rate =3D=3D 270000000)
> +		return 0;
> +	rational_best_approximation(rate, parent_rate,
> +				SUN6I_PLL3_NMASK + 1, SUN6I_PLL3_MMASK + 1,
> +				n, m);
> +	return SUN6I_PLL3_MODE_SEL;
> +}
> +
> +static unsigned long sun6i_pll3_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct clk_fact *fact =3D to_clk_fact(hw);
> +	u32 reg;
> +	u32 n, m;
> +
> +	reg =3D readl(fact->reg);
> +	if (reg & SUN6I_PLL3_MODE_SEL) {
> +		n =3D (reg >> SUN6I_PLL3_NSHIFT) & SUN6I_PLL3_NMASK;
> +		m =3D (reg >> SUN6I_PLL3_MSHIFT) & SUN6I_PLL3_MMASK;
> +		return parent_rate / (m + 1) * (n + 1);
> +	}
> +	if (reg & SUN6I_PLL3_FRAC_CLK)
> +		return 297000000;
> +	return 270000000;
> +}
> +
> +static long sun6i_pll3_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	u32 frac;
> +	unsigned long n, m;
> +
> +	frac =3D sun6i_pll3_get_fact(rate, *parent_rate, &n, &m);
> +	if (frac & SUN6I_PLL3_MODE_SEL)
> +		return *parent_rate / m * n;
> +	if (frac & SUN6I_PLL3_FRAC_CLK)
> +		return 297000000;
> +	return 270000000;
> +}
> +
> +static int sun6i_pll3_set_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long parent_rate)
> +{
> +	struct clk_fact *fact =3D to_clk_fact(hw);
> +	u32 reg;
> +	unsigned long n, m;
> +
> +	reg =3D readl(fact->reg) &
> +			~(SUN6I_PLL3_MODE_SEL |
> +			  SUN6I_PLL3_FRAC_CLK |
> +			  (SUN6I_PLL3_NMASK << SUN6I_PLL3_NSHIFT) |
> +			  (SUN6I_PLL3_MMASK << SUN6I_PLL3_MSHIFT));
> +
> +	reg |=3D sun6i_pll3_get_fact(rate, parent_rate, &n, &m);
> +	if (reg & SUN6I_PLL3_MODE_SEL)
> +		reg |=3D ((n - 1) << SUN6I_PLL3_NSHIFT) |
> +			((m - 1) << SUN6I_PLL3_MSHIFT);
> +
> +	writel(reg, fact->reg);
> +
> +	readl_poll_timeout(fact->reg, reg, reg & SUN6I_PLL3_LOCK_BIT, 10, 500);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops clk_sun6i_pll3_fact_ops =3D {
> +	.recalc_rate =3D sun6i_pll3_recalc_rate,
> +	.round_rate =3D sun6i_pll3_round_rate,
> +	.set_rate =3D sun6i_pll3_set_rate,
> +};
> +
> +static void __init sun6i_pll3_setup(struct device_node *node)
> +{
> +	const char *clk_name, *parent;
> +	void __iomem *mmio;
> +	struct clk_fact *fact;
> +	struct clk_gate *gate;
> +	struct resource res;
> +	struct clk *clk;
> +
> +	mmio =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(mmio)) {
> +		pr_err("%s: Could not map the clock registers\n", clk_name);
> +		return;
> +	}
> +
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		goto free_mmio;
> +	gate->reg =3D mmio;
> +	gate->bit_idx =3D SUN6I_PLL3_GATE_BIT;
> +	gate->lock =3D &sun6i_pll3_lock;
> +
> +	fact =3D kzalloc(sizeof(*fact), GFP_KERNEL);
> +	if (!fact)
> +		goto free_gate;
> +	fact->reg =3D mmio;
> +
> +	parent =3D of_clk_get_parent_name(node, 0);
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	clk =3D clk_register_composite(NULL, clk_name,
> +				     &parent, 1,
> +				     NULL, NULL,
> +				     &fact->hw, &clk_sun6i_pll3_fact_ops,
> +				     &gate->hw, &clk_gate_ops,
> +				     0);
> +	if (IS_ERR(clk)) {
> +		pr_err("%s: Couldn't register the clock\n", clk_name);
> +		goto free_fact;
> +	}
> +
> +	of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return;
> +
> +free_fact:
> +	kfree(fact);
> +free_gate:
> +	kfree(gate);
> +free_mmio:
> +	iounmap(mmio);
> +	of_address_to_resource(node, 0, &res);
> +	release_mem_region(res.start, resource_size(&res));
> +}
> +
> +CLK_OF_DECLARE(sun6i_pll3, "allwinner,sun6i-pll3-clk", sun6i_pll3_setup);

And please use the clk-factors code here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWtG3CAAoJEBx+YmzsjxAgBJIQALenYjBdrT58t28iNYa/7LL1
Oa7Nm6oUn5yDxRJWPPAbO+1yOj1hDlh6REq8CetWUwanf0IlLpeHrjhGYIhCXq5d
GsI6zKRH9lR+7ETrMQ3yKyLUzCnR17aXPyYYo3EU1tq+EYitbh3o7QhJ1cY1IGdK
sNXeMMVxv3PvXvXapC30dQ26xT/iy8ai5lY73uXyWNS34kqZ1pLFI1Mx91auEC9B
t65Xf2KjRkZgBX6RxSQKEVZV17tGAbKHlaakOfHZXFGisUfMUvWDR/xrDHQm4vBU
SSOjTMpSIfYsML72pqOkn5/U19Cu13BQ02WWQLKKJQ54dqulCB+pTXPsWIyzjPbe
XSlOx1L2BXLzO4YvQWINUfbqYn3KrTRauCxevYX+MMypC/C++fz4qy2C9ePAyHS4
7j9XngK+C+v4GUjmniA+PnRtRv03lUcN0gKZqL5YXgTtbvYr5JNtnOpfn5t8Ocbm
MF+aTVRuEJGKPnjutwueoQgofkKHIOV+KKubm9QU0fdi44TCGCW1/IK/YzLHepbZ
+VJ0882LxyPutcRQcGtblrkXbIlrAhGDaH3SjbMDHeT3VbkjLnRCa+2g1EQFrvMP
2JPLKGdYgY+ljfSIwj2J+I3WdNDog0QxqdoZr0xtcS+lw99srDmD4DoHDHjNhDAu
ghWPx4S+zSvfe6cEVrns
=YV/D
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--

--===============1524888962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1524888962==--
