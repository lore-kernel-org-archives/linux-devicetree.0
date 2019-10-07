From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: lx2160a: Correct CPU core idle state name
Date: Mon, 7 Oct 2019 21:36:24 +0000
Message-ID: <VE1PR04MB66874D4C179BA0AD091AC3DB8F9B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190917073357.5895-1-ran.wang_1@nxp.com>
 <20191007115104.GF7150@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007115104.GF7150@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Ran Wang <ran.wang_1@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, October 7, 2019 6:51 AM
> To: Ran Wang <ran.wang_1@nxp.com>; Leo Li <leoyang.li@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] arm64: dts: lx2160a: Correct CPU core idle state nam=
e
>=20
> On Tue, Sep 17, 2019 at 03:33:56PM +0800, Ran Wang wrote:
> > lx2160a support PW15 but not PW20, correct name to avoid confusing.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
>=20
> Leo, agree?

Ya.  The statement is correct.

Acked-by: Li Yang <leoyang.li@nxp.com>

>=20
> Shawn
>=20
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 36 +++++++++++++-----=
-
> -------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > index 408e0ec..b032f38 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > @@ -33,7 +33,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster0_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@1 {
> > @@ -49,7 +49,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster0_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@100 {
> > @@ -65,7 +65,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster1_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@101 {
> > @@ -81,7 +81,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster1_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@200 {
> > @@ -97,7 +97,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster2_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@201 {
> > @@ -113,7 +113,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster2_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@300 {
> > @@ -129,7 +129,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster3_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@301 {
> > @@ -145,7 +145,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster3_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@400 {
> > @@ -161,7 +161,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster4_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@401 {
> > @@ -177,7 +177,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster4_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@500 {
> > @@ -193,7 +193,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster5_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@501 {
> > @@ -209,7 +209,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster5_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@600 {
> > @@ -225,7 +225,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster6_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@601 {
> > @@ -241,7 +241,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster6_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@700 {
> > @@ -257,7 +257,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster7_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cpu@701 {
> > @@ -273,7 +273,7 @@
> >  			i-cache-line-size =3D <64>;
> >  			i-cache-sets =3D <192>;
> >  			next-level-cache =3D <&cluster7_l2>;
> > -			cpu-idle-states =3D <&cpu_pw20>;
> > +			cpu-idle-states =3D <&cpu_pw15>;
> >  		};
> >
> >  		cluster0_l2: l2-cache0 {
> > @@ -340,9 +340,9 @@
> >  			cache-level =3D <2>;
> >  		};
> >
> > -		cpu_pw20: cpu-pw20 {
> > +		cpu_pw15: cpu-pw15 {
> >  			compatible =3D "arm,idle-state";
> > -			idle-state-name =3D "PW20";
> > +			idle-state-name =3D "PW15";
> >  			arm,psci-suspend-param =3D <0x0>;
> >  			entry-latency-us =3D <2000>;
> >  			exit-latency-us =3D <2000>;
> > --
> > 2.7.4
> >
