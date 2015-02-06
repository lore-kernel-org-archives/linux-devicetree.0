From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 09/10] ARM: mvebu: add Device Tree files for Armada 39x
 SoC and board
Date: Fri, 6 Feb 2015 21:39:49 +0100
Message-ID: <20150206203949.GJ2079@lukather>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423238276-9206-10-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423238276-9206-10-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2015 at 04:57:55PM +0100, Thomas Petazzoni wrote:
> This commit adds the Device Tree files for the Armada 39x family of
> processors, as well as one Armada 398 Development Board.
>=20
> Like for other Marvell EBU families, a common armada-39x.dtsi contains
> the description of the common features of all Armada 39x SoCs, while
> armada-390.dtsi and armada-398.dtsi respectively describe the
> specificities of those SoCs.
>=20
> Finally, an armada-398-db.dts file is added to describe the Armada 398
> Development Board itself.
>=20
> So far, the following features are supported:
>=20
>  * SMP: dual Cortex-A9
>  * Basic ARM IPs: SCU, timer, GIC
>  * Basic Marvell IPs: pin-muxing, clocks, system controller, MBus
>    controller, MPIC interrupt controller, timer, CPU reset for SMP,
>    PMSU.
>  * I2C
>  * UART
>  * PCIe
>=20
> Additional features will be supported in the future.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/arm/boot/dts/Makefile          |   2 +
>  arch/arm/boot/dts/armada-390.dtsi   |  57 ++++++
>  arch/arm/boot/dts/armada-398-db.dts | 116 +++++++++++
>  arch/arm/boot/dts/armada-398.dtsi   |  60 ++++++
>  arch/arm/boot/dts/armada-39x.dtsi   | 372 ++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 607 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-390.dtsi
>  create mode 100644 arch/arm/boot/dts/armada-398-db.dts
>  create mode 100644 arch/arm/boot/dts/armada-398.dtsi
>  create mode 100644 arch/arm/boot/dts/armada-39x.dtsi
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 968bc7a..64886fb 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -540,6 +540,8 @@ dtb-$(CONFIG_MACH_ARMADA_38X) +=3D \
>  	armada-388-db.dtb \
>  	armada-388-gp.dtb \
>  	armada-388-rd.dtb
> +dtb-$(CONFIG_MACH_ARMADA_39X) +=3D \
> +	armada-398-db.dtb
>  dtb-$(CONFIG_MACH_ARMADA_XP) +=3D \
>  	armada-xp-axpwifiap.dtb \
>  	armada-xp-db.dtb \
> diff --git a/arch/arm/boot/dts/armada-390.dtsi b/arch/arm/boot/dts/armada=
-390.dtsi
> new file mode 100644
> index 0000000..094e39c
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-390.dtsi
> @@ -0,0 +1,57 @@
> +/*
> + * Device Tree Include file for Marvell Armada 390 SoC.
> + *
> + * Copyright (C) 2015 Marvell
> + *
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "armada-39x.dtsi"
> +
> +/ {
> +	soc {
> +		internal-regs {
> +			pinctrl@18000 {
> +				compatible =3D "marvell,mv88f6920-pinctrl";
> +				reg =3D <0x18000 0x20>;
> +			};
> +		};
> +};
> diff --git a/arch/arm/boot/dts/armada-398-db.dts b/arch/arm/boot/dts/arma=
da-398-db.dts
> new file mode 100644
> index 0000000..b889864
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-398-db.dts
> @@ -0,0 +1,116 @@
> +/*
> + * Device Tree Include file for Marvell Armada 398 Development Board
> + *
> + * Copyright (C) 2015 Marvell
> + *
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "armada-398.dtsi"
> +
> +/ {
> +	model =3D "Marvell Armada 398 Development Board";
> +	compatible =3D "marvell,a398-db", "marvell,armada398", "marvell,armada3=
90";
> +
> +	chosen {
> +		bootargs =3D "console=3DttyS0,115200 earlyprintk";

I think Arnd wanted to remove all the earlyprintk here, just in case
the debug_ll options compiled in the kernel would not match the
board/SoC options.

> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x80000000>; /* 2 GB */
> +	};
> +
> +	soc {
> +		ranges =3D <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
> +			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000>;
> +
> +		internal-regs {
> +                        i2c@11000 {
> +				pinctrl-0 =3D <&i2c0_pins>;
> +				pinctrl-names =3D "default";
> +                                status =3D "okay";
> +                                clock-frequency =3D <100000>;

The indentation looks off here.

It seems like you indented the two first lines with tabs, and the two
last with spaces.

> +                        };
> +
> +			serial@12000 {
> +				pinctrl-0 =3D <&uart0_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +			};
> +
> +			serial@12100 {
> +				pinctrl-0 =3D <&uart1_pins>;
> +				pinctrl-names =3D "default";
> +				status =3D "okay";
> +			};
> +
> +			pinctrl@18000 {
> +				uart0_pins: uart0-pins {
> +					marvell,pins =3D "mpp0", "mpp1";
> +					marvell,function =3D "ua0";
> +				};
> +
> +				uart1_pins: uart1-pins {
> +					marvell,pins =3D "mpp19", "mpp20";
> +					marvell,function =3D "ua1";
> +				};

These two looks like generic muxing options, maybe they should be put
in the SoC DTSI?

> +			};
> +		};
> +
> +		pcie-controller {
> +			status =3D "okay";
> +
> +			pcie@1,0 {
> +				status =3D "okay";
> +			};
> +
> +			pcie@2,0 {
> +				status =3D "okay";
> +			};
> +
> +			pcie@3,0 {
> +				status =3D "okay";
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/armada-398.dtsi b/arch/arm/boot/dts/armada=
-398.dtsi
> new file mode 100644
> index 0000000..fdc2591
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-398.dtsi
> @@ -0,0 +1,60 @@
> +/*
> + * Device Tree Include file for Marvell Armada 398 SoC.
> + *
> + * Copyright (C) 2015 Marvell
> + *
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "armada-39x.dtsi"
> +
> +/ {
> +	compatible =3D "marvell,armada398", "marvell,armada390";
> +
> +	soc {
> +		internal-regs {
> +			pinctrl@18000 {
> +				compatible =3D "marvell,mv88f6928-pinctrl";
> +				reg =3D <0x18000 0x20>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada=
-39x.dtsi
> new file mode 100644
> index 0000000..e248332
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -0,0 +1,372 @@
> +/*
> + * Device Tree Include file for Marvell Armada 39x family of SoCs.
> + *
> + * Copyright (C) 2015 Marvell
> + *
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
> + *     This file is distributed in the hope that it will be useful
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "skeleton.dtsi"
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << =
16))
> +
> +/ {
> +	model =3D "Marvell Armada 39x family SoC";
> +	compatible =3D "marvell,armada390";
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		enable-method =3D "marvell,armada-390-smp";
> +
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			reg =3D <0>;
> +		};
> +		cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a9";
> +			reg =3D <1>;
> +		};
> +	};
> +
> +	soc {
> +		compatible =3D "marvell,armada390-mbus", "marvell,armadaxp-mbus",
> +			     "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		controller =3D <&mbusc>;
> +		interrupt-parent =3D <&gic>;
> +		pcie-mem-aperture =3D <0xe0000000 0x8000000>;
> +		pcie-io-aperture  =3D <0xe8000000 0x100000>;
> +
> +		bootrom {
> +			compatible =3D "marvell,bootrom";
> +			reg =3D <MBUS_ID(0x01, 0x1d) 0 0x200000>;
> +		};
> +
> +		internal-regs {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
> +
> +			scu@c000 {
> +				compatible =3D "arm,cortex-a9-scu";
> +				reg =3D <0xc000 0x100>;
> +			};
> +
> +			timer@c600 {
> +				compatible =3D "arm,cortex-a9-twd-timer";
> +				reg =3D <0xc600 0x20>;
> +				interrupts =3D <GIC_PPI 13 (IRQ_TYPE_EDGE_RISING | GIC_CPU_MASK_SIMP=
LE(2))>;
> +				clocks =3D <&coreclk 2>;
> +			};
> +
> +			gic: interrupt-controller@d000 {
> +				compatible =3D "arm,cortex-a9-gic";
> +				#interrupt-cells =3D <3>;
> +				#size-cells =3D <0>;
> +				interrupt-controller;
> +				reg =3D <0xd000 0x1000>,
> +				      <0xc100 0x100>;
> +			};
> +
> +			i2c0: i2c@11000 {
> +				compatible =3D "marvell,mv64xxx-i2c";
> +				reg =3D <0x11000 0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +				timeout-ms =3D <1000>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c1: i2c@11100 {
> +				compatible =3D "marvell,mv64xxx-i2c";
> +				reg =3D <0x11100 0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +				timeout-ms =3D <1000>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c2: i2c@11200 {
> +				compatible =3D "marvell,mv64xxx-i2c";
> +				reg =3D <0x11200 0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +				timeout-ms =3D <1000>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c3: i2c@11300 {
> +				compatible =3D "marvell,mv64xxx-i2c";
> +				reg =3D <0x11300 0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +				timeout-ms =3D <1000>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			serial@12000 {
> +				compatible =3D "snps,dw-apb-uart";
> +				reg =3D <0x12000 0x100>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg-io-width =3D <1>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			serial@12100 {
> +				compatible =3D "snps,dw-apb-uart";
> +				reg =3D <0x12100 0x100>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg-io-width =3D <1>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			serial@12200 {
> +				compatible =3D "snps,dw-apb-uart";
> +				reg =3D <0x12200 0x100>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg-io-width =3D <1>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			serial@12300 {
> +				compatible =3D "snps,dw-apb-uart";
> +				reg =3D <0x12300 0x100>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +				reg-io-width =3D <1>;
> +				clocks =3D <&coreclk 0>;
> +				status =3D "disabled";
> +			};
> +
> +			pinctrl@18000 {
> +				i2c0_pins: i2c0-pins {
> +					marvell,pins =3D "mpp2", "mpp3";
> +					marvell,function =3D "i2c0";
> +				};
> +			};
> +
> +			system-controller@18200 {
> +				compatible =3D "marvell,armada-390-system-controller",
> +					     "marvell,armada-370-xp-system-controller";
> +				reg =3D <0x18200 0x100>;
> +			};
> +
> +			gateclk: clock-gating-control@18220 {
> +				compatible =3D "marvell,armada-390-gating-clock";
> +				reg =3D <0x18220 0x4>;
> +				clocks =3D <&coreclk 0>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			coreclk: mvebu-sar@18600 {
> +				compatible =3D "marvell,armada-390-core-clock";
> +				reg =3D <0x18600 0x04>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			mbusc: mbus-controller@20000 {
> +				compatible =3D "marvell,mbus-controller";
> +				reg =3D <0x20000 0x100>, <0x20180 0x20>, <0x20250 0x8>;
> +			};
> +
> +			mpic: interrupt-controller@20000 {

The unit-address doesn't match the reg address.

> +				compatible =3D "marvell,mpic";
> +				reg =3D <0x20a00 0x2d0>, <0x21070 0x58>;
> +				#interrupt-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				interrupt-controller;
> +				msi-controller;
> +				interrupts =3D <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			timer@20300 {
> +				compatible =3D "marvell,armada-380-timer",
> +					     "marvell,armada-xp-timer";
> +				reg =3D <0x20300 0x30>, <0x21040 0x30>;
> +				interrupts-extended =3D <&gic  GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
> +						      <&gic  GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
> +						      <&gic  GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +						      <&gic  GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +						      <&mpic 5>,
> +						      <&mpic 6>;
> +				clocks =3D <&coreclk 2>, <&coreclk 5>;
> +				clock-names =3D "nbclk", "fixed";
> +			};
> +
> +			cpurst@20800 {
> +				compatible =3D "marvell,armada-370-cpu-reset";
> +				reg =3D <0x20800 0x10>;
> +			};
> +
> +			pmsu@22000 {
> +				compatible =3D "marvell,armada-390-pmsu",
> +					     "marvell,armada-380-pmsu";
> +				reg =3D <0x22000 0x1000>;
> +			};
> +		};
> +
> +		pcie-controller {
> +			compatible =3D "marvell,armada-370-pcie";
> +			status =3D "disabled";
> +			device_type =3D "pci";
> +
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +
> +			msi-parent =3D <&mpic>;
> +			bus-range =3D <0x00 0xff>;
> +
> +			ranges =3D
> +			       <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
> +				0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
> +				0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
> +				0x82000000 0 0x48000 MBUS_ID(0xf0, 0x01) 0x48000 0 0x00002000
> +				0x82000000 0x1 0     MBUS_ID(0x08, 0xe8) 0 1 0 /* Port 0 MEM */
> +				0x81000000 0x1 0     MBUS_ID(0x08, 0xe0) 0 1 0 /* Port 0 IO  */
> +				0x82000000 0x2 0     MBUS_ID(0x04, 0xe8) 0 1 0 /* Port 1 MEM */
> +				0x81000000 0x2 0     MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 1 IO  */
> +				0x82000000 0x3 0     MBUS_ID(0x04, 0xd8) 0 1 0 /* Port 2 MEM */
> +				0x81000000 0x3 0     MBUS_ID(0x04, 0xd0) 0 1 0 /* Port 2 IO  */
> +				0x82000000 0x4 0     MBUS_ID(0x04, 0xb8) 0 1 0 /* Port 3 MEM */
> +				0x81000000 0x4 0     MBUS_ID(0x04, 0xb0) 0 1 0 /* Port 3 IO  */>;
> +
> +			/*
> +			 * This port can be either x4 or x1. When
> +			 * configured in x4 by the bootloader, then
> +			 * pcie@4,0 is not available.
> +			 */
> +			pcie@1,0 {
> +				device_type =3D "pci";
> +				assigned-addresses =3D <0x82000800 0 0x80000 0 0x2000>;
> +				reg =3D <0x0800 0 0 0 0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				#interrupt-cells =3D <1>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0
> +					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
> +				interrupt-map-mask =3D <0 0 0 0>;
> +				interrupt-map =3D <0 0 0 0 &gic GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				marvell,pcie-port =3D <0>;
> +				marvell,pcie-lane =3D <0>;
> +				clocks =3D <&gateclk 8>;
> +				status =3D "disabled";
> +			};
> +
> +			/* x1 port */
> +			pcie@2,0 {
> +				device_type =3D "pci";
> +				assigned-addresses =3D <0x82000800 0 0x40000 0 0x2000>;
> +				reg =3D <0x1000 0 0 0 0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				#interrupt-cells =3D <1>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0
> +					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
> +				interrupt-map-mask =3D <0 0 0 0>;
> +				interrupt-map =3D <0 0 0 0 &gic GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +				marvell,pcie-port =3D <1>;
> +				marvell,pcie-lane =3D <0>;
> +				clocks =3D <&gateclk 5>;
> +				status =3D "disabled";
> +			};
> +
> +			/* x1 port */
> +			pcie@3,0 {
> +				device_type =3D "pci";
> +				assigned-addresses =3D <0x82000800 0 0x44000 0 0x2000>;
> +				reg =3D <0x1800 0 0 0 0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				#interrupt-cells =3D <1>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x3 0 1 0
> +					  0x81000000 0 0 0x81000000 0x3 0 1 0>;
> +				interrupt-map-mask =3D <0 0 0 0>;
> +				interrupt-map =3D <0 0 0 0 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +				marvell,pcie-port =3D <2>;
> +				marvell,pcie-lane =3D <0>;
> +				clocks =3D <&gateclk 6>;
> +				status =3D "disabled";
> +			};
> +
> +			/*
> +			 * x1 port only available when pcie@1,0 is
> +			 * configured as a x1 port
> +			 */
> +			pcie@4,0 {
> +				device_type =3D "pci";
> +				assigned-addresses =3D <0x82000800 0 0x48000 0 0x2000>;
> +				reg =3D <0x2000 0 0 0 0>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				#interrupt-cells =3D <1>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x4 0 1 0
> +					  0x81000000 0 0 0x81000000 0x4 0 1 0>;
> +				interrupt-map-mask =3D <0 0 0 0>;
> +				interrupt-map =3D <0 0 0 0 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +				marvell,pcie-port =3D <3>;
> +				marvell,pcie-lane =3D <0>;
> +				clocks =3D <&gateclk 7>;
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +};
> --=20
> 2.1.0
>=20

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU1SaVAAoJEBx+YmzsjxAgCkkP/jVauwy5BncV9RQwnI8LQ2h2
KM+0hZpAw5QkOBDJMocCgEyTFmJbkQFGtMEhWe4xVoRkGfkZWFBgmuUUQk95rDqb
Tr+wX7EvfgtzC92gJeYfSSWtNDvresH4qE62pGVYoLzev8FDTo1bQu/GiUAq57gl
8owq8n5OajOLoiwLySbBJNrIJ97a/z8PgK0eo3JZSXLMtTN2NsdxcFKtengNrzCl
VezAeQmDv4IhEJobuZBdN49BxiIC+zV9KnNDg3TLPWmqcj39SN3lkPIIE8R0I1Rk
siDKYDQHaRBN+2axJwEs8iYZSg3Xqwbw5z9uft1fLvSvY/siryuawcrZfZ2gkJKo
TUGXHdLAdDcZV+kZTOmWcb0JP7s62ycmi8eIjZrlXdpjGOZFJdrYOUQmeKcF2pJq
4WVYWiAJg3eDnqq4Xv0u6/BANEeRDO5zhCoaYoan3HCIYGu5BVe8FSUvasHa8/YB
OQWC6WWy+u0Q1dp02aGLCBzwnti1zPMr7GtcAnFPxbXBQhL6mLNng+Q6l4DuDAY4
7g0sIbdK1gvezIQ8CXwtg2GVayMEwaKKteXAsb8fr621ybJaBfZgdz6RBixWwIrV
f8avswleWcMnWZsT62d4B0QyumYeNNwrMs+d4hzobg7uvNNVhUUDj8QgxCSNMMpJ
EJ7ztxpEfArzjTUztL7J
=A4bL
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
