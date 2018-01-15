From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add Olimex A20-SOM204-EVB board
Date: Mon, 15 Jan 2018 10:50:31 +0100
Message-ID: <20180115095031.pzsgrp3tdmemotrs@flea.lan>
References: <1515747666-6597-1-git-send-email-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eohqf37hv54wlmyc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515747666-6597-1-git-send-email-stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eohqf37hv54wlmyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Fri, Jan 12, 2018 at 11:01:05AM +0200, Stefan Mavrodiev wrote:
> This is new System-On-Module platform with universal dimm socket for
> easy insertation. The EVB board is designed to be universal with
> future modules. Product page is located here [1].
>=20
> There are two dts files - one for base model and another for eMMC variant.
>=20
> Base features of A20-SOM204 board includes:
> 	* 1GB DDR3 RAM
> 	* AXP209 PMU
> 	* KSZ9031 Gigabit PHY
> 	* AT24C16 EEPROM
> 	* Status LED
> 	* LCD connector
> 	* GPIO connector
>=20
> There will be variants with the following options:
> 	* Second LAN8710A Megabit PHY
> 	* 16MB SPI Flash memory
> 	* eMMC card
> 	* ATECC508 crypto device
>=20
> The EVB board has:
> 	* Debug UART
> 	* MicroSD card connector
> 	* USB-OTG connector
> 	* Two USB host
> 	* RTL8723BS WiFi/BT combo
> 	* IrDA transceiver/receiver
> 	* HDMI connector
> 	* VGA connector
> 	* Megabit ethernet transceiver
> 	* Gigabit ethernet transceiver
> 	* SATA connector
> 	* CAN driver
> 	* CSI camera
> 	* MIC and HP connectors
> 	* PCIe x4 connector
> 	* USB3 connector
> 	* Two UEXT connectors
> 	* Two user LEDs
>=20
> Some of the features are multiplexed and cannot be used the same time:
> CAN and Megabit PHY. Others are not usable with A20 SoC: PCIe and USB3.
>=20
> [1] https://www.olimex.com/Products/SOM204/
>=20
> Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                         |   2 +
>  .../boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts  |  70 ++++
>  arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts  | 392 +++++++++++++++=
++++++
>  3 files changed, 464 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0381e9..c890042 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -918,6 +918,8 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-m3.dtb \
>  	sun7i-a20-mk808c.dtb \
>  	sun7i-a20-olimex-som-evb.dtb \
> +	sun7i-a20-olimex-som204-evb.dtb \
> +	sun7i-a20-olimex-som204-evb-emmc.dtb \

Ideally, you should split that patch into two, one to introduce the
base board and the second one for the emmc.

>  	sun7i-a20-olinuxino-lime.dtb \
>  	sun7i-a20-olinuxino-lime2.dtb \
>  	sun7i-a20-olinuxino-lime2-emmc.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts b/arc=
h/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts
> new file mode 100644
> index 0000000..97c4824
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb-emmc.dts
> @@ -0,0 +1,70 @@
> +/*
> + * Copyright 2018 - Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
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

Could you use the SPDX header, as the first line,

// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

instead?

And then, you can drop the license text (but you should keep the
Copyright line).

> +/dts-v1/;
> +#include "sun7i-a20-olimex-som204-evb.dts"
> +
> +/ {
> +	model =3D "Olimex A20-SOM204-EVB-eMMC";
> +	compatible =3D "olimex,a20-olimex-som204-evb-emmc", "allwinner,sun7i-a2=
0";
> +
> +	mmc2_pwrseq: mmc2_pwrseq {
> +		compatible =3D "mmc-pwrseq-emmc";
> +		reset-gpios =3D <&pio 2 16 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	mmc-pwrseq =3D <&mmc2_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	emmc: emmc@0 {
> +		reg =3D <0>;
> +		compatible =3D "mmc-card";
> +		broken-hpi;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts b/arch/arm=
/boot/dts/sun7i-a20-olimex-som204-evb.dts
> new file mode 100644
> index 0000000..ec4492b
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som204-evb.dts
> @@ -0,0 +1,392 @@
> +/*
> + * Copyright 2018 - Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
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

Same thing for this file.

> +/dts-v1/;
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model =3D "Olimex A20-SOM204-EVB";
> +	compatible =3D "olimex,a20-olimex-som204-evb", "allwinner,sun7i-a20";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart4;
> +		serial2 =3D &uart7;
> +		spi0 =3D &spi1;
> +		spi1 =3D &spi2;
> +		ethernet1 =3D &rtl8723bs;

ethernet1? if there's a single network interface, it should be
ethernet0.

> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_olimex_som204_evb>;

You don't need that pinctrl node.

> +		stat {
> +			label =3D "a20-som204:green:stat";
> +			gpios =3D <&pio 8 0 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		led1 {
> +			label =3D "a20-som204-evb:green:led1";
> +			gpios =3D <&pio 8 10 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		led2 {
> +			label =3D "a20-som204-evb:yellow:led2";
> +			gpios =3D <&pio 8 11 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};

You don't have the same prefix between stat and led1/led2. I'm fine
with both, but you should be consistent :)

> +	};
> +
> +	mmc2_pwrseq: mmc2_pwrseq {
> +		compatible =3D "mmc-pwrseq-emmc";
> +		reset-gpios =3D <&pio 2 16 GPIO_ACTIVE_LOW>;
> +	};

This is already declared in the emmc variant, isn't it?

> +	rtl_pwrseq: rtl_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pio 6 9 GPIO_ACTIVE_LOW>,
> +			      <&pio 1 11 GPIO_ACTIVE_LOW>;
> +	};

It looks suspicious that you have two reset lines.

> +};
> +
> +&ahci {
> +	target-supply =3D <&reg_ahci_5v>;

You should use the regulators you defined in your PMIC there.

> +	status =3D "okay";
> +};
> +
> +&can0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&can0_pins_a>;
> +	status =3D "okay";
> +};
>
> +&codec {
> +	status =3D "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&de {
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&gmac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac_pins_rgmii_a>;
> +	phy =3D <&phy3>;
> +	phy-mode =3D "rgmii";
> +	phy-supply =3D <&reg_vcc3v3>;
> +
> +	snps,reset-gpio =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us =3D <0 10000 1000000>;
> +	status =3D "okay";
> +
> +	phy3: ethernet-phy@3 {
> +		reg =3D <3>;
> +	};
> +};
> +
> +&hdmi {
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins_a>;
> +	status =3D "okay";
> +
> +	axp209: pmic@34 {
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins_a>;
> +	status =3D "okay";
> +
> +	eeprom: eeprom@50 {
> +		compatible =3D "atmel,24c16";
> +		reg =3D <0x50>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pins_a>;
> +	status =3D "okay";
> +};

What is connected to that bus?

> +&ir0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ir0_rx_pins_a>,
> +		    <&ir0_tx_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&mmc3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc3_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	mmc-pwrseq =3D <&rtl_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	rtl8723bs: sdio_wifi@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&otg_sram {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +
> +	bt_uart_pins: bt_uart_pins@0 {
> +		pins =3D "PG6", "PG7", "PG8";
> +		function =3D "uart3";
> +	};
> +
> +	led_pins_olimex_som204_evb: led_pins@0 {
> +		pins =3D "PI0", "PI10", "PI11";
> +		function =3D "gpio_out";
> +		drive-strength =3D <20>;
> +	};
> +
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		pins =3D "PH4";
> +		function =3D "gpio_in";
> +		bias-pull-up;
> +	};
> +
> +	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
> +		pins =3D "PH5";
> +		function =3D "gpio_in";
> +		bias-pull-down;
> +	};
> +};

You don't need any of these pins

> +#include "axp209.dtsi"
> +
> +&ac_power_supply {
> +	status =3D "okay";
> +};
> +&battery_power_supply {
> +	status =3D "okay";
> +};
> +
> +&reg_ahci_5v {
> +	gpio =3D <&pio 2 3 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1400000>;
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
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1300000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "avcc";
> +};
> +
> +&reg_ldo4 {
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-pg";
> +};
> +
> +&reg_usb0_vbus {
> +	gpio =3D <&pio 2 17 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};
> +
> +&reg_usb1_vbus {
> +	status =3D "okay";
> +};
> +
> +&reg_usb2_vbus {
> +	status =3D "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi1_pins_a>,
> +		    <&spi1_cs0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&spi2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi2_pins_a>,
> +		    <&spi2_cs0_pins_a>;
> +	status =3D "okay";
> +};

What is connected on those buses

> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&bt_uart_pins>;
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart4_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&uart7 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart7_pins_a>;
> +	status =3D "okay";
> +};

Same thing for these three UARTs

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
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_id_detect_pin>,
> +		    <&usb0_vbus_detect_pin>;
> +	usb0_id_det-gpio =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	usb0_vbus_det-gpio =3D <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> +	usb0_vbus_power-supply =3D <&usb_power_supply>;
> +	usb0_vbus-supply =3D <&reg_usb0_vbus>;
> +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +	usb2_vbus-supply =3D <&reg_usb2_vbus>;

You should also use one of the PMIC regulators here.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eohqf37hv54wlmyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpceWYACgkQ0rTAlCFN
r3RIMQ//cQdF9sDUcD0VJACnY3cFqZ/rQ6G5fUcMoK8JCwuomtt7JJ3reIYjB9Ix
kg60sDkqKb1oiBU9tiXIXoQouhabK9d2821MnK8ZT563d6aQuRAd6xYDfA8LhARW
tUB4ToTifGqOUm6311vx8K94YypvtD/Rou0Ng4Rw//YFd4+Vf6KpESEbwGzYU9Cw
F4Micuzx0OB1dtedyw8ptWuPLjgbVRfMXVWvI5KPWztwrxJjk8P7DlAZ7l/FfgvO
Y+hqeobScT9kBNQ0lTrXIZxXS9QhK5qiN5+WT22x8JsvITJmj/JuuljFeoZaA76o
mdZazA+nooBNejnxvO64F+8W/QTAvE2xCyKYOv4wgNlKSyusbLgBrvGLF0wbL9yW
YlT0bejR8deW/Y9wrwpzON1616nBtC6M6G3NdktJ1pGyOtAyUqN2QCbE45Bqj/x2
3JrTBxc/tWMjo7bJPsiqzM5SCUdkm6SS1CcoDlFutPnN0qhST65Zg5Ill4IIbphv
lfEfBiMmPdHZ4UK3GQAWE48EPgkm9q2N/V2TJ8t1BRUh7qh5utCYuDjRDuppylj1
tMVirB2MybPiVvC4pHDnwBjFp6JJcDSuBVQM3ysgGHkpDeosnXyqcSiW+ADRa7h+
BeqzgMI521A5c4B66AJaG9pSFIIqHLZ3Lq7VOPEKUiiWFvGbf/c=
=xIzK
-----END PGP SIGNATURE-----

--eohqf37hv54wlmyc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
