From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: Add STiH407 SoC support
Date: Mon, 10 Mar 2014 12:28:30 +0000
Message-ID: <20140310122830.GT14976@lee--X1>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com>
 <1394203251-25361-5-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394203251-25361-5-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Mar 2014, Maxime COQUELIN wrote:

> The STiH407 is advanced multi-HD AVC processor with 3D graphics accel=
eration
> and 1.5-GHz ARM Cortex-A9 SMP CPU.
>=20
> Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-clock.dtsi   |  41 +++
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 618 +++++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/stih407.dtsi         | 250 +++++++++++++
>  3 files changed, 909 insertions(+)
>  create mode 100644 arch/arm/boot/dts/stih407-clock.dtsi
>  create mode 100644 arch/arm/boot/dts/stih407-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/stih407.dtsi
>=20
> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts=
/stih407-clock.dtsi
> new file mode 100644
> index 0000000..f50ac6f
> --- /dev/null
> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
> @@ -0,0 +1,41 @@

Going to gloss over this, as you and Srini are the platform experts.

> +/*
> + * Copyright (C) 2013 STMicroelectronics R&D Limited

s/2013/2014

> + * <stlinux-devel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>

Might consider submitting a MAINTAINERS entry for all of ST's DTS(I)
files and removing this from them. Only if this ML is pretty
stable/constant of course.

> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +/ {
> +	clocks {
> +		/*
> +		 * Fixed 30MHz oscillator inputs to SoC
> +		 */
> +		CLK_SYSIN: CLK_SYSIN {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <30000000>;
> +			clock-output-names =3D "CLK_SYSIN";
> +		};
> +
> +		/*
> +		 * ARM Peripheral clock for timers
> +		 */
> +		arm_periph_clk: arm_periph_clk {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <600000000>;
> +		};
> +
> +		/*
> +		 * Bootloader initialized system infrastructure clock for
> +		 * serial devices.
> +		 */
> +		CLK_EXT2F_A9: clockgenC0@13 {

s/@/@0x

> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <200000000>;
> +			clock-output-names =3D "CLK_S_ICN_REG_0";
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> new file mode 100644
> index 0000000..2d8543e
> --- /dev/null
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -0,0 +1,618 @@
> +/*
> + * Copyright (C) 2013 STMicroelectronics Limited.
> + * Author: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * publishhed by the Free Software Foundation.
> + */
> +#include "st-pincfg.h"
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +/ {
> +
> +	aliases {
> +		/* 0-5: PIO_SBC */
> +		gpio0 =3D &PIO0;
> +		gpio1 =3D &PIO1;
> +		gpio2 =3D &PIO2;
> +		gpio3 =3D &PIO3;
> +		gpio4 =3D &PIO4;
> +		gpio5 =3D &PIO5;
> +		/* 10-19: PIO_FRONT0 */
> +		gpio6 =3D &PIO10;
> +		gpio7 =3D &PIO11;
> +		gpio8 =3D &PIO12;
> +		gpio9 =3D &PIO13;
> +		gpio10 =3D &PIO14;
> +		gpio11 =3D &PIO15;
> +		gpio12 =3D &PIO16;
> +		gpio13 =3D &PIO17;
> +		gpio14 =3D &PIO18;
> +		gpio15 =3D &PIO19;
> +		/* 20: PIO_FRONT1 */
> +		gpio16 =3D &PIO20;
> +		/* 30-35: PIO_REAR */
> +		gpio17 =3D &PIO30;
> +		gpio18 =3D &PIO31;
> +		gpio19 =3D &PIO32;
> +		gpio20 =3D &PIO33;
> +		gpio21 =3D &PIO34;
> +		gpio22 =3D &PIO35;
> +		/* 40-42: PIO_FLASH */
> +		gpio23 =3D &PIO40;
> +		gpio24 =3D &PIO41;
> +		gpio25 =3D &PIO42;
> +	};
> +
> +	soc {
> +		pin-controller-sbc {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			compatible =3D "st,stih407-sbc-pinctrl";
> +			st,syscfg =3D <&syscfg_sbc>;
> +			reg =3D <0x0961f080 0x4>;
> +			reg-names =3D "irqmux";
> +			interrupts =3D <GIC_SPI 188 IRQ_TYPE_NONE>;
> +			interrupts-names =3D "irqmux";
> +			ranges =3D <0 0x09610000 0x6000>;
> +
> +			PIO0: gpio@09610000 {

s/@/@0x

I won't mention this particular point again, but it needs to be
propagated throughout the patch.

> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x0 0x100>;
> +				st,bank-name =3D "PIO0";
> +			};
> +			PIO1: gpio@09611000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x1000 0x100>;

Are there really these big gaps in the register space i.e 0x1100 -> 0x2=
000 etc?

> +				st,bank-name =3D "PIO1";
> +			};
> +			PIO2: gpio@09612000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x2000 0x100>;
> +				st,bank-name =3D "PIO2";
> +			};
> +			PIO3: gpio@09613000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x3000 0x100>;
> +				st,bank-name =3D "PIO3";
> +			};
> +			PIO4: gpio@09614000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x4000 0x100>;
> +				st,bank-name =3D "PIO4";
> +			};
> +
> +			PIO5: gpio@09615000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x5000 0x100>;
> +				st,bank-name =3D "PIO5";
> +			};
> +
> +			rc {
> +				pinctrl_ir: ir0 {
> +					st,pins {
> +						ir =3D <&PIO4 0 ALT2 IN>;
> +					};
> +				};
> +			};
> +
> +			/* SBC_ASC0 - UART10 */
> +			sbc_serial0 {
> +				pinctrl_sbc_serial0: sbc_serial0-0 {
> +					st,pins {
> +						tx =3D <&PIO3 4 ALT1 OUT>;
> +						rx =3D <&PIO3 5 ALT1 IN>;
> +					};
> +				};
> +			};
> +			/* SBC_ASC1 - UART11 */
> +			sbc_serial1 {
> +				pinctrl_sbc_serial1: sbc_serial1-0 {
> +					st,pins {
> +						tx =3D <&PIO2 6 ALT3 OUT>;
> +						rx =3D <&PIO2 7 ALT3 IN>;
> +					};
> +				};
> +			};
> +
> +			i2c10 {
> +				pinctrl_i2c10_default: i2c10-default {
> +					st,pins {
> +						sda =3D <&PIO4 6 ALT1 BIDIR>;
> +						scl =3D <&PIO4 5 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			i2c11 {
> +				pinctrl_i2c11_default: i2c11-default {
> +					st,pins {
> +						sda =3D <&PIO5 1 ALT1 BIDIR>;
> +						scl =3D <&PIO5 0 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			keyscan {
> +				pinctrl_keyscan: keyscan {
> +					st,pins {
> +						keyin0 =3D <&PIO4 0 ALT6 IN>;
> +						keyin1 =3D <&PIO4 5 ALT4 IN>;
> +						keyin2 =3D <&PIO0 4 ALT2 IN>;
> +						keyin3 =3D <&PIO2 6 ALT2 IN>;
> +
> +						keyout0 =3D <&PIO4 6 ALT4 OUT>;
> +						keyout1 =3D <&PIO1 7 ALT2 OUT>;
> +						keyout2 =3D <&PIO0 6 ALT2 OUT>;
> +						keyout3 =3D <&PIO2 7 ALT2 OUT>;
> +					};
> +				};
> +			};
> +
> +			gmac1 {
> +				/*
> +				  Almost all the boards based on STiH407 SoC have an embedded
> +				  switch where the mdio/mdc have been used for managing the SMI
> +				  iface via I2C. For this reason these lines can be allocated
> +				  by using dedicated configuration (in case of there will be a
> +				  standard PHY transceiver on-board).
> +				*/

Non-standard multi-line comment. Please fill in the remaining '*'s.

> +				pinctrl_rgmii1: rgmii1-0 {
> +					st,pins {
> +
> +						txd0 =3D <&PIO0 0 ALT1 OUT DE_IO 0 CLK_A>;
> +						txd1 =3D <&PIO0 1 ALT1 OUT DE_IO 0 CLK_A>;
> +						txd2 =3D <&PIO0 2 ALT1 OUT DE_IO 0 CLK_A>;
> +						txd3 =3D <&PIO0 3 ALT1 OUT DE_IO 0 CLK_A>;
> +						txen =3D <&PIO0 5 ALT1 OUT DE_IO 0 CLK_A>;
> +						txclk =3D <&PIO0 6 ALT1 IN NICLK 0 CLK_A>;
> +						rxd0 =3D <&PIO1 4 ALT1 IN DE_IO 0 CLK_A>;
> +						rxd1 =3D <&PIO1 5 ALT1 IN DE_IO 0 CLK_A>;
> +						rxd2 =3D <&PIO1 6 ALT1 IN DE_IO 0 CLK_A>;
> +						rxd3 =3D <&PIO1 7 ALT1 IN DE_IO 0 CLK_A>;
> +						rxdv =3D <&PIO2 0 ALT1 IN DE_IO 0 CLK_A>;
> +						rxclk =3D <&PIO2 2 ALT1 IN NICLK 500 CLK_A>;
> +						clk125 =3D <&PIO3 7 ALT4 IN NICLK 0 CLK_A>;
> +						phyclk =3D <&PIO2 3 ALT4 OUT NICLK 1750 CLK_B>;
> +					};
> +				};
> +
> +				pinctrl_rgmii1_mdio: rgmii1-mdio {
> +					st,pins {
> +						mdio =3D <&PIO1 0 ALT1 OUT BYPASS 0>;
> +						mdc =3D <&PIO1 1 ALT1 OUT NICLK 0 CLK_A>;
> +						mdint =3D <&PIO1 3 ALT1 IN BYPASS 0>;
> +					};
> +				};
> +
> +				pinctrl_mii1: mii1 {
> +					st,pins {
> +						txd0 =3D <&PIO0 0 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txd1 =3D <&PIO0 1 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txd2 =3D <&PIO0 2 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txd3 =3D <&PIO0 3 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txer =3D <&PIO0 4 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txen =3D <&PIO0 5 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txclk =3D <&PIO0 6 ALT1 IN NICLK 0 CLK_A>;
> +						col =3D <&PIO0 7 ALT1 IN BYPASS 1000>;
> +
> +						mdio =3D <&PIO1 0 ALT1 OUT BYPASS 1500>;
> +						mdc =3D <&PIO1 1 ALT1 OUT NICLK 0 CLK_A>;
> +						crs =3D <&PIO1 2 ALT1 IN BYPASS 1000>;
> +						mdint =3D <&PIO1 3 ALT1 IN BYPASS 0>;
> +						rxd0 =3D <&PIO1 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +						rxd1 =3D <&PIO1 5 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +						rxd2 =3D <&PIO1 6 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +						rxd3 =3D <&PIO1 7 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +
> +						rxdv =3D <&PIO2 0 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +						rx_er =3D <&PIO2 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +						rxclk =3D <&PIO2 2 ALT1 IN NICLK 0 CLK_A>;
> +						phyclk =3D <&PIO2 3 ALT1 OUT NICLK 0 CLK_A>;
> +					};
> +				};
> +
> +			};

Superflous new line.

> +			pwm1 {
> +				pinctrl_pwm1_chan0_default: pwm1-0-default {
> +					st,pins {
> +						pwm-out =3D <&PIO3 0 ALT1 OUT>;
> +					};
> +				};
> +				pinctrl_pwm1_chan1_default: pwm1-1-default {
> +					st,pins {
> +						pwm-out =3D <&PIO4 4 ALT1 OUT>;
> +					};
> +				};
> +				pinctrl_pwm1_chan2_default: pwm1-2-default {
> +					st,pins {
> +						pwm-out =3D <&PIO4 6 ALT3 OUT>;
> +					};
> +				};
> +				pinctrl_pwm1_chan3_default: pwm1-3-default {
> +					st,pins {
> +						pwm-out =3D <&PIO4 7 ALT3 OUT>;
> +					};
> +				};
> +			};
> +
> +		};
> +
> +		pin-controller-front0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			compatible =3D "st,stih407-front-pinctrl";
> +			st,syscfg =3D <&syscfg_front>;
> +			reg =3D <0x0920f080 0x4>;
> +			reg-names =3D "irqmux";
> +			interrupts =3D <GIC_SPI 189 IRQ_TYPE_NONE>;
> +			interrupts-names =3D "irqmux";
> +			ranges =3D <0 0x09200000 0x10000>;
> +
> +			PIO10: PIO@09200000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x0 0x100>;
> +				st,bank-name =3D "PIO10";
> +			};
> +			PIO11: PIO@09201000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x1000 0x100>;
> +				st,bank-name =3D "PIO11";
> +			};
> +			PIO12: PIO@09202000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x2000 0x100>;
> +				st,bank-name =3D "PIO12";
> +			};
> +			PIO13: PIO@09203000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x3000 0x100>;
> +				st,bank-name =3D "PIO13";
> +			};
> +			PIO14: PIO@09204000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x4000 0x100>;
> +				st,bank-name =3D "PIO14";
> +			};
> +			PIO15: PIO@09205000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x5000 0x100>;
> +				st,bank-name =3D "PIO15";
> +			};
> +			PIO16: PIO@09206000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x6000 0x100>;
> +				st,bank-name =3D "PIO16";
> +			};
> +			PIO17: PIO@09207000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x7000 0x100>;
> +				st,bank-name =3D "PIO17";
> +			};
> +			PIO18: PIO@09208000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x8000 0x100>;
> +				st,bank-name =3D "PIO18";
> +			};
> +			PIO19: PIO@09209000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x9000 0x100>;
> +				st,bank-name =3D "PIO19";
> +			};
> +
> +			/* Comms */
> +			serial0 {
> +				pinctrl_serial0: serial0-0 {
> +					st,pins {
> +						tx =3D <&PIO17 0 ALT1 OUT>;
> +						rx =3D <&PIO17 1 ALT1 IN>;
> +					};
> +				};
> +			};
> +
> +			serial1 {
> +				pinctrl_serial1: serial1-0 {
> +					st,pins {
> +						tx =3D <&PIO16 0 ALT1 OUT>;
> +						rx =3D <&PIO16 1 ALT1 IN>;
> +					};
> +				};
> +			};
> +
> +			serial2 {
> +				pinctrl_serial2: serial2-0 {
> +					st,pins {
> +						tx =3D <&PIO15 0 ALT1 OUT>;
> +						rx =3D <&PIO15 1 ALT1 IN>;
> +					};
> +				};
> +			};
> +
> +			mmc1 {
> +				pinctrl_sd1: sd1-0 {
> +					st,pins {
> +						sd_clk =3D <&PIO19 3 ALT5 BIDIR NICLK 0 CLK_B>;
> +						sd_cmd =3D <&PIO19 2 ALT5 BIDIR_PU BYPASS 0>;
> +						sd_dat0 =3D <&PIO19 4 ALT5 BIDIR_PU BYPASS 0>;
> +						sd_dat1 =3D <&PIO19 5 ALT5 BIDIR_PU BYPASS 0>;
> +						sd_dat2 =3D <&PIO19 6 ALT5 BIDIR_PU BYPASS 0>;
> +						sd_dat3 =3D <&PIO19 7 ALT5 BIDIR_PU BYPASS 0>;
> +						sd_led =3D <&PIO16 6 ALT6 OUT>;
> +						sd_pwren =3D <&PIO16 7 ALT6 OUT>;
> +						sd_cd =3D <&PIO19 0 ALT6 IN>;
> +						sd_wp =3D <&PIO19 1 ALT6 IN>;
> +					};
> +				};
> +			};
> +
> +
> +			i2c0 {
> +				pinctrl_i2c0_default: i2c0-default {
> +					st,pins {
> +						sda =3D <&PIO10 6 ALT2 BIDIR>;
> +						scl =3D <&PIO10 5 ALT2 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			i2c1 {
> +				pinctrl_i2c1_default: i2c1-default {
> +					st,pins {
> +						sda =3D <&PIO11 1 ALT2 BIDIR>;
> +						scl =3D <&PIO11 0 ALT2 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			i2c2 {
> +				pinctrl_i2c2_default: i2c2-default {
> +					st,pins {
> +						sda =3D <&PIO15 6 ALT2 BIDIR>;
> +						scl =3D <&PIO15 5 ALT2 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			i2c3 {
> +				pinctrl_i2c3_default: i2c3-default {
> +					st,pins {
> +						sda =3D <&PIO18 6 ALT1 BIDIR>;
> +						scl =3D <&PIO18 5 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			spi0 {
> +				pinctrl_spi0_default: spi0-default {
> +					st,pins {
> +						mtsr =3D <&PIO12 6 ALT2 BIDIR>;
> +						mrst =3D <&PIO12 7 ALT2 BIDIR>;
> +						scl =3D <&PIO12 5 ALT2 BIDIR>;
> +					};
> +				};
> +			};
> +		};
> +
> +		pin-controller-front1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			compatible =3D "st,stih407-front-pinctrl";
> +			st,syscfg =3D <&syscfg_front>;
> +			reg =3D <0x0921f080 0x4>;
> +			reg-names =3D "irqmux";
> +			interrupts =3D <GIC_SPI 190 IRQ_TYPE_NONE>;
> +			interrupts-names =3D "irqmux";
> +			ranges =3D <0 0x09210000 0x10000>;
> +
> +			PIO20: PIO@09210000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x0 0x100>;
> +				st,bank-name =3D "PIO20";
> +			};
> +		};
> +
> +		pin-controller-rear {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			compatible =3D "st,stih407-rear-pinctrl";
> +			st,syscfg =3D <&syscfg_rear>;
> +			reg =3D <0x0922f080 0x4>;
> +			reg-names =3D "irqmux";
> +			interrupts =3D <GIC_SPI 191 IRQ_TYPE_NONE>;
> +			interrupts-names =3D "irqmux";
> +			ranges =3D <0 0x09220000 0x6000>;
> +
> +			PIO30: gpio@09220000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x0 0x100>;
> +				st,bank-name =3D "PIO30";
> +			};
> +			PIO31: gpio@09221000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x1000 0x100>;
> +				st,bank-name =3D "PIO31";
> +			};
> +			PIO32: gpio@09222000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x2000 0x100>;
> +				st,bank-name =3D "PIO32";
> +			};
> +			PIO33: gpio@09223000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x3000 0x100>;
> +				st,bank-name =3D "PIO33";
> +			};
> +			PIO34: gpio@09224000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x4000 0x100>;
> +				st,bank-name =3D "PIO34";
> +			};
> +			PIO35: gpio@09225000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x5000 0x100>;
> +				st,bank-name =3D "PIO35";
> +			};
> +
> +			i2c4 {
> +				pinctrl_i2c4_default: i2c4-default {
> +					st,pins {
> +						sda =3D <&PIO30 1 ALT1 BIDIR>;
> +						scl =3D <&PIO30 0 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			i2c5 {
> +				pinctrl_i2c5_default: i2c5-default {
> +					st,pins {
> +						sda =3D <&PIO34 4 ALT1 BIDIR>;
> +						scl =3D <&PIO34 3 ALT1 BIDIR>;
> +					};
> +				};
> +			};
> +
> +			usb3 {
> +				pinctrl_usb3: usb3-2 {
> +					st,pins {
> +						usb-oc-detect =3D <&PIO35 4 ALT1 IN>;
> +						usb-pwr-enable =3D <&PIO35 5 ALT1 OUT>;
> +						usb-vbus-valid =3D <&PIO35 6 ALT1 IN>;
> +					};
> +				};
> +			};
> +
> +			pwm0 {
> +				pinctrl_pwm0_chan0_default: pwm0-0-default {
> +					st,pins {
> +						pwm-out =3D <&PIO31 1 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +		};

Extra new line above.

> +		pin-controller-flash {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			compatible =3D "st,stih407-flash-pinctrl";
> +			st,syscfg =3D <&syscfg_flash>;
> +			reg =3D <0x0923f080 0x4>;
> +			reg-names =3D "irqmux";
> +			interrupts =3D <GIC_SPI 192 IRQ_TYPE_NONE>;
> +			interrupts-names =3D "irqmux";
> +			ranges =3D <0 0x09230000 0x3000>;
> +
> +			PIO40: gpio@09230000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0 0x100>;
> +				st,bank-name =3D "PIO40";
> +			};
> +			PIO41: gpio@09231000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x1000 0x100>;
> +				st,bank-name =3D "PIO41";
> +			};
> +			PIO42: gpio@09232000 {
> +				gpio-controller;
> +				#gpio-cells =3D <1>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				reg =3D <0x2000 0x100>;
> +				st,bank-name =3D "PIO42";
> +			};
> +
> +			mmc0 {
> +				pinctrl_mmc0: mmc0-0 {
> +					st,pins {
> +						emmc_clk =3D <&PIO40 6 ALT1 BIDIR>;
> +						emmc_cmd =3D <&PIO40 7 ALT1 BIDIR_PU>;
> +						emmc_d0 =3D <&PIO41 0 ALT1 BIDIR_PU>;
> +						emmc_d1 =3D <&PIO41 1 ALT1 BIDIR_PU>;
> +						emmc_d2 =3D <&PIO41 2 ALT1 BIDIR_PU>;
> +						emmc_d3 =3D <&PIO41 3 ALT1 BIDIR_PU>;
> +						emmc_d4 =3D <&PIO41 4 ALT1 BIDIR_PU>;
> +						emmc_d5 =3D <&PIO41 5 ALT1 BIDIR_PU>;
> +						emmc_d6 =3D <&PIO41 6 ALT1 BIDIR_PU>;
> +						emmc_d7 =3D <&PIO41 7 ALT1 BIDIR_PU>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih4=
07.dtsi
> new file mode 100644
> index 0000000..2a0566b
> --- /dev/null
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -0,0 +1,250 @@
> +/*
> + * Copyright (C) 2013 STMicroelectronics Limited.
> + * Author: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * publishhed by the Free Software Foundation.
> + */
> +#include "stih407-clock.dtsi"
> +#include "stih407-pinctrl.dtsi"
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			reg =3D <0>;
> +		};
> +		cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			reg =3D <1>;
> +		};
> +	};
> +
> +	intc: interrupt-controller@08761000 {
> +		compatible =3D "arm,cortex-a9-gic";
> +		#interrupt-cells =3D <3>;
> +		interrupt-controller;
> +		reg =3D <0x08761000 0x1000>, <0x08760100 0x100>;
> +	};
> +
> +	scu@08760000 {
> +		compatible =3D "arm,cortex-a9-scu";
> +		reg =3D <0x08760000 0x1000>;
> +	};
> +
> +	timer@08760200 {
> +		interrupt-parent =3D <&intc>;
> +		compatible =3D "arm,cortex-a9-global-timer";
> +		reg =3D <0x08760200 0x100>;
> +		interrupts =3D <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&arm_periph_clk>;
> +	};
> +
> +	L2: cache-controller {
> +		compatible =3D "arm,pl310-cache";
> +		reg =3D <0x08762000 0x1000>;
> +		arm,data-latency =3D <3 3 3>;
> +		arm,tag-latency =3D <2 2 2>;
> +		cache-unified;
> +		cache-level =3D <2>;
> +	};
> +
> +	soc {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		interrupt-parent =3D <&intc>;
> +		ranges;
> +		compatible =3D "simple-bus";
> +
> +		syscfg_sbc:sbc-syscfg@9620000{

Space after colon and another after the address.

Same for all of the nodes below and throughout the patch.

> +			compatible =3D "st,stih407-sbc-syscfg", "syscon";
> +			reg =3D <0x9620000 0x1000>;
> +		};
> +
> +		syscfg_front:front-syscfg@9280000{
> +			compatible =3D "st,stih407-front-syscfg", "syscon";
> +			reg =3D <0x9280000 0x1000>;
> +		};
> +
> +		syscfg_rear:rear-syscfg@9290000{
> +			compatible =3D "st,stih407-rear-syscfg", "syscon";
> +			reg =3D <0x9290000 0x1000>;
> +		};
> +
> +		syscfg_flash:flash-syscfg@92a0000{
> +			compatible =3D "st,stih407-flash-syscfg", "syscon";
> +			reg =3D <0x92a0000 0x1000>;
> +		};
> +
> +		syscfg_sbc_reg:fvdp-lite-syscfg@9600000{
> +			compatible =3D "st,stih407-sbc-reg-syscfg", "syscon";
> +			reg =3D <0x9600000 0x1000>;
> +		};
> +
> +		syscfg_core:core-syscfg@92b0000{
> +			compatible =3D "st,stih407-core-syscfg", "syscon";
> +			reg =3D <0x92b0000 0x1000>;
> +		};
> +
> +		syscfg_lpm:lpm-syscfg@94b5100{
> +			compatible =3D "st,stih407-lpm-syscfg", "syscon";
> +			reg =3D <0x94b5100 0x1000>;
> +		};
> +
> +		serial@9830000{
> +			compatible =3D "st,asc";
> +			status =3D "disabled";

This might just be a personal thing, but I prefer to see the status at
the base of the node with a new line above it, as it is only relevant
to the node rather than the device.

> +			reg =3D <0x9830000 0x2c>;
> +			interrupts =3D <GIC_SPI 122 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_serial0>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +		};

Like this:
	serial@9830000{
		compatible =3D "st,asc";
		reg =3D <0x9830000 0x2c>;
		interrupts =3D <GIC_SPI 122 IRQ_TYPE_NONE>;
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&pinctrl_serial0>;
		clocks =3D <&CLK_EXT2F_A9>;

		status =3D "disabled";
	};

> +
> +		serial@9831000{
> +			compatible =3D "st,asc";
> +			status =3D "disabled";
> +			reg =3D <0x9831000 0x2c>;
> +			interrupts =3D <GIC_SPI 123 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_serial1>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +		};
> +
> +		serial@9832000{
> +			compatible =3D "st,asc";
> +			status =3D "disabled";
> +			reg =3D <0x9832000 0x2c>;
> +			interrupts =3D <GIC_SPI 124 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_serial2>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +		};
> +
> +		/* SBC_ASC0 - UART10 */
> +		sbc_serial0: serial@9530000 {
> +			compatible =3D "st,asc";
> +			status =3D "disabled";
> +			reg =3D <0x9530000 0x2c>;
> +			interrupts =3D <GIC_SPI 138 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_sbc_serial0>;
> +			clocks =3D <&CLK_SYSIN>;
> +		};
> +
> +		serial@9531000 {
> +			compatible =3D "st,asc";
> +			status =3D "disabled";
> +			reg =3D <0x9531000 0x2c>;
> +			interrupts =3D <GIC_SPI 139 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_sbc_serial1>;
> +			clocks =3D <&CLK_SYSIN>;
> +		};
> +
> +		i2c@9840000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			interrupts =3D <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			reg =3D <0x9840000 0x110>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c0_default>;
> +		};
> +
> +		i2c@9841000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9841000 0x110>;
> +			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c1_default>;
> +		};
> +
> +		i2c@9842000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9842000 0x110>;
> +			interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c2_default>;
> +		};
> +
> +		i2c@9843000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9843000 0x110>;
> +			interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c3_default>;
> +		};
> +
> +		i2c@9844000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9844000 0x110>;
> +			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c4_default>;
> +		};
> +
> +		i2c@9845000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9845000 0x110>;
> +			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_EXT2F_A9>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c5_default>;
> +		};
> +
> +
> +		/* SSCs on SBC */
> +		i2c@9540000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9540000 0x110>;
> +			interrupts =3D <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_SYSIN>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c10_default>;
> +		};
> +
> +		i2c@9541000 {
> +			compatible =3D "st,comms-ssc4-i2c";
> +			status =3D "disabled";
> +			reg =3D <0x9541000 0x110>;
> +			interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&CLK_SYSIN>;
> +			clock-names =3D "ssc";
> +			clock-frequency =3D <400000>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_i2c11_default>;
> +		};
> +	};
> +};

Not sure if this is Git playing around again, but the };s look
misaligned in the submission.

Wow, this is good work and a lot of code!

Once my comments have been rectified, feel free to add my:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
