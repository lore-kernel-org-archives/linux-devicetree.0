From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM64: dts: rockchip: Add GeekBox config
Date: Thu, 21 Jan 2016 00:08:16 +0100
Message-ID: <6705185.M2rneQv8FF@phil>
References: <1453307913-8907-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453307913-8907-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 20. Januar 2016, 17:38:33 schrieb Andreas F=E4rber:
> The GeekBox contains an MXM3 module with a Rockchip RK3368 SoC.
> Some connectors are available directly on the module.
>=20
> This adds initial support, namely serial, PMIC and USB.
>=20
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  Hi Heiko,
>=20
>  Here's an initial shot at a .dts for GeekBox.
>  GMAC was not yet working for me.
>=20
>  Regards,
>  Andreas
>=20
>  arch/arm64/boot/dts/rockchip/Makefile            |   1 +
>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts  |  48 +++++
>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi | 242
> +++++++++++++++++++++++ 3 files changed, 291 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi

You might want to explain your reasoning for having a dtsi and an empty=
=20
standalone dts. I guess you want to add a second one for module+baseboa=
rd?

The interesting artifact here is, that the baseboard can actually be us=
ed=20
standalone and the baseboard just extends it where in contrast a rk3288=
=20
rock2 for example isn't actually usable without a baseboard.

So I'm wondering if this really should be encoded in the dts or should =
uses=20
something like dts overlays instead to enable one geekbox module to be =
used=20
alone and in the "landingship".


>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile index e3f0b5f..df37865 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -1,4 +1,5 @@
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
>=20
>  always		:=3D $(dtb-y)
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts new file mode 10064=
4
> index 0000000..eb24ecd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright (c) 2016 Andreas F=E4rber
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
> +
> +/dts-v1/;
> +#include "rk3368-geekbox.dtsi"
> +
> +/ {
> +	model =3D "GeekBox";
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi new file mode 1006=
44
> index 0000000..f083cdb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
> @@ -0,0 +1,242 @@
> +/*
> + * Copyright (c) 2016 Andreas F=E4rber
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
> +
> +#include "rk3368.dtsi"
> +
> +/ {
> +	compatible =3D "geekbuying,geekbox", "rockchip,rk3368";

you're introducing
- a new vendor name (geekbuying), so should update=20
Documentation/devicetree/bindings/vendor-prefixes.txt in a separate pat=
ch
- a new board, so should update=20
Documentation/devicetree/bindings/arm/rockchip.txt


> +
> +	chosen {
> +		stdout-path =3D "serial2:115200n8";
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	leds: gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		blue {
> +			gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>;
> +			label =3D "geekbox:blue:led";
> +			default-state =3D "on";
> +		};
> +
> +		red {
> +			gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
> +			label =3D "geekbox:red:led";
> +			default-state =3D "off";
> +		};
> +	};
> +
> +	vcc_sys: vcc-sys-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_sys";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	rk808: pmic@1b {
> +		compatible =3D "rockchip,rk808";
> +		reg =3D <0x1b>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_int>, <&pmic_sleep>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> +		rockchip,system-power-controller;
> +		vcc1-supply =3D <&vcc_sys>;
> +		vcc2-supply =3D <&vcc_sys>;
> +		vcc3-supply =3D <&vcc_sys>;
> +		vcc4-supply =3D <&vcc_sys>;
> +		vcc6-supply =3D <&vcc_sys>;
> +		vcc7-supply =3D <&vcc_sys>;
> +		vcc8-supply =3D <&vcc_io>;
> +		vcc9-supply =3D <&vcc_sys>;
> +		vcc10-supply =3D <&vcc_sys>;
> +		vcc11-supply =3D <&vcc_sys>;
> +		vcc12-supply =3D <&vcc_io>;
> +		clock-output-names =3D "xin32k", "rk808-clkout2";
> +		#clock-cells =3D <1>;
> +
> +		regulators {
> +			vdd_cpu: DCDC_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <1500000>;
> +				regulator-name =3D "vdd_cpu";
> +			};
> +
> +			vdd_log: DCDC_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <1500000>;
> +				regulator-name =3D "vdd_log";
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vcc_ddr";
> +			};
> +
> +			vcc_io: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc_io";
> +			};
> +
> +			vcc18_flash: LDO_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc18_flash";
> +			};
> +
> +			vcc33_lcd: LDO_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc33_lcd";
> +			};
> +
> +			vdd_10: LDO_REG3 {
> +				regulator-always-on;

why all others also "boot-on" and this one not?


Otherwise that looks fine

Heiko
