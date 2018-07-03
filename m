From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Tue, 3 Jul 2018 07:44:10 +0000
Message-ID: <AM3PR04MB131542D42FCD798FDBBA54BFF5420@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <CAOMZO5BjOEGWv2dC-bp0BYHq+PhLssEKic+o7ock8_1Dobd=sQ@mail.gmail.com>
 <AM3PR04MB131507901BFEE1A5E426EECBF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
 <AM3PR04MB1315E7AED2BCE2265E6C443DF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8v4KM9S4ooHTDbA+vc8BZN_eO_wDuOPA+8Hcq-SmLDw@mail.gmail.com>
 <AM3PR04MB1315C7C7CFF990615732FFBCF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5AM5VRS7UiWuvAQ8vvTB8OM+iwofuYrbsL_yB9e0Z9Kyg@mail.gmail.com>
 <AM3PR04MB13155B8D567ABEF7EF03249AF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5BdtxKjQge5ONpnjr1yNVeTJf4u8Gh-fPqpHz7G9ipOTg@mail.gmail.com>
 <1530526335.15665.13.camel@nxp.com> <20180703053843.GC4348@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703053843.GC4348@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: "festevam@gmail.com" <festevam@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Tuesday, July 3, 2018 1:39 PM
> To: Robin Gong <yibin.gong@nxp.com>
> Cc: festevam@gmail.com; Anson Huang <anson.huang@nxp.com>;
> mark.rutland@arm.com; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; robh+dt@kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
>=20
> On Mon, Jul 02, 2018 at 02:12:52AM +0000, Robin Gong wrote:
> > But in fact, the original dts is not correct without
> > 'regulator-always- on'since SW4 is the critical DDR power rail,
> > although, it's kept on in the previous kernel by no switches
> > enable/disable interfaces provided in pfuze driver. Adding new
> > property which can be done totally by the common 'regulator-always-on'
> > is not a good choice. Keep the dts patch adding 'regulator-always-on'
> > ahead of pfuze driver pach adding enable/disable interface is enough fo=
r such
> case I think.
>=20
> We can not just break the installed DTBs like this.  If patching regulato=
r driver
> with a new property is really difficult, we could migrate the existing us=
ers in a
> 'soft' way:
=20
Patching regulator driver needs to add property for those regulators can be=
 OFF,
it will make users confuse with original regulator framework knowledge, NOT=
 a
good idea.

>=20
>  - Add required regulator-always-on for regulator nodes in DTS.
=20
I & Yibin already sent out patch to add " regulator-always-on " for regulat=
or nodes in DTS,
so they can be applied first?


>  - Patch i.MX platform code to check the presence of regulator-always-on
>    property for critical regulators, and give a big warning if it's
>    missing.
It is NOT easy to identify which switch is critical or NOT, and different p=
latforms
have different board design, it will introduce many platform specified code=
, so I think
just revert the pfuze100 switch enable/disable patch should be OK for now.=
=20

>  - Wait for a couple of release cycles for users to migrate.
>  - Add regulator driver patch back and break users who keep ignoring
>    the warning.
After a couple of release cycles, add the pfuze100 switch enable/disable pa=
tch
back to support this feature, I believe users should switch to new dtb with=
 "regulator-always-on"=20
existing already.

Anson.

>=20
> Shawn
