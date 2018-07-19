From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx7d: add missing OPP property for cpu0
Date: Thu, 19 Jul 2018 08:29:58 +0000
Message-ID: <AM3PR04MB1315A99663BCB53A09733015F5520@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1531896889-21377-1-git-send-email-Anson.Huang@nxp.com>
 <20180719032002.GT4576@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719032002.GT4576@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, July 19, 2018 11:20 AM
> To: Anson Huang <anson.huang@nxp.com>; Viresh Kumar
> <viresh.kumar@linaro.org>
> Cc: s.hauer@pengutronix.de; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH] ARM: dts: imx7d: add missing OPP property for cpu0
>=20
> On Wed, Jul 18, 2018 at 02:54:49PM +0800, Anson Huang wrote:
> > Commit b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for
> > CPUs") added "operating-points" property for all CPUs, but missed
> > i.MX7D's cpu0, this patch adds it.
> >
> > Fixes: b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for
> > CPUs")
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>=20
> In general, when you send a patch fixing a commit, you should have the au=
thor
> of that commit copied.  I added Viresh here.

Thanks, I missed it.

>=20
> It looks like a wrong fix to me.  It seems that commit b97872d4eb22 shoul=
dn't
> change imx7d.dtsi at all.  So the correct fix would be reverting the chan=
ge on
> imx7d.dtsi, @Viresh?

Agreed, I think the arch/arm/boot/dts/imx7d.dtsi should NOT be changed, as =
it already
had operating-points-v2 on both CPUs, I sent out another new patch with cor=
rect fix,
please review it.

Thanks.

Anson.


>=20
> Shawn
>=20
> > ---
> >  arch/arm/boot/dts/imx7d.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7d.dtsi
> > b/arch/arm/boot/dts/imx7d.dtsi index 9a772fc..30a1a73 100644
> > --- a/arch/arm/boot/dts/imx7d.dtsi
> > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > @@ -9,6 +9,11 @@
> >  / {
> >  	cpus {
> >  		cpu0: cpu@0 {
> > +			operating-points =3D <
> > +				/* KHz	uV */
> > +				996000	1075000
> > +				792000	975000
> > +			>;
> >  			clock-frequency =3D <996000000>;
> >  			operating-points-v2 =3D <&cpu0_opp_table>;
> >  			#cooling-cells =3D <2>;
> > --
> > 2.7.4
> >
