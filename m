From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add support for Ka-Ro TX51
Date: Mon, 23 Jun 2014 12:18:39 +0200
Message-ID: <20140623121839.679f35ee@ipc1.ka-ro>
References: <1402578584-12640-1-git-send-email-LW@KARO-electronics.de>
 <20140618150152.GP8860@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140618150152.GP8860@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Shawn Guo wrote:
> On Thu, Jun 12, 2014 at 03:09:44PM +0200, Lothar Wa=C3=9Fmann wrote:
> > Add support for Ka-Ro electronics i.MX51 based TX51 modules
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/Makefile       |    1 +
> >  arch/arm/boot/dts/imx51-tx51.dts |  620 ++++++++++++++++++++++++++=
++++++++++++
> >  2 files changed, 621 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx51-tx51.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
> > index 0f1e8be..8dd4dbc 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
> >  	imx51-babbage.dtb \
> >  	imx51-digi-connectcore-jsk.dtb \
> >  	imx51-eukrea-mbimxsd51-baseboard.dtb \
> > +	imx51-tx51.dtb \
> >  	imx53-ard.dtb \
> >  	imx53-m53evk.dtb \
> >  	imx53-mba53.dtb \
> > diff --git a/arch/arm/boot/dts/imx51-tx51.dts b/arch/arm/boot/dts/i=
mx51-tx51.dts
> > new file mode 100644
> > index 0000000..9ae7758
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx51-tx51.dts
> > @@ -0,0 +1,620 @@
> > +/*
> > + * Copyright 2012-2014 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org=
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
> > +
> > +/dts-v1/;
> > +#include "imx51.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
>=20
> imx51.dtsi already includes them.
>=20
OK.

> > +#include <dt-bindings/pwm/pwm.h>
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
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D &uart1;
> > +	};
> > +
> > +	backlight: pwm-backlight {
> > +		compatible =3D "pwm-backlight";
> > +
>=20
> Drop this new line.
>=20
OK.

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
> > +			compatible =3D "fixed-clock";
> > +			reg =3D <0>;
> > +			#clock-cells =3D <0>;
> > +			clock-frequency =3D <27000000>;
> > +		};
> > +
> > +		clk_26M: clock@1 {
>=20
> When using generic name, you will need clock-output-names property.
> Otherwise, the clocks will fail in registration except the first one,
> because of clock name collision.
>=20
Didn't recognize that yet.

[...]
> > +	usbphy {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		compatible =3D "simple-bus";
> > +
> > +		usbh1phy: usbh1phy@0 {
>=20
> The node name should be something generic like usbphy?
>=20
OK.

> > +			compatible =3D "usb-nop-xceiv";
> > +			reg =3D <0>;
> > +			clocks =3D <&clk_26M>;
> > +			clock-names =3D "main_clk";
> > +		};
> > +	};
> > +};
> > +
> > +&audmux {
> > +	status =3D "okay";
> > +};
> > +
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "mii";
> > +//	phy-reset-gpios =3D <&gpio2 14 GPIO_ACTIVE_LOW>;
>=20
> Drop it?
>=20
Leftover from debugging...

> > +	phy-handle =3D <&phy0>;
> > +	mac-address =3D [000000000000]; /* will be set by U-Boot */
>=20
> Shouldn't it be local-mac-address?
>=20
probably yes, but both 'mac-address' and 'local-mac-address' are being
set up by U-Boot anyway.

[...]
> > +&ipu_di0_disp0 {
> > +	remote-endpoint =3D <&display0_in>;
> > +};
> > +
> > +&kpp {
> > +	status =3D "okay";
>=20
> Put 'status' at the bottom of property list.
>
OK.

> > +
> > +	linux,keymap =3D <	/* sample keymap */
> > +		MATRIX_KEY(0, 0, KEY_POWER)
> > +		MATRIX_KEY(0, 1, KEY_KP0)
> > +		MATRIX_KEY(0, 2, KEY_KP1)
> > +		MATRIX_KEY(0, 3, KEY_KP2)
> > +		MATRIX_KEY(1, 0, KEY_KP3)
> > +		MATRIX_KEY(1, 1, KEY_KP4)
> > +		MATRIX_KEY(1, 2, KEY_KP5)
> > +		MATRIX_KEY(1, 3, KEY_KP6)
> > +		MATRIX_KEY(2, 0, KEY_KP7)
> > +		MATRIX_KEY(2, 1, KEY_KP8)
> > +		MATRIX_KEY(2, 2, KEY_KP9)
> > +	>;
> > +};
> > +
> > +&esdhc1 {
> > +	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
> > +	fsl,wp-controller;
>=20
> Does it work for you, since the driver does not support it as of toda=
y?
>=20
What driver doesn't support what?
AFAICT the sdhci-esdhc-imx.c driver supports both of these properties.

> > +	status =3D "okay";
> > +};
> > +
> > +&esdhc2 {
> > +	cd-gpios =3D <&gpio3 6 GPIO_ACTIVE_LOW>;
> > +	fsl,wp-controller;
> > +	status =3D "okay";
> > +};
> > +
> > +&pwm1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_pwm1>;
> > +};
> > +
> > +&ecspi1 {
> > +	fsl,spi-num-chipselects =3D <2>;
> > +	cs-gpios =3D <&gpio4 24 GPIO_ACTIVE_LOW &gpio4 25 GPIO_ACTIVE_LOW=
>;
>=20
> More readable to write it like below?
>=20
> 	cs-gpios =3D <&gpio4 24 GPIO_ACTIVE_LOW>,
> 		   <&gpio4 25 GPIO_ACTIVE_LOW>;
>=20
OK.

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
>=20
> I'm not sure we should have these two devices.
>=20
Why not? With this the SPI bus can readily be used with the spidev
driver from Documentation/spi/spidev_test.c (which is what most of our
customers are asking for)!

> > +};
> > +
> > +&ssi1 {
> > +	fsl,mode =3D "i2s-slave";
> > +	codec-handle =3D <&sgtl5000>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ssi2 {
> > +	status =3D "disabled";
> > +};
>=20
> Why is this needed, since the device is disabled in imx51.dtsi?
>=20
That's included here as a placeholder in case someone wants to enable
the second SSI interface so that they...

> > +&nfc {
>=20
> Please sort the nodes alphabetically.
>=20
=2E..won't have this problem. ;)


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
