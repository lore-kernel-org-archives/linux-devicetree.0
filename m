From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Specify memblock for Nano Pi M1
Date: Mon, 5 Dec 2016 09:09:32 +0100
Message-ID: <20161205080932.xaqyl2httgxgso67@lukather>
References: <20161205020032.26586-1-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pyvttxwltcubqvmk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161205020032.26586-1-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pyvttxwltcubqvmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 11:00:31AM +0900, Milo Kim wrote:
> The board has DDR3 512MB. This patch helps scanning the memory and
> adding memblock through the DT.
>=20
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts b/arch/arm/boot/dts=
/sun8i-h3-nanopi-m1.dts
> index ec63d10..be3668f 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
> @@ -45,6 +45,11 @@
>  / {
>  	model =3D "FriendlyArm NanoPi M1";
>  	compatible =3D "friendlyarm,nanopi-m1", "allwinner,sun8i-h3";
> +
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x40000000 0x20000000>;
> +	};

U-boot will fill that up, so there's no need to put it there.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pyvttxwltcubqvmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRSC4AAoJEBx+YmzsjxAgXRMP/Rrit0JNm0ANZrNrtYfqZz5J
O0S0h25CaC5V/yRcIqTqJ1mteWS5g2j/nLOcV+3/pUWcyZqaZEcovlfnT0NC5y5j
EPkNiQIT4i3H9+jCh8DhTXnsQ9TIqfcFGOd7SV+ieqaS8WrBV2/wdYObUtNHlVmw
6ZVGQUMO2ATiV/F5ODrjOGELQdAu/SFE8T/7eFQQ3jS1EdeJnDk3wk4tXozAfSQj
Vo4VQMIXLvfUndS3cGpgA8dHL5VP62w9nCSAneXQSRdl7z/sUOMewBVkJSW6QrIe
B8yXChaJzGMEFQjLKhSUmTjyaDPRuGVbRvacTGZ+6y+F2lsONIMxGZZCnW0aESUb
sEvv6odcg3pSy5ySn2QX/+dua8YvsMG8bOufecfAu3tVGf48Lf0uZZTZ8wBjZ27X
8lR3b8gMTPQlyFUPEd3wAejbyU+lEwsskfm9ZsppzzRK1OXynRoKDRda+YkgkiyV
+Ury43nDQRcuPP7TH6UKw0A8dKucIotNaol9nZMoVynKbygsAvdvhuTnq5vcvscW
h4BVGKqJTrz0prMApQVIgKvO7Lbh8audL1T9QUoQldv47HfBkKP5F5tQ6Qq3HKKM
DWzpuHPbJeoUA3D9pQp97empV9zVdNlb1BZvSgRADbvJs7QmmLP7382KpE5ANEeN
8Z4gN/gsZguodWXdkbo2
=knge
-----END PGP SIGNATURE-----

--pyvttxwltcubqvmk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
