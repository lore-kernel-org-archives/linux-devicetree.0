From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: at91: dts: sama5d4: add dts for sama5d4 xplained
 board
Date: Wed, 4 Mar 2015 12:07:53 +0100
Message-ID: <54F6E789.5080508@atmel.com>
References: <1425437508-30976-1-git-send-email-josh.wu@atmel.com> <1425437508-30976-2-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425437508-30976-2-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 04/03/2015 03:51, Josh Wu a =E9crit :
> Add at91 sama5d4 xplained board support.
>=20
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>=20
> Changes in v4:
> - Thanks to Bo Shen to find following leds issues:
>     1. the leds' label is changed in new xplained board.
>     2. as piod bank is disabled in sama5d4, that will whole led drive=
r
> not work. So just disable the led which used piod.
>=20
> Changes in v3:
> - add phy0 child node under macb0
> - rebase on top of linux next, re-formated the arch/arm/boot/dts/Make=
file
>=20
> Changes in v2:
> - to be sorted by memory address, put the adc dt node after usart4.
>=20
>  arch/arm/boot/dts/Makefile                  |   3 +-
>  arch/arm/boot/dts/at91-sama5d4_xplained.dts | 239 ++++++++++++++++++=
++++++++++
>  2 files changed, 241 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/at91-sama5d4_xplained.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a1c776b..5c189a5 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -42,7 +42,8 @@ dtb-$(CONFIG_SOC_SAM_V7) +=3D \
>  	sama5d34ek.dtb \
>  	sama5d35ek.dtb \
>  	sama5d36ek.dtb \
> -	at91-sama5d4ek.dtb
> +	at91-sama5d4ek.dtb \
> +	at91-sama5d4_xplained.dtb
>  dtb-$(CONFIG_ARCH_ATLAS6) +=3D \
>  	atlas6-evb.dtb
>  dtb-$(CONFIG_ARCH_ATLAS7) +=3D \
> diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d4_xplained.dts
> new file mode 100644
> index 0000000..af8f4f5
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
> @@ -0,0 +1,239 @@
> +/*
> + * at91-sama5d4_xplained.dts - Device Tree file for SAMA5D4 Xplained=
 board
> + *
> + *  Copyright (C) 2015 Atmel,
> + *                2015 Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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
> +
> +/ {
> +	model =3D "Atmel SAMA5D4 Xplained";
> +	compatible =3D "atmel,sama5d4-xplained", "atmel,sama5d4", "atmel,sa=
ma5";
> +
> +	chosen {
> +		bootargs =3D "console=3DttyS0,115200 ignore_loglevel earlyprintk";
> +	};
> +
> +	memory {
> +		reg =3D <0x20000000 0x20000000>;
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
> +
> +		slow_xtal {
> +			clock-frequency =3D <32768>;
> +		};
> +
> +		main_xtal {
> +			clock-frequency =3D <12000000>;
> +		};
> +	};
> +
> +	ahb {
> +		apb {
> +			spi0: spi@f8010000 {
> +				cs-gpios =3D <&pioC 3 0>, <0>, <0>, <0>;
> +				status =3D "okay";
> +				m25p80@0 {
> +					compatible =3D "atmel,at25df321a";
> +					spi-max-frequency =3D <50000000>;
> +					reg =3D <0>;
> +				};
> +			};
> +
> +			macb0: ethernet@f8020000 {
> +				phy-mode =3D "rmii";
> +				status =3D "okay";
> +
> +				phy0: ethernet-phy@1 {
> +					interrupt-parent =3D <&pioE>;
> +					interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +					reg =3D <1>;
> +				};
> +			};
> +
> +			mmc1: mmc@fc000000 {
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &=
pinctrl_mmc1_cd>;
> +				status =3D "okay";
> +				slot@0 {
> +					reg =3D <0>;
> +					bus-width =3D <4>;
> +					cd-gpios =3D <&pioE 3 0>;
> +				};
> +			};
> +
> +			usart3: serial@fc00c000 {
> +				status =3D "okay";
> +			};
> +
> +			usart4: serial@fc010000 {
> +				status =3D "okay";
> +			};
> +
> +			adc0: adc@fc034000 {
> +				atmel,adc-vref =3D <3300>;
> +				status =3D "okay";
> +			};
> +
> +			watchdog@fc068640 {
> +				status =3D "okay";
> +			};
> +
> +			pinctrl@fc06a000 {
> +				board {
> +					pinctrl_mmc1_cd: mmc1_cd {
> +						atmel,pins =3D
> +							<AT91_PIOE 3 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
> +					};
> +					pinctrl_usba_vbus: usba_vbus {
> +						atmel,pins =3D
> +							<AT91_PIOE 31 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>;
> +					};
> +					pinctrl_key_gpio: key_gpio_0 {
> +						atmel,pins =3D
> +							<AT91_PIOE 8 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;=
 /* PE13 gpio */

Nit: useless comment which is wrong. I remove it.



> +					};
> +				};
> +			};
> +		};
> +
> +		usb0: gadget@00400000 {
> +			atmel,vbus-gpio =3D <&pioE 31 GPIO_ACTIVE_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_usba_vbus>;
> +			status =3D "okay";
> +		};
> +
> +		usb1: ohci@00500000 {
> +			num-ports =3D <3>;
> +			atmel,vbus-gpio =3D <0
> +					   &pioE 11 GPIO_ACTIVE_HIGH
> +					   &pioE 14 GPIO_ACTIVE_HIGH
> +					  >;
> +			status =3D "okay";
> +		};
> +
> +		usb2: ehci@00600000 {
> +			status =3D "okay";
> +		};
> +
> +		nand0: nand@80000000 {
> +			nand-bus-width =3D <8>;
> +			nand-ecc-mode =3D "hw";
> +			nand-on-flash-bbt;
> +			atmel,has-pmecc;
> +			status =3D "okay";
> +
> +			at91bootstrap@0 {
> +				label =3D "at91bootstrap";
> +				reg =3D <0x0 0x40000>;
> +			};
> +
> +			bootloader@40000 {
> +				label =3D "bootloader";
> +				reg =3D <0x40000 0x80000>;
> +			};
> +
> +			bootloaderenv@c0000 {
> +				label =3D "bootloader env";
> +				reg =3D <0xc0000 0xc0000>;
> +			};
> +
> +			dtb@180000 {
> +				label =3D "device tree";
> +				reg =3D <0x180000 0x80000>;
> +			};
> +
> +			kernel@200000 {
> +				label =3D "kernel";
> +				reg =3D <0x200000 0x600000>;
> +			};
> +
> +			rootfs@800000 {
> +				label =3D "rootfs";
> +				reg =3D <0x800000 0x0f800000>;
> +			};
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_key_gpio>;
> +
> +		pb_user1 {
> +			label =3D "pb_user1";
> +			gpios =3D <&pioE 8 GPIO_ACTIVE_HIGH>;
> +			linux,code =3D <0x100>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		status =3D "okay";
> +
> +		d8 {
> +			label =3D "d8";
> +			gpios =3D <&pioD 30 GPIO_ACTIVE_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		d10 {
> +			label =3D "d10";
> +			gpios =3D <&pioE 15 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
>=20

Otherwise, it's okay:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I take it for at91-4.1-dt (no need to respin it).

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
