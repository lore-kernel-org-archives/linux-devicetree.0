From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Mon, 10 Jun 2019 08:14:25 -0700
Message-ID: <20190610151425.D8139207E0@mail.kernel.org>
References: <20190604015928.23157-1-Anson.Huang@nxp.com> <20190604015928.23157-3-Anson.Huang@nxp.com> <20190606162543.EFFB820645@mail.kernel.org> <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com> <20190607180039.611C7208C0@mail.kernel.org> <DB3PR0402MB391678C245944942EA2A7F62F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB391678C245944942EA2A7F62F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-06-08 02:58:18)
> Hi, Stephen
>=20
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Sent: Saturday, June 8, 2019 2:01 AM
> > To: bjorn.andersson@linaro.org; catalin.marinas@arm.com;
> > devicetree@vger.kernel.org; dinguyen@kernel.org;
> > enric.balletbo@collabora.com; festevam@gmail.com;
> > horms+renesas@verge.net.au; jagan@amarulasolutions.com;
> > kernel@pengutronix.de; l.stach@pengutronix.de; linux-arm-
> > kernel@lists.infradead.org; linux-clk@vger.kernel.org; linux-
> > kernel@vger.kernel.org; mark.rutland@arm.com;
> > maxime.ripard@bootlin.com; mturquette@baylibre.com; olof@lixom.net;
> > robh+dt@kernel.org; s.hauer@pengutronix .de <s.hauer@pengutronix.de>;
> > shawnguo@kernel.org; will.deacon@arm.com; Abel Vesa
> > <abel.vesa@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>; Anson
> > Huang <anson.huang@nxp.com>; Jacky Bai <ping.bai@nxp.com>; Leonard
> > Crestez <leonard.crestez@nxp.com>
> > Cc: dl-linux-imx <linux-imx@nxp.com>
> > Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock dri=
ver
> >=20
> > Quoting Anson Huang (2019-06-06 17:50:28)
> > >
> > > I will use devm_platform_ioremap_resource() instead of ioremap(), and
> > > can you be more specific about devmified clk registration?
> > >
> >=20
> > I mean using things like devm_clk_hw_register().
>=20
> Sorry, I am still a little confused, all the clock register(clk_register(=
)) are via each different
> clock types like imx_clk_gate4/imx_clk_pll14xx, if using clk_hw_register,=
 means we need
> to re-write the clock driver using different clk register method, that wi=
ll make the driver
> completely different from i.mx8mq/i.mx8mm, they are actually same series =
of SoC as i.mx8mn,
> it will introduce many confusion, is my understanding correct? And is it =
OK to just keep what
> it is and make them all aligned?
>=20

Ok, the problem I'm trying to point out is that clk registrations need
to be undone, i.e. clk_unregister() needs to be called, when the driver
fails to probe. devm_*() is one way to do this, but if you have other
ways of removing all the registered clks then that works too. Makes
sense?
