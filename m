From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: sun8i: h3: bluetooth for Banana Pi M2 Zero board
Date: Fri, 1 Mar 2019 15:36:32 +0100
Message-ID: <20190301143632.kzlr4jphq3rceos6@flea>
References: <20190228212840.24964-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ib4bul6sb7rzbemi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228212840.24964-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ib4bul6sb7rzbemi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your patch

On Thu, Feb 28, 2019 at 10:28:40PM +0100, Andreas Kemnade wrote:
> The Banana Pi M2 Zero board has an AP6212 BT+Wifi combo chip
> with broadcom internals attached to UART1 and some gpios.
> This addition is in line with similar boards
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 29 ++++++++++++++++=
++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/=
arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> index 1db2541135a7..39e206fac4e3 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> @@ -69,6 +69,8 @@
>  		compatible =3D "mmc-pwrseq-simple";
>  		pinctrl-names =3D "default";
>  		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> +		clocks =3D <&rtc 1>;
> +		clock-names =3D "ext_clock";
>  	};
>  };
> =20
> @@ -122,7 +124,34 @@
>  &uart1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
>  	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm43438-bt";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&bt_pins_out>, <&bt_pins_in>;
> +		clocks =3D <&rtc 1>;
> +		clock-names =3D "lpo";
> +		vbat-supply =3D <&reg_vcc3v3>;
> +		vddio-supply =3D <&reg_vcc3v3>;
> +		device-wakeup-gpios =3D <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
> +		host-wakeup-gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
> +		shutdown-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> +	};
> +
> +};
> +
> +&pio {
> +	bt_pins_out: bt_out {
> +		pins =3D "PG12", "PG13";
> +		function =3D "gpio_out";
> +	};
> +
> +	bt_pins_in: bt_in {
> +		pins =3D "PG11";
> +		function =3D "gpio_in";
> +	};

You don't need any of those pinctrl nodes, GPIOs work fine without.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ib4bul6sb7rzbemi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXHlDcAAKCRDj7w1vZxhR
xWn6AP0cj7wtgn87Bf2OYGSm3A4wakfamsXePzKGD2jOfh+OUQD+PQr/iYkj+OYv
6IvLK6H+eNF9wjDGYohNflqd7siYuwo=
=Wkrh
-----END PGP SIGNATURE-----

--ib4bul6sb7rzbemi--
