From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v3 02/12] arm64: allwinner: a64: add NMI
 controller on A64
Date: Thu, 20 Apr 2017 07:58:02 +0200
Message-ID: <20170420055802.btibui5pspan4qal@lukather>
References: <20170417115747.7300-1-icenowy@aosc.io>
 <20170417115747.7300-3-icenowy@aosc.io>
 <20170418070016.qsng3qtk76bqxyc5@lukather>
 <FB3B3C68-EB16-4352-B0B9-64857B1A6C03@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="igw46omcbrryc5ij"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBY5M4HDQKGQEKCTAKXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <FB3B3C68-EB16-4352-B0B9-64857B1A6C03-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--igw46omcbrryc5ij
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 06:56:43PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B44=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
3:00:16, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Mon, Apr 17, 2017 at 07:57:37PM +0800, Icenowy Zheng wrote:
> >> Allwinner A64 SoC features a NMI controller, which is usually
> >connected
> >> to the AXP PMIC.
> >>=20
> >> Add support for it.
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >> Changes in v2:
> >> - Added Chen-Yu's ACK.
> >>=20
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>=20
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> index 05ec9fc5e81f..53c18ca372ea 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> @@ -403,6 +403,14 @@
> >>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> >>  		};
> >> =20
> >> +		nmi_intc: interrupt-controller@01f00c0c {
> >> +			compatible =3D "allwinner,sun6i-a31-sc-nmi";
> >> +			interrupt-controller;
> >> +			#interrupt-cells =3D <2>;
> >> +			reg =3D <0x01f00c0c 0x38>;
> >
> >The base address is not correct, and there's uncertainty on whether
> >this is this particular controller or not. Did you even test this?
>=20
> Tested by axp20x-pek.

Still, the base address is wrong, which is yet another hint that this
is not the same interrupt controller, and just works by accident.

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

--igw46omcbrryc5ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+E3lAAoJEBx+YmzsjxAgQt0QAKBnazClOM/YeEpzHhYlzRQc
0YwiOmy9T/ZFCJ7meeeVfnJjeTi7+gX07cpTgQbnG1qI5g/ZYr60daWCCm45iahW
slrvRe//hyLQyxyu829iYH1Vm1a5uUlHYr1EXEEjxHxSsW6FQmqtbqSvpOHTGtHp
72WmeV8YIsE5cH5uSSsYNP6ILDLoqyI9fD/pakWHfIEwXl+cKrMY8Z/VtrB5hblf
4s7XKiyRZAcKeIk3LHloxmiK8QGcuVfc/fNQB0jeq4yRBnPpw0873RMxSZ4Jhj+7
zIHLLIZbIeWdx65TjKxuvKVBVMFIDaKvqE56eWis8nX/ZFNgLF+v1Kwm6TCj38uP
o1u/aspFT/mf8JmIs4ZGTzDm26g3VJvWbc4oPSgvPenOTYiDKH9/npKlGI+XdQX9
h2bZr7F9zmjjrZprChvQ7XiIUak4klj5Aq8lRDOgLK+6+JSUis2u1FH2dsIf4Zlr
5aKKPI8mRaT374YEljsl2rTEtKwslBuvmOT8f8tgqiDErd/SDmprzXgNAR9LFhDH
HNuBcfCyFTbD5w4e7IZ8yEE7x4D2KmUFD8lVTK2KNqTefFUPHbA4qL1wWwJK3Cih
FOKgKOkLJBe2oIyjbKIyCmrv/gVn787a+qgSMzkohdeX9HbSklzn7uXMzHJGC3qp
6oMLWTS3nLpkHv3QR+U1
=G06A
-----END PGP SIGNATURE-----

--igw46omcbrryc5ij--
