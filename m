From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: sun7i: Enable axp209 driver on
 olinuxino lime2
Date: Thu, 10 Sep 2015 20:13:15 +0200
Message-ID: <20150910181315.GM9885@lukather>
References: <1441805204-6037-1-git-send-email-o.schinagl@ultimaker.com>
 <1441805204-6037-2-git-send-email-o.schinagl@ultimaker.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441805204-6037-2-git-send-email-o.schinagl@ultimaker.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olliver Schinagl <o.schinagl@ultimaker.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Wed, Sep 09, 2015 at 03:26:44PM +0200, Olliver Schinagl wrote:
> The Olimex OLinuXino Lime2 uses the same AXP209 as was recently
> introduced this driver for its power regulation.
>=20
> Signed-off-by: Olliver Schinagl <o.schinagl@ultimaker.com>
> ---
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 87 +++++++++----------=
------
>  1 file changed, 31 insertions(+), 56 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/b=
oot/dts/sun7i-a20-olinuxino-lime2.dts
> index d5c796c..dd90a1d 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> @@ -71,14 +71,6 @@
>  			default-state =3D "on";
>  		};
>  	};
> -
> -	reg_axp_ipsout: axp_ipsout {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "axp-ipsout";
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -		regulator-always-on;
> -	};

Why are you removing that regulator?

>  };
> =20
>  &ahci {
> @@ -86,6 +78,10 @@
>  	status =3D "okay";
>  };
> =20
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -112,57 +108,9 @@
>  	status =3D "okay";
> =20
>  	axp209: pmic@34 {
> -		compatible =3D "x-powers,axp209";
>  		reg =3D <0x34>;
>  		interrupt-parent =3D <&nmi_intc>;
>  		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> -
> -		interrupt-controller;
> -		#interrupt-cells =3D <1>;
> -
> -		acin-supply =3D <&reg_axp_ipsout>;
> -		vin2-supply =3D <&reg_axp_ipsout>;
> -		vin3-supply =3D <&reg_axp_ipsout>;
> -		ldo24in-supply =3D <&reg_axp_ipsout>;
> -		ldo3in-supply =3D <&reg_axp_ipsout>;

And these supplies?

> -		regulators {
> -			vdd_rtc: ldo1 {
> -				regulator-min-microvolt =3D <1300000>;
> -				regulator-max-microvolt =3D <1300000>;
> -				regulator-always-on;
> -			};
> -
> -			avcc: ldo2 {
> -				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <3300000>;
> -				regulator-always-on;
> -			};
> -
> -			vcc_csi0: ldo3 {
> -				regulator-min-microvolt =3D <700000>;
> -				regulator-max-microvolt =3D <3500000>;
> -				regulator-always-on;
> -			};
> -
> -			vcc_csi1: ldo4 {
> -				regulator-min-microvolt =3D <1250000>;
> -				regulator-max-microvolt =3D <3300000>;
> -				regulator-always-on;
> -			};
> -
> -			vdd_cpu: dcdc2 {
> -				regulator-min-microvolt =3D <700000>;
> -				regulator-max-microvolt =3D <2275000>;
> -				regulator-always-on;
> -			};
> -
> -			vdd_int: dcdc3 {
> -				regulator-min-microvolt =3D <700000>;
> -				regulator-max-microvolt =3D <3500000>;
> -				regulator-always-on;
> -			};
> -		};
>  	};
>  };
> =20
> @@ -243,6 +191,33 @@
>  	status =3D "okay";
>  };
> =20
> +#include "axp209.dtsi"
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1450000>;

This is outside of the operating voltages of the CPU.

> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-int-dll";
> +};
> +
> +&reg_ldo1 {
> +	regulator-name =3D "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "avcc";

You're changing the boundaries, why?

> +};
> +
>  &reg_usb0_vbus {
>  	pinctrl-0 =3D <&usb0_vbus_pin_lime2>;
>  	gpio =3D <&pio 2 17 GPIO_ACTIVE_HIGH>;
> --=20
> 2.1.4

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8cg7AAoJEBx+YmzsjxAg0EAQAIveSaDlKItC69pOd/IA+8nC
donmqr+hQjkLOP0C6fYMUqmfJJtjsQsjwJX8rXE9FKLiG/UhKTm0aCUIfyPihpiT
rW2uhcN0th36UgNZF9F/A33bUJZEpMStmQkxpIa739RMcZZBSSOw86nFjDtUJ/o8
2vROAgAWxjyyubCC2x5rYBQbVQF5LxZEfkZ7e72c0PLpPlDCiBv7dACQ9ZaHYsuq
+dA1TM+qCuFlWhBYWApfxdrUFRYJtX7GxBPbxwgEg+zsy1WJC6QGMZL5R2qAbakV
KTywbKETRix1uFiNpmCgcaBNM3SoczpyPY8psD3aHDMh30sizQtuyrYqQ+SrfQeD
heR79BNStbok34irFFyg/nGafozJnr/qyVzc0oilhyo+UeaBqWNRkvZwS5RjmBgl
4SuFTR2ZOcYM+9bzi+3VadXkrUWqtGLTpYMBGrSYch8/X7dG+x4CLjBOomMLA8q6
8lS1r5iuJN6Kl/uTLFGRPufK7r0MhmRw9Sd1vl9b+NHh91WfiMeYaZaYvYi6HQlg
vNZ8iMsX5Gy6h3mXUgkq373c6Hi8QwePPXXji8yPaSVIoXMnIkyCJHjhgMbFijwA
/s6rvbR85cFbwuMI+AqBwSbbNeVw1I194m5C5gZis2+xe7Nc+x4lynYv0Qgx5kQB
TMhuoUZAqJlpC9fMkS6b
=JKj9
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--
