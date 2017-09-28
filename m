From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU
 clock
Date: Thu, 28 Sep 2017 16:20:50 +0200
Message-ID: <20170928142050.gkbdqlwpfjmpdlg3@flea>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170923001531.14285-2-icenowy@aosc.io>
 <20170928102752.ceo54qccqakb4xyx@flea>
 <975c0c884d9a83faad6141df474a93af@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ynwlkhxyx47lxmvj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <975c0c884d9a83faad6141df474a93af-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ynwlkhxyx47lxmvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 10:42:39AM +0000, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > On Sat, Sep 23, 2017 at 12:15:29AM +0000, Icenowy Zheng wrote:
> > > The A64 PLL_CPU clock has the same instability if some factor changed
> > > without the PLL gated like other SoCs with sun6i-style CCU, e.g. A33,
> > > H3.
> > >=20
> > > Add the mux and pll notifiers for A64 CPU clock to workaround the
> > > problem.
> > >=20
> > > Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 28
> > > +++++++++++++++++++++++++++-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > index 2bb4cabf802f..b55fa69dd0c1 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > @@ -879,11 +879,26 @@ static const struct sunxi_ccu_desc
> > > sun50i_a64_ccu_desc =3D {
> > >  	.num_resets	=3D ARRAY_SIZE(sun50i_a64_ccu_resets),
> > >  };
> > >=20
> > > +static struct ccu_pll_nb sun50i_a64_pll_cpu_nb =3D {
> > > +	.common	=3D &pll_cpux_clk.common,
> > > +	/* copy from pll_cpux_clk */
> > > +	.enable	=3D BIT(31),
> > > +	.lock	=3D BIT(28),
> > > +};
> > > +
> > > +static struct ccu_mux_nb sun50i_a64_cpu_nb =3D {
> > > +	.common		=3D &cpux_clk.common,
> > > +	.cm		=3D &cpux_clk.mux,
> > > +	.delay_us	=3D 1, /* > 8 clock cycles at 24 MHz */
> > > +	.bypass_index	=3D 1, /* index of 24 MHz oscillator */
> > > +};
> > > +
> > >=20
> > >  static int sun50i_a64_ccu_probe(struct platform_device *pdev)
> > >  {
> > >  	struct resource *res;
> > >  	void __iomem *reg;
> > >  	u32 val;
> > > +	int ret;
> > >=20
> > >  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >  	reg =3D devm_ioremap_resource(&pdev->dev, res);
> > > @@ -897,7 +912,18 @@ static int sun50i_a64_ccu_probe(struct
> > > platform_device *pdev)
> > >=20
> > >  	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> > >=20
> > > -	return sunxi_ccu_probe(pdev->dev.of_node, reg,
> > > &sun50i_a64_ccu_desc);
> > > +	ret =3D sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_des=
c);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Gate then ungate PLL CPU after any rate changes */
> > > +	ccu_pll_notifier_register(&sun50i_a64_pll_cpu_nb);
> > > +
> > > +	/* Reparent CPU during PLL CPU rate changes */
> > > +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> > > +				  &sun50i_a64_cpu_nb);
> > > +
> > > +	return 0;
> >=20
> > So this is the fourth user of the exact same code, can you turn that
> > into a shared function?
>=20
> I think it's not so worthful to extract the code, as:

It does, because the order is important. If you do not register the
notifiers in the right order, you have a bug, and:

> - the notifier structs contains info of the clocks

this should be passed as a parameter anyway,

> - A31 seems not to need the PLL notifier.

And you don't care about the ordering in that case, since there's just
one. If was talking about the H3, A64, R40 and A33 that all have that
code.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ynwlkhxyx47lxmvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzQVCAAoJEBx+YmzsjxAgWfIP/jVxa/nJyoiocVCqSrz2Sk4z
pRXAByC+Qm6Hx95ZooK43H+BqXOwig32Vjx9X0YKSTDmU4t7giZwOM47/bTeJVsZ
oyfD8h1bjR2wjfBV3KtzEaub5WdzllWWOhy9/T3cg7zuE9fbScpJ2DK+q6f/LwUn
/nQChhHgLJtSoVwyxuRpjXLowB4wB/OsOQXP6vf+x0IK4P/KySaJ5PGbnqFNdxvG
BH5LdZ2YxLOLV/B8ZFXRrEF0eVtIdla9VW4vMwlcO+XIQdwFB4sOWZQTmm9FO0s5
PaWkLHyzbWleNg7U58lCwBTyRMyGECBVs9A1nsN/dA9Pe9Hgi7/TPcDL1a76gmAL
XFib2wMB8a/MQS5jj5rEiugkBikiyofvLGTNvTPM2EN4m+v1JYMJq4xEpJZhyiQP
ZLLa7aP6y5s2lB3QtpJ5kL0e6PqbAoo1tuHe7vrrhxJssQdiVYtIAn9cTZ9pQeGf
vmgHmEdZAWntTh6qS4h6OB+1OUvbsKvV840w93jiR8sQkBKoqMvp0dp6i9xuw6XJ
f1YWp6x4MH44FnZLQWHySb/azeT1NT6B0l1HhddUwJrUHVYbiE1MtHMUdCJtUn/A
DrmrxSUFbfL9ZnMW13ZxEwjFHepr1uTIu+yy+webGbvfv3uKtlIEz0/ObwnGccwu
EthZxRA6uDCASBGsRNMH
=umA7
-----END PGP SIGNATURE-----

--ynwlkhxyx47lxmvj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
