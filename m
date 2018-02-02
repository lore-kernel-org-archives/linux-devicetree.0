From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: add audio codec support into V3s
 DTSI
Date: Fri, 2 Feb 2018 20:49:35 +0100
Message-ID: <20180202194935.vdqkgch6mowqi2px@flea.lan>
References: <20180202140153.21549-1-icenowy@aosc.io>
 <20180202140153.21549-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="esaw3md4zvp67dni"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180202140153.21549-3-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--esaw3md4zvp67dni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2018 at 10:01:52PM +0800, Icenowy Zheng wrote:
> Allwinner V3s SoC features an internal audio codec like the one in H3,
> and a analog codec like the one in H3/A23 (but much simpler).
>=20
> Add them in the DTSI file.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v=
3s.dtsi
> index 20edebd983f0..f6c534efaef9 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -354,6 +354,25 @@
>  			status =3D "disabled";
>  		};
> =20
> +		codec: codec@01c22c00 {
> +			#sound-dai-cells =3D <0>;
> +			compatible =3D "allwinner,sun8i-v3s-codec";
> +			reg =3D <0x01c22c00 0x400>;
> +			interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
> +			clock-names =3D "apb", "codec";
> +			resets =3D <&ccu RST_BUS_CODEC>;
> +			dmas =3D <&dma 15>, <&dma 15>;
> +			dma-names =3D "rx", "tx";
> +			allwinner,codec-analog-controls =3D <&codec_analog>;
> +			status =3D "disabled";
> +		};
> +
> +		codec_analog: codec-analog@01c23000 {
> +			compatible =3D "allwinner,sun8i-v3s-codec-analog";
> +			reg =3D <0x01c23000 0x4>;

This should be the whole size of the memory region.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--esaw3md4zvp67dni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlp0wM4ACgkQ0rTAlCFN
r3Tlxg//TCjPGvAz4ePGihqk06mbEPkHOcsi0o17VPyPG7izW2qAawGf0sYJ/gpR
f4O0E/D1U3fCSykPn9PVJJtiFHa8B94Ni2I6G6KFWo0MkBJw2Q6uciGiTUYb2+EN
2iNG52L9dhNDI2VvPi3V8T922Y+LiC8Ctq1P7OzjKCdOycRKF/RqK+Nyn3F0yTO6
vMf9zZcPqLbbqE+E+VNYkyoov6UbkedFRkEjvKNmTTwawJqu5ioKjX9gbHEMTmD0
Q7NM6Cpy6eaVZzfVfnrC9x6/Wfig+CDQLoCCjcITOUqlTPdouMPydoAbhFvcXOMb
PTQiiKon6Jaf/Lq0N700xqaNJmczPHDP5Csc8Dt9Nk2Iy+eYNbgBN6Lfw4fgyc6L
gtHObdOQ01aehxQrqEc1uX2qQvOk3ie4uABz8cY2W1qwN1CJJNvBHFckRBqksUJA
aVqVCEf3eQQd0SN+kh59NybgiaOVAlFflgNFAiaucrstRCKzAoVJ02J8CZIsE/dg
Y3wEZXyIQtkvxeIHFeRfwdJXU9O0/vndBniCtrRG03qO5PJxDiY4kp8gqyxIAaAu
JuXsoU/kbgCOxJYatDI1HVkN2bqSP3kh57EKJL/AJ+QS3weJEmhuja+eh6bZQoNp
+XSeF9ibRbRYqzoSR3SyCd43Oei6wplSImriNppqww/n6eCo5/Q=
=dqx9
-----END PGP SIGNATURE-----

--esaw3md4zvp67dni--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
