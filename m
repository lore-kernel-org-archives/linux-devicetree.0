From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/8] arm64: dts: allwinner: add R_PIO node
Date: Fri, 10 Feb 2017 09:07:06 +0100
Message-ID: <20170210080706.loofvr3mmctfa2mc@lukather>
References: <20170208100009.29362-1-icenowy@aosc.xyz>
 <20170208100009.29362-5-icenowy@aosc.xyz>
 <20170208101458.du6ybqsw52ypzhzw@lukather>
 <39431486552126@web41j.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jwrinjwhek26djsn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBK7J6XCAKGQEVXX2IWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <39431486552126-4vD9JDEoAAxxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jwrinjwhek26djsn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 07:08:46PM +0800, Icenowy Zheng wrote:
> 08.02.2017, 18:15, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Wed, Feb 08, 2017 at 06:00:06PM +0800, Icenowy Zheng wrote:
> >> =C2=A0Allwinner A64 SoC has a R_PIO node like the one in H3.
> >>
> >> =C2=A0Add the node as well as needed clocks and resets.
> >>
> >> =C2=A0As there's no document for apb0_gates, I only added the R_PIO bi=
t here.
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0---
> >> =C2=A0=C2=A0arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 40 +++++++=
++++++++++++++++++++
> >> =C2=A0=C2=A01 file changed, 40 insertions(+)
> >>
> >> =C2=A0diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> =C2=A0index 1c64ea2d23f9..4b0baa79554c 100644
> >> =C2=A0--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> =C2=A0+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> =C2=A0@@ -98,6 +98,15 @@
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clock-output-names =3D "osc32k";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> >>
> >> =C2=A0+ apb0: apb0_clk {
> >> =C2=A0+ compatible =3D "fixed-factor-clock";
> >> =C2=A0+ #clock-cells =3D <0>;
> >> =C2=A0+ clock-div =3D <1>;
> >> =C2=A0+ clock-mult =3D <1>;
> >> =C2=A0+ clocks =3D <&osc24M>;
> >> =C2=A0+ clock-output-names =3D "apb0";
> >> =C2=A0+ };
> >> =C2=A0+
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0psci {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "arm,psci-0.2";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0method =3D "smc";
> >> =C2=A0@@ -392,5 +401,36 @@
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> >> =C2=A0+
> >> =C2=A0+ apb0_gates: clk@1f01428 {
> >> =C2=A0+ compatible =3D "allwinner,sun50i-a64-apb0-gates-clk",
> >> =C2=A0+ "allwinner,sun4i-a10-gates-clk";
> >> =C2=A0+ reg =3D <0x01f01428 0x4>;
> >> =C2=A0+ #clock-cells =3D <1>;
> >> =C2=A0+ clocks =3D <&apb0>;
> >> =C2=A0+ clock-indices =3D <0>;
> >> =C2=A0+ clock-output-names =3D "apb0_pio";
> >> =C2=A0+ };
> >> =C2=A0+
> >> =C2=A0+ apb0_rst: reset@1f014b0 {
> >> =C2=A0+ reg =3D <0x01f014b0 0x4>;
> >> =C2=A0+ compatible =3D "allwinner,sun6i-a31-clock-reset";
> >> =C2=A0+ #reset-cells =3D <1>;
> >> =C2=A0+ };
> >
> > Please make a sunxi-ng driver for those clocks.
>=20
> We have no enough materials to make such a CCU driver.
>=20
> Clocks in CPUs are usually undocumented, and difficult to
> be collected -- even the clk-sun50iw1.c in BSP do not have
> all clocks in CPUs.

That's unfortunate, but we can deal with that by simply extending the
clocks we have. Nothing too complicated or unconvenient to deal with.

> We should only make it sunxi-ng until it's fully discovered (all
> functions in CPUs are functional).

No, I expect that by 4.12 we have converted every users to sunxi-ng,
PRCM included.

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

--jwrinjwhek26djsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYnXSqAAoJEBx+YmzsjxAgvCwP/jz6fMkzK82uE7uGoLJesacU
HKbgwOjMPRJCmwKfmcoYckPr8xSWNPfkB16W1I2Fk3E8EyluSwWz15tKxvzrfeVf
oLFlnsPzbl+xJAiRiABAw2XsSUoFwwppz7cxhwnbO2BNHqEJ6ogFIKercMz9YzEU
dzO58Z7S/wQ/zjeDgxpNEO/IkyQJcqMBlQLOo4btmAKN4nACpaJx5tY1tLH6oGLH
2ugeM9ACmXwEbF2DB8W96/+xMd0pV22GqlEyRMGRXctRN8y6CD7iuY07BuWjC++I
974/nYdOW5FpE4bHGO4A6vuH9ljRMipsooZplgM4XsGPShBXEzKU+TW93OGp7vQ3
7qru94Iu1ocuZkhbc/ronrhwudkY8ArEa8cuLZO+1k+jUWk1vAan/a7VIcduzKTR
6LCjwcDePuFv2XpEvk/2pyxrKsLxvZWcjhXTZpOV6fDxFZozUSxet+3W7wctuGPF
encnryj2yC/oIijt4CGdCiZTTOMAboHRgYyODXs5DDjn8dWDRasza5xtdtmnTBH4
oMklTnC5zN/IfipZDZpiJgxPRwS/JvFNx2kRFAu2jd3vdbJW9o60TJQ8GUVeX/NV
+ycbMJM2V4AGhE9Rd2oEOfHFk/k4D111LnWxqMooF9zBQfth9JUD2/Jpy9GvyrEy
XAGFNEdBB346QRQmpk54
=d7UZ
-----END PGP SIGNATURE-----

--jwrinjwhek26djsn--
