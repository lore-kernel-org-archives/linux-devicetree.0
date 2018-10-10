From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v10 4/5] clk: imx: add imx composite clock
Date: Wed, 10 Oct 2018 07:50:41 +0000
Message-ID: <20181010075040.lcpdsw433vfet3ok@fsr-ub1664-175>
References: <1539074230-27277-1-git-send-email-abel.vesa@nxp.com>
 <1539074230-27277-5-git-send-email-abel.vesa@nxp.com>
 <5c0cc4de8403fca17431a9382f7e34e8003f497b.camel@nxp.com>
 <20181010053744.5pxrlcdxmmyisu62@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010053744.5pxrlcdxmmyisu62@pengutronix.de>
Content-Language: en-US
Content-ID: <8154C3D079ABF34BAFDD6596570EF2CB@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "abelvesa@linux.com" <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 07:37:44AM +0200, Sascha Hauer wrote:
> On Tue, Oct 09, 2018 at 10:56:14PM +0000, Leonard Crestez wrote:
> > On Tue, 2018-10-09 at 08:37 +0000, Abel Vesa wrote:
> > > +struct clk *imx_clk_composite_8m_flags(const char *name,
> > > +					const char **parent_names,
> > > +					int num_parents, void __iomem *reg,
> > > +					unsigned long flags);
> > > +
> > > +#define __imx_clk_composite_8m(name, parent_names, reg, flags) \
> > > +	imx_clk_composite_8m_flags(name, parent_names, \
> > > +		ARRAY_SIZE(parent_names), reg, \
> > > +		flags | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
> > > +
> > > +#define imx_clk_composite_8m(name, parent_names, reg) \
> > > +	__imx_clk_composite_8m(name, parent_names, reg, 0)
> > > +
> > > +#define imx_clk_composite_8m_critical(name, parent_names, reg) \
> > > +	__imx_clk_composite_8m(name, parent_names, reg, CLK_IS_CRITICAL)
> >=20
> > Does anyone else think that the "8m" would be prettier next to imx
> > rather than as a suffix? Using imx8m_clk_composite* and
> > imx7ulp_clk_composite* makes more sense to me.
>=20
> +1
>=20
> Sascha

Just sent another version.

Abel

>=20
> --=20
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | https://emea01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pengutronix.de%2F&amp;data=3D02=
%7C01%7Cabel.vesa%40nxp.com%7C4eaf85c4f4504cc112d908d62e72870e%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C0%7C636747466762782779&amp;sdata=3DmuaryKQFzFY=
CKzVw4XNxzp0m1Y1wZmAsfwNBodJfTKY%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

-- =
