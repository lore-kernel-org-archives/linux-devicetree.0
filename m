From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 4/5] clk: imx: add imx composite clock
Date: Fri, 24 Aug 2018 09:43:46 +0200
Message-ID: <20180824074346.crkb2qus76lwva5h@pengutronix.de>
References: <1534945703-4730-1-git-send-email-abel.vesa@nxp.com>
 <1534945703-4730-5-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534945703-4730-5-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 04:48:22PM +0300, Abel Vesa wrote:
> Since a lot of clocks on imx8 are formed by a mux, gate, predivider and
> divider, the idea here is to combine all of those into one composite clock,
> but we need to deal with both predivider and divider at the same time and
> therefore we add the imx_clk_composite_divider_ops and register the composite
> clock with those.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/imx/Makefile        |   1 +
>  drivers/clk/imx/clk-composite.c | 157 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h           |   9 +++
>  3 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-composite.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index b87513c..4fabb0a 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -3,6 +3,7 @@
>  obj-y += \
>  	clk.o \
>  	clk-busy.o \
> +	clk-composite.o \
>  	clk-cpu.o \
>  	clk-fixup-div.o \
>  	clk-fixup-mux.o \
> diff --git a/drivers/clk/imx/clk-composite.c b/drivers/clk/imx/clk-composite.c
> new file mode 100644
> index 0000000..a5c0080
> --- /dev/null
> +++ b/drivers/clk/imx/clk-composite.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2018 NXP
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +
> +#include "clk.h"
> +
> +#define PCG_PREDIV_SHIFT	16
> +#define PCG_PREDIV_WIDTH	3
> +
> +#define PCG_DIV_SHIFT		0
> +#define PCG_DIV_WIDTH		6
> +
> +#define PCG_PCS_SHIFT		24
> +#define PCG_PCS_MASK		0x7
> +
> +#define PCG_CGC_SHIFT		28
> +
> +static unsigned long imx_clk_composite_divider_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	unsigned long prediv_rate;
> +	unsigned int prediv_value;
> +	unsigned int div_value;
> +
> +	prediv_value = clk_readl(divider->reg) >> divider->shift;
> +	prediv_value &= clk_div_mask(divider->width);
> +
> +	prediv_rate = divider_recalc_rate(hw, parent_rate, prediv_value,
> +						divider->table, divider->flags,
> +						divider->width);
> +
> +	div_value = clk_readl(divider->reg) >> PCG_DIV_SHIFT;
> +	div_value &= clk_div_mask(PCG_DIV_WIDTH);
> +
> +	return divider_recalc_rate(hw, prediv_rate, div_value, divider->table,
> +				   divider->flags, PCG_DIV_WIDTH);

This is no table based divider, so divider->table is NULL, right? It's
clearer to just write NULL here instead.

Otherwise this looks good for me now.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
