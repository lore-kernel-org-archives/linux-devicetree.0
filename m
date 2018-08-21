From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RESEND v5 4/5] clk: imx: add imx composite clock
Date: Tue, 21 Aug 2018 08:58:30 +0200
Message-ID: <20180821065830.x5illrgyqct6h3nf@pengutronix.de>
References: <1534749367-31085-1-git-send-email-abel.vesa@nxp.com>
 <1534749367-31085-5-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534749367-31085-5-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, linux-imx@nxp.com, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2018 at 10:16:06AM +0300, Abel Vesa wrote:
> Since a lot of clocks on imx8 are formed by a mux, gate, predivider and
> divider, the idea here is to combine all of those into one more complex
> clock type, therefore moving the complexity inside the composite clock and
> outside of the SoC specific clock driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/imx/Makefile        |   1 +
>  drivers/clk/imx/clk-composite.c | 126 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h           |   9 +++
>  3 files changed, 136 insertions(+)
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
> index 0000000..717c6f1
> --- /dev/null
> +++ b/drivers/clk/imx/clk-composite.c
> @@ -0,0 +1,126 @@
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
> +	return clk_divider_ops.recalc_rate(hw, parent_rate);
> +}
> +
> +static long imx_clk_composite_divider_round_rate(struct clk_hw *hw,
> +						unsigned long rate,
> +						unsigned long *prate)
> +{
> +	return clk_divider_ops.round_rate(hw, rate, prate);
> +}
> +
> +static int imx_clk_composite_divider_set_rate(struct clk_hw *hw,
> +					unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	int value;
> +	unsigned long flags = 0;
> +	u32 val;
> +
> +	value = divider_get_val(rate, parent_rate, NULL,
> +				PCG_PREDIV_WIDTH, CLK_DIVIDER_ROUND_CLOSEST);
> +	if (value < 0)
> +		return value;
> +
> +	spin_lock_irqsave(divider->lock, flags);
> +
> +	val = clk_readl(divider->reg);
> +	val &= ~((clk_div_mask(divider->width) << divider->shift) |
> +			(clk_div_mask(PCG_DIV_WIDTH) << PCG_DIV_SHIFT));
> +
> +	val |= (u32)value << divider->shift;
> +	val |= (u32)value << PCG_DIV_SHIFT;
> +	clk_writel(val, divider->reg);
> +
> +	spin_unlock_irqrestore(divider->lock, flags);
> +
> +	return 0;
> +}

Have you tested this works? I thought those are two cascaded dividers
and you program both to the same value. Normally you would have to
calculate individual values for each divider which together give you the
desired output rate.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
