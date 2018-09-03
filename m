From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] ARM: dts: imx7s: enable cpuidle driver
Date: Mon, 3 Sep 2018 01:50:48 +0000
Message-ID: <AM6PR0402MB3911E04E1DF1CB7FE55B47CAF50C0@AM6PR0402MB3911.eurprd04.prod.outlook.com>
References: <1535518847-24417-1-git-send-email-Anson.Huang@nxp.com>
 <20180903011625.GZ3850@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903011625.GZ3850@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org



Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, September 3, 2018 9:16 AM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: s.hauer@pengutronix.de; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> linux@armlinux.org.uk; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH 1/2] ARM: dts: imx7s: enable cpuidle driver
>=20
> On Wed, Aug 29, 2018 at 01:00:46PM +0800, Anson Huang wrote:
> > Enable cpuidle for i.MX7S/D using generic ARM cpuidle driver, below 2
> > idle states enabled:
> >
> > 1. ARM WFI;
> > 2. SoC WAIT mode.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx7d.dtsi |  1 +
> >  arch/arm/boot/dts/imx7s.dtsi | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7d.dtsi
> > b/arch/arm/boot/dts/imx7d.dtsi index 7cbc2ff..4d0d0f6 100644
> > --- a/arch/arm/boot/dts/imx7d.dtsi
> > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > @@ -20,6 +20,7 @@
> >  			reg =3D <1>;
> >  			clock-frequency =3D <996000000>;
> >  			operating-points-v2 =3D <&cpu0_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> >  		};
> >  	};
> >
> > diff --git a/arch/arm/boot/dts/imx7s.dtsi
> > b/arch/arm/boot/dts/imx7s.dtsi index 93884ce..cf5570b 100644
> > --- a/arch/arm/boot/dts/imx7s.dtsi
> > +++ b/arch/arm/boot/dts/imx7s.dtsi
> > @@ -54,6 +54,19 @@
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <0>;
> >
> > +		idle-states {
> > +			entry-method =3D "psci";
> > +
> > +			CPU_SLEEP: WAIT {
>=20
> I understand uppercase is allowed, but we conventionally use lowercase fo=
r
> label and node name.  Can we do something like below?
>=20
> 	cpu_sleep_wait: cpu-sleep-wait {
> 		...
> 	}
=20
Sure, please review V2 patch, thanks!

Anson

>=20
> Shawn
>=20
> > +				compatible =3D "arm,idle-state";
> > +				arm,psci-suspend-param =3D <0x0010000>;
> > +				local-timer-stop;
> > +				entry-latency-us =3D <100>;
> > +				exit-latency-us =3D <50>;
> > +				min-residency-us =3D <1000>;
> > +			};
> > +		};
> > +
> >  		cpu0: cpu@0 {
> >  			compatible =3D "arm,cortex-a7";
> >  			device_type =3D "cpu";
> > @@ -61,6 +74,7 @@
> >  			clock-frequency =3D <792000000>;
> >  			clock-latency =3D <61036>; /* two CLK32 periods */
> >  			clocks =3D <&clks IMX7D_CLK_ARM>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> >  		};
> >  	};
> >
> > --
> > 2.7.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
t
> >
> s.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=3D02%7C
> >
> 01%7CAnson.Huang%40nxp.com%7C8ce1cddcac05444edc1408d6113b0a76%7
> C686ea1
> >
> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636715342610651079&amp;sda
> ta=3Dx9l%
> >
> 2FrkV8Uo8CtSa0jJsBZ%2FXt2DE3ZRQ5TWXm5%2Fbwvag%3D&amp;reserved=3D
> 0
