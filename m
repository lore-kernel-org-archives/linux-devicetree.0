From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCHv2 16/16] ARM: dts: imx6ul: add support for Ka-Ro
 electronics TXUL modules
Date: Sun, 28 Feb 2016 14:43:26 +0800
Message-ID: <20160228064326.GG22051@tiger>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-17-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453284549-16363-17-git-send-email-LW@KARO-electronics.de>
Sender: linux-clk-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 20, 2016 at 11:09:09AM +0100, Lothar Wa=DFmann wrote:
> The TXUL-0010/-0011 modules are Computers On Module manufactured by
>   Ka-Ro electronics GmbH with the following characteristics:
>   Processor    Freescale i.MX 6UltraLite MCIMX6G2, 528 MHz
>   RAM          256MB 16-bit DDR3 SDRAM
>   ROM          128MB NAND Flash (TXUL-0010) / 4GB eMMC (TXUL-0011)
>   Power supply Single 3.3 to 5V
>   Size         26mm SO-DIMM
>   Temp. Range  -40=B0C to 85=B0C
>=20
>=20
> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> ---
>  arch/arm/boot/dts/Makefile             |   4 +-
>  arch/arm/boot/dts/imx6ul-txul-0010.dts |  54 ++
>  arch/arm/boot/dts/imx6ul-txul-0011.dts |  85 +++
>  arch/arm/boot/dts/imx6ul-txul.dtsi     | 962 +++++++++++++++++++++++=
++++++++++
>  4 files changed, 1104 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/imx6ul-txul-0010.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-txul-0011.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-txul.dtsi
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a4a6d70..f993e7d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -358,7 +358,9 @@ dtb-$(CONFIG_SOC_IMX6SX) +=3D \
>  	imx6sx-sdb-reva.dtb \
>  	imx6sx-sdb.dtb
>  dtb-$(CONFIG_SOC_IMX6UL) +=3D \
> -	imx6ul-14x14-evk.dtb
> +	imx6ul-14x14-evk.dtb \
> +	imx6ul-txul-0010.dtb \
> +	imx6ul-txul-0011.dtb
>  dtb-$(CONFIG_SOC_IMX7D) +=3D \
>  	imx7d-cl-som-imx7.dtb \
>  	imx7d-sbc-imx7.dtb \
> diff --git a/arch/arm/boot/dts/imx6ul-txul-0010.dts b/arch/arm/boot/d=
ts/imx6ul-txul-0010.dts
> new file mode 100644
> index 0000000..5e0b09f
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-txul-0010.dts
> @@ -0,0 +1,54 @@
> +/*
> + * Copyright 2015 Lothar Wa=DFmann <LW@KARO-electronics.de>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License
> + *     version 2 as published by the Free Software Foundation.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "imx6ul.dtsi"
> +#include "imx6ul-txul.dtsi"
> +
> +/ {
> +	model =3D "Ka-Ro electronics TXUL-0010 Module";
> +	compatible =3D "karo,imx6ul-tx6ul", "fsl,imx6ul";
> +
> +	aliases {
> +		mmc0 =3D &usdhc1;
> +		/delete-property/ mmc1;

Why is this deletion of mmc1 needed?

> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6ul-txul-0011.dts b/arch/arm/boot/d=
ts/imx6ul-txul-0011.dts
> new file mode 100644
> index 0000000..dd3055b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-txul-0011.dts
> @@ -0,0 +1,85 @@
> +/*
> + * Copyright 2015 Lothar Wa=DFmann <LW@KARO-electronics.de>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License
> + *     version 2 as published by the Free Software Foundation.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "imx6ul.dtsi"
> +#include "imx6ul-txul.dtsi"
> +
> +/ {
> +	model =3D "Ka-Ro electronics TXUL-0011 Module";
> +	compatible =3D "karo,imx6ul-tx6ul", "fsl,imx6ul";
> +
> +	aliases {
> +		mmc0 =3D &usdhc2;
> +		mmc1 =3D &usdhc1;
> +	};
> +};
> +
> +&gpmi {
> +	status =3D "disabled";
> +};
> +
> +&iomuxc {
> +	imx6ul-txul {

Since commit 5fcdf6a7ed95 (pinctrl: imx: Allow parsing DT without
function nodes), we can save this container node.

> +		pinctrl_usdhc2: usdhc2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x070b1
> +				MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x070b1
> +				MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x070b1
> +				MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x070b1
> +				MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x070b1
> +				MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x070b1
> +				/* eMMC RESET */
> +				MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x170b0
> +			>;
> +		};
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>;
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	non-removable;
> +	fsl,wp-controller;
> +	status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx6ul-txul.dtsi b/arch/arm/boot/dts/i=
mx6ul-txul.dtsi
> new file mode 100644
> index 0000000..12dff96
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-txul.dtsi
> @@ -0,0 +1,962 @@
> +/*
> + * Copyright 2015 Lothar Wa=DFmann <LW@KARO-electronics.de>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License
> + *     version 2 as published by the Free Software Foundation.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	aliases {
> +		can0 =3D &can2;
> +		can1 =3D &can1;
> +		display =3D &display;
> +		i2c0 =3D &i2c_gpio;
> +		i2c1 =3D &i2c2;
> +		lcdif_23bit_pins_a =3D &pinctrl_disp0_1;
> +		lcdif_24bit_pins_a =3D &pinctrl_disp0_2;
> +		pwm0 =3D &pwm5;
> +		reg_can_xcvr =3D &reg_can_xcvr;
> +		serial2 =3D &uart5;
> +		serial4 =3D &uart3;
> +		spi0 =3D &ecspi2;
> +		spi1 =3D &spi_gpio;
> +		stk5led =3D &user_led;
> +		usbh1 =3D &usbotg2;
> +		usbotg =3D &usbotg1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart1;
> +	};
> +
> +	memory {
> +		reg =3D <0 0>; /* will be filled by U-Boot */
> +	};
> +
> +	clocks {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

Have a new line here.

> +		mclk: clock@0 {
> +			compatible =3D "fixed-clock";
> +			reg =3D <0>;
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <26000000>;
> +		};
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm5 0 500000 PWM_POLARITY_INVERTED>;
> +		power-supply =3D <&reg_3v3>;
> +		/*
> +		 * a poor man's way to create a 1:1 relationship between
> +		 * the PWM value and the actual duty cycle
> +		 */
> +		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> +				     10 11 12 13 14 15 16 17 18 19
> +				     20 21 22 23 24 25 26 27 28 29
> +				     30 31 32 33 34 35 36 37 38 39
> +				     40 41 42 43 44 45 46 47 48 49
> +				     50 51 52 53 54 55 56 57 58 59
> +				     60 61 62 63 64 65 66 67 68 69
> +				     70 71 72 73 74 75 76 77 78 79
> +				     80 81 82 83 84 85 86 87 88 89
> +				     90 91 92 93 94 95 96 97 98 99
> +				    100>;
> +		default-brightness-level =3D <50>;
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";

With no real keys defined?  If so, please drop it.

> +	};
> +
> +	i2c_gpio: i2c-gpio {
> +		compatible =3D "i2c-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_i2c_gpio>;
> +		gpios =3D <
> +			&gpio5 1 GPIO_ACTIVE_HIGH /* SDA */
> +			&gpio5 0 GPIO_ACTIVE_HIGH /* SCL */
> +		>;
> +		clock-frequency =3D <400000>;
> +		status =3D "okay";
> +
> +		ds1339: rtc@68 {
> +			compatible =3D "dallas,ds1339";
> +			reg =3D <0x68>;
> +			status =3D "disabled";
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		user_led: user {
> +			label =3D "Heartbeat";
> +			gpios =3D <&gpio5 9 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +
> +	regulators {
> +		compatible =3D "simple-bus";

Device tree maintainers do not like this fake simple-bus.  Let's put al=
l
these fixed regulators directly under root with the following naming
schema:

	reg_xxx: regulator-xxx {
		...
	};

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		reg_3v3_etn: regulator@0 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <0>;
> +			regulator-name =3D "3V3_ETN";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_etnphy_power>;
> +			gpio =3D <&gpio5 7 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +
> +		reg_2v5: regulator@1 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <1>;
> +			regulator-name =3D "2V5";
> +			regulator-min-microvolt =3D <2500000>;
> +			regulator-max-microvolt =3D <2500000>;
> +			regulator-always-on;
> +		};
> +
> +		reg_3v3: regulator@2 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <2>;
> +			regulator-name =3D "3V3";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		reg_can_xcvr: regulator@3 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <3>;
> +			regulator-name =3D "CAN XCVR";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_flexcan_xcvr>;
> +			gpio =3D <&gpio3 5 GPIO_ACTIVE_HIGH>;
> +			enable-active-low;
> +		};
> +
> +		reg_lcd_pwr: regulator@5 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <5>;
> +			regulator-name =3D "LCD POWER";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_lcd_pwr>;
> +			gpio =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		reg_lcd_reset: regulator@6 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <6>;
> +			regulator-name =3D "LCD RESET";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_lcd_reset>;
> +			gpio =3D <&gpio3 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		reg_usbh1_vbus: regulator@7 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <7>;
> +			regulator-name =3D "usbh1_vbus";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_usbh1_vbus &pinctrl_usbh1_oc>;
> +			gpio =3D <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +
> +		reg_usbotg_vbus: regulator@8 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <8>;
> +			regulator-name =3D "usbotg_vbus";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_usbotg_vbus &pinctrl_usbotg_oc>;
> +			gpio =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +	};
> +
> +	spi_gpio: spi-gpio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "spi-gpio";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_spi_gpio>;
> +		gpio-mosi =3D <&gpio1 30 GPIO_ACTIVE_HIGH>;
> +		gpio-miso =3D <&gpio1 31 GPIO_ACTIVE_HIGH>;
> +		gpio-sck =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +		num-chipselects =3D <2>;
> +		cs-gpios =3D <
> +			&gpio1 29 GPIO_ACTIVE_HIGH
> +			&gpio1 10 GPIO_ACTIVE_HIGH
> +		>;
> +		status =3D "disabled";
> +
> +		spi@0 {
> +			compatible =3D "spidev";
> +			reg =3D <0>;
> +			spi-max-frequency =3D <660000>;
> +		};
> +
> +		spi@1 {
> +			compatible =3D "spidev";
> +			reg =3D <1>;
> +			spi-max-frequency =3D <660000>;
> +		};
> +	};
> +
> +	sound {
> +		compatible =3D "karo,imx6ul-tx6ul-sgtl5000",
> +			     "simple-audio-card";
> +		simple-audio-card,name =3D "imx6ul-tx6ul-sgtl5000-audio";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&codec_dai>;
> +		simple-audio-card,frame-master =3D <&codec_dai>;
> +		simple-audio-card,widgets =3D
> +			"Microphone", "Mic Jack",
> +			"Line", "Line In",
> +			"Line", "Line Out",
> +			"Headphone", "Headphone Jack";
> +		simple-audio-card,routing =3D
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +
> +		cpu_dai: simple-audio-card,cpu {
> +			sound-dai =3D <&sai2>;
> +		};
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai =3D <&sgtl5000>;
> +		};
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	xceiver-supply =3D <&reg_can_xcvr>;
> +	status =3D "okay";
> +};
> +
> +&can2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	xceiver-supply =3D <&reg_can_xcvr>;
> +	status =3D "okay";
> +};
> +
> +&ecspi2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi2>;
> +	fsl,spi-num-chipselects =3D <2>;
> +	cs-gpios =3D <
> +		&gpio1 29 GPIO_ACTIVE_HIGH
> +		&gpio1 10 GPIO_ACTIVE_HIGH
> +	>;
> +	status =3D "disabled";
> +
> +	spi@0 {
> +		compatible =3D "spidev";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <60000000>;
> +	};
> +
> +	spi@1 {
> +		compatible =3D "spidev";
> +		reg =3D <1>;
> +		spi-max-frequency =3D <60000000>;
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enet1 &pinctrl_enet_mdio>;
> +	phy-mode =3D "rmii";
> +	phy-reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_HIGH>;
> +	phy-supply =3D <&reg_3v3_etn>;
> +	phy-handle =3D <&etnphy0>;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		etnphy0: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			interrupt-parent =3D <&gpio5>;
> +			interrupts =3D <5>;
> +			status =3D "okay";
> +		};
> +
> +		etnphy1: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <1>;
> +			status =3D "okay";
> +		};
> +	};
> +};
> +
> +&fec2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_enet2>;
> +	phy-mode =3D "rmii";
> +	phy-supply =3D <&reg_3v3_etn>;
> +	phy-handle =3D <&etnphy1>;
> +	status =3D "disabled";
> +};
> +
> +&gpmi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
> +	fsl,no-blockmark-swap;
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	sgtl5000: sgtl5000@0a {
> +		#sound-dai-cells =3D <0>;
> +		compatible =3D "fsl,sgtl5000";
> +		reg =3D <0x0a>;
> +		VDDA-supply =3D <&reg_2v5>;
> +		VDDIO-supply =3D <&reg_3v3>;
> +		clocks =3D <&mclk>;
> +	};
> +
> +	polytouch: edt-ft5x06@38 {
> +		compatible =3D "edt,edt-ft5x06";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&gpio5 3 GPIO_ACTIVE_LOW>;
> +		wake-gpios =3D <&gpio5 8 GPIO_ACTIVE_HIGH>;
> +		linux,wakeup;

This property becomes legacy one.  Please use wakeup-source instead.
See Documentation/devicetree/bindings/power/wakeup-source.txt for
details.

> +	};
> +
> +	touchscreen: tsc2007@48 {
> +		compatible =3D "ti,tsc2007";
> +		reg =3D <0x48>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tsc2007>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <26 IRQ_TYPE_NONE>;
> +		gpios =3D <&gpio3 26 GPIO_ACTIVE_LOW>;
> +		ti,x-plate-ohms =3D <660>;
> +		linux,wakeup;

Ditto

> +	};
> +};
> +
> +&iomuxc {

I suggest you put iomuxc node at the bottom of the file to make the res=
t
a bit easier to be read.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_hog>;
> +
> +	imx6ul-txul {

Drop this container node.

Shawn

> +		pinctrl_hog: hoggrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x0b0b0 /* LED */
> +				MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x0b0b0 /* ETN PHY RESET */
> +				MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x0b0b0 /* ETN PHY INT */
> +			>;
> +		};
> +
> +		pinctrl_disp0_1: disp0grp-1 {
> +			fsl,pins =3D <
> +				MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x10 /* LSCLK */
> +				MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x10 /* OE_ACD */
> +				MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC		0x10 /* HSYNC */
> +				MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC		0x10 /* VSYNC */
> +				/* PAD DISP0_DAT0 is used for the Flexcan transceiver control */
> +				MX6UL_PAD_LCD_DATA01__LCDIF_DATA01	0x10
> +				MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x10
> +				MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x10
> +				MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x10
> +				MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x10
> +				MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x10
> +				MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x10
> +				MX6UL_PAD_LCD_DATA08__LCDIF_DATA08	0x10
> +				MX6UL_PAD_LCD_DATA09__LCDIF_DATA09	0x10
> +				MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x10
> +				MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x10
> +				MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x10
> +				MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x10
> +				MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x10
> +				MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x10
> +				MX6UL_PAD_LCD_DATA16__LCDIF_DATA16	0x10
> +				MX6UL_PAD_LCD_DATA17__LCDIF_DATA17	0x10
> +				MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x10
> +				MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x10
> +				MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x10
> +				MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x10
> +				MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x10
> +				MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x10
> +			>;
> +		};
> +
> +		pinctrl_disp0_2: disp0grp-2 {
> +			fsl,pins =3D <
> +				MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x10 /* LSCLK */
> +				MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x10 /* OE_ACD */
> +				MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC	0x10 /* HSYNC */
> +				MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC	0x10 /* VSYNC */
> +				MX6UL_PAD_LCD_DATA00__LCDIF_DATA00	0x10
> +				MX6UL_PAD_LCD_DATA01__LCDIF_DATA01	0x10
> +				MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x10
> +				MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x10
> +				MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x10
> +				MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x10
> +				MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x10
> +				MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x10
> +				MX6UL_PAD_LCD_DATA08__LCDIF_DATA08	0x10
> +				MX6UL_PAD_LCD_DATA09__LCDIF_DATA09	0x10
> +				MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x10
> +				MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x10
> +				MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x10
> +				MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x10
> +				MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x10
> +				MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x10
> +				MX6UL_PAD_LCD_DATA16__LCDIF_DATA16	0x10
> +				MX6UL_PAD_LCD_DATA17__LCDIF_DATA17	0x10
> +				MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x10
> +				MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x10
> +				MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x10
> +				MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x10
> +				MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x10
> +				MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x10
> +			>;
> +		};
> +
> +		pinctrl_ecspi2: ecspi2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29	0x0b0b0 /* CSPI_SS */
> +				MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x0b0b0 /* CSPI_SS */
> +				MX6UL_PAD_UART5_TX_DATA__ECSPI2_MOSI	0x0b0b0 /* CSPI_MOSI */
> +				MX6UL_PAD_UART5_RX_DATA__ECSPI2_MISO	0x0b0b0 /* CSPI_MISO */
> +				MX6UL_PAD_UART4_TX_DATA__ECSPI2_SCLK	0x0b0b0 /* CSPI_SCLK */
> +			>;
> +		};
> +
> +		pinctrl_edt_ft5x06: edt-ft5x06grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0 /* Interrupt */
> +				MX6UL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x1b0b0 /* Reset */
> +				MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x1b0b0 /* Wake */
> +			>;
> +		};
> +
> +		pinctrl_enet1: enet1grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x0b0b0
> +				MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x0b0b0
> +				MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x0b0b0
> +				MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x0b0b0
> +				MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x0b0b0
> +				MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x0b0b0
> +				MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x0b0b0
> +				MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x40000031
> +			>;
> +		};
> +
> +		pinctrl_enet2: enet2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x0b0b0
> +				MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x0b0b0
> +				MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x0b0b0
> +				MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x0b0b0
> +				MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x0b0b0
> +				MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x0b0b0
> +				MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x0b0b0
> +				MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x40000031
> +			>;
> +		};
> +
> +		pinctrl_enet_mdio: enet-mdiogrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x0b0b0
> +				MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
> +			>;
> +		};
> +
> +		pinctrl_etnphy_power: etnphy-pwrgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x0b0b0 /* ETN PHY POWER */
> +			>;
> +		};
> +
> +		pinctrl_flexcan1: flexcan1grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b0b0
> +				MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b0b0
> +			>;
> +		};
> +
> +		pinctrl_flexcan2: flexcan2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART2_CTS_B__FLEXCAN2_TX	0x1b0b0
> +				MX6UL_PAD_UART2_RTS_B__FLEXCAN2_RX	0x1b0b0
> +			>;
> +		};
> +
> +		pinctrl_flexcan_xcvr: flexcan-xcvrgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_LCD_DATA00__GPIO3_IO05	0x0b0b0 /* Flexcan XCVR enable =
*/
> +			>;
> +		};
> +
> +		pinctrl_gpmi_nand: gpminandgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0x0b0b1
> +				MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0x0b0b1
> +				MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0x0b0b1
> +				MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0x0b000
> +				MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0x0b0b1
> +				MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0x0b0b1
> +				MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0x0b0b1
> +				MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0x0b0b1
> +				MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0x0b0b1
> +				MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0x0b0b1
> +				MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0x0b0b1
> +				MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0x0b0b1
> +				MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0x0b0b1
> +				MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0x0b0b1
> +				MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0x0b0b1
> +			>;
> +		};
> +
> +		pinctrl_i2c_gpio: i2c-gpiogrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x4001b8b1 /* I2C SCL */
> +				MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x4001b8b1 /* I2C SDA */
> +			>;
> +		};
> +
> +		pinctrl_i2c2: i2c2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b1
> +				MX6UL_PAD_GPIO1_IO01__I2C2_SDA		0x4001b8b1
> +			>;
> +		};
> +
> +		pinctrl_kpp: kppgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_ENET2_RX_DATA1__KPP_COL04	0x1b0b0
> +				MX6UL_PAD_ENET2_TX_DATA0__KPP_COL05	0x1b0b0
> +				MX6UL_PAD_ENET2_TX_EN__KPP_COL06	0x1b0b0
> +				MX6UL_PAD_ENET2_RX_ER__KPP_COL07	0x1b0b0
> +				MX6UL_PAD_ENET2_RX_DATA0__KPP_ROW04	0x1b0b0
> +				MX6UL_PAD_ENET2_RX_EN__KPP_ROW05	0x1b0b0
> +				MX6UL_PAD_ENET2_TX_DATA1__KPP_ROW06	0x1b0b0
> +				MX6UL_PAD_ENET2_TX_CLK__KPP_ROW07	0x1b0b0
> +			>;
> +		};
> +
> +		pinctrl_lcd_pwr: lcd-pwrgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x0b0b0 /* LCD Power Enable *=
/
> +			>;
> +		};
> +
> +		pinctrl_lcd_reset: lcd-resetgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_LCD_RESET__GPIO3_IO04		0x0b0b0 /* LCD RESET */
> +			>;
> +		};
> +
> +		pinctrl_pwm5: pwm5grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_NAND_DQS__PWM5_OUT		0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_sai2: sai2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x0b0b0 /* SSI1_RXD */
> +				MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x0b0b0 /* SSI1_TXD */
> +				MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x0b0b0 /* SSI1_CLK */
> +				MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x0b0b0 /* SSI1_FS */
> +			>;
> +		};
> +
> +		pinctrl_spi_gpio: spi-gpiogrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29	0x0b0b0 /* CSPI_SS */
> +				MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x0b0b0 /* CSPI_SS */
> +				MX6UL_PAD_UART5_TX_DATA__GPIO1_IO30	0x0b0b0 /* CSPI_MOSI */
> +				MX6UL_PAD_UART5_RX_DATA__GPIO1_IO31	0x0b0b0 /* CSPI_MISO */
> +				MX6UL_PAD_UART4_TX_DATA__GPIO1_IO28	0x0b0b0 /* CSPI_SCLK */
> +			>;
> +		};
> +
> +		pinctrl_tsc2007: tsc2007grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_JTAG_TMS__GPIO1_IO11		0x1b0b0 /* Interrupt */
> +			>;
> +		};
> +
> +		pinctrl_uart1: uart1grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x0b0b0
> +				MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_uart1_rtscts: uart1_rtsctsgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART1_RTS_B__UART1_DCE_RTS	0x0b0b0
> +				MX6UL_PAD_UART1_CTS_B__UART1_DCE_CTS	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_uart2: uart2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x0b0b0
> +				MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_uart2_rtscts: uart2_rtsctsgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART3_RX_DATA__UART2_DCE_RTS	0x0b0b0
> +				MX6UL_PAD_UART3_TX_DATA__UART2_DCE_CTS	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_uart5: uart5grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO04__UART5_DCE_TX	0x0b0b0
> +				MX6UL_PAD_GPIO1_IO05__UART5_DCE_RX	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_uart5_rtscts: uart5_rtsctsgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x0b0b0
> +				MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x0b0b0
> +			>;
> +		};
> +
> +		pinctrl_usbh1_oc: usbh1-ocgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0x17059 /* USBH1_OC */
> +			>;
> +		};
> +
> +		pinctrl_usbh1_vbus: usbh1-vbusgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0x0b0b0 /* USBH1_VBUSEN */
> +			>;
> +		};
> +
> +		pinctrl_usbotg_oc: usbotg-ocgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x17059 /* USBOTG_OC */
> +			>;
> +		};
> +
> +		pinctrl_usbotg_vbus: usbotg-vbusgrp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0 /* USBOTG_VBUSEN */
> +			>;
> +		};
> +
> +		pinctrl_usdhc1: usdhc1grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x070b1
> +				MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x07099
> +				MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x070b1
> +				MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x070b1
> +				MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x070b1
> +				MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x070b1
> +				/* SD1 CD */
> +				MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x170b0 /* SD1 CD */
> +			>;
> +		};
> +		pinctrl_usdhc2: usdhc2grp {
> +			fsl,pins =3D <
> +				MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x070b1
> +				MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x070b1
> +				MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x070b1
> +				MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x070b1
> +				MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x070b1
> +				MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x070b1
> +				/* eMMC RESET */
> +				MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x170b0
> +			>;
> +		};
> +	};
> +};
> +
> +&kpp {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_kpp>;
> +	/* sample keymap */
> +	/* row/col 0..3 are mapped to KPP row/col 4..7 */
> +	linux,keymap =3D <
> +		MATRIX_KEY(4, 4, KEY_POWER)
> +		MATRIX_KEY(4, 5, KEY_KP0)
> +		MATRIX_KEY(4, 6, KEY_KP1)
> +		MATRIX_KEY(4, 7, KEY_KP2)
> +		MATRIX_KEY(5, 4, KEY_KP3)
> +		MATRIX_KEY(5, 5, KEY_KP4)
> +		MATRIX_KEY(5, 6, KEY_KP5)
> +		MATRIX_KEY(5, 7, KEY_KP6)
> +		MATRIX_KEY(6, 4, KEY_KP7)
> +		MATRIX_KEY(6, 5, KEY_KP8)
> +		MATRIX_KEY(6, 6, KEY_KP9)
> +	>;
> +	status =3D "okay";
> +};
> +
> +&lcdif {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_disp0_1>;
> +	lcd-supply =3D <&reg_lcd_pwr>;
> +	display =3D <&display>;
> +	status =3D "okay";
> +
> +	display: display@di0 {
> +		bits-per-pixel =3D <32>;
> +		bus-width =3D <24>;
> +		status =3D "okay";
> +
> +		display-timings {
> +			VGA {
> +				clock-frequency =3D <25200000>;
> +				hactive =3D <640>;
> +				vactive =3D <480>;
> +				hback-porch =3D <48>;
> +				hsync-len =3D <96>;
> +				hfront-porch =3D <16>;
> +				vback-porch =3D <31>;
> +				vsync-len =3D <2>;
> +				vfront-porch =3D <12>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +
> +			ETV570 {
> +				clock-frequency =3D <25200000>;
> +				hactive =3D <640>;
> +				vactive =3D <480>;
> +				hback-porch =3D <114>;
> +				hsync-len =3D <30>;
> +				hfront-porch =3D <16>;
> +				vback-porch =3D <32>;
> +				vsync-len =3D <3>;
> +				vfront-porch =3D <10>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +
> +			ET0350 {
> +				clock-frequency =3D <6413760>;
> +				hactive =3D <320>;
> +				vactive =3D <240>;
> +				hback-porch =3D <34>;
> +				hsync-len =3D <34>;
> +				hfront-porch =3D <20>;
> +				vback-porch =3D <15>;
> +				vsync-len =3D <3>;
> +				vfront-porch =3D <4>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +
> +			ET0430 {
> +				clock-frequency =3D <9009000>;
> +				hactive =3D <480>;
> +				vactive =3D <272>;
> +				hback-porch =3D <2>;
> +				hsync-len =3D <41>;
> +				hfront-porch =3D <2>;
> +				vback-porch =3D <2>;
> +				vsync-len =3D <10>;
> +				vfront-porch =3D <2>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <0>;
> +			};
> +
> +			ET0500 {
> +				clock-frequency =3D <33264000>;
> +				hactive =3D <800>;
> +				vactive =3D <480>;
> +				hback-porch =3D <88>;
> +				hsync-len =3D <128>;
> +				hfront-porch =3D <40>;
> +				vback-porch =3D <33>;
> +				vsync-len =3D <2>;
> +				vfront-porch =3D <10>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +
> +			ET0700 { /* same as ET0500 */
> +				clock-frequency =3D <33264000>;
> +				hactive =3D <800>;
> +				vactive =3D <480>;
> +				hback-porch =3D <88>;
> +				hsync-len =3D <128>;
> +				hfront-porch =3D <40>;
> +				vback-porch =3D <33>;
> +				vsync-len =3D <2>;
> +				vfront-porch =3D <10>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +
> +			ETQ570 {
> +				clock-frequency =3D <6596040>;
> +				hactive =3D <320>;
> +				vactive =3D <240>;
> +				hback-porch =3D <38>;
> +				hsync-len =3D <30>;
> +				hfront-porch =3D <30>;
> +				vback-porch =3D <16>;
> +				vsync-len =3D <3>;
> +				vfront-porch =3D <4>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&pwm5 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm5>;
> +	#pwm-cells =3D <3>;
> +	status =3D "okay";
> +};
> +
> +&sai2 {
> +	#sound-dai-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai2>;
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart1 &pinctrl_uart1_rtscts>;
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
> +	status =3D "okay";
> +};
> +
> +&uart5 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart5 &pinctrl_uart5_rtscts>;
> +	status =3D "okay";
> +};
> +
> +&usbotg2 {
> +	vbus-supply =3D <&reg_usbh1_vbus>;
> +	dr_mode =3D "host";
> +	disable-over-current;
> +	status =3D "okay";
> +};
> +
> +&usbotg1 {
> +	vbus-supply =3D <&reg_usbotg_vbus>;
> +	dr_mode =3D "peripheral";
> +	disable-over-current;
> +	status =3D "okay";
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>;
> +	bus-width =3D <4>;
> +	no-1-8-v;
> +	cd-gpios =3D <&gpio4 14 GPIO_ACTIVE_LOW>;
> +	fsl,wp-controller;
> +	status =3D "okay";
> +};
> --=20
> 2.1.4
>=20
>=20
