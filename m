From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 5/5] arm64: dts: imx8mq: Add the opp table and the
 cpu-supply nodes
Date: Thu, 14 Feb 2019 17:18:07 +0000
Message-ID: <20190214171806.kufhw7ouguxt5jhq@fsr-ub1664-175>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
 <1550084693-9797-6-git-send-email-abel.vesa@nxp.com>
 <1550159428.2546.40.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159428.2546.40.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <C59E0F6826FFEB43AD5E013C932B78C0@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 19-02-14 16:50:28, Lucas Stach wrote:
> Hi Abel
>=20
> Am Mittwoch, den 13.02.2019, 19:05 +0000 schrieb Abel Vesa:
> > Add the opp table containing only non over drive opps.
> > Also add the cpu-supply nodes for the A53 cores in the EVK board.
> >=20
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> > =A0arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17 +++++++++++++++++
> > =A0arch/arm64/boot/dts/freescale/imx8mq.dtsi=A0=A0=A0=A0| 23 ++++++++++=
+++++++++++++
> > =A02 files changed, 40 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > index 54737bf..114359e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > @@ -31,6 +31,23 @@
> > =A0		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > =A0		enable-active-high;
> > =A0	};
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
> > =A0};
>=20
> This should be a separate patch.
>=20

OK, will send as separate patches in the next version.

> And AFAICS this is wrong, sw1a on the MX8M-EVK is the GPU supply, the
> CPU is supplied by a dedicated switcher that is controlled via a GPIO.
>=20

Hmm, I think you're right. At least this is what the following document say=
s.

https://www.mouser.com/ds/2/302/IMX8MDQLQEVKHUG-1280333.pdf

So I guess this means there will not be any cpu-supply properties.=20

Thanks,
Abel

> Regards,
> Lucas
>=20
> > =A0&fec1 {
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index 1a89062..89b2d5f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -91,6 +91,7 @@
> > =A0			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> > =A0			enable-method =3D "psci";
> > =A0			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> > =A0		};
> > =A0
> > =A0		A53_1: cpu@1 {
> > @@ -101,6 +102,7 @@
> > =A0			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> > =A0			enable-method =3D "psci";
> > =A0			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> > =A0		};
> > =A0
> > =A0		A53_2: cpu@2 {
> > @@ -111,6 +113,7 @@
> > =A0			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> > =A0			enable-method =3D "psci";
> > =A0			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> > =A0		};
> > =A0
> > =A0		A53_3: cpu@3 {
> > @@ -121,6 +124,7 @@
> > =A0			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> > =A0			enable-method =3D "psci";
> > =A0			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> > =A0		};
> > =A0
> > =A0		A53_L2: l2-cache0 {
> > @@ -666,6 +670,25 @@
> > =A0			status =3D "disabled";
> > =A0		};
> > =A0
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
> > +				clock-latency-ns =3D <150000>;
> > +				opp-suspend;
> > +			};
> > +		};
> > +
> > =A0		gic: interrupt-controller@38800000 {
> > =A0			compatible =3D "arm,gic-v3";
> > =A0			reg =3D <0x38800000 0x10000>,	/* GIC
> > Dist */=
