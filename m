From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 5/5] arm64: dts: imx8mq: Add the opp table and the
  cpu-supply nodes
Date: Fri, 15 Feb 2019 08:56:25 +0000
Message-ID: <20190215085624.dtc5uyxch72l2q6g@fsr-ub1664-175>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
 <1550084693-9797-6-git-send-email-abel.vesa@nxp.com>
 <76b2c0e4a61d022f7f798990af4dfd8b@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <76b2c0e4a61d022f7f798990af4dfd8b@www.akkea.ca>
Content-Language: en-US
Content-ID: <2998E0C023992748802F4B623D2C5B93@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel-owner@vger.kernel.org" <linux-kernel-owner@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19-02-14 16:55:22, Angus Ainslie wrote:
> On 2019-02-13 11:05, Abel Vesa wrote:
> > Add the opp table containing only non over drive opps.
> > Also add the cpu-supply nodes for the A53 cores in the EVK board.
> >=20
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17 +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 23
> > +++++++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > index 54737bf..114359e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > @@ -31,6 +31,23 @@
> >  		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> >  	};
> > +
> > +};
> > +
> > +&A53_0 {
> > +	cpu-supply =3D <&sw1a_reg>;
> > +};
> > +
> > +&A53_1 {
> > +	cpu-supply =3D <&sw1a_reg>;
> > +};
> > +
> > +&A53_2 {
> > +	cpu-supply =3D <&sw1a_reg>;
> > +};
> > +
> > +&A53_3 {
> > +	cpu-supply =3D <&sw1a_reg>;
> >  };
> >=20
> >  &fec1 {
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index 1a89062..89b2d5f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -91,6 +91,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> >=20
> >  		A53_1: cpu@1 {
> > @@ -101,6 +102,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> >=20
> >  		A53_2: cpu@2 {
> > @@ -111,6 +113,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> >=20
> >  		A53_3: cpu@3 {
> > @@ -121,6 +124,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> >=20
> >  		A53_L2: l2-cache0 {
> > @@ -666,6 +670,25 @@
> >  			status =3D "disabled";
> >  		};
> >=20
> > +
> > +		a53_0_opp_table: opp-table {
> > +			compatible =3D "operating-points-v2";
> > +			opp-shared;
> > +
> > +			opp-800000000 {
> > +				opp-hz =3D /bits/ 64 <800000000>;
> > +				opp-microvolt =3D <900000>;
> > +				clock-latency-ns =3D <150000>;
> > +			};
> > +
> > +			opp-1000000000 {
> > +				opp-hz =3D /bits/ 64 <1000000000>;
> > +				opp-microvolt =3D <900000>;
>=20
> Shouldn't this be
>=20
> opp-microvolt =3D <1000000>;
>=20

Hmm, I looked into some older datasheet which said the maximum non
overdrive is 1GHz.

But the latest one I could find:

https://www.nxp.com/docs/en/data-sheet/IMX8MDQLQIEC.pdf

says it's 0.8GHz.=20

So I'll fix it in the next version.

Thanks.

> > +				clock-latency-ns =3D <150000>;
> > +				opp-suspend;
> > +			};
> > +		};
> > +
> >  		gic: interrupt-controller@38800000 {
> >  			compatible =3D "arm,gic-v3";
> >  			reg =3D <0x38800000 0x10000>,	/* GIC Dist */
> =
