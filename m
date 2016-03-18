From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
Date: Fri, 18 Mar 2016 20:25:35 +0100
Message-ID: <20160318192535.GR30977@lukather>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z8pjODCYYz+3zRe3"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: yassinjaffer@gmail.com
Cc: dev@linux-sunxi.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Reinder de Haan <patchesrdh@mveas.com>, Jens Kuske <jenskuske@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--Z8pjODCYYz+3zRe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yassin,

On Thu, Mar 17, 2016 at 07:43:42PM +1100, yassinjaffer@gmail.com wrote:
> From: Yassin Jaffer <yassinjaffer@gmail.com>
>=20
> This patch adds a composite clock type consisting of
> a clock gate, mux, configurable dividers, and a reset control.
>=20
> Signed-off-by: Yassin Jaffer <yassinjaffer@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   1 +
>  drivers/clk/sunxi/Makefile                        |   1 +
>  drivers/clk/sunxi/clk-a10-csi.c                   | 188 ++++++++++++++++=
++++++
>  3 files changed, 190 insertions(+)
>  create mode 100644 drivers/clk/sunxi/clk-a10-csi.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index e59f57b..c3826f7 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -77,6 +77,7 @@ Required properties:
>  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
>  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
>  	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
> +	"allwinner,sun4i-a10-csi-clk" - for the CSI module
> =20
>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 3fd7901..42ce752 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -7,6 +7,7 @@ obj-y +=3D clk-a10-codec.o
>  obj-y +=3D clk-a10-hosc.o
>  obj-y +=3D clk-a10-mod1.o
>  obj-y +=3D clk-a10-pll2.o
> +obj-y +=3D clk-a10-csi.o
>  obj-y +=3D clk-a10-ve.o
>  obj-y +=3D clk-a20-gmac.o
>  obj-y +=3D clk-mod0.o
> diff --git a/drivers/clk/sunxi/clk-a10-csi.c b/drivers/clk/sunxi/clk-a10-=
csi.c
> new file mode 100644
> index 0000000..f17d206
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-a10-csi.c
> @@ -0,0 +1,188 @@
> +/*
> + * Copyright 2016 Yassin Jaffer
> + *
> + * Yassin Jaffer <yassinjaffer@gmail.com>
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
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +static DEFINE_SPINLOCK(sun4i_csi_lock);
> +
> +#define SUN4I_CSI_PARENTS       5
> +#define SUN4I_CSI_GATE_BIT      31
> +#define SUN4I_CSI_RESET_BIT     30
> +#define SUN4I_CSI_MUX_SHIFT     24
> +#define SUN4I_CSI_DIV_WIDTH     5
> +#define SUN4I_CSI_DIV_SHIFT     0
> +
> +static u32 sun4i_csi_mux_table[SUN4I_CSI_PARENTS] =3D {
> +	0x0,
> +	0x1,
> +	0x2,
> +	0x5,
> +	0x6,
> +};
> +
> +struct csi_reset_data {
> +	void __iomem			*reg;
> +	spinlock_t			*lock; /* lock for reset handling */
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +static int sun4i_csi_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long id)
> +{
> +	struct csi_reset_data *data =3D container_of(rcdev,
> +						  struct csi_reset_data,
> +						  rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg =3D readl(data->reg);
> +	writel(reg & ~BIT(SUN4I_CSI_RESET_BIT), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int sun4i_csi_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct csi_reset_data *data =3D container_of(rcdev,
> +						  struct csi_reset_data,
> +						  rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg =3D readl(data->reg);
> +	writel(reg | BIT(SUN4I_CSI_RESET_BIT), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int sun4i_csi_of_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	if (WARN_ON(reset_spec->args_count !=3D 0))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static struct reset_control_ops sun4i_csi_reset_ops =3D {
> +	.assert		=3D sun4i_csi_assert,
> +	.deassert	=3D sun4i_csi_deassert,
> +};
> +
> +static void __init sun4i_csi_clk_setup(struct device_node *node)
> +{
> +	const char *parents[SUN4I_CSI_PARENTS];
> +	const char *clk_name =3D node->name;
> +	struct csi_reset_data *reset_data;
> +	struct clk_divider *div;
> +	struct clk_gate *gate;
> +	struct clk_mux *mux;
> +	void __iomem *reg;
> +	struct clk *clk;
> +	int i =3D 0;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg))
> +		return;
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	i =3D of_clk_parent_fill(node, parents, SUN4I_CSI_PARENTS);
> +
> +	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		goto err_unmap;
> +
> +	mux->reg =3D reg;
> +	mux->shift =3D SUN4I_CSI_MUX_SHIFT;
> +	mux->table =3D sun4i_csi_mux_table;
> +	mux->lock =3D &sun4i_csi_lock;
> +
> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		goto err_free_mux;
> +
> +	gate->reg =3D reg;
> +	gate->bit_idx =3D SUN4I_CSI_GATE_BIT;
> +	gate->lock =3D &sun4i_csi_lock;
> +
> +	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> +	if (!div)
> +		goto err_free_gate;
> +
> +	div->reg =3D reg;
> +	div->shift =3D SUN4I_CSI_DIV_SHIFT;
> +	div->width =3D SUN4I_CSI_DIV_WIDTH;
> +	div->lock =3D &sun4i_csi_lock;
> +
> +	clk =3D clk_register_composite(NULL, clk_name,
> +				     parents, i,
> +				     &mux->hw, &clk_mux_ops,
> +				     &div->hw, &clk_divider_ops,
> +				     &gate->hw, &clk_gate_ops,
> +				     CLK_SET_RATE_PARENT);
> +	if (IS_ERR(clk))
> +		goto err_free_div;
> +
> +	of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	reset_data =3D kzalloc(sizeof(*reset_data), GFP_KERNEL);
> +	if (!reset_data)
> +		goto err_free_clk;
> +
> +	reset_data->reg =3D reg;
> +	reset_data->lock =3D &sun4i_csi_lock;
> +	reset_data->rcdev.nr_resets =3D 1;
> +	reset_data->rcdev.ops =3D &sun4i_csi_reset_ops;
> +	reset_data->rcdev.of_node =3D node;
> +	reset_data->rcdev.of_xlate =3D sun4i_csi_of_xlate;
> +	reset_data->rcdev.of_reset_n_cells =3D 0;
> +
> +	if (reset_controller_register(&reset_data->rcdev))
> +		goto err_free_reset;
> +
> +	return;
> +
> +err_free_reset:
> +	kfree(reset_data);
> +err_free_clk:
> +	clk_unregister(clk);
> +err_free_div:
> +	kfree(div);
> +err_free_gate:
> +	kfree(gate);
> +err_free_mux:
> +	kfree(mux);
> +err_unmap:
> +	iounmap(reg);
> +}
> +
> +CLK_OF_DECLARE(sun4i_csi, "allwinner,sun4i-a10-csi-clk",
> +	       sun4i_csi_clk_setup);
> +

That's great, but it shares a lot of infrastructure of boilerplate
code with the display clocks that are part of my DRM serie.

I plan to post them early next week, I'll cc you so that you can base
your clock on top of it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Z8pjODCYYz+3zRe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW7FYvAAoJEBx+YmzsjxAg/w4P/itvqrg+mRLYRFEHngNtI+ae
KbqEvG8SCV20w4QrClh72/VxGaMVEXztywI1goGylL1JGXrZULE1DAqNoQQMoJmZ
AkO1d2pvL1ej/rfz1yPJJC5o96/4kJZJ2YBykopITylS64/M2EsM3C12auULPqRz
fblLqmY1dfJbvtosAsd9KOdM7DA79kJYePxDc+5P9iuxEEQ8o7juEtbRMUHJm71V
E1Eh6/gwfm0njZHaAfkwgBKw5Oy6ixdEyRs0bizOOdaQq1be2UsoRMmsuRYtWjVX
qoUnfJbwiZ9PcPb+1Sqk6WPfmgWIw8qkz8V0pkFVn/hY8dImvhXpwnpyItBpikCY
s/T+s2yKjzMhsMbuqCNit3PWp9vuQlt7wwREygIHRAEbV4X09Ufnk8Y0GTSl4dvo
GHBa4PSpfVFGnAQrw2G7INTV+y7soIElnZwbm/bCq3au6luaLX+6ImwyjSDEV9K9
9kdak16HPHiCCqnPBNF33Jqm9PwtJ/oTHpNjP7MyfA3hZVSO+ypF2yeJR3Cjzbh0
lD0WpQIM5WRtqwrptfDKA/KEVq5qC+c5uNLfPs/q0h8pteCVBXCFu4tiJCURh2Jk
UJK/HAMns4X0I1MlG1yfbZZWvkcoCPy37VUwJ/h7lu4liT9xW8OvTapvl8tULB5V
Ie8ZRDeth908XGfSdw0p
=pcFQ
-----END PGP SIGNATURE-----

--Z8pjODCYYz+3zRe3--
