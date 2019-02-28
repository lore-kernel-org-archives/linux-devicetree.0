From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mq: Add the opp table and cores
 opp properties
Date: Thu, 28 Feb 2019 14:28:18 +0000
Message-ID: <20190228142817.wxgv5u5y6v5rncwo@fsr-ub1664-175>
References: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
 <1550254032-16451-4-git-send-email-abel.vesa@nxp.com>
 <20190228142030.GB29231@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228142030.GB29231@dragon>
Content-Language: en-US
Content-ID: <750FFEAC4349A1428AC36753A9F5524A@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 19-02-28 22:20:32, Shawn Guo wrote:
> On Fri, Feb 15, 2019 at 06:07:24PM +0000, Abel Vesa wrote:
> > Add the 0.8GHz and 1GHz opps. According to the datasheet:
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.nxp.com%2Fdocs%2Fen%2Fdata-sheet%2FIMX8MDQLQIEC.pdf&amp;data=3D02%7C01%7C=
abel.vesa%40nxp.com%7C05d898b625824204bb3908d69d880aaf%7C686ea1d3bc2b4c6fa9=
2cd99c5c301635%7C0%7C1%7C636869604952370425&amp;sdata=3DyDuM%2ByO%2F9twQ3cX=
TR%2FkCSSfxOMm015qG%2FfBSFZC91SQ%3D&amp;reserved=3D0
> > section 3.1.3 Operating ranges.
> >=20
> > The 0.8GHz opp runs in nominal mode with the regulator set to 0.9V.
> > The 1GHz runs in overdrive mode with the regulator set to 1V.
> >=20
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mq.dtsi
> > index 1a89062..ebdec9e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -91,6 +91,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> > =20
> >  		A53_1: cpu@1 {
> > @@ -101,6 +102,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> > =20
> >  		A53_2: cpu@2 {
> > @@ -111,6 +113,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> > =20
> >  		A53_3: cpu@3 {
> > @@ -121,6 +124,7 @@
> >  			clocks =3D <&clk IMX8MQ_CLK_ARM>;
> >  			enable-method =3D "psci";
> >  			next-level-cache =3D <&A53_L2>;
> > +			operating-points-v2 =3D <&a53_0_opp_table>;
> >  		};
> > =20
> >  		A53_L2: l2-cache0 {
> > @@ -666,6 +670,25 @@
> >  			status =3D "disabled";
> >  		};
> > =20
> > +
> > +		a53_0_opp_table: opp-table {
>=20
> What's the point of having '0' in the label name, considering it's
> actually referred by all CPU nodes?
>=20

Good catch. Will remove and resend.

Thanks.

> Shawn
>=20
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
> > +				opp-microvolt =3D <1000000>;
> > +				clock-latency-ns =3D <150000>;
> > +				opp-suspend;
> > +			};
> > +		};
> > +
> >  		gic: interrupt-controller@38800000 {
> >  			compatible =3D "arm,gic-v3";
> >  			reg =3D <0x38800000 0x10000>,	/* GIC Dist */
> > --=20
> > 2.7.4
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
ts.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=3D02%7C01=
%7Cabel.vesa%40nxp.com%7C05d898b625824204bb3908d69d880aaf%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0%7C1%7C636869604952370425&amp;sdata=3DHD1WvWQJGR319rM5=
OrQRXRLU2zEuHzEeLMkq3vbi3OA%3D&amp;reserved=3D0=
