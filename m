From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sama5d4: add support for Ka-Ro electronics
 TXA5 modules
Date: Mon, 25 Jan 2016 14:40:03 +0100
Message-ID: <56A625B3.2070709@atmel.com>
References: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
 <1453293337-16078-4-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453293337-16078-4-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 20/01/2016 13:35, Lothar Wa=C3=9Fmann a =C3=A9crit :
> The TXA5-5010/-5011 are Computers On Module manufactured by
>   Ka-Ro electronics GmbH with the following characteristics:
>   Processor    Atmel SAMA5D42, 528 MHz
>   RAM          256MB 32-bit DDR2 SDRAM
>   ROM          128MB NAND Flash (TXA5-5010) / 4GB eMMC (TXA5-5011)
>   Power supply Single 3.1V to 5.5V
>   Size         26mm SO-DIMM
>   Temp. Range  -40=C2=B0C/-25=C2=B0C to 85=C2=B0C
>=20
> Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>

Once remarks by Alexandre are addressed, you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
as well. It's good to see your board integrated in Linux Mainline:
thanks! We'll queue it in a couple of weeks for inclusion in at91-4.6-d=
t
branch.

Bye,


> ---
>  arch/arm/boot/dts/Makefile                   |   1 +
>  arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts | 217 +++++++++++++++++=
++++++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a4a6d70..8fbc0cb 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -49,6 +49,7 @@ dtb-$(CONFIG_SOC_SAM_V7) +=3D \
>  	sama5d35ek.dtb \
>  	sama5d36ek.dtb \
>  	at91-sama5d4_ma5d4evk.dtb \
> +	at91-sama5d4-txa5-5010.dtb \
>  	at91-sama5d4_xplained.dtb \
>  	at91-sama5d4ek.dtb \
>  	at91-vinco.dtb
> diff --git a/arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts b/arch/arm/=
boot/dts/at91-sama5d4-txa5-5010.dts
> new file mode 100644
> index 0000000..fb4a253
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts
> @@ -0,0 +1,217 @@
> +/*
> + * at91-sama5d4-txa5.dts - Device Tree file for Ka-Ro electronics TX=
A5 module
> + *
> + *  Copyright (C) 2015 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> + *  based on: at91-sama5d4_xplained.dts
> + *            Copyright (C) 2015 Atmel,
> + *                          2015 Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License a=
s
> + *     published by the Free Software Foundation; either version 2 o=
f the
> + *     License, or (at your option) any later version.
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
> +/dts-v1/;
> +#include "sama5d4.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model =3D "Ka-Ro SAMA5D4 TXA5";
> +	compatible =3D "atmel,sama5d4-txa5", "atmel,sama5d4", "atmel,sama5"=
;
> +
> +	aliases {
> +		display =3D &display;
> +		ethernet0 =3D &macb0;
> +		serial0 =3D &usart0;
> +		serial1 =3D &usart1;
> +		serial2 =3D &usart3;
> +		spi0 =3D &spi0;
> +	};
> +
> +	clocks {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		main_clock: clock@0 {
> +			compatible =3D "atmel,osc", "fixed-clock";
> +			clock-frequency =3D <12000000>;
> +		};
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&hlcdc_pwm 0 500000 PWM_POLARITY_INVERTED>;
> +	};
> +
> +	display: display {
> +		display-timings {
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		status =3D "okay";
> +
> +		heartbeat {
> +			label =3D "heartbeat";
> +			gpios =3D <&pioD 29 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
> +
> +&adc0 {
> +	atmel,adc-vref =3D <3300>;
> +	status =3D "okay";
> +};
> +
> +&hlcdc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lcd_rgb888>;
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +};
> +
> +&macb0 {
> +	phy-mode =3D "rmii";
> +	status =3D "okay";
> +
> +	phy0: ethernet-phy@1 {
> +		interrupt-parent =3D <&pioE>;
> +		interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +		reg =3D <1>;
> +	};
> +};
> +
> +&main_xtal {
> +	clock-frequency =3D <12000000>;
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &pin=
ctrl_mmc1_cd>;
> +	status =3D "okay";
> +	slot@0 {
> +		reg =3D <0>;
> +		bus-width =3D <4>;
> +		cd-gpios =3D <&pioE 3 0>;
> +	};
> +};
> +
> +&nand0 {
> +	nand-bus-width =3D <8>;
> +	nand-ecc-mode =3D "hw";
> +	nand-on-flash-bbt;
> +	atmel,has-pmecc;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	sama5d4-txa5 {
> +		pinctrl_mmc1_cd: mmc1-cd {
> +			atmel,pins =3D <AT91_PIOE 6 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP=
_DEGLITCH>;
> +		};
> +
> +		pinctrl_spi0_cs: spi0 {
> +			atmel,pins =3D <
> +				AT91_PIOB 21 AT91_PERIPH_GPIO 0					/* CSPI_SS0 */
> +				AT91_PIOB 22 AT91_PERIPH_GPIO 0					/* CSPI_SS1 */
> +				AT91_PIOB 23 AT91_PERIPH_GPIO 0					/* CSPI_RDY */
> +			>;
> +		};
> +
> +		pinctrl_usba_vbus: usba-vbus {
> +			atmel,pins =3D <
> +				AT91_PIOE 10 AT91_PERIPH_GPIO 0					/* USBOTG_VBUSEN */
> +				AT91_PIOD 8 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH	/* US=
BOTG_OC */
> +			>;
> +		};
> +
> +		pinctrl_usbb_vbus: usbb-vbus {
> +			atmel,pins =3D <
> +				AT91_PIOE 11 AT91_PERIPH_GPIO 0					/* USBH_VBUSEN */
> +				AT91_PIOD 9 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH	/* US=
BH_OC */
> +			>;
> +		};
> +	};
> +};
> +
> +&slow_xtal {
> +	clock-frequency =3D <32768>;
> +};
> +
> +&spi0 {
> +	cs-gpios =3D <&pioB 21 0>, <&pioB 22 0>, <0>, <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi0 &pinctrl_spi0_cs>;
> +	status =3D "okay";
> +};
> +
> +&usart0 {
> +	status =3D "okay";
> +};
> +
> +&usart1 {
> +	status =3D "okay";
> +};
> +
> +&usart3 {
> +	status =3D "okay";
> +};
> +
> +&usb0 {
> +	atmel,vbus-gpio =3D <&pioE 10 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usba_vbus>;
> +	status =3D "okay";
> +};
> +
> +&usb1 {
> +	num-ports =3D <1>;
> +	atmel,vbus-gpio =3D <&pioE 11 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usbb_vbus>;
> +	status =3D "okay";
> +};
> +
> +&watchdog {
> +	status =3D "okay";
> +};
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
