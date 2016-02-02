From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] ARM: dts: imx51: add support for Ka-Ro electronics TX51
 modules
Date: Tue, 2 Feb 2016 15:02:53 +0100
Message-ID: <20160202150253.340d8e86@ipc1.ka-ro>
References: <1453292619-3560-1-git-send-email-LW@KARO-electronics.de>
	<20160202061842.GB8307@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160202061842.GB8307@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 2 Feb 2016 14:18:42 +0800 Shawn Guo wrote:
> On Wed, Jan 20, 2016 at 01:23:39PM +0100, Lothar Wa=C3=9Fmann wrote:
> > The TX51-8xxx module series is a System On Module manufactured by
> >   Ka-Ro electronics GmbH with the following characteristics:
> >   Processor    Freescale i.MX515
> >                  up to 800 MHz (commercial)
> >                  up to 600 MHz (industrial)
> >   RAM          128/256MB mobile DDR-SDRAM
> >   ROM          128MB NAND Flash
> >   RTC          DS1339 Real Time Clock
> >   Power supply Single 3.1V to 5.5V
> >   Size         26mm SO-DIMM
> >   Temp. Range  0=C2=B0C..70=C2=B0C (-40=C2=B0C..85=C2=B0C)
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > ---
> >  arch/arm/boot/dts/Makefile       |   3 +-
> >  arch/arm/boot/dts/imx51-tx51.dts | 749 +++++++++++++++++++++++++++=
++++++++++++
> >  2 files changed, 751 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/imx51-tx51.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
> > index a4a6d70..ea70f34 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -277,7 +277,8 @@ dtb-$(CONFIG_SOC_IMX51) +=3D \
> >  	imx51-babbage.dtb \
> >  	imx51-digi-connectcore-jsk.dtb \
> >  	imx51-eukrea-mbimxsd51-baseboard.dtb \
> > -	imx51-ts4800.dtb
> > +	imx51-ts4800.dtb \
> > +	imx51-tx51.dtb
> >  dtb-$(CONFIG_SOC_IMX53) +=3D \
> >  	imx53-ard.dtb \
> >  	imx53-m53evk.dtb \
> > diff --git a/arch/arm/boot/dts/imx51-tx51.dts b/arch/arm/boot/dts/i=
mx51-tx51.dts
> > new file mode 100644
> > index 0000000..80c5d60
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx51-tx51.dts
> > @@ -0,0 +1,749 @@
> > +/*
> > + * Copyright 2012-2014 Lothar Wa=C3=9Fmann <LW@KARO-electronics.de=
>
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
>=20
> We generally suggest GPL/X11 dual license for new dts to consider
> non-Linux device tree users.
>=20
OK.

> > +
> > +/dts-v1/;
> > +#include "imx51.dtsi"
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TX51 module";
> > +	compatible =3D "karo,tx51", "fsl,imx51";
> > +
> > +	aliases {
> > +		backlight =3D &backlight;
> > +		display =3D &display;
> > +		i2c1 =3D &i2c_gpio;
> > +		usbotg =3D &usbotg;
> > +		wlan0 =3D &wlan0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D &uart1;
> > +	};
> > +
> > +	backlight: pwm-backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm1 0 500000 PWM_POLARITY_INVERTED>;
> > +		power-supply =3D <&reg_3v3>;
> > +		brightness-levels =3D <
> > +			  0  1  2  3  4  5  6  7  8  9
> > +			 10 11 12 13 14 15 16 17 18 19
> > +			 20 21 22 23 24 25 26 27 28 29
> > +			 30 31 32 33 34 35 36 37 38 39
> > +			 40 41 42 43 44 45 46 47 48 49
> > +			 50 51 52 53 54 55 56 57 58 59
> > +			 60 61 62 63 64 65 66 67 68 69
> > +			 70 71 72 73 74 75 76 77 78 79
> > +			 80 81 82 83 84 85 86 87 88 89
> > +			 90 91 92 93 94 95 96 97 98 99
> > +			100
> > +		>;
> > +		default-brightness-level =3D <50>;
> > +	};
> > +
> > +	clocks {
> > +		ckih1 {
> > +			clock-frequency =3D <0>;
> > +		};
> > +
> > +		mclk: clock@0 {
>=20
> I would like to see these fixed rate clocks are named in a consistent
> way, maybe just drop 'reg' property and use a unique clock name to al=
ign
> with what imx51.dtsi does.
>=20
OK.

> > +			compatible =3D "fixed-clock";
> > +			reg =3D <0>;
> > +			#clock-cells =3D <0>;
> > +			clock-output-names =3D "mclk";
> > +			clock-frequency =3D <26000000>;
> > +		};
> > +
> > +		clk_26M: clock@1 {
> > +			compatible =3D "fixed-clock";
> > +			reg =3D <1>;
> > +			#clock-cells =3D <0>;
> > +			clock-output-names =3D "clk_26M";
> > +			clock-frequency =3D <26000000>;
> > +			gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
> > +		};
> > +
> > +		wlan_ref_clk: wlan-ref-clk {
> > +			compatible =3D "ti,wilink-clock";
>=20
> I do not see this compatible string is documented anywhere.  And how =
is
> this compatible string used by kernel?
>=20
This is a relic from a Test of a TI Wifi adapter.
Will be removed.

[...]
> > +	regulators {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		reg_2v5: regulator@0 {
>=20
> Device tree maintainers do not like the fake simple-bus container nod=
e.
> We are asked to put these fixed regulators directly under root node,
> with a unique node name like:
>=20
> 	reg_xxx: regulator-xxx {
> 		...
> 	};
>=20
OK.

> > +	usbphy {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		compatible =3D "simple-bus";
> > +
> > +		usbh1phy: usbphy@0 {
> > +			compatible =3D "usb-nop-xceiv";
> > +			reg =3D <0>;
> > +			clocks =3D <&clk_26M>;
> > +			clock-names =3D "main_clk";
> > +		};
>=20
> This should probably go with the same way as fixed regulators.
>=20
This is modeled exactly after the code in imx51.dtsi:
|	usbphy {
|		#address-cells =3D <1>;
|		#size-cells =3D <0>;
|		compatible =3D "simple-bus";
|
|		usbphy0: usbphy@0 {
|			compatible =3D "usb-nop-xceiv";
|			reg =3D <0>;
|			clocks =3D <&clks IMX5_CLK_USB_PHY_GATE>;
|			clock-names =3D "main_clk";
|		};
|	};

> > +	};
> > +
> > +	wlan0: tiwi-ble {
> > +		compatible =3D "ti,wilink6";
>=20
> Undocumented compatible string.
>
See above.
=20
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_wlan0>;
> > +		clocks =3D <&wlan_ref_clk>;
> > +		clock-names =3D "refclock";
> > +		interrupt-parent =3D <&gpio1>;
> > +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +};
> > +
> > +&audmux {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_ssi1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ecspi1 {
> > +	fsl,spi-num-chipselects =3D <2>;
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_ecspi1>;
> > +	cs-gpios =3D <&gpio4 24 GPIO_ACTIVE_LOW>,
> > +		   <&gpio4 25 GPIO_ACTIVE_LOW>;
> > +	status =3D "okay";
> > +
> > +	spidev0: spi@0 {
> > +		compatible =3D "spidev";
> > +		reg =3D <0>;
> > +		spi-max-frequency =3D <54000000>;
> > +	};
> > +
> > +	spidev1: spi@1 {
> > +		compatible =3D "spidev";
> > +		reg =3D <1>;
> > +		spi-max-frequency =3D <54000000>;
> > +	};
> > +};
> > +
> > +&esdhc1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_esdhc1>;
> > +	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
> > +	fsl,wp-controller;
> > +	status =3D "okay";
> > +};
> > +
> > +&esdhc2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_esdhc2 &pinctrl_wlan0>;
> > +	vmmc-supply =3D <&reg_wlan0>;
> > +	bus-width =3D <4>;
> > +	no-1-8-v;
> > +	fsl,wp-controller;
> > +	cap-sdio-irq;
> > +	non-removable;
> > +	//cd-gpios =3D <&gpio3 6 GPIO_ACTIVE_LOW>;
>=20
> Drop it.
>=20
This also stems from the Wifi adapter test...

> > +	status =3D "okay";
> > +};
> > +
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "mii";
> > +//	phy-handle =3D <&phy0>;
> > +	local-mac-address =3D [000000000000]; /* will be set by U-Boot */
> > +	status =3D "okay";
> > +
> > +	phy0: ethernet-phy@0 {
> > +		interrupt-parent =3D <&gpio3>;
> > +		interrupts =3D <18 0>;
> > +		device_type =3D "ethernet-phy";
> > +	};
>=20
> This probably works, but I think we should follow the more standard
> bindings to put it like the following?
>=20
>=20
> 	phy-handle =3D <&phy0>;
>=20
> 	mdio {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		phy0: ethernet-phy@0 {
> 			interrupt-parent =3D <&gpio3>;
> 			interrupts =3D <18 0>;
> 			device_type =3D "ethernet-phy";
> 		};
> 	};
>=20
OK.
=20
> > +};
> > +
> > +&ipu {
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_i2c2>;
> > +	status =3D "okay";
> > +
> > +	sgtl5000: sgtl5000@0a {
>=20
> Use generic name like 'codec' for node might comply to DT convention
> better.
>=20
OK.

> > +		compatible =3D "fsl,sgtl5000";
> > +		reg =3D <0x0a>;
> > +		clocks =3D <&mclk>;
> > +		VDDA-supply =3D <&reg_2v5>;
> > +		VDDIO-supply =3D <&reg_3v3>;
> > +	};
> > +
> > +	polytouch: edt-ft5x06@38 {
> > +		compatible =3D "edt,edt-ft5x06";
> > +		reg =3D <0x38>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_edt_ft5x06>;
> > +		interrupt-parent =3D <&gpio1>;
> > +		interrupts =3D <5 0>;
> > +		reset-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
> > +		wake-gpios =3D <&gpio4 9 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	touchscreen: tsc2007@48 {
>=20
> 	tsc2007: touchscreen@48 {
>=20
> > +		compatible =3D "ti,tsc2007";
> > +		reg =3D <0x48>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_tsc2007>;
> > +		interrupt-parent =3D <&gpio3>;
> > +		interrupts =3D <3 0>;
> > +		gpios =3D <&gpio3 3 GPIO_ACTIVE_LOW>;
> > +		ti,x-plate-ohms =3D <660>;
> > +		linux,wakeup;
>=20
> Use the new standard 'wakeup-source' please.
>=20
> https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commi=
t/?h=3Dimx/dt&id=3D1c49ad21c2cae607193da4495489c751d7147df2
>=20
OK.

> > +	};
> > +};
> > +
> > +&iomuxc {
>=20
> Please move the node to the bottom of the file to make the reset a bi=
t
> easier for reading.
>=20
> > +	imx51-tx51 {
>=20
> Since commit 5fcdf6a7ed95 (pinctrl: imx: Allow parsing DT without
> function nodes), this additional function container node can be saved=
=2E
>=20
OK.

> > +		pinctrl_hog: hoggrp {
> > +			fsl,pins =3D <
> > +				MX51_PAD_GPIO1_7__GPIO1_7		0x20e0	/* 26MHz osc enable */
> > +			>;
> > +		};
> > +
> > +		pinctrl_ecspi1: ecspi1grp {
> > +			fsl,pins =3D <
> > +				MX51_PAD_CSPI1_SS0__ECSPI1_SS0		0x4
> > +				MX51_PAD_CSPI1_SS1__ECSPI1_SS1		0x4
> > +				MX51_PAD_CSPI1_SCLK__ECSPI1_SCLK	0x5
> > +				MX51_PAD_CSPI1_MOSI__ECSPI1_MOSI	0x85
> > +				MX51_PAD_CSPI1_MISO__ECSPI1_MISO	0x185
> > +				MX51_PAD_CSPI1_RDY__ECSPI1_RDY		0x84
> > +			>;
> > +		};
> > +
> > +		pinctrl_edt_ft5x06: edt-ft5x056grp {
>=20
> I would suggest to not use any hyphen in pinctrl group node name to m=
ake
> the naming looks more consistent.
>=20
OK.

[...]
> > +
> > +		pinctrl_kpp: kppgrp-1 {
>=20
> The '-1' suffix means nothing and can just be dropped.
>=20
OK.

[...]
> > +&ssi1 {
> > +	fsl,mode =3D "i2s-slave";
>=20
> The "i2s-slave" of fsl,mode is deprecated and can be dropped.
>=20
OK.


Lothar Wa=C3=9Fmann
