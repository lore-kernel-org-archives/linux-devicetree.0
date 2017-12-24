From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3] ARM: sun8i: h2+: add support for Banana
 Pi M2 Zero board
Date: Sun, 24 Dec 2017 20:24:54 +0800
Message-ID: <4598591.qIIcbk4Suq@ice-x220i>
References: <20171224054029.12278-1-icenowy@aosc.io> <20171224080208.x27o2i6v6ml3im7q@plaes.org>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJFZ73IQKGQEBOA2B7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171224080208.x27o2i6v6ml3im7q-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017=E5=B9=B412=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E6=97=A5 CS=
T =E4=B8=8B=E5=8D=884:02:08=EF=BC=8CPriit Laes =E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Dec 24, 2017 at 01:40:29PM +0800, Icenowy Zheng wrote:
> > Banana Pi M2 Zero board is a H2+-based board by Sinovoip, with a form
> > factor and GPIO holes similar to Raspberry Pi Zero.
> >=20
> > It features:
> > - Allwinner H2+ SoC
> > - Single-chip (16-bit) 512MiB DDR3 DRAM
> > - Ampak AP6212 Wi-Fi/Bluetooth module
> > - MicroSD slot
> > - Two MicroUSB Type-B ports (one can only be used to power the board an=
d
> >=20
> >   the other features OTG functionality)
> >=20
> > - Two keys, a reset and a GPIO-connected key.
> > - HDMI Type-C (miniHDMI) connector connected to the HDMI part of H2+.
> > - CSI connector to connect the camera sensor provided by Sinovoip.
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> > Changes in v3:
> > - Add comments about Vbus problem in &usbphy node.
> >=20
> > Changes in v2:
> > - Use high active SD card detect on the production batch.
> >=20
> >  arch/arm/boot/dts/Makefile                         |   1 +
> >  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 162
> >  +++++++++++++++++++++ 2 files changed, 163 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dt=
s
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 0bb8db33704a..937a8768671f 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -962,6 +962,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >=20
> >  	sun8i-a83t-cubietruck-plus.dtb \
> >  	sun8i-a83t-tbs-a711.dtb \
> >  	sun8i-h2-plus-orangepi-r1.dtb \
> >=20
> > +	sun8i-h2-plus-bananapi-m2-zero.dtb \
> >=20
> >  	sun8i-h2-plus-orangepi-zero.dtb \
> >  	sun8i-h3-bananapi-m2-plus.dtb \
> >  	sun8i-h3-beelink-x2.dtb \
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts new file mode
> > 100644
> > index 000000000000..5bc182ddc5f7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > @@ -0,0 +1,162 @@
> > +/*
> > + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > + *
> > + * Based on sun8i-h3-bananapi-m2-plus.dts, which is:
> > + *   Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-h3.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +	model =3D "Banana Pi BPI-M2-Zero";
> > +	compatible =3D "sinovoip,bpi-m2-zero", "allwinner,sun8i-h2-plus";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-names =3D "default";
> > +
> > +		pwr_led {
> > +			label =3D "bananapi-m2-zero:red:pwr";
> > +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
> > +			default-state =3D "on";
> > +		};
> > +	};
> > +
> > +	gpio_keys {
> > +		compatible =3D "gpio-keys";
> > +		pinctrl-names =3D "default";
> > +
> > +		sw4 {
> > +			label =3D "power";
> > +			linux,code =3D <BTN_0>;
> > +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>;
> > +		};
> > +	};
> > +
> > +	wifi_pwrseq: wifi_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		pinctrl-names =3D "default";
> > +		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> > +	};
> > +};
> > +
> > +&ehci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc0_pins_a>;
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	bus-width =3D <4>;
> > +	/*
> > +	 * On the production batch of this board the card detect GPIO is
> > +	 * high active (card inserted), although on the early samples it's
> > +	 * low active.
> > +	 */
>=20
> Is there a way to differentiate between early samples and production
> batches? Board markings, etc?

in fact there's no significant markings to differentiate them.

Howeverm the early samples are never sold; you will know it's an
early sample if you manage to get it from Sinovoip.

>=20
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc1_pins_a>;
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	vqmmc-supply =3D <&reg_vcc3v3>;
> > +	mmc-pwrseq =3D <&wifi_pwrseq>;
> > +	bus-width =3D <4>;
> > +	non-removable;
> > +	status =3D "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		reg =3D <1>;
> > +		compatible =3D "brcm,bcm4329-fmac";
> > +		interrupt-parent =3D <&pio>;
> > +		interrupts =3D <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
> > +		interrupt-names =3D "host-wake";
> > +	};
> > +};
> > +
> > +&ohci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode =3D "otg";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb0_id_det-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> > +	/*
> > +	 * There're two micro-USB connectors, one is power-only and another i=
s
> > +	 * OTG. The Vbus of these two connectors are connected together, so
> > +	 * the external USB device will be powered just by the power input
> > +	 * from the power-only USB port.
> > +	 */
> > +	status =3D "okay";
> > +};


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
