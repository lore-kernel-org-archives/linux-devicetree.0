From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sun7i: Add Cubietech Einstein A20 board device-tree
Date: Thu, 2 Nov 2017 16:57:36 +0100
Message-ID: <20171102155736.qab746tkaspfe47n@flea>
References: <20171102143534.19353-1-mailinglists@kunz-im-inter.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vlujwwerohrzyawr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102143534.19353-1-mailinglists@kunz-im-inter.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Kunz <mailinglists@kunz-im-inter.net>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, wens@csie.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, Frank Kunz <xxxxxmichl@googlemail.com>
List-Id: devicetree@vger.kernel.org


--vlujwwerohrzyawr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Thanks for your patch.

On Thu, Nov 02, 2017 at 03:35:34PM +0100, Frank Kunz wrote:
> From: Frank Kunz <xxxxxmichl@googlemail.com>
>=20
> The Einstein A20 board is a Allwinner A20 based board with a credit card
> form factor.
>=20
> Features:
> - Allwinner A20 SoC
> - DDR3 1GB RAM
> - 8GiB eMMC
> - AP6210 wifi/Bluetooth
> - RTC
> - Micro USB-OTG connector
> - UART0 debugging port
> - 200 pins stamp hole package
>=20
> Signed-off-by: Frank Kunz <xxxxxmichl@googlemail.com>
> ---
>  arch/arm/boot/dts/Makefile               |   1 +
>  arch/arm/boot/dts/sun7i-a20-einstein.dts | 200 +++++++++++++++++++++++++=
++++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-einstein.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index faf46abaa4a2..f9158400ea0f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -878,6 +878,7 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-bananapro.dtb \
>  	sun7i-a20-cubieboard2.dtb \
>  	sun7i-a20-cubietruck.dtb \
> +	sun7i-a20-einstein.dtb \

I guess it's not that obvious from what company that board is coming
=66rom. Could you turn it into cubietech-einstein please?

>  	sun7i-a20-hummingbird.dtb \
>  	sun7i-a20-itead-ibox.dtb \
>  	sun7i-a20-i12-tvbox.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-einstein.dts b/arch/arm/boot/dts=
/sun7i-a20-einstein.dts
> new file mode 100644
> index 000000000000..59d46b08f21c
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-einstein.dts
> @@ -0,0 +1,200 @@
> +/*
> + * Copyright 2017 Frank Kunz
> + *
> + * Frank Kunz <xxxxxmichl@googlemail.com>
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
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model =3D "Cubietech Einstein A20";
> +	compatible =3D "cubietech,einstein-a20", "allwinner,sun7i-a20";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	mmc3_pwrseq: mmc3_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mmc3_pwrseq_pin_ea20>;

You don't need those GPIO pinctrl nodes, you can remove all of them.

> +		reset-gpios =3D <&pio 7 9 GPIO_ACTIVE_LOW>; /* PH9 WIFI-SHDN */
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins_a>;
> +	status =3D "okay";
> +
> +	axp209: pmic@34 {
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;

What regulator is this connected to on the PMIC?

> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&mmc3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc3_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;

Same question here.

Looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vlujwwerohrzyawr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ+0BwAAoJEBx+YmzsjxAg6x4P/0v4GWuYbmEQA0fvYzlaLvph
ANh4lvWwnschRv6QvkSpnFpVQWPtbumUnMEjt+SVGM/wPsiBdVeaQ32Sder+XUCY
df73Lvctdpu0RlzARHkMq2ikVyBiTWKwsusOXqFMFKxXNXzfM0/bQyym7rrkQKl4
A2SXr2aCP57Lq3AP2Zb+XnxpKVlO+q5FrK072uGKF9bTn909gCchXk0L+u/EQDeL
EIqnpnh4J80nxiJcRalsBFR/byDnNf11TqbzvQPP8gifAvMi+KP/vX81pkClKUEm
1txdKhjtDxRL+HHxQKCKf5tFDHCEDTr8IjtP/KFfprQYBg6iGrWb4gn9Vh/0o/bF
44k8fC02BgwwaD+cAXgPsks+VNmfjoWRJAaK3h1AbDBVC9/NWHlRaU/uF8TNS5iu
Cb4+j3zTbYo9F+Y11fhJCs2ExY7iXoF/zOp2oEGc0eciR9kbXRgVyrqcerQ94P31
71I77cQgvaIA7zhTMkOmRhAOs9m58onBYJeKks+hDnFJ1st5BRFN/GJpIPkESKKh
b5myMAEHSuYdLeHqw88Ng7HK53S9MMBdg2XjajSAC7AcYWmecL9TePXZGHwq8ecs
U6Lv6cgjhCzxSFlfJk0iO8OM49v4AwOwqvzJ7tUC878nNEDr6z0TxE97ARk3lGjM
17nlwdqLgvCy5AtgW/k5
=9Imx
-----END PGP SIGNATURE-----

--vlujwwerohrzyawr--
