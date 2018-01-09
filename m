From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off state
Date: Tue, 9 Jan 2018 09:25:59 +0000
Message-ID: <AM3PR04MB13155287E5AAAF5407AF68A6F5100@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180109092232.GA26312@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180109092232.GA26312@b29396-OptiPlex-7040>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org



Best Regards!
Anson Huang


> -----Original Message-----
> From: Dong Aisheng [mailto:dongas86@gmail.com]
> Sent: 2018-01-09 5:23 PM
> To: Stefan Agner <stefan@agner.ch>
> Cc: shawnguo@kernel.org; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Anson Huang <anson.huang@nxp.com>; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off s=
tate
>=20
> On Tue, Jan 02, 2018 at 05:42:17PM +0100, Stefan Agner wrote:
> > When the CPU is in ARM power off state the ARM architected timers are
> > stopped. The flag is already present in the higher power WAIT mode.
> >
> > This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
> > Without the flag the kernel freezes when the timer enters the first
> > time ARM power off mode.
> >
> > Cc: Anson Huang <anson.huang@nxp.com>
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>=20
> It seems ok at my side.
> Did you meet the real issue? If yes, how to reproduce?
>=20
> Both mx6sx and mx6ul are using GPT which do not need that flag, suppose w=
e
> should remove it, right?
> Anson can help confirm it.

For UP system like i.MX6SX, we do NOT enable "cortex-a9-twd-timer", so loca=
l
timer is NOT used, GPT is used instead, GPT's clock is NOT disabled when cp=
uidle,
so I think we should remove all these Timer stop flag for 6SX CPUIDLE.

Anson.

>=20
> Regards
> Dong Aisheng
>=20
> > ---
> >  arch/arm/mach-imx/cpuidle-imx6sx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c
> > b/arch/arm/mach-imx/cpuidle-imx6sx.c
> > index c5a5c3a70ab1..d0f14b761ff7 100644
> > --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
> > +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
> > @@ -89,6 +89,7 @@ static struct cpuidle_driver imx6sx_cpuidle_driver =
=3D {
> >  			 */
> >  			.exit_latency =3D 300,
> >  			.target_residency =3D 500,
> > +			.flags =3D CPUIDLE_FLAG_TIMER_STOP,
> >  			.enter =3D imx6sx_enter_wait,
> >  			.name =3D "LOW-POWER-IDLE",
> >  			.desc =3D "ARM power off",
> > --
> > 2.15.1
> >
