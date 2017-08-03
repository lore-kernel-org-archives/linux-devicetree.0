From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 2/2] arm64: dts: ls2088a: add cpu idle support
Date: Thu, 3 Aug 2017 08:39:16 +0000
Message-ID: <AM5PR0402MB2818861202D11C4255689532F3B10@AM5PR0402MB2818.eurprd04.prod.outlook.com>
References: <1501053893-20897-1-git-send-email-andy.tang@nxp.com>
 <1501053893-20897-2-git-send-email-andy.tang@nxp.com>
 <20170803014007.GC31819@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170803014007.GC31819@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Please see my explanation inline.

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, August 03, 2017 9:40 AM
> To: Andy Tang <andy.tang@nxp.com>
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> catalin.marinas@arm.com; will.deacon@arm.com; linux-
> kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH 2/2] arm64: dts: ls2088a: add cpu idle support
>=20
> On Wed, Jul 26, 2017 at 03:24:53PM +0800, andy.tang@nxp.com wrote:
> > From: Yuantian Tang <andy.tang@nxp.com>
> >
> > ls2088a supports another cpu idle state which is pw20 which saves more
> > power when cpu is idle.
> > It was implemented through psci firmware.
> >
> > Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
>=20
> Can you explain a bit in the commit log why psci node is being added in f=
sl-
> ls208xa.dtsi while you are only adding idle state for ls2088a?  Does that=
 mean
> ls2088a and ls2080a gets different idle implementation?
>=20
IDLE implementation is same on both ls2080a and ls2088a.  it is just there =
is no=20
Requirement for ls2080a though. Still it is better to update both.

I will resend the patch adding ls2080a supports.

Regards,
Andy

> Shawn
>=20
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi | 17 +++++++++++++++++
> > arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  5 +++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > index 5c695c6..6aa319d 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
> > @@ -53,6 +53,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x0>;
> >  		clocks =3D <&clockgen 1 0>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster0_l2>;
> >  		#cooling-cells =3D <2>;
> >  	};
> > @@ -62,6 +63,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x1>;
> >  		clocks =3D <&clockgen 1 0>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster0_l2>;
> >  	};
> >
> > @@ -70,6 +72,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x100>;
> >  		clocks =3D <&clockgen 1 1>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster1_l2>;
> >  		#cooling-cells =3D <2>;
> >  	};
> > @@ -79,6 +82,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x101>;
> >  		clocks =3D <&clockgen 1 1>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster1_l2>;
> >  	};
> >
> > @@ -88,6 +92,7 @@
> >  		reg =3D <0x200>;
> >  		clocks =3D <&clockgen 1 2>;
> >  		next-level-cache =3D <&cluster2_l2>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		#cooling-cells =3D <2>;
> >  	};
> >
> > @@ -96,6 +101,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x201>;
> >  		clocks =3D <&clockgen 1 2>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster2_l2>;
> >  	};
> >
> > @@ -104,6 +110,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x300>;
> >  		clocks =3D <&clockgen 1 3>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster3_l2>;
> >  		#cooling-cells =3D <2>;
> >  	};
> > @@ -113,6 +120,7 @@
> >  		compatible =3D "arm,cortex-a72";
> >  		reg =3D <0x301>;
> >  		clocks =3D <&clockgen 1 3>;
> > +		cpu-idle-states =3D <&CPU_PW20>;
> >  		next-level-cache =3D <&cluster3_l2>;
> >  	};
> >
> > @@ -131,6 +139,15 @@
> >  	cluster3_l2: l2-cache3 {
> >  		compatible =3D "cache";
> >  	};
> > +
> > +	CPU_PW20: cpu-pw20 {
> > +		compatible =3D "arm,idle-state";
> > +		idle-state-name =3D "PW20";
> > +		arm,psci-suspend-param =3D <0x00010000>;
> > +		entry-latency-us =3D <2000>;
> > +		exit-latency-us =3D <2000>;
> > +		min-residency-us =3D <6000>;
> > +	};
> >  };
> >
> >  &pcie1 {
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> > index 94cdd30..205b7f7 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> > @@ -118,6 +118,11 @@
> >  		interrupts =3D <1 7 0x8>; /* PMU PPI, Level low type */
> >  	};
> >
> > +	psci {
> > +		compatible =3D "arm,psci-0.2";
> > +		method =3D "smc";
> > +	};
> > +
> >  	soc {
> >  		compatible =3D "simple-bus";
> >  		#address-cells =3D <2>;
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
