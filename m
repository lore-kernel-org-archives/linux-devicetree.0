From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 8/9] arm64: allwinner: a64: enable AXP803
 regulators for Pine64
Date: Fri, 19 May 2017 10:56:47 +0200
Message-ID: <20170519085647.cruo55p2662mysf7@flea.home>
References: <20170518071653.36561-1-icenowy@aosc.io>
 <20170518071653.36561-9-icenowy@aosc.io>
 <98ae1ea8-ef08-8859-63d8-57c56a6348a6@arm.com>
 <4B129FD0-4AEB-4DC3-AF33-C279468BD197@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="npy7xqflswdmbn44"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUHG7LEAKGQEQJCZICA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <4B129FD0-4AEB-4DC3-AF33-C279468BD197-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--npy7xqflswdmbn44
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 04:29:01PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
4:27:21, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
> >Hi,
> >
> >On 18/05/17 08:16, Icenowy Zheng wrote:
> >> Add support of AXP803 regulators in the Pine64 device tree, in order
> >to
> >> enable many future functionalities, e.g. Wi-Fi.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> ---
> >> Changes in v6:
> >> - Rebased on next-20170517.
> >>=20
> >>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109
> >+++++++++++++++++++++
> >>  1 file changed, 109 insertions(+)
> >>=20
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> index 36001884ed33..40921bacb39c 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >> @@ -118,6 +118,115 @@
> >>  	};
> >>  };
> >> =20
> >> +#include "axp803.dtsi"
> >> +
> >> +&reg_aldo1 {
> >> +	regulator-min-microvolt =3D <2800000>;
> >> +	regulator-max-microvolt =3D <2800000>;
> >> +	regulator-name =3D "vcc-csi";
> >> +};
> >> +
> >> +&reg_aldo2 {
> >> +	regulator-always-on;
> >> +	regulator-min-microvolt =3D <1800000>;
> >> +	regulator-max-microvolt =3D <3300000>;
> >> +	regulator-name =3D "vcc-pl";
> >> +};
> >> +
> >> +&reg_aldo3 {
> >> +	regulator-always-on;
> >> +	regulator-min-microvolt =3D <2700000>;
> >> +	regulator-max-microvolt =3D <3300000>;
> >> +	regulator-name =3D "vcc-pll-avcc";
> >> +};
> >> +
> >> +&reg_dc1sw {
> >> +	regulator-name =3D "vcc-phy";
> >> +};
> >> +
> >> +&reg_dcdc1 {
> >> +	regulator-always-on;
> >> +	regulator-min-microvolt =3D <3300000>;
> >> +	regulator-max-microvolt =3D <3300000>;
> >> +	regulator-name =3D "vcc-3v3";
> >> +};
> >> +
> >> +&reg_dcdc2 {
> >> +	regulator-always-on;
> >> +	regulator-min-microvolt =3D <1000000>;
> >> +	regulator-max-microvolt =3D <1300000>;
> >> +	regulator-name =3D "vdd-cpux";
> >> +};
> >> +
> >> +/* DCDC3 is polyphased with DCDC2 */
> >> +
> >> +&reg_dcdc5 {
> >> +	regulator-always-on;
> >> +	regulator-min-microvolt =3D <1500000>;
> >> +	regulator-max-microvolt =3D <1500000>;
> >> +	regulator-name =3D "vcc-dram";
> >> +};
> >
> >I think I mentioned this before, but the Pine64 has DDR3L DRAM,
> >which is specified to run at 1.35V (1.36V with the 20mV granularity
> >of the AXP).  The reset value is even (wrongly?) configured to
> >1.24V.
> >
> >So is there any reason you set the voltage to 1.5V? Is that what
> >the BSP does? Or did you see any problems with 1.36V?
>=20
> I just set it based on the schematics.
>=20
> And 1.35v cannot be accurately achieved by dcdc5 and it's a problem
> whether to use 1.34v or 1.36v ;-)

1.36V seems safer.

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

--npy7xqflswdmbn44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHrNPAAoJEBx+YmzsjxAgwDIP/RC6mABunn4irfNLb8gf5xfv
RIW79p6Q/SCS/saKT8XoUWY9HT30DXM2NtE0EkaqYBOIHRxuMvx4DUs//F32r8Kj
cVUvUPK67jAXfhvTYE3th8S6TQOAvpkvW0LvN1sL2w3hUCCXpTUUzDHRKZE1f5Ct
L79qBP1cW7+A1X+ndX9uOsfoh/bw7wuaM+ni1RNOZDEWwf6pfzEGfl0Y2VNVIuuQ
M3JJpubkwE0PriyGcN9OXSTjjL1zJ8lXRIOguPJxzwPY6MCKEoCJLa8/6Ad1ZwJ7
J8mvbBNQBkMX/DRWj/Pyr3yFtVPdtmGwi6rIA0oZQ3hBu1HW9fvcBsY5ufRmPDM1
qIwN+Erl17w/RPjmiZn/1im5b6kw2DvfKfon+nGQ3T+r+uQpI9/yMOUyKh0Gnc6A
QWG+m+Xs/U3ZGdQYHc0tDxtW2jfPe6ptIF9fH1oykRqTtOzTUpwEf40ChuRtwq5p
EOp8OiZY2LEm3PPEghcu4bJB1NhKl4ylWSv92l+lvrBFOThB9aoRLnYM55Y2BkOl
Ee62+0SROKsT4ziyCbA3iXSrXaN2DhMYS5oqwejh2i+aDcDTlK4gc5WpaTMxwqSM
VCH1l8b6o8H2/wFGlOAvKv7tMlflzuY7UnrlHEsINlLoRZ2Gv7PxJkANZ3D/IfdS
9nBgsq267sDZWlYnIcLc
=xeGm
-----END PGP SIGNATURE-----

--npy7xqflswdmbn44--
