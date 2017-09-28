From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU
 clock
Date: Thu, 28 Sep 2017 16:31:42 +0200
Message-ID: <20170928143142.f6wtekvkia3bvoq2@flea>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170923001531.14285-2-icenowy@aosc.io>
 <20170928102752.ceo54qccqakb4xyx@flea>
 <975c0c884d9a83faad6141df474a93af@aosc.io>
 <20170928142050.gkbdqlwpfjmpdlg3@flea>
 <bae0f40adef1ef1ffd3a15c32af7bf42@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7hlrtk67smbc4grp"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bae0f40adef1ef1ffd3a15c32af7bf42@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--7hlrtk67smbc4grp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 02:24:18PM +0000, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-09-28 22:20=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Thu, Sep 28, 2017 at 10:42:39AM +0000, icenowy@aosc.io wrote:
> > > > On Sat, Sep 23, 2017 at 12:15:29AM +0000, Icenowy Zheng wrote:
> > > > > The A64 PLL_CPU clock has the same instability if some factor cha=
nged
> > > > > without the PLL gated like other SoCs with sun6i-style CCU, e.g. =
A33,
> > > > > H3.
> > > > >
> > > > > Add the mux and pll notifiers for A64 CPU clock to workaround the
> > > > > problem.
> > > > >
> > > > > Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
> > > > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > > > ---
> > > > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 28
> > > > > +++++++++++++++++++++++++++-
> > > > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > > > b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > > > index 2bb4cabf802f..b55fa69dd0c1 100644
> > > > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > > > > @@ -879,11 +879,26 @@ static const struct sunxi_ccu_desc
> > > > > sun50i_a64_ccu_desc =3D {
> > > > >  	.num_resets	=3D ARRAY_SIZE(sun50i_a64_ccu_resets),
> > > > >  };
> > > > >
> > > > > +static struct ccu_pll_nb sun50i_a64_pll_cpu_nb =3D {
> > > > > +	.common	=3D &pll_cpux_clk.common,
> > > > > +	/* copy from pll_cpux_clk */
> > > > > +	.enable	=3D BIT(31),
> > > > > +	.lock	=3D BIT(28),
> > > > > +};
> > > > > +
> > > > > +static struct ccu_mux_nb sun50i_a64_cpu_nb =3D {
> > > > > +	.common		=3D &cpux_clk.common,
> > > > > +	.cm		=3D &cpux_clk.mux,
> > > > > +	.delay_us	=3D 1, /* > 8 clock cycles at 24 MHz */
> > > > > +	.bypass_index	=3D 1, /* index of 24 MHz oscillator */
> > > > > +};
> > > > > +
> > > > >
> > > > >  static int sun50i_a64_ccu_probe(struct platform_device *pdev)
> > > > >  {
> > > > >  	struct resource *res;
> > > > >  	void __iomem *reg;
> > > > >  	u32 val;
> > > > > +	int ret;
> > > > >
> > > > >  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > >  	reg =3D devm_ioremap_resource(&pdev->dev, res);
> > > > > @@ -897,7 +912,18 @@ static int sun50i_a64_ccu_probe(struct
> > > > > platform_device *pdev)
> > > > >
> > > > >  	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> > > > >
> > > > > -	return sunxi_ccu_probe(pdev->dev.of_node, reg,
> > > > > &sun50i_a64_ccu_desc);
> > > > > +	ret =3D sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu=
_desc);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	/* Gate then ungate PLL CPU after any rate changes */
> > > > > +	ccu_pll_notifier_register(&sun50i_a64_pll_cpu_nb);
> > > > > +
> > > > > +	/* Reparent CPU during PLL CPU rate changes */
> > > > > +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> > > > > +				  &sun50i_a64_cpu_nb);
> > > > > +
> > > > > +	return 0;
> > > >
> > > > So this is the fourth user of the exact same code, can you turn that
> > > > into a shared function?
> > >=20
> > > I think it's not so worthful to extract the code, as:
> >=20
> > It does, because the order is important. If you do not register the
> > notifiers in the right order, you have a bug, and:
> >=20
> > > - the notifier structs contains info of the clocks
> >=20
> > this should be passed as a parameter anyway,
>=20
> So the function only does these two registers?

Yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7hlrtk67smbc4grp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzQfNAAoJEBx+YmzsjxAgx9UQALX381hZYr3TXyOQSHkQlg+O
qpb7kiYaI1PKKlnN8q5G8gzlBOTjoHVMHKvXABX4MvjxsRBTvNUwwLzoW350f2uM
khjR1NyABhK/F5wNixj1iiM/FxvAskFZBM4gyK8z7msKVfVyk4YN3wWlgNnVT8C5
OGeh0+BcyK9tWc9ma+Tk6/x7geFX6YJ/xoOuKzgcOEPaYWGrwXnpsS5tIlaeqIFw
jpARvFb18R1TTslfUmz3Rm6kurJ+OzAKH1/Ybvtw8mMU/I5XTygHqbL8t1qN/HAk
9Wn6weON/grfZFXwo51+RC7BEPjKKJu1NIchCsGqMJgB6G4vUMkB9R5P4XKKT6PD
ypxe6/grNZxXw359bFV+r0rD91X0TgwbIwkl9K0NIICDWU64FtJgMyFMeKUEwav5
w3p7+Lj1ZvsK1mlZJkimfWWVvsr0JWu7NyL3dZlPdZ+BaskWStVY4OvpKjEfd6Pl
rmZ2xJ6LCmWh530UL3JTKh4rxX0JpWIbQ64W4qAb2obtFib+LzKZknIsMg+s4Ljz
Q8f3lYAkGxcGUSpDquEOlA9iYq65BjvPfWAJ0XFRvbxocfM9qkMnNNbRxqbeIkBd
iQVJewKUwqCjg5MpvzvPF0HmmsWpkK5Afyn9qRdE70va8nnxW9FJqlJ61HqfSOWZ
ZDhDBWgOfJg2bdn6wN0v
=pqrM
-----END PGP SIGNATURE-----

--7hlrtk67smbc4grp--
