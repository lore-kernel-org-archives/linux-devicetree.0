From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: Add GeekBox config
Date: Thu, 21 Jan 2016 03:27:10 +0100
Message-ID: <56A041FE.7000104@suse.de>
References: <1453307913-8907-1-git-send-email-afaerber@suse.de>
 <6705185.M2rneQv8FF@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6705185.M2rneQv8FF@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 21.01.2016 um 00:08 schrieb Heiko Stuebner:
> Am Mittwoch, 20. Januar 2016, 17:38:33 schrieb Andreas F=E4rber:
>> The GeekBox contains an MXM3 module with a Rockchip RK3368 SoC.
>> Some connectors are available directly on the module.
>>
>> This adds initial support, namely serial, PMIC and USB.
>>
>> Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  Hi Heiko,
>>
>>  Here's an initial shot at a .dts for GeekBox.
>>  GMAC was not yet working for me.
>>
>>  Regards,
>>  Andreas
>>
>>  arch/arm64/boot/dts/rockchip/Makefile            |   1 +
>>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts  |  48 +++++
>>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi | 242
>> +++++++++++++++++++++++ 3 files changed, 291 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
>=20
> You might want to explain your reasoning for having a dtsi and an emp=
ty=20
> standalone dts. I guess you want to add a second one for module+baseb=
oard?

More generally, as mentioned in the commit message, it's a module, so
automatically I did a .dtsi to allow for easy reuse.

At LinuxCon JP I had discussed with Grant Likely about whether it's oka=
y
to #include a .dts rather than .dtsi and don't remember getting a clear
answer as we ended up drawing a line between hardware and FPGA.

And yes, I may later add a .dts for the Landingship - it would mainly
enable more nodes, I envision. But I assume that we're not bound to jus=
t
the Landingship with such a standard connector.

=46or now I'm more interested in incrementally adding further nodes to =
the
module's own file.

> The interesting artifact here is, that the baseboard can actually be =
used=20
> standalone and the baseboard just extends it where in contrast a rk32=
88=20
> rock2 for example isn't actually usable without a baseboard.
>=20
> So I'm wondering if this really should be encoded in the dts or shoul=
d uses=20
> something like dts overlays instead to enable one geekbox module to b=
e used=20
> alone and in the "landingship".

Well, with the Parallella I made the experience that I used a single
=2Edts initially, and it turned out to be a bad choice when we tried
adding stuff to the DT while new hardware models surfaced - we still
haven't managed to split it up and it's stuck in limbo without USB.
I'd really like to avoid that going forward, so I'm trying to look
forward here in keeping our options open with a clean design.

How would your overlay get loaded? Wouldn't that need some special
kernel driver like for the BeagleBone? Not so attractive for a single
optional baseboard I care about.

>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>> b/arch/arm64/boot/dts/rockchip/Makefile index e3f0b5f..df37865 10064=
4
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -1,4 +1,5 @@
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
>>
>>  always		:=3D $(dtb-y)
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts new file mode 1006=
44
>> index 0000000..eb24ecd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
>> @@ -0,0 +1,48 @@
>> +/*
>> + * Copyright (c) 2016 Andreas F=E4rber
>> + *
>> + * This file is dual-licensed: you can use it either under the term=
s
>> + * of the GPL or the X11 license, at your option. Note that this du=
al
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty =
of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentati=
on
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom t=
he
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall =
be
>> + *     included in all copies or substantial portions of the Softwa=
re.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KI=
ND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include "rk3368-geekbox.dtsi"
>> +
>> +/ {
>> +	model =3D "GeekBox";
>> +};
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi new file mode 100=
644
>> index 0000000..f083cdb
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
>> @@ -0,0 +1,242 @@
>> +/*
>> + * Copyright (c) 2016 Andreas F=E4rber
>> + *
>> + * This file is dual-licensed: you can use it either under the term=
s
>> + * of the GPL or the X11 license, at your option. Note that this du=
al
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty =
of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentati=
on
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom t=
he
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall =
be
>> + *     included in all copies or substantial portions of the Softwa=
re.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KI=
ND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include "rk3368.dtsi"
>> +
>> +/ {
>> +	compatible =3D "geekbuying,geekbox", "rockchip,rk3368";
>=20
> you're introducing
> - a new vendor name (geekbuying), so should update=20
> Documentation/devicetree/bindings/vendor-prefixes.txt in a separate p=
atch

True. I did not check whether they're NASDAQ-listed either, but I assum=
e
no; haven't compared the downstream DT for what they might've been usin=
g
themselves.

> - a new board, so should update=20
> Documentation/devicetree/bindings/arm/rockchip.txt

Will do.

>> +
>> +	chosen {
>> +		stdout-path =3D "serial2:115200n8";
>> +	};
>> +
>> +	memory {
>> +		device_type =3D "memory";
>> +		reg =3D <0x0 0x0 0x0 0x80000000>;
>> +	};
>> +
>> +	leds: gpio-leds {
>> +		compatible =3D "gpio-leds";
>> +
>> +		blue {
>> +			gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>;
>> +			label =3D "geekbox:blue:led";
>> +			default-state =3D "on";
>> +		};
>> +
>> +		red {
>> +			gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
>> +			label =3D "geekbox:red:led";
>> +			default-state =3D "off";
>> +		};
>> +	};
>> +
>> +	vcc_sys: vcc-sys-regulator {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vcc_sys";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	status =3D "okay";
>> +
>> +	rk808: pmic@1b {
>> +		compatible =3D "rockchip,rk808";
>> +		reg =3D <0x1b>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pmic_int>, <&pmic_sleep>;
>> +		interrupt-parent =3D <&gpio0>;
>> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>> +		rockchip,system-power-controller;
>> +		vcc1-supply =3D <&vcc_sys>;
>> +		vcc2-supply =3D <&vcc_sys>;
>> +		vcc3-supply =3D <&vcc_sys>;
>> +		vcc4-supply =3D <&vcc_sys>;
>> +		vcc6-supply =3D <&vcc_sys>;
>> +		vcc7-supply =3D <&vcc_sys>;
>> +		vcc8-supply =3D <&vcc_io>;
>> +		vcc9-supply =3D <&vcc_sys>;
>> +		vcc10-supply =3D <&vcc_sys>;
>> +		vcc11-supply =3D <&vcc_sys>;
>> +		vcc12-supply =3D <&vcc_io>;
>> +		clock-output-names =3D "xin32k", "rk808-clkout2";
>> +		#clock-cells =3D <1>;
>> +
>> +		regulators {
>> +			vdd_cpu: DCDC_REG1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <700000>;
>> +				regulator-max-microvolt =3D <1500000>;
>> +				regulator-name =3D "vdd_cpu";
>> +			};
>> +
>> +			vdd_log: DCDC_REG2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <700000>;
>> +				regulator-max-microvolt =3D <1500000>;
>> +				regulator-name =3D "vdd_log";
>> +			};
>> +
>> +			vcc_ddr: DCDC_REG3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name =3D "vcc_ddr";
>> +			};
>> +
>> +			vcc_io: DCDC_REG4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vcc_io";
>> +			};
>> +
>> +			vcc18_flash: LDO_REG1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <1800000>;
>> +				regulator-max-microvolt =3D <1800000>;
>> +				regulator-name =3D "vcc18_flash";
>> +			};
>> +
>> +			vcc33_lcd: LDO_REG2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt =3D <3300000>;
>> +				regulator-max-microvolt =3D <3300000>;
>> +				regulator-name =3D "vcc33_lcd";
>> +			};
>> +
>> +			vdd_10: LDO_REG3 {
>> +				regulator-always-on;
>=20
> why all others also "boot-on" and this one not?

Good question. I had to fiddle with voltages and always-on / boot-on to
get things to work so far, it kept probing with -EINVAL earlier.

According to the schematics, the PLL is behind vdd_10, so it probably
should be boot-on, too. I'm now less certain whether some of the others
should be boot-on though, in particular in light of RK3368 mainline
U-Boot not existing yet and choices possibly being different there.

Counter-question: Why does the -r88.dts have them all as fixed
regulators? I simply assumed here that the RK808-B is sufficiently
compatible with rockchip,rk808?

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
