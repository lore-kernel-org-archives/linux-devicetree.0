From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: sun8i: v3s: add PWM device node
Date: Mon, 29 May 2017 08:59:42 +0200
Message-ID: <20170529065942.gho4kjgzsv4lfnda@flea.home>
References: <20170524121320.4171-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="e542b2vzlsxnpyvv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170524121320.4171-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--e542b2vzlsxnpyvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 24, 2017 at 08:13:18PM +0800, Icenowy Zheng wrote:
> As we have already the support for the PWM controller on V3s SoC, add
> its device node in the SoC's DTSI file.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v=
3s.dtsi
> index a49ebef53c91..bb080c4bd22c 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -255,6 +255,14 @@
>  			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		pwm: pwm@1c21400 {
> +			compatible =3D "allwinner,sun7i-a20-pwm";

You need to have a v3s compatible here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e542b2vzlsxnpyvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK8beAAoJEBx+YmzsjxAgI7YP/1qtIfY40IAN7TRr5Z+JTj9l
1wPf8u5S14BPDlPj3DFeeRJjSMPoTCiBS4OsqtAI4ZgqX6jpmD9/aFBNhu4nCWjS
9h4e6w0MAHv28Lvy1Bso7J7zeTN8EqNdODInZSwctHfcn/6CbF/94S8xQpBLYHTC
TyHMeW3YlTi3JysIs3pwiq3zmdcwUBJtWIgSCtNVi4vDzTUf7vsS703nMqJXgrQd
htbDmhfHrkgC0BjH9Ebb3YUyGhAYDROCo5BgFy7Yke0P4q6GkANdv1EuzUbVASJa
XcrmPsF0qQ682wVrQoNZ0OHSXVxtSDouhufs06YsKClmPrR9LqV0tVSMbbR4Uy8h
N1lzKIGQFGNFjP4fBbUeHgaPpbMA97XSLDD04r3deoq01TspqwSJ+I3srPVy78QX
JgqULs/+B32nOhPymRbXt2xz4uiAH56WeOm1515om6wUNYyvhNC05h95PhwBze+W
XZ8Y1rAGUVawmt07YSAZIHeVH01viK+PGrAaF2l16OnY/fIdt1F0ENR2IEXanKFv
oWrRKcLNiyWiQvlNNpi5VXSdvOs4nOi5IkqNyF+KrlXYLpMaV21bsmzvEDG+4R0Z
WXgRZvOTkpViq45DRDSHzCnT+aox09IaAVFyTBSY7KU6ygjKYt46WiniKYCg8j1C
sOETZjaXJ4s6I2f4APxw
=/iY4
-----END PGP SIGNATURE-----

--e542b2vzlsxnpyvv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
