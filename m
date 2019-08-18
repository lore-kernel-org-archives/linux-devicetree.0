From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 5/6] clk: imx8mn: Add necessary frequency support for ARM PLL table
Date: Sat, 17 Aug 2019 18:11:33 -0700
Message-ID: <20190818011133.CE6F52173B@mail.kernel.org>
References: <1565866783-19672-1-git-send-email-Anson.Huang@nxp.com> <1565866783-19672-5-git-send-email-Anson.Huang@nxp.com> <20190817035220.268F32173B@mail.kernel.org> <DB3PR0402MB3916D320EB51B2D9E28D55E1F5AE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916D320EB51B2D9E28D55E1F5AE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Abel Vesa <abel.vesa@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-08-17 15:22:01)
> Hi, Stephen
>=20
> > Quoting Anson.Huang@nxp.com (2019-08-15 03:59:42)
> > > diff --git a/drivers/clk/imx/clk-imx8mn.c
> > > b/drivers/clk/imx/clk-imx8mn.c index ecd1062..3f1239a 100644
> > > --- a/drivers/clk/imx/clk-imx8mn.c
> > > +++ b/drivers/clk/imx/clk-imx8mn.c
> > > @@ -82,6 +84,7 @@ static struct imx_pll14xx_clk imx8mn_dram_pll =3D {
> > > static struct imx_pll14xx_clk imx8mn_arm_pll =3D {
> > >                 .type =3D PLL_1416X,
> > >                 .rate_table =3D imx8mn_pll1416x_tbl,
> > > +               .rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),
> >=20
> > Why is rate_count added? That's not described in the commit text.
>=20
> rate_count is necessary for table search during set_rate, it was missed p=
reviously,
> I will add it into commit text in V2.
>=20

Right, isn't that a more critical fix to make by itself instead of
rolling into this change that adds a few more frequencies?
