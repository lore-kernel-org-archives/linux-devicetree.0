From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 06/26] clk: sunxi: Add PLL3 clock
Date: Wed, 3 Feb 2016 21:27:58 +0100
Message-ID: <20160203202758.GD3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-7-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64pj5Ga4-QaF7RpExUSyYntyMU2dQ87TPsm5WbNeAXMOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1125174477=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v64pj5Ga4-QaF7RpExUSyYntyMU2dQ87TPsm5WbNeAXMOQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Wynter Woods <wynter@nextthing.co>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Kaplan <alex@nextthing.co>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1125174477==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2016 at 12:05:06AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A10 SoCs and relatives have a PLL controller to drive the PLL3 and
> > PLL7, clocked from a 3MHz oscillator, that drives the display related
> > clocks (GPU, display engine, TCON, etc.)
> >
> > Add a driver for it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
> >  drivers/clk/sunxi/Makefile                        |  1 +
> >  drivers/clk/sunxi/clk-sun4i-pll3.c                | 90 +++++++++++++++=
++++++++
> >  3 files changed, 92 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun4i-pll3.c
> >
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docume=
ntation/devicetree/bindings/clock/sunxi.txt
> > index 5360554a7d3f..bb9fb78dcff8 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -10,6 +10,7 @@ Required properties:
> >         "allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
> >         "allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
> >         "allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
> > +       "allwinner,sun4i-a10-pll3-clk" - for the video PLL clock on A10
> >         "allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
> >         "allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
> >         "allwinner,sun4i-a10-pll6-clk" - for the PLL6 clock
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index a991cd8ca509..40c32ffd912c 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -11,6 +11,7 @@ obj-y +=3D clk-a20-gmac.o
> >  obj-y +=3D clk-mod0.o
> >  obj-y +=3D clk-simple-gates.o
> >  obj-y +=3D clk-sun4i-display.o
> > +obj-y +=3D clk-sun4i-pll3.o
> >  obj-y +=3D clk-sun8i-mbus.o
> >  obj-y +=3D clk-sun9i-core.o
> >  obj-y +=3D clk-sun9i-mmc.o
> > diff --git a/drivers/clk/sunxi/clk-sun4i-pll3.c b/drivers/clk/sunxi/clk=
-sun4i-pll3.c
> > new file mode 100644
> > index 000000000000..6c9c2210b6b2
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-sun4i-pll3.c
> > @@ -0,0 +1,90 @@
> > +/*
> > + * Copyright 2015 Maxime Ripard
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define SUN4I_A10_PLL3_GATE_BIT        31
> > +#define SUN4I_A10_PLL3_DIV_WIDTH       7
> > +#define SUN4I_A10_PLL3_DIV_SHIFT       0
> > +
> > +static DEFINE_SPINLOCK(sun4i_a10_pll3_lock);
> > +
> > +static void __init sun4i_a10_pll3_setup(struct device_node *node)
> > +{
> > +       const char *clk_name =3D node->name, *parent;
> > +       struct clk_multiplier *mult;
> > +       struct clk_gate *gate;
> > +       void __iomem *reg;
> > +       struct clk *clk;
> > +       int ret;
> > +
> > +       of_property_read_string(node, "clock-output-names", &clk_name);
> > +       parent =3D of_clk_get_parent_name(node, 0);
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg)) {
> > +               pr_err("%s: Could not map the clock registers\n", clk_n=
ame);
> > +               return;
> > +       }
> > +
> > +       gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +       if (!gate)
> > +               return;
> > +
> > +       gate->reg =3D reg;
> > +       gate->bit_idx =3D SUN4I_A10_PLL3_GATE_BIT;
> > +       gate->lock =3D &sun4i_a10_pll3_lock;
> > +
> > +       mult =3D kzalloc(sizeof(*mult), GFP_KERNEL);
> > +       if (!mult)
> > +               goto err_free_gate;
> > +
> > +       mult->reg =3D reg;
> > +       mult->shift =3D SUN4I_A10_PLL3_DIV_SHIFT;
> > +       mult->width =3D SUN4I_A10_PLL3_DIV_WIDTH;
> > +       mult->lock =3D &sun4i_a10_pll3_lock;
> > +
> > +       clk =3D clk_register_composite(NULL, clk_name,
> > +                                    &parent, 1,
> > +                                    NULL, NULL,
> > +                                    &mult->hw, &clk_multiplier_ops,
> > +                                    &gate->hw, &clk_gate_ops,
> > +                                    0);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("%s: Couldn't register the clock\n", clk_name);
> > +               goto err_free_mult;
> > +       }
> > +
> > +       ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
> > +       if (WARN_ON(ret))
>=20
> Any particular reason for WARN_ON instead of pr_err like above?

I guess not, I'll change that.

>=20
> > +               goto err_clk_unregister;
> > +
> > +       return;
> > +
> > +err_clk_unregister:
> > +       clk_unregister_composite(clk);
> > +err_free_mult:
> > +       kfree(mult);
> > +err_free_gate:
> > +       kfree(gate);
>=20
> Clean up after of_io_request_and_map(), otherwise

Ack

>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmLOAAoJEBx+YmzsjxAgPtoP/0aO9J2QOr6CNTzA6gqO+ajJ
hvRvpFyuSRryu22/VBzovMSmmkTEOrJBBn7vQ/ACRmU10wC2C190cstwZqOvNnOc
oG/O+08/Onc8WwXRxuL4zIGgMh2XxgCJUS1kVauKWWpPimIbLTjTNA69cyxj9C02
CjW9BIhYfTjshT2LyNwEuPyetfxEbyEKdrr4OE55Hlj5xsZecv0A/A6bXdUkkvS1
Jp7SnqRStO8jefqmVGx6Xw2/tRM5xSLJNQeMz+IFXJRVYSc//uBpT9MqfJP4tBfo
/fSaX//7VeweyDWQFylnjKW5pJ9gOCbTrWa1S3RNTgF/0Es2v7OD5holIhSR6kuI
hfiO6rI9q+5mrJIaDMdaxt5vy+QNmlWglfcdtH3BSxBx4uehjwvu9y3B1/qRS7vF
vsi3CVbi4zQsxduVnFMVjP3m/WKUVWZiO554SjfIPxkBKH6fjm/xi6lcS3vhRqLQ
m30d1iIm4yhml96QCGZ8t0pwZLQejbJNVB2AGd6hKKDrGWIJs4fjxXBvsIXZCDHz
9w72geQQO5WUK7IMYB+wej9LNCj5CcXUZTA8wWAyFVnSHzBtFkdZJt479TjH33qw
lbRIUCAfIarVmXEODO2gr+rebBU+je61qMLWjRqE0fjhtB0djjjDru7OamWavT6q
AKAOnURCfqoc/Z/+2hu0
=FKi8
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--

--===============1125174477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1125174477==--
