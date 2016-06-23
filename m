From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] ARM: sun8i: Add Parrot Board DTS
Date: Thu, 23 Jun 2016 13:57:44 +0200
Message-ID: <20160623115744.GA3785@lukather>
References: <1466602902-4022-1-git-send-email-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466602902-4022-1-git-send-email-quentin.schulz@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 22, 2016 at 03:41:42PM +0200, Quentin Schulz wrote:
> The Parrot Board is an evaluation board with an Allwinner R16 (assumed
> to be close to an Allwinner A33), 4GB of eMMC, 512MB of RAM, USB host
> and OTG, a WiFi/Bluetooth combo chip, a micro SD Card reader, 2
> controllable buttons, an LVDS port with separated backlight and
> capacitive touch panel ports, an audio/microphone jack, a camera CSI
> port, 2 sets of 22 GPIOs and an accelerometer.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> ---
>=20
> Patch dependencies:
>  - regulator: axp20x: Add support for the (external) drivebus regulator
>  - ARM: dts: axp22x.dtsi: Add reg_drivebus node
>  - ARM: dts: axp22x.dtsi: Add usb_power_supply node
>  - power: axp20x_usb: Add support for usb power-supply on axp22x pmics
>  - mfd: axp20x: Extend axp22x_volatile_ranges
>  - mfd: axp20x: Add axp20x-usb-power-supply for axp22x pmics

Those are not dependencies worth mentionning, they've already been
merged.

>  - phy-sun4i-usb: Add workaround for missing Vbus det interrupts on A31
> or the micro USB port would not be powered.
>=20
> v2:
>  - correct typos,
>  - chose less generic name suffix for nodes (now_parrot_r16),
>  - add comment for i2c childless node,
>  - add comment for two regulators-powered WiFi chip,
>  - add comment to explicit the use of some regulators,
>  - add usb_vbus_power-supply property in usbphy node (this adds a
>    dependance to an other patch),
>=20
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/sun8i-r16-parrot.dts | 356 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 357 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r16-parrot.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1ff5434..6c7581f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -762,6 +762,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a33-ippo-q8h-v1.2.dtb \
>  	sun8i-a33-q8-tablet.dtb \
>  	sun8i-a33-sinlinx-sina33.dtb \
> +	sun8i-r16-parrot.dtb \

This is supposed to be ordered alphabetically

>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-h3-orangepi-2.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-r16-parrot.dts b/arch/arm/boot/dts/s=
un8i-r16-parrot.dts
> new file mode 100644
> index 0000000..cd68bfa
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r16-parrot.dts
> @@ -0,0 +1,356 @@
> +/*
> + * Copyright 2016 Quentin Schulz
> + *
> + * Quentin Schulz <quentin.schulz@free-electrons.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun8i-a33.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model =3D "Allwinner Parrot EVB R16";

I think something like "Allwinner R16 EVB (Parrot)" would be better.

> +	compatible =3D "allwinner,parrot-evb-r16", "allwinner,sun8i-a33";

And we usually put the soc name first, so something like
"allwinner,r16-evb" or "allwinner,parrot"

> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_parrot_r16>;
> +
> +		led1 {
> +			label =3D "parrot_r16:led1:usr";
> +			gpio =3D <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
> +		};
> +
> +		led2 {
> +			label =3D "parrot_r16:led2:usr";

parrot_r16 is redundant. Once again, parrot, or r16-evb.

> +			gpio =3D <&pio 4 16 GPIO_ACTIVE_HIGH>; /* PE16 */
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_LOW>; /* PL06 */
> +	};
> +
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins_a>;
> +	status =3D "okay";
> +
> +	/* An as-yet-unknown accelerometer is connected to this i2c bus. */

Maybe add a TODO, or FIXME tag?

> +};
> +
> +&lradc {
> +	vref-supply =3D <&reg_aldo3>;
> +	status =3D "okay";
> +
> +	button@0 {
> +		label =3D "V+";
> +		linux,code =3D <KEY_VOLUMEUP>;
> +		channel =3D <0>;
> +		voltage =3D <190000>;
> +	};
> +
> +	button@1 {
> +		label =3D "V-";
> +		linux,code =3D <KEY_VOLUMEDOWN>;
> +		channel =3D <0>;
> +		voltage =3D <390000>;
> +	};
> +
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_parrot_r16>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	cd-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};
> +
> +/*
> + * TODO: WiFi chip needs dldo1 AND dldo2 as vmmc-supply.
> + * aldo1 is connected to VCC-IO-WIFI and thus should be vqmmc.
> + * Once two regulators can be in sync for vmmc-supply, modify this node
> + * accordingly.
> + */

I would place that comment above the regulator definitions.

> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>, <&wifi_reset_pin_parrot_r16>;
> +	vmmc-supply =3D <&reg_aldo1>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	cap-mmc-hw-reset;
> +	status =3D "okay";
> +};
> +
> +&mmc2_8bit_pins {
> +	allwinner,drive =3D <SUN4I_PINCTRL_40_MA>;
> +	allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	mmc0_cd_pin_parrot_r16: mmc0_cd_pin@0 {
> +		allwinner,pins =3D "PD14";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	led_pins_parrot_r16: led_pins@0 {
> +		allwinner,pins =3D "PE16", "PE17";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
> +	usb0_id_det: usb0_id_detect_pin@0 {
> +		allwinner,pins =3D "PD10";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	usb1_vbus_pin_parrot_r16: usb1_vbus_pin@0 {
> +		allwinner,pins =3D "PD12";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&r_pio {
> +	wifi_reset_pin_parrot_r16: wifi_reset_pin@0 {
> +		allwinner,pins =3D "PL6";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&r_rsb {
> +	status =3D "okay";
> +
> +	axp22x: pmic@3a3 {
> +		compatible =3D "x-powers,axp223";
> +		reg =3D <0x3a3>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		drivevbus-supply =3D <&reg_vcc5v0>;
> +		x-powers,drive-vbus-en;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +/* Used for VCC-IO, VCC-PD, VCC-USB, HPVCC, VCC-IO-BB and VCC-IO-WIFI */

Just call it vcc-io then.

> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "aldo1";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2350000>;
> +	regulator-max-microvolt =3D <2650000>;
> +	regulator-name =3D "vdd-dll";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-pll-avcc";
> +};
> +
> +&reg_dc5ldo {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpus";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-sys";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <900000>;
> +	regulator-max-microvolt =3D <1400000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1500000>;
> +	regulator-max-microvolt =3D <1500000>;
> +	regulator-name =3D "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +	/*
> +	 * TODO: WiFi chip needs dldo1 AND dldo2 to be on to be powered.
> +	 * Remove next line once it is possible to sync two regulators.
> +	 */
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi";
> +};
> +
> +&reg_dldo2 {
> +	/*
> +	 * TODO: WiFi chip needs dldo1 AND dldo2 to be on to be powered.
> +	 * Remove next line once it is possible to sync two regulators.
> +	 */

Those comments are actually fine, you can just drop the comment on the
MMC node then :)

> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi1";

vcc-wifi0 and vcc-wifi1 maybe?

> +};
> +
> +&reg_dldo3 {
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-3v0-csi";
> +};
> +
> +&reg_drivevbus {
> +	regulator-name =3D "usb0-vbus";
> +	status =3D "okay";
> +};
> +
> +&reg_eldo1 {
> +	regulator-min-microvolt =3D <1200000>;
> +	regulator-max-microvolt =3D <1200000>;
> +	regulator-name =3D "vcc-1v2-hsic";
> +};
> +
> +&reg_eldo2 {
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "dsp-vcc";

You have all the other regulators starting with vcc but this one, some
consistency would be great :)

> +};
> +
> +/* Mapped to GPIO 22 in U21 GPIOs set */

So is it a GPIO or a regulator?

> +&reg_eldo3 {
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "eldo3";
> +};
> +
> +&reg_usb1_vbus {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb1_vbus_pin_parrot_r16>;
> +	gpio =3D <&pio 3 12 GPIO_ACTIVE_HIGH>; /* PD12 */
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_b>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usb_power_supply {
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_id_det>;
> +	usb0_vbus-supply =3D <&reg_drivevbus>;
> +	usb0_id_det-gpios =3D <&pio 3 10 GPIO_ACTIVE_HIGH>; /* PD10 */
> +	usb0_vbus_power-supply =3D <&usb_power_supply>;
> +	usb1_vbus-supply =3D <&reg_usb1_vbus>; /* USB1 VBUS is always on */

Like Chen-Yu said, that comment is wrong.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXa864AAoJEBx+YmzsjxAg1EoP/jsrRbuPu9jfdJTRxfseBdMf
QaXtytTsIfQqm4ysv8CVpfNVitIraRug4ZKx/U8/8kDHLW7CXzUGziCg4Kx4TD+7
4ED/z2M2UD98qWA3ACsTm/VQeeaknks3GZKQ5urnSjTnTcGbYD3h5VzICikvHLLf
YVbK6ip/FvXNp6HxctOFGKWyGH+l5zt322v2ZoQmQs813k4wsPWPsfy4BN12Qf9X
Ce1yLVOnf53H6mpdXZUMDBW01chiXVYai+Gc6XSZH6j6l3lwurF2dgrW8g/qiRmv
wWrCze9bvhyZPUr1h/SF+wZHzZB76Md0xa9CM45ARup+b5kflfifooJSXMzy/67m
w+BD0zRm7REClOIPM18kpUcIKmLkGxDq6NwEW5C4aX6NLG6DQrHY1NBZn5GYCHF4
SerVCHQtQ9tJaW8pS8Kc1yylYgfn2LzRuzllWCgTnqQa4aZFr1PgrAev4KJ6JmTT
DWc1bArDt+oi6NyYKP+aJBrLhdlYNJ9pONxeG9zd+MXN1lnQGN3UxEBoxCoBCkNU
D65M/UZAfGLudi0hoUtauoTnDZDDgGdrYB8gbB5FLBkIKkxhTWFUX5LFCugoYc0O
jsULN15Sx7PUPHxW6E7whi3zYDLXPX2DgqHO85iO6gf2DuELaGtdKacfSVfY943K
CF9Ml7RNDCGHPvSWVxjN
=Yw0H
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
