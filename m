From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Wed, 23 Nov 2016 08:57:13 +0100
Message-ID: <20161123075713.ks6gmud3rszjbdsh@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0469401033034470892=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161121162421.800-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Andre Przywara <andre.przywara@arm.com>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0469401033034470892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnhpomsqxvao6b3f"
Content-Disposition: inline


--qnhpomsqxvao6b3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 12:24:20AM +0800, Icenowy Zheng wrote:
> Orange Pi Zero is a board that came with the new Allwinner H2+ SoC.
>=20
> Add a device tree file for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes since v2:
> - Use generic pinconf binding instead of legacy allwinner pinctrl binding.
> - removed uart3, which is not accessible on Orange Pi Zero.
> - Removed sun8i-h2plus.dtsi and make Orange Pi Zero dts directly include
>   sun8i-h3.dtsi.
> - Removed allwinner,sun8i-h3 compatible.
>=20
>  arch/arm/boot/dts/Makefile                       |   1 +
>  arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts | 137 +++++++++++++++++=
++++++

Ditto, h2-plus-orangepi-zero.

>  2 files changed, 138 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 802a10d..51a1dd7 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -834,6 +834,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a33-sinlinx-sina33.dtb \
>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-cubietruck-plus.dtb \
> +	sun8i-h2plus-orangepi-zero.dtb \
>  	sun8i-h3-bananapi-m2-plus.dtb \
>  	sun8i-h3-nanopi-neo.dtb \
>  	sun8i-h3-orangepi-2.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts b/arch/arm/=
boot/dts/sun8i-h2plus-orangepi-zero.dts
> new file mode 100644
> index 0000000..b428e47
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> @@ -0,0 +1,137 @@
> +/*
> + * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
> + *
> + * Based on sun8i-h3-orangepi-one.dts, which is:
> + *   Copyright (C) 2016 Hans de Goede <hdegoede@redhat.com>
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
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Xunlong Orange Pi Zero";
> +	compatible =3D "xunlong,orangepi-zero", "allwinner,sun8i-h2plus";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&leds_opi0>, <&leds_r_opi0>;
> +
> +		pwr_led {
> +			label =3D "orangepi:green:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		status_led {
> +			label =3D "orangepi:red:status";
> +			gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	leds_opi0: led_pins@0 {
> +		pins =3D "PA17";
> +		function =3D "gpio_out";
> +	};
> +};
> +
> +&r_pio {
> +	leds_r_opi0: led_pins@0 {
> +		pins =3D "PL10";
> +		function =3D "gpio_out";
> +	};
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
> +	pinctrl-0 =3D <&uart1_pins>;
> +	status =3D "disabled";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_pins>;
> +	status =3D "disabled";
> +};

I'm not sure you answered me on this one. Are those exposed on the
headers? why did you put them as disabled here?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qnhpomsqxvao6b3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNUvZAAoJEBx+YmzsjxAgAH0QAKQGtfMscpAu5UjeQ15rHnSH
9Y1QghQwZamjJ71HnTWsLHb+NN93XB43OeCoRPRQldlpYfw5fBOIuJ2/Fx37NmWX
ydaNWkcZW+hRacFVoz0Fbwvq9QdrCPOS2qAGE+/xoJsVdpjOysQeoj+ENjaHg65g
C+8/5DU/ta0cAsttcSdAaggKNUm3APIlVhyHm/a6woRrf0fig6bxYmDJaA5TPZHN
dihT1g/bhvuYy2XEus4IJpvNPrnz7/15sbDdlqc8cMhvarqDFjcemzmcjxD6jdG8
s9RAVSuTFbt4cF+1szTvZLQcxPN1GtyKQljAMXJpOhGflusdB4P1wXZHDC2/TNj+
qd4ibemhLdIG7EDzWl4kJBIxNG2t9ZVehi51+ETAbx05rrm4jokKIH+u18SIM+Fx
XuadidWDVMk7YKWfNkDtWHI3ja8MQyRPlNwyAvBdLjMP2M+Unxknqnls6mRtWHGQ
TjGBMQQ/tx7AMY2hDp/591MqtPD+zSvAlax8rG71/0bFMciOyGqqb6bpsvZzMl7C
Be7EZNMYWY/QkbRFfmQSyNts0QmVaoAtqsDmvo7VYUQMlGgiVohEV8fnWKgmLsSw
JYFwxQq+ZgGW57HzIn3dbJI/d9FQNAkglZm5XN02p4soZ1nvQiCq2vWhA64kz9/6
0Cz6CS6fjd9Oxt9YDUrq
=e9zM
-----END PGP SIGNATURE-----

--qnhpomsqxvao6b3f--


--===============0469401033034470892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0469401033034470892==--
