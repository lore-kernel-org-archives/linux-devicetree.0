From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v6 3/5] clk: imx: add SCCG PLL type
Date: Tue, 28 Aug 2018 10:58:22 +0000
Message-ID: <20180828105821.gbd7tba7uvmeeqcx@fsr-ub1664-175>
References: <1534945703-4730-1-git-send-email-abel.vesa@nxp.com>
 <1534945703-4730-4-git-send-email-abel.vesa@nxp.com>
 <20180824074011.lufm653imkf6fyd3@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824074011.lufm653imkf6fyd3@pengutronix.de>
Content-Language: en-US
Content-ID: <9567F8D0E4488A42A2BA7920776C568F@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 24, 2018 at 09:40:11AM +0200, Sascha Hauer wrote:
> +Cc Andrey Smirnov who made me aware of this issue.
>=20
> On Wed, Aug 22, 2018 at 04:48:21PM +0300, Abel Vesa wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >=20
> > The SCCG is a new PLL type introduced on i.MX8. Add support for this.
> > The driver currently misses the PLL lock check, as the preliminary
> > documentation mentions lock configurations, but is quiet about where
> > to find the actual lock status signal.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> > +static int clk_pll1_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			    unsigned long parent_rate)
> > +{
> > +	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
> > +	u32 val;
> > +	u32 divf;
> > +
> > +	divf =3D rate / (parent_rate * 2);
> > +
> > +	val =3D readl_relaxed(pll->base + PLL_CFG2);
> > +	val &=3D ~(PLL_DIVF_MASK << PLL_DIVF1_SHIFT);
> > +	val |=3D (divf - 1) << PLL_DIVF1_SHIFT;
> > +	writel_relaxed(val, pll->base + PLL_CFG2);
> > +
> > +	/* FIXME: PLL lock check */
>=20
> Shouldn't be too hard to add, no?

Added to the next version which I intend to send today.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int clk_pll1_prepare(struct clk_hw *hw)
> > +{
> > +	struct clk_sccg_pll *pll =3D to_clk_sccg_pll(hw);
> > +	u32 val;
> > +
> > +	val =3D readl_relaxed(pll->base);
> > +	val &=3D ~(1 << PLL_PD);
> > +	writel_relaxed(val, pll->base);
>=20
> pll->base + PLL_CFG0 please.

Same as above.

>=20
> > +static const struct clk_ops clk_sccg_pll1_ops =3D {
> > +	.is_prepared	=3D clk_pll1_is_prepared,
> > +	.recalc_rate	=3D clk_pll1_recalc_rate,
> > +	.round_rate	=3D clk_pll1_round_rate,
> > +	.set_rate	=3D clk_pll1_set_rate,
> > +};
> > +
> > +static const struct clk_ops clk_sccg_pll2_ops =3D {
> > +	.prepare	=3D clk_pll1_prepare,
> > +	.unprepare	=3D clk_pll1_unprepare,
> > +	.recalc_rate	=3D clk_pll2_recalc_rate,
> > +	.round_rate	=3D clk_pll2_round_rate,
> > +	.set_rate	=3D clk_pll2_set_rate,
> > +};
>=20
> So these are two PLLs that share the same enable register. Doing the
> prepare/unprepare for only one PLL can lead to all kinds of trouble.
> Finding a good abstraction the properly handles this case with the
> clock framework is probably also not easy.
>=20
> I could imagine we'll need to track the enable state on both PLLs and
> only if both are disabled we disable it in hardware.
>=20
> With the current code we disable the PLLs when all consumers are
> reparented to pll1, which probably has bad effects.
>=20

So it took me a while to understand exactly why this needs to stay like it =
is.

The PLL1 is never used by any device, instead it is used as a source for PL=
L2.

But because the interlink between the two of them is too complicated,
the PLLs 1 and 2 need to be separate clocks.

As for the disabling, it's safe to disable just the second one because,
as mentioned above, the first PLL is never used alone by a device.

If there isn't anything else here to discuss, I would like to send the next
version of this patchset with all the other comments taken care of.

Abel

> Sascha
>=20
> --=20
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 | https://emea01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pengutronix.de%2F&amp;data=3D02=
%7C01%7Cabel.vesa%40nxp.com%7C5e9c7c6f9e464ed522f108d60994d471%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C0%7C636706932168087639&amp;sdata=3DXbfFq5z%2FR=
tkq6yGgwSyk6dNCZVuXOzY%2Fiygmwle3C2I%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

-- =
