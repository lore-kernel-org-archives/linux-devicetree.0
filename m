From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun8i: Add basic dtsi file
 for Allwinner R40
Date: Thu, 24 Aug 2017 08:07:09 +0200
Message-ID: <20170824060709.ejlmhzfhr7pwt3tx@flea.lan>
References: <20170822061742.40869-1-icenowy@aosc.io>
 <20170822200521.nadkb4335mcc5ah2@flea.home>
 <ea10374b49489d2250fd804e1fdbf204@aosc.io>
 <20170823143532.owocqyq3tehsahhg@flea.home>
 <9554c7524c8608e1eceafe762a487c11@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vhe5slmg2gjosf2o"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDW27HGAKGQEEHOLSRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <9554c7524c8608e1eceafe762a487c11-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vhe5slmg2gjosf2o
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 11:13:04PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-08-23 22:35=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Wed, Aug 23, 2017 at 07:56:29PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > > > > +			reg =3D <0x01c0f000 0x1000>;
> > > > > +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> > > > > +			clock-names =3D "ahb", "mmc";
> > > > > +			resets =3D <&ccu RST_BUS_MMC0>;
> > > > > +			reset-names =3D "ahb";
> > > > > +			pinctrl-0 =3D <&mmc0_pins>;
> > > > > +			pinctrl-names =3D "default";
> > > > > +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +			max-frequency =3D <150000000>;
> > > >
> > > > have you tested that frequency?
> > >=20
> > > I think the frequency should be kept here, although my cards cannot
> > > reach this frequency.
> > >=20
> > > The numbers are same as the corresponding controllers in A64.
> > >=20
> > > Maybe I should add a comment saying it's educated guess?
> >=20
> > I'd rather have it tested by someone, and then add the proper
> > frequencies. It took quite a while to figure out how these modes were
> > supposed to be working on the A64, so it's not obvious that they're
> > just going to work.
>=20
> Should I add my results here?
>=20
> MMC0: 25MHz
> MMC1: 50MHz
> MMC2: 52MHz
> MMC3: not wired :-(
>=20
> I think it's conservative enough and works well ;-)

And that's my point. You didn't test HS200, SDR50 or SDR104 for
example. So you have no idea whether the frequencies from 50MHz to
150MHz are actually working or not.

>=20
> >=20
> > > > > +		gic: interrupt-controller@1c81000 {
> > > > > +			compatible =3D "arm,gic-400";
> > > > > +			reg =3D <0x01c81000 0x1000>,
> > > > > +			      <0x01c82000 0x1000>,
> > > > > +			      <0x01c84000 0x2000>,
> > > > > +			      <0x01c86000 0x2000>;
> > > > > +			interrupt-controller;
> > > > > +			#interrupt-cells =3D <3>;
> > > > > +			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
> > > > > IRQ_TYPE_LEVEL_HIGH)>;
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	timer {
> > > > > +		compatible =3D "arm,armv7-timer";
> > > > > +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> > > > > IRQ_TYPE_LEVEL_LOW)>,
> > > > > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW=
)>,
> > > > > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW=
)>,
> > > > > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW=
)>;
> > > >
> > > > Those masks are wrong.
> > >=20
> > > I compared it with other sun8i SoCs' device tree.
> > >=20
> > > Where's wrong?
> >=20
> > It's supposed to be a mask of the CPUs in your system. Since you just
> > have one of them, it shouldn't be 4.
>=20
> R40 has 4 cores...
>=20
> Or I didn't understand this?

Gah, sorry, I mistook this for the V3s for some reason...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--vhe5slmg2gjosf2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnm0NAAoJEBx+YmzsjxAgh3EQAJ6rHv6lMOiml//WnJEB8/NY
OffC93HohM7MvER5R4OVetqrSEcU3T/x7eC8GA07b1rFe0Ez928shMM7j82k/qHD
1ADBcHyF95WMZJi1+dO9R2qocUx35PcZSjQpPAdU4y0OOXpv0vZwFAvbOKCbyhwa
HmVTsDaOlO9/6wCsr65dwojpboqI+LZ3QSeNBUGCuOwaX+RL6vQJy8ZgDuTtVMSj
zvfSfeRgq7k6Qgyo7SrBb9Xvvo4Q+OEsyjG99AxpgEXAi+aTWLbik1+01ENlCW26
nrBJCCoyk7gydQtxsPESMv6fsGG5/EG3/LcRWH9ofra5kMSkgg7NT/hAJyB/FKeL
bE2/bNzReY4u7PhRPcNctfvGywSlubrF8llxgT6sLqQd8Hx+0VdOr2hYpce0FlTC
P2VMAacPZs2bf/AupisYy8lNGQrHWaAzjqK+z39EW2AuXxvhjSPQpd9qM2uSHB2e
QsYlMChrdlz06SkpadNOzNfDx7X6c481A9z+6feicbrt7WUGCjspx5qNpMQFrbhO
NYJkkoop1KQxSmon0EalwA3t6nlKhhmH4OzashQFtEIlFNcwsf6jI+dEIpYVzl1F
SZOUHa+4ArKX4QPbTVutoJJsqXMXvxupkfCOAKXudbWr4EeNSDLjwByH1UvwNltg
pszPjxneGwSY5EW2gxlY
=Ajpy
-----END PGP SIGNATURE-----

--vhe5slmg2gjosf2o--
