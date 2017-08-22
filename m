From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: Add board dts file for Banana Pi M2
 Ultra
Date: Tue, 22 Aug 2017 22:10:43 +0200
Message-ID: <20170822201043.vdweyevkxvjbzrwt@flea.home>
References: <20170822061742.40869-1-icenowy@aosc.io>
 <20170822061742.40869-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zg4zksebpdfma2qb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822061742.40869-2-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zg4zksebpdfma2qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 22, 2017 at 02:17:41PM +0800, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>=20
> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
> form factor and position of various connectors, leds and buttons is
> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
> as the latest Banana Pi M64.
>=20
> It features:
>=20
>   - X-Powers AXP221s PMIC connected to i2c0
>   - 2 GB DDR3 DRAM
>   - 8 GB eMMC
>   - micro SD card slot
>   - DC power jack
>   - HDMI output
>   - MIPI DSI connector
>   - 2x USB 2.0 hosts
>   - 1x USB 2.0 OTG
>   - gigabit ethernet with Realtek RTL8211E transceiver
>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>   - SATA and power connectors for native SATA support
>   - camera sensor connector
>   - consumer IR receiver
>   - audio out headphone jack
>   - onboard microphone
>   - red, green, and blue LEDs
>   - debug UART pins
>   - Li-Po battery connector
>   - Raspberry Pi B+ compatible GPIO header
>   - power, reset, and boot control buttons
>=20
> This patch adds a dts file that enables UART, MMC and PMIC support.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                        |   1 +
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 181 ++++++++++++++++=
++++++
>  2 files changed, 182 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 570e107bf702..e0b1ed3e2e24 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -927,6 +927,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-h3-orangepi-plus2e.dtb \
>  	sun8i-r16-bananapi-m2m.dtb \
>  	sun8i-r16-parrot.dtb \
> +	sun8i-r40-bananapi-m2-ultra.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm=
/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> new file mode 100644
> index 000000000000..daf55556036f
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -0,0 +1,181 @@
> +/*
> + * Copyright (C) 2017 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
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
> +#include "sun8i-r40.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model =3D "Banana Pi BPI-M2-Ultra";
> +	compatible =3D "sinovoip,bpi-m2-ultra", "allwinner,sun8i-r40";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};

Missing newline

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		pwr-led {
> +			label =3D "bananapi:red:pwr";
> +			gpios =3D <&pio 7 20 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		user-led-green {
> +			label =3D "bananapi:green:user";
> +			gpios =3D <&pio 7 21 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		user-led-blue {
> +			label =3D "bananapi:blue:user";
> +			gpios =3D <&pio 7 22 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> +	};
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	axp22x: pmic@34 {
> +		compatible =3D "x-powers,axp221";
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "avcc";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1500000>;
> +	regulator-max-microvolt =3D <1500000>;
> +	regulator-name =3D "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt =3D <1800000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi-io";
> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi";
> +};
> +
> +&reg_vcc5v0 {
> +	gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> +	enable-active-high;
> +};

That regulator is unused, and the GPIO is marked to be unused on the schema=
tics.

> +&mmc0 {
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pg_pins>;
> +	vmmc-supply =3D <&reg_dldo2>;
> +	vqmmc-supply =3D <&reg_dldo1>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&mmc2 {
> +	vmmc-supply =3D <&reg_dcdc1>;
> +	vqmmc-supply =3D <&reg_dcdc1>;

You don't need vqmmc here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zg4zksebpdfma2qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnI/CAAoJEBx+YmzsjxAgJzEQALmty2//oBpZsNhca41Q/6lC
U0XRbg5QTokEsamWRdp6fyBNq4igU6V5ih9BR3CYOUlKY3aJU2/WASuIxY4Ziayr
dWBEsMnYKsaZUOBAqsEY868XByu1mv+SyU8+Vfs8LApads43MZRzYuJGhZf23Lxn
rXvIzua+9pzI2i/JQ0r+QnS0gn6UZTGHxWdFaSRyPOo0VxtOGkEiFz26bgUjbwef
8XWxWiKjXDC8/dWHoHxpfzDZrLB1kfpxXUbh1PuqkLtcBdVm8dCSGmVpmb0syJqR
Cv2NHChIWeoHaR2iC7nHq8l0bSqSRHV5eKP+TUS6qHvx2td1iANUyIIqjNy9l2BR
CEUsgWGXrbzUETGQ3HEJ5awYCCKc8zh6Fcr1H3OA4tEEKJrPEr5jMpHxb2LXubjC
+7ztVbOQU4E65lCUyiQAYHVETiKtRwn+27wB9vFZQwcgIXT8wDdYZAuCKWOAg57/
CNJi/Gc/bJztImGCBpVZZF79Wncht23stwJUkjMRTFZuNm7A/y+d8l7UTbg+jh/+
C1Lq440O34+hWTNW9yWeHgZZRKwBlAr0jLbZyg6rroA6hT/SqXRUsmcc4YYulzWd
jWmJQYPJSg+u5jqA7WgCV6P8D6HINAd0EAgDSkgXo+l+pPl2dVcIPQZWhNfOUHnV
jdqxrndJOciJY41n//0Q
=NCTm
-----END PGP SIGNATURE-----

--zg4zksebpdfma2qb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
