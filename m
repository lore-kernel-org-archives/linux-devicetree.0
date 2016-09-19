From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: sun8i: add pinmux for UART1 at PG
Date: Mon, 19 Sep 2016 10:18:24 +0200
Message-ID: <20160919081824.GB8719@lukather>
References: <20160916151642.27907-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1211704761350109433=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160916151642.27907-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1211704761350109433==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 16, 2016 at 11:16:41PM +0800, Icenowy Zheng wrote:
> The UART1 at PG (PG6, PG7, PG8, PG9) is, in the Allwinner's reference
> tablet design of A23/33, used to connect to UART Bluetooth cards.
>=20
> Add the pinmux for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> This patch is splited in v4.
>=20
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun=
8i-a23-a33.dtsi
> index 7e05e09..c340885 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -361,6 +361,20 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> +			uart1_pins_a: uart1@0 {
> +				allwinner,pins =3D "PG6", "PG7";
> +				allwinner,function =3D "uart1";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart1_pins_cts_rts_a: uart1-cts-rts@0 {
> +				allwinner,pins =3D "PG8", "PG9";
> +				allwinner,function =3D "uart1";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +

It turns out the allwinner,drive and allwinner,pull properties are
optionnal. I removed them, and applied that patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX359QAAoJEBx+YmzsjxAg3vsP/0HEB+Ac2RZhrwDua5YoI+7V
rTcEgUpqI+IzHxGOYgz8WMwE6stmZTp2j9+nW5+LQbxSMIVkD9lT9MfTFzfKCbHN
mJb7xipkEM8W9LLyPrYULclKO+GNwkLn8Hdwh402BhlppDID37Sa1SIuj3LnX077
6ko0YCXKN77E9I99TP1uVChapPw8Kr4NJEo31rXs2U9khT6u88RuBkQur159A9o2
46gBaPl722BFBQbemEBX9VEVm2TZSI78OuVjcNuS+Isehp4+sNTQae49tfuvvjg/
7noLk75wGvyOr+irv1K+NiEZ8NbzuOyRc1AkWlQ96NzcGRwlWbbgErtLZDCVo+lF
E6qbAEoR+fFF6xUfFsgCvGaR2Kh7MSnQ7VRLpM9SVjeoa4Z9WWdi+8RiaOK4Scnw
ykiuFYGMkneePVa9uEL/LProTErygSjvUkG2zScFy6hXC9HoXofkulWI8N7BU9Qv
glbg9M2q/8MBBP+DZydZKp7SWEq8yrmZQUnSMQDYcj+lT6U0YoIslSocJpKsUOgT
xFvQ4QkNemwhq3xutjEoF38VYlZijGgcfGGiAAVPAMb4YMY0Ocw13DYBH+OQg2EA
e/rulEsj+XB96ewm4BRG6J7vyYDFoy6OXOuyh7OMV0hCYj55EyM9VcIuKkNw28JF
RekuSlQjOTXP1freatHZ
=c9LJ
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--


--===============1211704761350109433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1211704761350109433==--
