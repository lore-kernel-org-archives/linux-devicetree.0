From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 3/5] clk: imx: add SCCG PLL type
Date: Fri, 24 Aug 2018 09:40:11 +0200
Message-ID: <20180824074011.lufm653imkf6fyd3@pengutronix.de>
References: <1534945703-4730-1-git-send-email-abel.vesa@nxp.com>
 <1534945703-4730-4-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534945703-4730-4-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

+Cc Andrey Smirnov who made me aware of this issue.

On Wed, Aug 22, 2018 at 04:48:21PM +0300, Abel Vesa wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> The SCCG is a new PLL type introduced on i.MX8. Add support for this.
> The driver currently misses the PLL lock check, as the preliminary
> documentation mentions lock configurations, but is quiet about where
> to find the actual lock status signal.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
> +static int clk_pll1_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_sccg_pll *pll = to_clk_sccg_pll(hw);
> +	u32 val;
> +	u32 divf;
> +
> +	divf = rate / (parent_rate * 2);
> +
> +	val = readl_relaxed(pll->base + PLL_CFG2);
> +	val &= ~(PLL_DIVF_MASK << PLL_DIVF1_SHIFT);
> +	val |= (divf - 1) << PLL_DIVF1_SHIFT;
> +	writel_relaxed(val, pll->base + PLL_CFG2);
> +
> +	/* FIXME: PLL lock check */

Shouldn't be too hard to add, no?

> +
> +	return 0;
> +}
> +
> +static int clk_pll1_prepare(struct clk_hw *hw)
> +{
> +	struct clk_sccg_pll *pll = to_clk_sccg_pll(hw);
> +	u32 val;
> +
> +	val = readl_relaxed(pll->base);
> +	val &= ~(1 << PLL_PD);
> +	writel_relaxed(val, pll->base);

pll->base + PLL_CFG0 please.

> +static const struct clk_ops clk_sccg_pll1_ops = {
> +	.is_prepared	= clk_pll1_is_prepared,
> +	.recalc_rate	= clk_pll1_recalc_rate,
> +	.round_rate	= clk_pll1_round_rate,
> +	.set_rate	= clk_pll1_set_rate,
> +};
> +
> +static const struct clk_ops clk_sccg_pll2_ops = {
> +	.prepare	= clk_pll1_prepare,
> +	.unprepare	= clk_pll1_unprepare,
> +	.recalc_rate	= clk_pll2_recalc_rate,
> +	.round_rate	= clk_pll2_round_rate,
> +	.set_rate	= clk_pll2_set_rate,
> +};

So these are two PLLs that share the same enable register. Doing the
prepare/unprepare for only one PLL can lead to all kinds of trouble.
Finding a good abstraction the properly handles this case with the
clock framework is probably also not easy.

I could imagine we'll need to track the enable state on both PLLs and
only if both are disabled we disable it in hardware.

With the current code we disable the PLLs when all consumers are
reparented to pll1, which probably has bad effects.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
