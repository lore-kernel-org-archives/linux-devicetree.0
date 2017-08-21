From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 07/13] ARM: sun8i: h3: add display engine
 pipeline barebone
Date: Mon, 21 Aug 2017 10:30:05 +0200
Message-ID: <20170821083005.4ujfk5g3kqgqofwl@flea.lan>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <20170801131304.7741-8-icenowy@aosc.io>
 <1773537.vAqre0jhCE@jernej-laptop>
 <fcbff773f61061bbc0f1d6ffef2a7c35@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u4b3hybyzegoos4e"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fcbff773f61061bbc0f1d6ffef2a7c35@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--u4b3hybyzegoos4e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 01:07:55PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-08-02 12:47=EF=BC=8CJernej =C5=A0krabec =E5=86=99=E9=81=93=
=EF=BC=9A
> > Hi Icenowy,
> >=20
> > Dne torek, 01. avgust 2017 ob 15:12:58 CEST je Icenowy Zheng napisal(a):
> > > As we have already the support for the DE2 on Allwinner H3, add the
> > > display engine pipeline device tree nodes to its DTSI file.
> > >=20
> > > The H5 pipeline has some differences and will be enabled later.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > ---
> > >  arch/arm/boot/dts/sun8i-h3.dtsi | 170
> > > ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 170
> > > insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > b/arch/arm/boot/dts/sun8i-h3.dtsi index b36f9f423c39..75ad7b65a7fc
> > > 100644
> > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > > @@ -41,6 +41,8 @@
> > >   */
> > >=20
> > >  #include "sunxi-h3-h5.dtsi"
> > > +#include <dt-bindings/clock/sun8i-de2.h>
> > > +#include <dt-bindings/reset/sun8i-de2.h>
> > >=20
> > >  / {
> > >  	cpus {
> > > @@ -72,6 +74,174 @@
> > >  		};
> > >  	};
> > >=20
> > > +	de: display-engine {
> > > +		compatible =3D "allwinner,sun8i-h3-display-engine";
> > > +		allwinner,pipelines =3D <&mixer0>,
> > > +				      <&mixer1>;
> > > +		status =3D "disabled";
> > > +	};
> > > +
> > > +	soc {
> > > +		display_clocks: clock@1000000 {
> > > +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
> > > +			reg =3D <0x01000000 0x100000>;
> > > +			clocks =3D <&ccu CLK_BUS_DE>,
> > > +				 <&ccu CLK_DE>;
> > > +			clock-names =3D "bus",
> > > +				      "mod";
> > > +			resets =3D <&ccu RST_BUS_DE>;
> > > +			#clock-cells =3D <1>;
> > > +			#reset-cells =3D <1>;
> > > +			assigned-clocks =3D <&ccu CLK_DE>;
> > > +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
> > > +			assigned-clock-rates =3D <432000000>;
> > > +		};
> >=20
> > I believe Maxime ask you to use clk_set_rate() in the past:
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2017-June/512909.=
html
>=20
> Yes, but I think the frequency is still part of our configuration,
> not forced by the hardware.
>=20
> If we set it in the driver, why don't we set it to 300MHz?
>=20
> (In fact for pipelines without TVE we can really use 300MHz for
> CLK_DE, and if we do not want 4K we can even use lower frequency)

You should ask yourself another question. Do you absolutely need that
rate and parent to operate properly?

If the answer is yes, the DT is not what you're looking for, it
provides no guarantee on the changes to the clock rate and parenthood,
and doesn't allow you to act upon those changes either.

If you want to make it work, you need to have some code to do that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--u4b3hybyzegoos4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZmpoNAAoJEBx+YmzsjxAgLR0QAK9D9Ekx5tcR60iwsQRtLJv1
cqQqYihGVGVZUkhweuuNGuFPOXK7Ry1ufwqCrd5erwFkz5E8P8XnLAK6V0db806X
Lw3FR6f78konbmkLTZfBbg6lsqEaeKShKuBmq545gj0OseCy4qRKWp5lU3a7+2FD
KZTbiNPQLTSKkVCj79oDp4yYata91xiEYkyZY+8yDF1I6z7FbjZL4aj3hejsROP2
+kC/3OXMOC1yJutEFM0qTXIQoMizdM4sPFpJOzdz3E9qe0ScqGBugXvpQP2rBDsF
GAk0rOmPvNPUrXj6pJGeKPual5OdhtmrkIpKcBVKcet5/6ZRM7lH0LEWYPmXZHgm
qiKRVezShFEBRZSUXSFu8Qy/Iqb/bs8q9LIfseFfMmwe5KgIfczgG4nYS+nb7u0V
Tub9imZsDlXXBp48YW/EcTbsy1SUZQKkgp2A6hRBLdiWA/vkPJcA6ZF0Yqjq3J/4
s3BFHX65yeDghXYR8gsmfk7O5GYexk4axFNVmlUKpAPUGApK747AktclYVGBRJim
7FPm+jiNK+4ApNACZ4MaEGM8ol4QCf7/3pwIDbVFUeC3vGEyira15gMnNXcVJC2E
oAPSFuMg3PpT09JASwkFfYG0VFyhUdwKXi2+luHVh1CTKakAohborRJvt57LfHkr
lokjn38nphNAy+mG05yd
=HQFv
-----END PGP SIGNATURE-----

--u4b3hybyzegoos4e--
