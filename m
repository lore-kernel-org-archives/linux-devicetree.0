From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun5i: Add touchscreen node to
 reference-design-tablet.dtsi
Date: Mon, 14 Nov 2016 21:08:02 +0100
Message-ID: <20161114200802.vdduhyxnkgmpsyd5@lukather>
References: <20161113192203.7101-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eoypaxrcm7nlrypm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161113192203.7101-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--eoypaxrcm7nlrypm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 13, 2016 at 08:22:02PM +0100, Hans de Goede wrote:
> Just like on sun8i all sun5i tablets use the same interrupt and power
> gpios for their touchscreens. I've checked all known a13 fex files and
> only the UTOO P66 uses a different gpio for the interrupt.
>=20
> Add a touchscreen node to sun5i-reference-design-tablet.dtsi, which
> fills in the necessary gpios to avoid duplication in the tablet dts files,
> just like we do in sun8i-reference-design-tablet.dtsi.
>=20
> This will make future patches adding touchscreen nodes to a13 tablets
> simpler.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i-a13-utoo-p66.dts           | 38 ++++++++--------=
------
>  .../boot/dts/sun5i-reference-design-tablet.dtsi    | 25 ++++++++++++++
>  2 files changed, 39 insertions(+), 24 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts=
/sun5i-a13-utoo-p66.dts
> index a8b0bcc..3d7ff10 100644
> --- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> +++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> @@ -83,22 +83,6 @@
>  	allwinner,pins =3D "PG3";
>  };
> =20
> -&i2c1 {
> -	icn8318: touchscreen@40 {
> -		compatible =3D "chipone,icn8318";
> -		reg =3D <0x40>;
> -		interrupt-parent =3D <&pio>;
> -		interrupts =3D <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&ts_wake_pin_p66>;
> -		wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> -		touchscreen-size-x =3D <800>;
> -		touchscreen-size-y =3D <480>;
> -		touchscreen-inverted-x;
> -		touchscreen-swapped-x-y;
> -	};
> -};
> -
>  &mmc2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc2_pins_a>;
> @@ -121,20 +105,26 @@
>  		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>  		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
>  	};
> -
> -	ts_wake_pin_p66: ts_wake_pin@0 {
> -		allwinner,pins =3D "PB3";
> -		allwinner,function =3D "gpio_out";
> -		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> -		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> -	};
> -
>  };
> =20
>  &reg_usb0_vbus {
>  	gpio =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
>  };
> =20
> +&touchscreen {
> +	compatible =3D "chipone,icn8318";
> +	reg =3D <0x40>;
> +	/* The P66 uses a different EINT then the reference design */
> +	interrupts =3D <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
> +	/* The icn8318 binding expects wake-gpios instead of power-gpios */
> +	wake-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> +	touchscreen-size-x =3D <800>;
> +	touchscreen-size-y =3D <480>;
> +	touchscreen-inverted-x;
> +	touchscreen-swapped-x-y;
> +	status =3D "okay";
> +};
> +
>  &uart1 {
>  	/* The P66 uses the uart pins as gpios */
>  	status =3D "disabled";
> diff --git a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi b/arch/=
arm/boot/dts/sun5i-reference-design-tablet.dtsi
> index 20cc940..7af488a 100644
> --- a/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
> +++ b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
> @@ -41,6 +41,7 @@
>   */
>  #include "sunxi-reference-design-tablet.dtsi"
> =20
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pwm/pwm.h>
> =20
>  / {
> @@ -84,6 +85,23 @@
>  };
> =20
>  &i2c1 {
> +	/*
> +	 * The gsl1680 is rated at 400KHz and it will not work reliable at
> +	 * 100KHz, this has been confirmed on multiple different q8 tablets.
> +	 * All other devices on this bus are also rated for 400KHz.
> +	 */
> +	clock-frequency =3D <400000>;
> +
> +	touchscreen: touchscreen {
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <6 11 IRQ_TYPE_EDGE_FALLING>; /* EINT11 (PG11) */
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ts_power_pin>;
> +		power-gpios =3D <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
> +		/* Tablet dts must provide reg and compatible */
> +		status =3D "disabled";
> +	};
> +
>  	pcf8563: rtc@51 {
>  		compatible =3D "nxp,pcf8563";
>  		reg =3D <0x51>;
> @@ -125,6 +143,13 @@
>  		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
>  	};
> =20
> +	ts_power_pin: ts_power_pin {
> +		allwinner,pins =3D "PB3";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +

For the next release, we'll switch to the generic pin mux properties
("pins" and "function"), and we actually implemented the fact that the
drive and pull properties are optional, so you can drop them both.

You'll need next + http://lists.infradead.org/pipermail/linux-arm-kernel/20=
16-November/467123.html

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eoypaxrcm7nlrypm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYKhmfAAoJEBx+YmzsjxAgx7MP/2nOm1P7cwlsffH/U/BE1dCo
Nza1hzamUp0ve08hIaBwAuxRDljIp+82ls03eRlW8UlX5fe068WgcPSY2kwJca6e
mbF6nbQWpXTBKGpLZ/NljCJzSeK1K5VcR9Z40kJpkJnLx9YUiLG0Y8fpHoZVLWr6
uMsYXsAbcsMyjCe+r1QDFpXtaX0YuX37irngI8eI6ifA9xDya6xQpNypToOmXMpy
GtVyAT04JqBDRc5NBBqxejpwyr7v1679sSj6bto0uNLWuSnbZ7y0ifFeu44hV/uo
1Foxk42SG4xl5LiOQjbxElDOISau+sug4eUVrIklNOJtU0KtPAY66r1kGokvg8cl
JgnGkzgHECnKEVmf+KtRST6TCXYiGslt2jlnl1Hr2+WnGAjtp04m8aagHU5H73M/
8X2M5/AMMQyHMRrhnr3/MSb6xpucRNLANVA/QtW+2/YFbPBfdDEioirUvkhT9H3i
yRrjOL1R3vzB92dBoF+2fEdmi66YaeR/S15d+SlYOonH/kdqNT9YWYjKoPAYYenH
D1mOZ1NC0vJUz7qPCr1OMPShAUi3pOBMbed57oDcx86c61eJ2NKsz56ZhYrkV/6l
w4I4vjyWtMXFEnVjHgdrh/VefkAQpjRfiQIUeR93e++WhyLZDpc14ifk/ZaGUTc0
VNJ1e44p/Rr8auGnNGtI
=w0V8
-----END PGP SIGNATURE-----

--eoypaxrcm7nlrypm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
