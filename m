From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: h3: Add dts file for Libre
 Computer Board ALL-H3-CC H3 ver.
Date: Tue, 28 Nov 2017 19:11:29 +0800
Message-ID: <e570dc9534eaabe5925a450414406d25@aosc.io>
References: <20171128041211.17375-1-wens@csie.org>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBZMI6XIAKGQEFDB7EQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171128041211.17375-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-11-28 12:12=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> The Libre Computer Board ALL-H3-CC from Libre Technology is a Raspberry
> Pi B+ form factor single board computer based on the Allwinner H3 SoC.
> The board has 1GB DDR3 SDRAM, provided by 4 2Gb chips. The mounting=20
> holes
> and connectors are in the exact same position as on the Raspberry Pi=20
> B+.
>=20
> Raspberry Pi B+ like peripherals supported on this board include:
>=20
>   - Power input through micro-USB connector (without USB OTG)
>   - Native 100 Mbps ethernet using the internal PHY, as opposed to
>     USB-based on the RPi
>   - 4x USB 2.0 host ports, directly connected to the SoC, as opposed to
>     being connected through a USB 2.0 hub on the RPi
>   - TV and audio output on a 3.5mm TRRS jack
>   - HDMI output
>   - Micro-SD card slot
>   - Standard RPi B+ GPIO header, with the standard peripherals routed=20
> to
>     the same pins.
>=20
>     * 5V, 3.3V power, and ground
>     * I2C0 on the H3 is routed to I2C1 pins on the RPi header
>     * I2C1 on the H3 is routed to I2C0 pins on the RPi header
>     * UART1 on the H3 is routed to UART0 pins on the RPi header
>     * SPI0 on the H3 is routed to SPI0 pins on the RPi header,
>       with GPIO pin PA17 replacing the missing Chip Select 1
>     * I2S1 on the H3 is routed to PCM pins on the RPi header
>=20
>   - Additional peripherals from the H3 are available on different pins.
>     These include I2S0, JTAG, PWM1, SPDIF, SPI1, and UART3
>=20
> In addition, there are a number of new features:
>=20
>   - Console UART header
>   - Consumer IR receiver
>   - Camera interface (not compatible with RPi)
>   - Onboard microphone
>   - eMMC expansion module port
>   - Heatsink mounting holes
>=20
> This patch adds a dts file for this board that enables all "onboard"
> peripherals currently supported. This means no display or camera
> support.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>=20
> There are two other variants [1] of this board, with different SoCs and
> DRAM configuration. But the board remains the same, thanks to the SoCs
> being pin compatible.
>=20
> Do we need different board compatible strings? FWIW the soc compatible
> string already encodes the soc variant, and the DRAM stuff is handled
> by the bootloader. The filename also has the SoC family and chip name.
> The displayed board model also has the SoC variant included. The board
> itself is named "ALL-H3-CC".
>=20
> I'm asking as we have the same issue with the Bananapi M2+ [2], where
> they've released new variants with different SoCs and DRAM capacities
> using the same board. Not sure if they are commercially available=20
> though.

BPi M2+ H5 is not yet commercially available.

>=20
> Last, the LED polarity is wrong. This is due to the EMAC driver not
> following the DT binding and looking for the=20
> "allwinner,leds-active-low"
> under the PHY node, instead of the EMAC node. I've notified Corentin of
> this issue.
>=20
> [1]
> https://www.kickstarter.com/projects/librecomputer/libre-computer-board-t=
ritium-sbc-linux-android-7-n
> [2] http://www.banana-pi.org/m2plus.html
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 196=20
> +++++++++++++++++++++
>  2 files changed, 197 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3c139c63098f..aa68f719692f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -953,6 +953,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-h2-plus-orangepi-zero.dtb \
>  	sun8i-h3-bananapi-m2-plus.dtb \
>  	sun8i-h3-beelink-x2.dtb \
> +	sun8i-h3-libretech-all-h3-cc.dtb \

There's also a H5 variant of this board, so I think the
peripherals should be placed into a DTSI, and have the
board DTS include the SoC DTSI and peripheral DTSI.

>  	sun8i-h3-nanopi-m1.dtb	\
>  	sun8i-h3-nanopi-m1-plus.dtb \
>  	sun8i-h3-nanopi-neo.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts
> b/arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts
> new file mode 100644
> index 000000000000..6f544e007f71
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts
> @@ -0,0 +1,196 @@
> +/*
> + * Copyright (C) 2017 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> + */
> +
> +/dts-v1/;
> +#include "sun8i-h3.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model =3D "Libre Computer Board ALL-H3-CC H3";
> +	compatible =3D "libretech,all-h3-cc", "allwinner,sun8i-h3";
> +
> +	aliases {
> +		ethernet0 =3D &emac;
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		pwr_led {
> +			label =3D "librecomputer:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
> +			default-state =3D "on";
> +		};
> +
> +		status_led {
> +			label =3D "librecomputer:status";
> +			gpios =3D <&pio 0 7 GPIO_ACTIVE_HIGH>; /* PA7 */
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +
> +		recovery {
> +			label =3D "recovery";
> +			linux,code =3D <BTN_0>;
> +			gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +		};
> +	};
> +
> +	reg_vcc1v2: vcc1v2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc1v2";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc5v0>;
> +		gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
> +		enable-active-high;
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&reg_vcc5v0>;
> +	};
> +
> +	/* This represents the board's 5V input */
> +	reg_vcc5v0: vcc5v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	reg_vcc_dram: vcc-dram {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-dram";
> +		regulator-min-microvolt =3D <1500000>;
> +		regulator-max-microvolt =3D <1500000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc5v0>;
> +		gpio =3D <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
> +		enable-active-high;
> +	};
> +
> +	reg_vcc_io: vcc-io {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-io";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc3v3>;
> +		gpio =3D <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
> +	};
> +
> +	reg_vdd_cpux: vdd-cpux {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd-cpux";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc5v0>;
> +		gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
> +		enable-active-high;
> +	};
> +};
> +
> +&codec {
> +	allwinner,audio-routing =3D
> +		"Line Out", "LINEOUT",
> +		"MIC1", "Mic",
> +		"Mic",  "MBIAS";
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
> +&ehci2 {
> +	status =3D "okay";
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&emac {
> +	phy-handle =3D <&int_mii_phy>;
> +	phy-mode =3D "mii";
> +	allwinner,leds-active-low;
> +	status =3D "okay";
> +};
> +
> +&ir {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ir_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>;
> +	vmmc-supply =3D <&reg_vcc_io>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +	cd-inverted;
> +	status =3D "okay";
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
> +&ohci2 {
> +	status =3D "okay";
> +};
> +
> +&ohci3 {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	/* VBUS on USB ports are always on */
> +	usb0_vbus-supply =3D <&reg_vcc5v0>;
> +	usb1_vbus-supply =3D <&reg_vcc5v0>;
> +	usb2_vbus-supply =3D <&reg_vcc5v0>;
> +	usb3_vbus-supply =3D <&reg_vcc5v0>;
> +	status =3D "okay";
> +};

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
