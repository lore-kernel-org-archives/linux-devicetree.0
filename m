From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: allwinner: H5: Add Xunlong Orange Pi Zero Plus
Date: Mon, 12 Mar 2018 10:02:08 +0100
Message-ID: <20180312090208.jjssbgf5t5y5dj7o@flea>
References: <20180311155932.20945-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4968625937168459571=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180311155932.20945-1-hauke@hauke-m.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, wens@csie.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4968625937168459571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="foz7uz6ci36t7tfy"
Content-Disposition: inline


--foz7uz6ci36t7tfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 11, 2018 at 04:59:32PM +0100, Hauke Mehrtens wrote:
> The Xunlong Orange Pi Zero Plus is single board computer.
> - H5 Quad-core 64-bit Cortex-A53
> - 512MB DDR3
> - microSD slot
> - Debug TTL UART
> - 1000M/100M/10M Ethernet RJ45
> - Realtek RTL8189FTV
> - Spi flash (2MB)
> - One USB 2.0 HOST, One USB 2.0 OTG
>=20
> This is based on a patch from armbian:
> https://github.com/armbian/build/blob/master/patch/kernel/sunxi-next/sunx=
i-add-orangepi-zero-plus.patch
>=20
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts | 192 +++++++++++++++=
++++++
>  2 files changed, 193 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero=
-plus.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index f505227b0250..d9d239affbcf 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard=
=2Edtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus.dtb

Putting it before the Plus2 would make more sense

>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-nanopi-neo2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-nanopi-neo-plus2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
> new file mode 100644
> index 000000000000..52b29f3706a7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
> @@ -0,0 +1,192 @@
> +/*
> + * Copyright (C) 2016 ARM Ltd.

Is it?

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

Also, please use an SPDX tag instead of the full license description.

> + */
> +
> +/dts-v1/;
> +#include "sun50i-h5.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Xunlong Orange Pi Zero Plus";
> +	compatible =3D "xunlong,orangepi-zero-plus", "allwinner,sun50i-h5";
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	aliases {
> +		ethernet0 =3D &emac;
> +		ethernet1 =3D &rtl8189ftv;
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		pwr {
> +			label =3D "orangepi:green:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		status {
> +			label =3D "orangepi:red:status";
> +			gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	reg_gmac_3v3: gmac-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "gmac-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <100000>;
> +		enable-active-high;
> +		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	reg_usb0_vbus: usb0-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb0-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		enable-active-high;
> +		gpio =3D <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */

It doesn't look to be right judging from the schematics. That pin
doesn't control whether VBUS is enabled or not, it doesn't seem to be
enabled at all.

Looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--foz7uz6ci36t7tfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqmQg8ACgkQ0rTAlCFN
r3QD2w/+JrykA7h4X1kcQ2iXP66ILioaoIbKbz2KsqZPvktsz8D+tOgL6XP6SHj0
gnmQUtlf2FaxKbETxL5jCcEbFizEZbjE2r1CN0cWZgB34Hv0XkDiv5rtMM+SWNHN
KTWmyU9K1tjCd25MOxKHulNpqga8ssvJaf0JpSE+IffqOKBTSWgfd/2lx/NE3Tr7
DTnnzRDA7NBrFgRC1lT46x9mdqoJobaxrAG2t8p3VbwBPriR/QiI77DdcSXxGelW
DcwbJ40J4igvAKWBEybv0RJmVCnoGGTsMOL5seUsvUoSIYwP4oa6YuC/2YevzPsx
EXIg+4Iihfm4zn1lFPwZ4yr2n8IsKTeXYKx8W5//gX62ibACbDa+FxVACfAOiqYG
GACubB41taIDtjSRtb1027bjo1P+kyC2leLxRg7+rhotYyZGafUbhR0bYgfvdPCD
fik0EpDPws6bBLwJY6z9dtThZtLNGcRtk+lZOIP9+T1n2LPHwwibY/AidaGnlFGr
nZmbWSqHUuvncw+z1iOvHjuMftO8kioWcbNb1uxeO83/Vr5eg8ZOpbm9fx5v1e8r
c9HRszYSl+yQd4H/NeYY5VMw4RlaGtNBvEhGm7D180iOICjroz7ltiIeTu/xwFSj
EEVKL9XInzz2ffPKaFpXr2DXve4zO9Cte9ytXa6w28wmVp8Cofc=
=1X12
-----END PGP SIGNATURE-----

--foz7uz6ci36t7tfy--


--===============4968625937168459571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4968625937168459571==--
