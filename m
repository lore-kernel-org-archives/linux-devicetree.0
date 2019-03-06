From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] Document: dt: binding: imx: Fix PAD_CTL_DSE_X*
Date: Wed, 6 Mar 2019 13:36:42 +0000
Message-ID: <AM0PR04MB42118ED0DB09896BB860AF7C80730@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190222170038.9669-1-cquast@hanoverdisplays.com>
 <VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <db6c2755e80e41f7c169406c213a40e8@agner.ch>
 <AM0PR04MB4211737BF7A85E15090636BD80720@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <VI1PR04MB504036C9FA56673680279BB190730@VI1PR04MB5040.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB504036C9FA56673680279BB190730@VI1PR04MB5040.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: BOUGH CHEN <haibo.chen@nxp.com>, Stefan Agner <stefan@agner.ch>
Cc: Christina Quast <cquast@hanoverdisplays.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

[...]

> > > Btw, I saw that imx7d-sdb.dts (and probably other i.MX 7 boards too)
> > > use three different settings for usdhc pinctrl: 0x59, 0x5a and 0x5b
> > > (for default, 100MHz and 200MHz respectively). One would expect that
> > > higher frequency use higher driver strength (and this is the case for=
 i.MX 6).
> > > But with this new/corrected pad values this means we use x4, x2 and
> > > x6 for default, 100MHz and 200MHz respectively. This hardly seems rig=
ht..?
> > > Probably needs fixing too?
> > >
> >
> > Yes, that's true.
> > Especially 100Mhz setting should be updated.
> >
> > Haibo,
> > Can you please help double check if X2 for 50Mhz and X4 for 100Mhz can
> > work stably on MX7D SDB?
> > If yes, we'd like to update the pad setting according to new RM version=
.
> >
>=20
> X2 for high speed and x4 for ddr50/ddr52 can work stable on MX7D SDB.
> I think all the 7D related dts need to fix this. Not sure whether 7S need=
 this fix,
> can you confirm?
>=20

Yes, please make a patch to test board maintainer.

Regards
Dong Aisheng

> Best Regards
> Haibo Chen
