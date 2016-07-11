From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 13/15] ARM: dts: sun8i: Add dt node for rtl8703as wifi
 chip on ga10h
Date: Mon, 11 Jul 2016 08:39:09 +0200
Message-ID: <20160711063909.GA4589@lukather>
References: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
 <1467993956-19535-14-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467993956-19535-14-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 08, 2016 at 06:05:54PM +0200, Hans de Goede wrote:
> The ga10h tablet has a rtl8703as wifi chip, add a dt node describing it.
>=20
> This enables usage of wifi on this tablet (together with the out of
> tree rtl8732bs driver).
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts b/arch/arm/boot/d=
ts/sun8i-a33-ga10h-v1.1.dts
> index 6566032..de6269d 100644
> --- a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
> +++ b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
> @@ -47,6 +47,11 @@
>  / {
>  	model =3D "Allwinner GA10H Quad Core Tablet (v1.1)";
>  	compatible =3D "allwinner,ga10h-v1.1", "allwinner,sun8i-a33";
> +
> +	aliases {
> +		/* Make u-boot set mac-address for rtl8703as (no eeprom) */
> +		ethernet0 =3D &rtl8703as;
> +	};
>  };
> =20
>  &ehci0 {
> @@ -62,6 +67,19 @@
>  	};
>  };
> =20
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_dldo1>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	rtl8703as: sdio_wifi@1 {

Shouldn't that need a compatible ?

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgz8NAAoJEBx+YmzsjxAgOE0P/2Cvnbl5RBYIg/t+bhjVlqRV
o0HKUU4b8kOhdu5Uqq09XSYkTDDFfwPkWJmGGiNj3eP2wZ4XYJTb3AN70dq3+xYu
v1FKcJ1jXzObw4IsStBnNBCj+9yHbFeZLbZ7xBtEeAPOy2jWyl3Zgnp2Ko6bnoFN
oT4O1Oxjpyn4cz0vpCF943lXDiCEeJMcFWWT4oO1Y3/8+RUduAeJySq9vRQ2Jnru
H2ROYJzCaWQyMwQDJBoc6PL5EXLUC3Mi3D8RJoGU2b0PVYJfhs3hcZsKMpUNQZiv
F5B+xvEgNyI2D16dYiDxBtVKDTiIYQsX90aOGeH+vFv+tH/TrwIYeYQROjH5xJrV
In+H4wqqXz2xerJw7cA5fpb2n5w8sg25KwfeCPUROlaLPSWAHQFcWYLjvfMi8Xf7
IXShApw1DuoWMeKl42lGJkPkHWm4NGrQosIykGc99T5DvBAcCiOlbAYQ0qqARcDh
6VNskZGolWhL2pKVCKLm2722RxKGVY+s708KL3I96PTnVwiaOE8Zj3PGLh939U46
6maJtHDGbQYxoBHoE7SEsh01ocFJ25z3BOBx2OWJNO4NoB2PZUmVloL9gLj5HC06
WZOzN6eh0vqZa/A+KQYNsa30vk2xPUGpHbEdUWGvjgixXhLhukc0Y6j4KzULO893
buNUMsba3LfDPHF96LIm
=8aVS
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
