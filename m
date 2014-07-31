From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: sun7i: Add Banana Pi board
Date: Thu, 31 Jul 2014 11:58:00 +0200
Message-ID: <20140731095800.GA3952@lukather>
References: <1406653348-16638-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va9XEZk9/dJ5GUjX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406653348-16638-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--va9XEZk9/dJ5GUjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 29, 2014 at 07:02:28PM +0200, Hans de Goede wrote:
> The Banana Pi is an A20 based development board using Raspberry Pi compat=
ible
> IO headers. It comes with 1 GB RAM, 1 Gb ethernet, 2x USB host, sata, hdmi
> and stereo audio out + various expenansion headers:
>=20
> http://www.bananapi.org/
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile               |   1 +
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 183 +++++++++++++++++++++++++=
++++++
>  2 files changed, 184 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bdbc84a..440e037 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -379,6 +379,7 @@ dtb-$(CONFIG_MACH_SUN6I) +=3D \
>  	sun6i-a31-hummingbird.dtb \
>  	sun6i-a31-m9.dtb
>  dtb-$(CONFIG_MACH_SUN7I) +=3D \
> +	sun7i-a20-bananapi.dtb \
>  	sun7i-a20-cubieboard2.dtb \
>  	sun7i-a20-cubietruck.dtb \
>  	sun7i-a20-i12-tvbox.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts=
/sun7i-a20-bananapi.dts
> new file mode 100644
> index 0000000..0332b82
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -0,0 +1,183 @@
> +/*
> + * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +/include/ "sun7i-a20.dtsi"
> +/include/ "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model =3D "LeMaker Banana Pi";
> +	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
> +
> +	soc@01c00000 {
> +		spi0: spi@01c05000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi0_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		mmc0: mmc@01c0f000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
> +			vmmc-supply =3D <&reg_vcc3v3>;
> +			bus-width =3D <4>;
> +			cd-gpios =3D <&pio 7 10 0>; /* PH10 */
> +			cd-inverted;
> +			status =3D "okay";
> +		};
> +
> +		usbphy: phy@01c13400 {
> +			usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +			usb2_vbus-supply =3D <&reg_usb2_vbus>;
> +			status =3D "okay";
> +		};
> +
> +		ehci0: usb@01c14000 {
> +			status =3D "okay";
> +		};
> +
> +		ohci0: usb@01c14400 {
> +			status =3D "okay";
> +		};
> +
> +		ahci: sata@01c18000 {
> +			status =3D "okay";
> +		};
> +
> +		ehci1: usb@01c1c000 {
> +			status =3D "okay";
> +		};
> +
> +		ohci1: usb@01c1c400 {
> +			status =3D "okay";
> +		};
> +
> +		pinctrl@01c20800 {
> +			uart3_pins_bananapi: uart3_pin@0 {
> +				allwinner,pins =3D "PH0", "PH1";
> +				allwinner,function =3D "uart3";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <0>;
> +			};

That node should be in the DTSI

> +
> +			mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
> +				allwinner,pins =3D "PH10";
> +				allwinner,function =3D "gpio_in";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <1>;
> +			};
> +
> +			gmac_power_pin_bananapi: gmac_power_pin@0 {
> +				allwinner,pins =3D "PH23";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <0>;
> +			};
> +
> +			led_pins_bananapi: led_pins@0 {
> +				allwinner,pins =3D "PH24";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <0>;
> +			};
> +		};
> +
> +		ir0: ir@01c21800 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&ir0_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		uart0: serial@01c28000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart0_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		uart3: serial@01c28c00 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart3_pins_bananapi>;
> +			status =3D "okay";
> +		};
> +
> +		uart7: serial@01c29c00 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart7_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		i2c0: i2c@01c2ac00 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&i2c0_pins_a>;
> +			status =3D "okay";
> +
> +			axp209: pmic@34 {
> +				compatible =3D "x-powers,axp209";
> +				reg =3D <0x34>;
> +				interrupt-parent =3D <&nmi_intc>;
> +				interrupts =3D <0 8>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +
> +		i2c2: i2c@01c2b400 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&i2c2_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		gmac: ethernet@01c50000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&gmac_pins_rgmii_a>;
> +			phy =3D <&phy1>;
> +			phy-mode =3D "rgmii";
> +			phy-supply =3D <&reg_gmac_3v3>;
> +			status =3D "okay";
> +
> +			phy1: ethernet-phy@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_bananapi>;
> +
> +		green {
> +			label =3D "bananapi:green:usr";
> +			gpios =3D <&pio 7 24 0>;
> +		};
> +	};
> +
> +	reg_usb1_vbus: usb1-vbus {
> +		status =3D "okay";
> +	};
> +
> +	reg_usb2_vbus: usb2-vbus {
> +		status =3D "okay";
> +	};
> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&gmac_power_pin_bananapi>;
> +		regulator-name =3D "gmac-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <50000>;
> +		enable-active-high;
> +		gpio =3D <&pio 7 23 0>;
> +	};
> +};

Looks fine otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--va9XEZk9/dJ5GUjX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT2hMoAAoJEBx+YmzsjxAgk5QP/jupu9W9DHnHfYrg+/Xm8ks4
Zr1/O0FmidZ4I5JMH/Xiy6PL3raBWwLOm/NT7Rq6wuPQMp6ekVkv6YFMA1uufX3u
nEYrtiJbJSd17gZ40yGnoM7Dn21YJvvUSLK0Pc/LAHAc8JN9LA6qpl2ONN3TtR73
AcqIkEQ0Nk/19OHHlUq/N88VBIwhDAaz1MaataiBMDPq74z741ylfw0KIyEpzW7h
0yS+xA7+nO0fjSgQb0WuGR5/BbeO5kQswyFrhZQwtr8eQu2Qq7jIlIvQ0whKeJXS
w+c0a0x1emOkJHYlKqoq+zbW3kKo0OQlHTSbajEwrvUzOamyQ1UQa5UaRJm3868P
QM6YAETDxKZkWM7ffLu8dnxQZcsUprLVTR17pe6++c4vrimDXx71T7gxxWnSdv9W
MPpJav2Xan37tJc6e2Z2LRN8kNqV8Gg65bRVXlPlbs0ZMaCNXUG5WJq1JfBpPY+A
egunOVc7l8Ahcuf8+6zAFSSg908uZhr0ZfDj3oPTbmmWdtR65XRxL6zYxg90RRED
1Ul/0ksKUZtGheB8aViHQ3ndVELaVpfGtqFHh2VGQ8LWxgJuYW7HEBXSQPYQ4PQ4
r+O6NthVF+6RFL7kFr3PLpkBlxKCkHOQkEq3XdtAbPlPPo/CyJw2klVCx/oc1qs7
Wj8XzCdeA6QhbSO7/Lui
=e30/
-----END PGP SIGNATURE-----

--va9XEZk9/dJ5GUjX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
