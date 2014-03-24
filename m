From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] ARM: dts: imx6: add support for Ka-Ro TX6 modules
Date: Mon, 24 Mar 2014 13:01:29 +0100
Message-ID: <20140324130129.1c2ec444@ipc1.ka-ro>
References: <1395235784-14034-1-git-send-email-LW@KARO-electronics.de>
	<20140322082352.GF5938@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140322082352.GF5938@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

it would help readability a lot if you would trim down the quoted parts
of the original mail (like I did with [...] in this reply).


Shawn Guo wrote:
> On Wed, Mar 19, 2014 at 02:29:44PM +0100, Lothar Wa=C3=9Fmann wrote:
> > This patch adds support for the Ka-Ro electronics GmbH TX6 modules.
> > There are five distinct module types with either i.MX6Q or i.MX6DL =
and
> > LVDS or LCD display interface and one DTS file for a complete syste=
m
> > with an i.MX6DL based TX6 module and a baseboard mounted on the bac=
k
> > of a display (imx6dl-tx6dl-comtft.dts).
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > ---
> >  arch/arm/boot/dts/Makefile                |    6 +
> >  arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts |  114 +++++
> >  arch/arm/boot/dts/imx6dl-tx6u-801x.dts    |  188 ++++++++
> >  arch/arm/boot/dts/imx6dl-tx6u-811x.dts    |  166 +++++++
> >  arch/arm/boot/dts/imx6q-tx6q-1010.dts     |  192 +++++++++
> >  arch/arm/boot/dts/imx6q-tx6q-1020.dts     |  192 +++++++++
> >  arch/arm/boot/dts/imx6q-tx6q-1110.dts     |  174 ++++++++
> >  arch/arm/boot/dts/imx6qdl-tx6.dtsi        |  672 +++++++++++++++++=
++++++++++++
> >  8 files changed, 1704 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-801x.dts
> >  create mode 100644 arch/arm/boot/dts/imx6dl-tx6u-811x.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1010.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1020.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-tx6q-1110.dts
> >  create mode 100644 arch/arm/boot/dts/imx6qdl-tx6.dtsi
> >=20
[...]
> > diff --git a/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts b/arch/arm/b=
oot/dts/imx6dl-tx6dl-comtft.dts
> > new file mode 100644
> > index 0000000..6df5a25
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6dl-tx6dl-comtft.dts
> > @@ -0,0 +1,114 @@
> > +/*
> > + * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > + *
> > + * The code contained herein is licensed under the GNU General Pub=
lic
> > + * License. You may obtain a copy of the GNU General Public Licens=
e
> > + * Version 2 at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx6dl.dtsi"
> > +#include "imx6qdl-tx6.dtsi"
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TX6DL Module on CoMpact TFT";
> > +	compatible =3D "fsl,imx6dl-tx6dl", "fsl,imx6dl";
>=20
> Shouldn't it be "karo,imx6dl-tx6dl" instead?
>=20
Of course. :(

> > +
> > +	aliases {
> > +		display =3D &display;
> > +	};
> > +
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm2 0 500000 0>;
> > +		power-supply =3D <&reg_3v3>;
> > +		/*
> > +		 * a poor man's way to create a 1:1 relationship between
> > +		 * the PWM value and the actual duty cycle
> > +		 */
> > +		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> > +				     10 11 12 13 14 15 16 17 18 19
> > +				     20 21 22 23 24 25 26 27 28 29
> > +				     30 31 32 33 34 35 36 37 38 39
> > +				     40 41 42 43 44 45 46 47 48 49
> > +				     50 51 52 53 54 55 56 57 58 59
> > +				     60 61 62 63 64 65 66 67 68 69
> > +				     70 71 72 73 74 75 76 77 78 79
> > +				     80 81 82 83 84 85 86 87 88 89
> > +				     90 91 92 93 94 95 96 97 98 99
> > +				    100>;
> > +		default-brightness-level =3D <50>;
> > +	};
> > +
> > +	display: display@di0 {
> > +		compatible =3D "fsl,imx-parallel-display";
> > +		interface-pix-fmt =3D "rgb24";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_disp0_1>;
> > +		status =3D "okay";
> > +
> > +		port {
> > +			display0_in: endpoint {
> > +				remote-endpoint =3D <&ipu1_di0_disp0>;
> > +			};
> > +		};
>=20
> I do not have OF graph stuff in my tree yet.
>=20
You can apply the patch, once it arrives in your tree.

[...]
> > diff --git a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts b/arch/arm/boot=
/dts/imx6dl-tx6u-811x.dts
> > new file mode 100644
> > index 0000000..c97fb42
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
> > @@ -0,0 +1,166 @@
> > +/*
> > + * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > + *
> > + * The code contained herein is licensed under the GNU General Pub=
lic
> > + * License. You may obtain a copy of the GNU General Public Licens=
e
> > + * Version 2 at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx6dl.dtsi"
> > +#include "imx6qdl-tx6.dtsi"
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TX6U-811x Module";
> > +	compatible =3D "fsl,imx6dl-tx6dl", "fsl,imx6dl";
> > +
> > +	aliases {
> > +		display =3D &lvds0;
> > +		lvds0 =3D &lvds0;
> > +		lvds1 =3D &lvds1;
> > +	};
> > +
> > +	backlight0: backlight0 {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm2 0 500000 0>;
> > +		power-supply =3D <&reg_lcd0_pwr>;
> > +		/*
> > +		 * a poor man's way to create a 1:1 relationship between
> > +		 * the PWM value and the actual duty cycle
> > +		 */
> > +		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> > +				     10 11 12 13 14 15 16 17 18 19
> > +				     20 21 22 23 24 25 26 27 28 29
> > +				     30 31 32 33 34 35 36 37 38 39
> > +				     40 41 42 43 44 45 46 47 48 49
> > +				     50 51 52 53 54 55 56 57 58 59
> > +				     60 61 62 63 64 65 66 67 68 69
> > +				     70 71 72 73 74 75 76 77 78 79
> > +				     80 81 82 83 84 85 86 87 88 89
> > +				     90 91 92 93 94 95 96 97 98 99
> > +				    100>;
> > +		default-brightness-level =3D <50>;
> > +	};
> > +
> > +	backlight1: backlight1 {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm1 0 500000 0>;
> > +		power-supply =3D <&reg_lcd1_pwr>;
> > +		/*
> > +		 * a poor man's way to create a 1:1 relationship between
> > +		 * the PWM value and the actual duty cycle
> > +		 */
> > +		brightness-levels =3D < 0  1  2  3  4  5  6  7  8  9
> > +				     10 11 12 13 14 15 16 17 18 19
> > +				     20 21 22 23 24 25 26 27 28 29
> > +				     30 31 32 33 34 35 36 37 38 39
> > +				     40 41 42 43 44 45 46 47 48 49
> > +				     50 51 52 53 54 55 56 57 58 59
> > +				     60 61 62 63 64 65 66 67 68 69
> > +				     70 71 72 73 74 75 76 77 78 79
> > +				     80 81 82 83 84 85 86 87 88 89
> > +				     90 91 92 93 94 95 96 97 98 99
> > +				    100>;
> > +		default-brightness-level =3D <50>;
> > +	};
> > +
> > +	panel0 {
>=20
> The convention of device tree node is node-name@unit-address, so in t=
his
> case it should probably be panel@0.
>=20
AFAIK that's only true for nodes that require a 'reg' property.
Thus if it were:
	panels {
		compatible =3D "simple-bus";
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		panel@0 {
			compatible =3D "simple-panel";
			reg =3D <0>;
			power-supply =3D <&reg_3v3>;
			backlight =3D <&backlight0>;
		};
[...]
> > diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts=
/imx6qdl-tx6.dtsi
> > new file mode 100644
> > index 0000000..828e7f3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
> > @@ -0,0 +1,672 @@
> > +/*
> > + * Copyright 2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > + *
> > + * The code contained herein is licensed under the GNU General Pub=
lic
> > + * License. You may obtain a copy of the GNU General Public Licens=
e
> > + * Version 2 at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +
> > +/ {
> > +	aliases {
> > +		can0 =3D &can2;
> > +		can1 =3D &can1;
> > +		ethernet0 =3D &fec;
> > +		lcdif_23bit_pins_a =3D &pinctrl_disp0_1;
> > +		lcdif_24bit_pins_a =3D &pinctrl_disp0_2;
> > +		pwm0 =3D &pwm1;
> > +		pwm1 =3D &pwm2;
> > +		reg_can_xcvr =3D &reg_can_xcvr;
> > +		stk5led =3D &user_led;
> > +		usbotg =3D &usbotg;
> > +		sdhc0 =3D &usdhc1;
> > +		sdhc1 =3D &usdhc2;
> > +	};
> > +
> > +	memory {
> > +		reg =3D <0 0>; /* will be filled by U-Boot */
> > +	};
> > +
> > +	clocks {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		mclk: codec_clock {
>=20
> clock@0
>=20
OK.

> > +&can1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	xceiver-supply =3D <&reg_can_xcvr>;
> > +
>=20
> Drop the new line.
>=20
OK.

[...]
> > +&i2c3 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_i2c3>;
> > +	clock-frequency =3D <400000>;
> > +	status =3D "okay";
> > +
> > +	sgtl5000: sgtl5000@0a {
> > +		compatible =3D "fsl,sgtl5000";
> > +		reg =3D <0x0a>;
> > +		VDDA-supply =3D <&reg_2v5>;
> > +		VDDIO-supply =3D <&reg_3v3>;
> > +		clocks =3D <&mclk>;
> > +	};
> > +
> > +	polytouch: edt-ft5x06@38 {
> > +		compatible =3D "edt,edt-ft5x06";
> > +		reg =3D <0x38>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
> > +		interrupt-parent =3D <&gpio6>;
> > +		interrupts =3D <15 0>;
> > +		reset-gpios =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
> > +		wake-gpios =3D <&gpio2 21 GPIO_ACTIVE_HIGH>;
>=20
> Where are all these bindings documented?
>=20
That's one in a separate patch adding DT support to the edt_ft5x06
driver.

> > +		linux,wakeup;
> > +	};
> > +
> > +	touchscreen: tsc2007@48 {
> > +		compatible =3D "ti,tsc2007";
> > +		reg =3D <0x48>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_tsc2007>;
> > +		interrupt-parent =3D <&gpio3>;
> > +		interrupts =3D <26 0>;
> > +		gpios =3D <&gpio3 26 GPIO_ACTIVE_LOW>;
> > +		ti,x-plate-ohms =3D <660>;
> > +		linux,wakeup;
> > +	};
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_hog>;
> > +
> > +	imx6qdl-tx6 {
> > +		pinctrl_hog: hoggrp {
> > +			fsl,pins =3D <
> > +				MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b0b1 /* LED */
> > +				MX6QDL_PAD_SD3_DAT2__GPIO7_IO06		0x1b0b1 /* ETN PHY RESET */
> > +				MX6QDL_PAD_SD3_DAT4__GPIO7_IO01		0x1b0b1 /* ETN PHY INT
>=20
> Broken comment?
>=20
Yeah, right. Bad, that the compiler doesn't complain here. :(

[...]
> > +		pinctrl_flexcan_xcvr: flexcan-xcvrgrp {
> > +			fsl,pins =3D <
> > +				MX6QDL_PAD_DISP0_DAT0__GPIO4_IO21	0x1b0b0 /* Flexcan XCVR enab=
le */
> > +			>;
> > +		};
> > +
> > +		pinctrl_gpmi_nand: gpmi-nand {
>=20
> gpminandgrp
>=20
OK.

> > +		pinctrl_kpp: kppgrp {
> > +			fsl,pins =3D <
> > +				MX6QDL_PAD_GPIO_9__KEY_COL6		0x1b0b1
> > +				MX6QDL_PAD_GPIO_4__KEY_COL7		0x1b0b1
> > +				MX6QDL_PAD_KEY_COL2__KEY_COL2		0x1b0b1
> > +				MX6QDL_PAD_KEY_COL3__KEY_COL3		0x1b0b1
> > +
>=20
> Drop it.
>=20
I guess you mean the empty line.
OK.

[...]
> > +&uart2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
>=20
> These two entries can be merged into one.
>=20
I prefer to have the handshake pinctrls separate from the data lines so
that the uart can be used with or without RTS/CTS, without having to
mess around with the pinctrl defs.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
