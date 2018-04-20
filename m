Return-Path: <SRS0=YwGW=HJ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: Add Renesas R8A77990 SoC support
Date: Fri, 20 Apr 2018 10:56:33 +0000
Message-ID: <TY1PR06MB0992DB1044C92F27E14DA8F3D8B40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523439462-1130-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439462-1130-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180420095523.abfccarwq7ye367o@verge.net.au>
In-Reply-To: <20180420095523.abfccarwq7ye367o@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Friday, April 20, 2018 6:55 PM
>=20
> Hi Shimoda-san,
>=20
> On Wed, Apr 11, 2018 at 06:37:41PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds basic support for the Renesas R-Car E3 (R8A77990) SoC:
> >   - PSCI
> >   - CPU (single)
> >   - Cache controller
> >   - Main clocks and controller
> >   - Interrupt controller
> >   - Timer
> >   - PMU
> >   - Reset controller
> >   - Product register
> >   - System controller
> >   - UART for console
> >
> > Inspried by a patch by Takeshi Kihara in the BSP.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Thanks for your patch. I'd like to request a few minor updates
> as per my comments below.

Thank you for the review!

> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 131 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a77990.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a77990.dtsi
> > new file mode 100644
> > index 0000000..310bfd9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -0,0 +1,131 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Device Tree Source for the r8a77990 SoC
> > + *
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	compatible =3D "renesas,r8a77990";
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		/* 1 core only at this point */
> > +		a53_0: cpu@0 {
> > +			compatible =3D "arm,cortex-a53", "arm,armv8";
> > +			reg =3D <0x0>;
> > +			device_type =3D "cpu";
> > +			power-domains =3D <&sysc 5>;
> > +			next-level-cache =3D <&L2_CA53>;
> > +			enable-method =3D "psci";
> > +		};
> > +
> > +		L2_CA53: cache-controller@0 {
> > +			compatible =3D "cache";
> > +			reg =3D <0>;
> > +			power-domains =3D <&sysc 21>;
> > +			cache-unified;
> > +			cache-level =3D <2>;
> > +		};
> > +	};
> > +
> > +	extal_clk: extal {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		/* This value must be overridden by the board */
> > +		clock-frequency =3D <0>;
> > +	};
> > +
> > +	psci {
> > +		compatible =3D "arm,psci-0.2";
> > +		method =3D "smc";
> > +	};
> > +
> > +	soc: soc {
> > +		compatible =3D "simple-bus";
> > +		interrupt-parent =3D <&gic>;
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		gic: interrupt-controller@f1010000 {
> > +			compatible =3D "arm,gic-400";
> > +			#interrupt-cells =3D <3>;
> > +			#address-cells =3D <0>;
> > +			interrupt-controller;
> > +			reg =3D <0x0 0xf1010000 0 0x1000>,
> > +			      <0x0 0xf1020000 0 0x20000>,
> > +			      <0x0 0xf1040000 0 0x20000>,
> > +			      <0x0 0xf1060000 0 0x20000>;
> > +			interrupts =3D <GIC_PPI 9
> > +					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> > +			clocks =3D <&cpg CPG_MOD 408>;
> > +			clock-names =3D "clk";
> > +			power-domains =3D <&sysc 32>;
> > +			resets =3D <&cpg 408>;
> > +		};
>=20
> Please sort sub-nodes of the soc node by:
> 1. Primary key: base address
> 2. Secondary key: IP block
>=20
> You can use arch/arm64/boot/dts/renesas/r8a7795.dtsi as a guide.

Oops, I assumed that all nodes are sorted by alphabet order...
I'll fix this in v2.

> > +
> > +		timer {
> > +			compatible =3D "arm,armv8-timer";
> > +			interrupts =3D <GIC_PPI 13
> > +					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +				     <GIC_PPI 14
> > +					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +				     <GIC_PPI 11
> > +					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +				     <GIC_PPI 10
> > +					(GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> > +		};
> > +
> > +		pmu_a53 {
> > +			compatible =3D "arm,cortex-a53-pmu";
> > +			interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-affinity =3D <&a53_0>;
> > +		};
>=20
> The timer and pmu_a53 nodes do not have a base address and are thus
> not on the bus. Please move them outside of the SoC node.

I got it. I will fix it in v2.

Best regards,
Yoshihiro Shimoda
