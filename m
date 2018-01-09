From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 2/2] ARM: dts: imx7s: add snvs rtc clock
Date: Tue, 9 Jan 2018 01:43:25 +0000
Message-ID: <AM3PR04MB131588945BE9C5504C6EC0E8F5100@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
 <1515078402-22135-2-git-send-email-Anson.Huang@nxp.com>
 <20180108103915.GD32635@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108103915.GD32635@b29396-OptiPlex-7040>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "stefan@agner.ch" <stefan@agner.ch>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org



Best Regards!
Anson Huang


> -----Original Message-----
> From: Dong Aisheng [mailto:dongas86@gmail.com]
> Sent: 2018-01-08 6:39 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org; linu=
x-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx <linux-
> imx@nxp.com>; shawnguo@kernel.org; kernel@pengutronix.de; Fabio
> Estevam <fabio.estevam@nxp.com>; mturquette@baylibre.com;
> sboyd@codeaurora.org; robh+dt@kernel.org; mark.rutland@arm.com;
> stefan@agner.ch; linux@armlinux.org.uk
> Subject: Re: [PATCH 2/2] ARM: dts: imx7s: add snvs rtc clock
>=20
> On Thu, Jan 04, 2018 at 11:06:42PM +0800, Anson Huang wrote:
> > Add i.MX7 SNVS RTC clock.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>=20
> If this clock IMX7D_SNVS_CLK is used for all SNVS sub modules, then
> snvs_poweroff and snvs_pwrkey should also rely on it, right?
>=20
> How about add them all in one time?
>=20
> BTW, syscon-poweroff seems still not introduce clock support and fsl,sec-=
v4.0-
> pwrkey also does not handle clock, they may need to be added later.
>=20
> Regards
> Dong Aisheng

Yes, I thought about it before sending patch, but currently the poweroff an=
d pwrkey driver do NOT
handle clocks, so I plan to add them later, including handling clocks in dr=
iver and dtb.

Anson

>=20
> > ---
> >  arch/arm/boot/dts/imx7s.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7s.dtsi
> > b/arch/arm/boot/dts/imx7s.dtsi index e718fd2..f9b97f3 100644
> > --- a/arch/arm/boot/dts/imx7s.dtsi
> > +++ b/arch/arm/boot/dts/imx7s.dtsi
> > @@ -534,6 +534,8 @@
> >  					offset =3D <0x34>;
> >  					interrupts =3D <GIC_SPI 19
> IRQ_TYPE_LEVEL_HIGH>,
> >  						     <GIC_SPI 20
> IRQ_TYPE_LEVEL_HIGH>;
> > +					clocks =3D <&clks IMX7D_SNVS_CLK>;
> > +					clock-names =3D "snvs-rtc";
> >  				};
> >
> >  				snvs_poweroff: snvs-poweroff {
> > --
> > 1.9.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-clk"
> > in the body of a message to majordomo@vger.kernel.org More majordomo
> > info at
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fvge=
r
> > .kernel.org%2Fmajordomo-
> info.html&data=3D02%7C01%7CAnson.Huang%40nxp.com
> > %7Cd10ff23b822b4cd16c2708d5568417c6%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635
> > %7C0%7C0%7C636510047707248763&sdata=3DFMx22hfKxs7YA%2F1zCVeYCnVX
> 9Ck4MmB9
> > GuolA51V2eg%3D&reserved=3D0
