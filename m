From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: h2+: add support for Banana Pi M2 Zero board
Date: Thu, 2 Nov 2017 10:02:48 +0100
Message-ID: <20171102090248.wnvj7dpphn5uqsut@flea>
References: <20171101093814.19177-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7bvkf4hiduxrzk2m"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101093814.19177-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7bvkf4hiduxrzk2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 01, 2017 at 05:38:14PM +0800, Icenowy Zheng wrote:
> Banana Pi M2 Zero board is a H2+-based board by Sinovoip, with a form
> factor and GPIO holes similar to Raspberry Pi Zero.
>=20
> It features:
> - Allwinner H2+ SoC
> - Single-chip (16-bit) 512MiB DDR3 DRAM
> - Ampak AP6212 Wi-Fi/Bluetooth module
> - MicroSD slot
> - Two MicroUSB Type-B ports (one can only be used to power the board and
>   the other features OTG functionality)
> - Two keys, a reset and a GPIO-connected key.
> - HDMI Type-C (miniHDMI) connector connected to the HDMI part of H2+.
> - CSI connector to connect the camera sensor provided by Sinovoip.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 156 +++++++++++++++=
++++++
>  2 files changed, 157 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3a5b79fd8198..803dbdf03916 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -930,6 +930,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a83t-bananapi-m3.dtb \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-a83t-tbs-a711.dtb \
> +	sun8i-h2-plus-bananapi-m2-zero.dtb \
>  	sun8i-h2-plus-orangepi-zero.dtb \
>  	sun8i-h3-bananapi-m2-plus.dtb \
>  	sun8i-h3-beelink-x2.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/=
arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> new file mode 100644
> index 000000000000..414258da4308
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> @@ -0,0 +1,156 @@
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> + *
> + * Based on sun8i-h3-bananapi-m2-plus.dts, which is:
> + *   Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
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
> +
> +/dts-v1/;
> +#include "sun8i-h3.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model =3D "Banana Pi BPI-M2-Zero";
> +	compatible =3D "sinovoip,bpi-m2-zero", "allwinner,sun8i-h2-plus";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";

This property is useless

> +
> +		pwr_led {
> +			label =3D "bananapi-m2-zero:red:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
> +			default-state =3D "on";
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";

Same thing here.

> +
> +		sw4 {

That node should be called power.

> +			label =3D "power";
> +			linux,code =3D <BTN_0>;
> +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";

That property is useless

> +		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> +	};
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	/*
> +	 * In different revisions the board have different card detect
> +	 * configuration.
> +	 */

Which ones?

> +	broken-cd;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	vqmmc-supply =3D <&reg_vcc3v3>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
> +		interrupt-names =3D "host-wake";
> +	};
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> +	/* USB OTG VBUS is directly connected to 5V without any regulators */

So it cannot operate in OTG, but it's host only?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7bvkf4hiduxrzk2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ+t84AAoJEBx+YmzsjxAg2/gP/1p+/W+7ySwe/VHeaOvRCXu6
5o8JiHZ/tSQkIAmAiTIehvr0P5jtAnXqnIGpLqnmXJTTfso41qUXvzMHIN3WsW/5
vsSTsFioWwnu6TawLlPGvkiMraMuOw97GlZi2/RVyGMiNWWk3ksJZsbtX7aRmjhR
lvBeCHwN33Py0LTnWC1H8UEweKUCsXqQEmp1h5rMxPnn0VJn/kwijEPYSLbLucFF
4n4mhNSu8UGAPpHJks90imkK0OVl8wLTCd12KrMKGWjSjUytfEcLxs6jJW6MZvDO
eD7rOe6I3ERFE2nWs0wvBcPOfspZHCpIZ8vjFTbV1qEsxL6BsUCdoiyAMREUzus4
X4bvaV2C0YvdMAquZdbv1jKWldkKP+dc1ahWcf7Hlk3H4gAb6cSK6AfOtseIZgqe
PN4YUu6eQsfFyVsv4tnoYeNmQVN0mGkx0gPZIUhl/b0UIdGQE3sbhJYT5yuoXz4/
Ys78plNwb/vZ+WKzUFIIGUfnyxwsvOCNcw4x54EoO8avWcR0aMxF73tOritcmeDD
YfAZvcFqmtC/wb1ZHz+Tnld1A18MAyuqP/P9hVnI1QZvTujoJaqM8/nrT5d2RKlL
h0iTuaQxG+9FKJTyOF4xDZwTZUHWOCuK9lddMkENVZCTdc0G9gJFnza6AITazbw6
HXurc09Lu3DOpLiAIFoH
=FKOj
-----END PGP SIGNATURE-----

--7bvkf4hiduxrzk2m--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
