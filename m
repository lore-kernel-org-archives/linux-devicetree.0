From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM64: dts: rockchip: Add GeekBox config
Date: Thu, 21 Jan 2016 10:55:07 +0100
Message-ID: <1969169.l2ZMdDHEV7@phil>
References: <1453307913-8907-1-git-send-email-afaerber@suse.de> <6705185.M2rneQv8FF@phil> <56A041FE.7000104@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A041FE.7000104@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, DT <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,

Am Donnerstag, 21. Januar 2016, 03:27:10 schrieb Andreas F=E4rber:
> Am 21.01.2016 um 00:08 schrieb Heiko Stuebner:
> > Am Mittwoch, 20. Januar 2016, 17:38:33 schrieb Andreas F=E4rber:
> >> The GeekBox contains an MXM3 module with a Rockchip RK3368 SoC.
> >> Some connectors are available directly on the module.
> >>=20
> >> This adds initial support, namely serial, PMIC and USB.
> >>=20
> >> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> >> ---
> >>=20
> >>  Hi Heiko,
> >> =20
> >>  Here's an initial shot at a .dts for GeekBox.
> >>  GMAC was not yet working for me.
> >> =20
> >>  Regards,
> >>  Andreas
> >> =20
> >>  arch/arm64/boot/dts/rockchip/Makefile            |   1 +
> >>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts  |  48 +++++
> >>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi | 242
> >>=20
> >> +++++++++++++++++++++++ 3 files changed, 291 insertions(+)
> >>=20
> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt=
s
> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dt=
si
> >=20
> > You might want to explain your reasoning for having a dtsi and an e=
mpty
> > standalone dts. I guess you want to add a second one for
> > module+baseboard?
> More generally, as mentioned in the commit message, it's a module, so
> automatically I did a .dtsi to allow for easy reuse.
>=20
> At LinuxCon JP I had discussed with Grant Likely about whether it's o=
kay
> to #include a .dts rather than .dtsi and don't remember getting a cle=
ar
> answer as we ended up drawing a line between hardware and FPGA.
>=20
> And yes, I may later add a .dts for the Landingship - it would mainly
> enable more nodes, I envision. But I assume that we're not bound to j=
ust
> the Landingship with such a standard connector.
>=20
> For now I'm more interested in incrementally adding further nodes to =
the
> module's own file.
>=20
> > The interesting artifact here is, that the baseboard can actually b=
e
> > used
> > standalone and the baseboard just extends it where in contrast a rk=
3288
> > rock2 for example isn't actually usable without a baseboard.
> >=20
> > So I'm wondering if this really should be encoded in the dts or sho=
uld
> > uses something like dts overlays instead to enable one geekbox modu=
le
> > to be used alone and in the "landingship".
>=20
> Well, with the Parallella I made the experience that I used a single
> .dts initially, and it turned out to be a bad choice when we tried
> adding stuff to the DT while new hardware models surfaced - we still
> haven't managed to split it up and it's stuck in limbo without USB.
> I'd really like to avoid that going forward, so I'm trying to look
> forward here in keeping our options open with a clean design.
>=20
> How would your overlay get loaded? Wouldn't that need some special
> kernel driver like for the BeagleBone? Not so attractive for a single
> optional baseboard I care about.

It wasn't meant as a requirement, more like a thought I had and wanted =
to=20
discuss ;-) . So far I also only saw talks about devicetree overlays bu=
t=20
never in action yet.

I would have hoped there to be some gpio indicating if it's connected t=
o the=20
"LandingShip" but that doesn't seem to be the case after looking throug=
h the=20
schematics again.

In any case, going the regular way should be ok as well.


> >> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> >> b/arch/arm64/boot/dts/rockchip/Makefile index e3f0b5f..df37865 100=
644
> >> --- a/arch/arm64/boot/dts/rockchip/Makefile
> >> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> >> @@ -1,4 +1,5 @@
> >>=20
> >>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
> >>=20
> >> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
> >>=20
> >>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
> >> =20
> >>  always		:=3D $(dtb-y)
> >>=20
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> >> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts new file mode 10=
0644
> >> index 0000000..eb24ecd
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> >> @@ -0,0 +1,48 @@
> >> +/*
> >> + * Copyright (c) 2016 Andreas F=E4rber
> >> + *
> >> + * This file is dual-licensed: you can use it either under the te=
rms
> >> + * of the GPL or the X11 license, at your option. Note that this =
dual
> >> + * licensing only applies to this file, and not this project as a
> >> + * whole.
> >> + *
> >> + *  a) This file is free software; you can redistribute it and/or
> >> + *     modify it under the terms of the GNU General Public Licens=
e as
> >> + *     published by the Free Software Foundation; either version =
2 of
> >> the + *     License, or (at your option) any later version.
> >> + *
> >> + *     This file is distributed in the hope that it will be usefu=
l,
> >> + *     but WITHOUT ANY WARRANTY; without even the implied warrant=
y of
> >> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See =
the
> >> + *     GNU General Public License for more details.
> >> + *
> >> + * Or, alternatively,
> >> + *
> >> + *  b) Permission is hereby granted, free of charge, to any perso=
n
> >> + *     obtaining a copy of this software and associated documenta=
tion
> >> + *     files (the "Software"), to deal in the Software without
> >> + *     restriction, including without limitation the rights to us=
e,
> >> + *     copy, modify, merge, publish, distribute, sublicense, and/=
or
> >> + *     sell copies of the Software, and to permit persons to whom=
 the
> >> + *     Software is furnished to do so, subject to the following
> >> + *     conditions:
> >> + *
> >> + *     The above copyright notice and this permission notice shal=
l be
> >> + *     included in all copies or substantial portions of the Soft=
ware.
> >> + *
> >> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY =
KIND,
> >> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRA=
NTIES
> >> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGH=
T
> >> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILIT=
Y,
> >> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> >> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR
> >> + *     OTHER DEALINGS IN THE SOFTWARE.
> >> + */
> >> +
> >> +/dts-v1/;
> >> +#include "rk3368-geekbox.dtsi"
> >> +
> >> +/ {
> >> +	model =3D "GeekBox";

Compatible should probably move here.


> >> +};
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
> >> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi new file mode 1=
00644
> >> index 0000000..f083cdb
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi

maybe also rk3368-geekbox-som.dtsi like the rk3288-rock2-som.dtsi. That=
 way=20
it would show clearly its status as system on module which then gets us=
ed=20
somewhere.


> >> @@ -0,0 +1,242 @@
> >> +/*
> >> + * Copyright (c) 2016 Andreas F=E4rber
> >> + *
> >> + * This file is dual-licensed: you can use it either under the te=
rms
> >> + * of the GPL or the X11 license, at your option. Note that this =
dual
> >> + * licensing only applies to this file, and not this project as a
> >> + * whole.
> >> + *
> >> + *  a) This file is free software; you can redistribute it and/or
> >> + *     modify it under the terms of the GNU General Public Licens=
e as
> >> + *     published by the Free Software Foundation; either version =
2 of
> >> the + *     License, or (at your option) any later version.
> >> + *
> >> + *     This file is distributed in the hope that it will be usefu=
l,
> >> + *     but WITHOUT ANY WARRANTY; without even the implied warrant=
y of
> >> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See =
the
> >> + *     GNU General Public License for more details.
> >> + *
> >> + * Or, alternatively,
> >> + *
> >> + *  b) Permission is hereby granted, free of charge, to any perso=
n
> >> + *     obtaining a copy of this software and associated documenta=
tion
> >> + *     files (the "Software"), to deal in the Software without
> >> + *     restriction, including without limitation the rights to us=
e,
> >> + *     copy, modify, merge, publish, distribute, sublicense, and/=
or
> >> + *     sell copies of the Software, and to permit persons to whom=
 the
> >> + *     Software is furnished to do so, subject to the following
> >> + *     conditions:
> >> + *
> >> + *     The above copyright notice and this permission notice shal=
l be
> >> + *     included in all copies or substantial portions of the Soft=
ware.
> >> + *
> >> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY =
KIND,
> >> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRA=
NTIES
> >> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGH=
T
> >> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILIT=
Y,
> >> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> >> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR
> >> + *     OTHER DEALINGS IN THE SOFTWARE.
> >> + */
> >> +
> >> +#include "rk3368.dtsi"
> >> +
> >> +/ {
> >> +	compatible =3D "geekbuying,geekbox", "rockchip,rk3368";
> >=20
> > you're introducing
> > - a new vendor name (geekbuying), so should update
> > Documentation/devicetree/bindings/vendor-prefixes.txt in a separate
> > patch
>=20
> True. I did not check whether they're NASDAQ-listed either, but I ass=
ume
> no; haven't compared the downstream DT for what they might've been us=
ing
> themselves.
>=20
> > - a new board, so should update
> > Documentation/devicetree/bindings/arm/rockchip.txt
>=20
> Will do.

And as said above, the compatible should probably live in the dts, not =
the=20
dtsi (see rock2).

>=20
> >> +
> >> +	chosen {
> >> +		stdout-path =3D "serial2:115200n8";
> >> +	};
> >> +
> >> +	memory {
> >> +		device_type =3D "memory";
> >> +		reg =3D <0x0 0x0 0x0 0x80000000>;
> >> +	};
> >> +
> >> +	leds: gpio-leds {
> >> +		compatible =3D "gpio-leds";
> >> +
> >> +		blue {
> >> +			gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>;
> >> +			label =3D "geekbox:blue:led";
> >> +			default-state =3D "on";
> >> +		};
> >> +
> >> +		red {
> >> +			gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
> >> +			label =3D "geekbox:red:led";
> >> +			default-state =3D "off";
> >> +		};
> >> +	};
> >> +
> >> +	vcc_sys: vcc-sys-regulator {
> >> +		compatible =3D "regulator-fixed";
> >> +		regulator-name =3D "vcc_sys";
> >> +		regulator-min-microvolt =3D <5000000>;
> >> +		regulator-max-microvolt =3D <5000000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +};
> >> +
> >> +&i2c0 {
> >> +	status =3D "okay";
> >> +
> >> +	rk808: pmic@1b {
> >> +		compatible =3D "rockchip,rk808";
> >> +		reg =3D <0x1b>;
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&pmic_int>, <&pmic_sleep>;
> >> +		interrupt-parent =3D <&gpio0>;
> >> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> >> +		rockchip,system-power-controller;
> >> +		vcc1-supply =3D <&vcc_sys>;
> >> +		vcc2-supply =3D <&vcc_sys>;
> >> +		vcc3-supply =3D <&vcc_sys>;
> >> +		vcc4-supply =3D <&vcc_sys>;
> >> +		vcc6-supply =3D <&vcc_sys>;
> >> +		vcc7-supply =3D <&vcc_sys>;
> >> +		vcc8-supply =3D <&vcc_io>;
> >> +		vcc9-supply =3D <&vcc_sys>;
> >> +		vcc10-supply =3D <&vcc_sys>;
> >> +		vcc11-supply =3D <&vcc_sys>;
> >> +		vcc12-supply =3D <&vcc_io>;
> >> +		clock-output-names =3D "xin32k", "rk808-clkout2";
> >> +		#clock-cells =3D <1>;
> >> +
> >> +		regulators {
> >> +			vdd_cpu: DCDC_REG1 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-min-microvolt =3D <700000>;
> >> +				regulator-max-microvolt =3D <1500000>;
> >> +				regulator-name =3D "vdd_cpu";
> >> +			};
> >> +
> >> +			vdd_log: DCDC_REG2 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-min-microvolt =3D <700000>;
> >> +				regulator-max-microvolt =3D <1500000>;
> >> +				regulator-name =3D "vdd_log";
> >> +			};
> >> +
> >> +			vcc_ddr: DCDC_REG3 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-name =3D "vcc_ddr";
> >> +			};
> >> +
> >> +			vcc_io: DCDC_REG4 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-min-microvolt =3D <3300000>;
> >> +				regulator-max-microvolt =3D <3300000>;
> >> +				regulator-name =3D "vcc_io";
> >> +			};
> >> +
> >> +			vcc18_flash: LDO_REG1 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-min-microvolt =3D <1800000>;
> >> +				regulator-max-microvolt =3D <1800000>;
> >> +				regulator-name =3D "vcc18_flash";
> >> +			};
> >> +
> >> +			vcc33_lcd: LDO_REG2 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;
> >> +				regulator-min-microvolt =3D <3300000>;
> >> +				regulator-max-microvolt =3D <3300000>;
> >> +				regulator-name =3D "vcc33_lcd";
> >> +			};
> >> +
> >> +			vdd_10: LDO_REG3 {
> >> +				regulator-always-on;
> >=20
> > why all others also "boot-on" and this one not?
>=20
> Good question. I had to fiddle with voltages and always-on / boot-on =
to
> get things to work so far, it kept probing with -EINVAL earlier.
>=20
> According to the schematics, the PLL is behind vdd_10, so it probably
> should be boot-on, too. I'm now less certain whether some of the othe=
rs
> should be boot-on though, in particular in light of RK3368 mainline
> U-Boot not existing yet and choices possibly being different there.

I'm fine with going the always-on/boot-on way at first. Sorting which=20
regulators can actually be disabled can also be done later - especially=
 as=20
some components still don't do regulator-handling.


> Counter-question: Why does the -r88.dts have them all as fixed
> regulators?

Because the r88 board doesn't actually have a pmic ;-) . Just a bunch o=
f=20
individual (and mostly always-on) regulators on the board - thankfully =
I=20
have schematics for it.


> I simply assumed here that the RK808-B is sufficiently
> compatible with rockchip,rk808?

I'd hope so.


Heiko
