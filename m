From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 12/13] arm64: dts: add Allwinner A64 SoC .dtsi
Date: Fri, 9 Sep 2016 22:04:35 +0200
Message-ID: <20160909200435.GJ8881@lukather>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <20160726203041.29366-13-maxime.ripard@free-electrons.com>
 <c2334630-edab-5b42-48dd-5e4edd5f3de1@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c2334630-edab-5b42-48dd-5e4edd5f3de1@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 08, 2016 at 09:41:10AM +0100, Andre Przywara wrote:
> > +	timer {
> > +		compatible =3D "arm,armv8-timer";
> > +		interrupts =3D <GIC_PPI 13
> > +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +			     <GIC_PPI 14
> > +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +			     <GIC_PPI 11
> > +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +			     <GIC_PPI 10
> > +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> > +	};
>=20
> Can you add a PMU node here? Or shall I send a patch on top of it?
> It would be:
>=20
> 	pmu {
>         	compatible =3D "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
> 		interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,=09
> 			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> 		interrupt-affinity =3D <&cpu0>,
> 				     <&cpu1>,
> 				     <&cpu2>,
> 				     <&cpu3>;
> 	};
>=20
> This enables perf to use hardware counters (for cycles and instructions,
> for instance).
>=20
> > +
> > +	clocks {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> > +
> > +		osc24M: osc24M_clk {
> > +			#clock-cells =3D <0>;
> > +			compatible =3D "fixed-clock";
> > +			clock-frequency =3D <24000000>;
> > +			clock-output-names =3D "osc24M";
> > +		};
> > +
> > +		osc32k: osc32k_clk {
> > +			#clock-cells =3D <0>;
> > +			compatible =3D "fixed-clock";
> > +			clock-frequency =3D <32768>;
> > +			clock-output-names =3D "osc32k";
> > +		};
> > +	};
>=20
> Can you remove this "clocks" node and put the two subnodes directly onto
> the top level?
> I know that putting clocks into a subnode is quite wide spread, but it
> does not represent any hardware hierarchy, especially in this
> fixed-clock case.
> So if we can (and it is easy here!) we should avoid any clocks subnode.
>=20
> (Yes, I know that this was in my original DT as well, but Mark Rutland
> convinced me of this.)

I'll do those changes before sending the new version.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0xXTAAoJEBx+YmzsjxAgFqYQALnfRxjSfH51NrdxDOkG0WEB
9Unch1EZGZ4Oaaxhl9ZuTO+iwC9vqHBLw6FlpZ6zkwUouCM9A4Y5dLot0/Pk2PTZ
Xj5yoIk32+jpVfbMb/FVtQ9Wr+ewKBDXvpQpSQnKGFauiCxr3iSSelF1C7megPoy
c9xmrTND9lukR5RIG33ZsN0Cprbk+NRcmlE1NSKP6zTjbFlagnHiNPNtEobeJMQz
WdePLisQXKhAj/qqLss7fdEZF8HbY+oC0clIts+VTeyFBXEJbT2UtV1Hq5ZwJisa
wAccDZ0TqaOrEG74AYFMb9eT6xBz4GSxiaX1cOTe0qJPtaiE4ogjFrg6lgQxsdud
IQwKhY/h/ocanariIZtcpHau0hxpuaWjb8NfW9sBCMSg1EsjokJ6pnvwTGee9IWY
M0BiZGh2iwleTDN5KIg1xwlGPFizWuip5fvyY1FUoYrCf42uacRuUBqWaxeXlIAP
n0nOQxbwCEsANi2Q+sYFAIyi5zRXHbEV0di07ljUA+20PT335ZxzaL3PoRtipN6I
o1THoSvX4I8X7aviiIGJZgSBFcYjEjeSawmUQN6osz2Hkz0scCOn7dT8p6SsYuzz
4j5uq9WSQLW9L+5br1DSvlVsX3a79l2832JBazKeZXHUEjssusoWVF1cp7XzBiTV
YJuvzwOh1Z223fZyN59c
=5now
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
