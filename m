From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx7d: use operating-points-v2 for cpu
Date: Mon, 21 May 2018 01:58:21 +0000
Message-ID: <AM3PR04MB1315E332CBFDA4151F6F3FA8F5950@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1526446097-7111-1-git-send-email-Anson.Huang@nxp.com>
 <20180520125048.GX26863@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180520125048.GX26863@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Sunday, May 20, 2018 8:51 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
> robh+dt@kernel.org; mark.rutland@arm.com; dl-linux-imx
> <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ARM: dts: imx7d: use operating-points-v2 for cpu
>=20
> On Wed, May 16, 2018 at 12:48:17PM +0800, Anson Huang wrote:
> > This patch uses "operating-points-v2" instead of "operating-points" to
> > be more fit with cpufreq-dt driver.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx7d.dtsi | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx7d.dtsi
> > b/arch/arm/boot/dts/imx7d.dtsi index 4c9877e..28980c8 100644
> > --- a/arch/arm/boot/dts/imx7d.dtsi
> > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > @@ -9,12 +9,8 @@
> >  / {
> >  	cpus {
> >  		cpu0: cpu@0 {
> > -			operating-points =3D <
> > -				/* KHz	uV */
> > -				996000	1075000
> > -				792000	975000
> > -			>;
> >  			clock-frequency =3D <996000000>;
> > +			operating-points-v2 =3D <&cpu0_opp_table>;
> >  		};
> >
> >  		cpu1: cpu@1 {
> > @@ -22,6 +18,24 @@
> >  			device_type =3D "cpu";
> >  			reg =3D <1>;
> >  			clock-frequency =3D <996000000>;
> > +			operating-points-v2 =3D <&cpu0_opp_table>;
> > +		};
> > +	};
> > +
> > +	cpu0_opp_table: opp_table0 {
>=20
> Hyphen is recommended in node name.  Also the suffix 0 doesn't mean too
> much here.  That said, a better node name would be 'opp-table'.
>=20
> > +		compatible =3D "operating-points-v2";
> > +		opp-shared;
> > +
> > +		opp-792000000 {
> > +			opp-hz =3D /bits/ 64 <792000000>;
> > +			opp-microvolt =3D <975000>;
> > +			clock-latency-ns =3D <150000>;
> > +		};
>=20
> We recommend to have a newline between nodes.
>=20
> I fixed them all and applied the patch.
>=20
> Shawn
=20
Thanks Shawn.

Anson.



>=20
> > +		opp-996000000 {
> > +			opp-hz =3D /bits/ 64 <996000000>;
> > +			opp-microvolt =3D <1075000>;
> > +			clock-latency-ns =3D <150000>;
> > +			opp-suspend;
> >  		};
> >  	};
> >
> > --
> > 2.7.4
> >
