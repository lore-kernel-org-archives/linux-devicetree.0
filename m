From: Marek Vasut <marex@denx.de>
Subject: Re: [RFC v5 01/15] WIP: clk: add Atheros AR933X SoCs clock driver
Date: Tue, 9 Feb 2016 12:05:36 +0100
Message-ID: <201602091205.36276.marex@denx.de>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com> <1455005641-7079-2-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455005641-7079-2-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-mips@linux-mips.org, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Alban Bedel <albeu@free.fr>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday, February 09, 2016 at 09:13:47 AM, Antony Pavlov wrote:
> This driver can be easely upgraded for other Atheros
> SoCs (e.g. AR724X/AR913X) support.
> 

Hi!

[...]

> +static unsigned long
> +ath79_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct ath79_clk *ath79_clk = to_ath79_clk(hw);
> +	struct ath79_cblk *cblk = ath79_clk->cblk;
> +	const struct ath79_clk_info *clk_info =
> &cblk->clock_info[ath79_clk->idx]; +	const struct ath79_pll_info
> *pll_info;
> +	unsigned long rate;
> +	unsigned long freq;
> +	u32 clock_ctrl;
> +	u32 cpu_config;
> +	u32 t;
> +
> +	BUG_ON(clk_info->type != ATH79_CLK_PLL);
> +
> +	clock_ctrl = __raw_readl(cblk->base + AR933X_PLL_CLOCK_CTRL_REG);
> +
> +	if (clock_ctrl & AR933X_PLL_CLOCK_CTRL_BYPASS) {
> +		return parent_rate;
> +	}

You can drop the {} here.

> +	cpu_config = __raw_readl(cblk->base + AR933X_PLL_CPU_CONFIG_REG);
> +
> +	t = (cpu_config >> AR933X_PLL_CPU_CONFIG_REFDIV_SHIFT) &
> +	    AR933X_PLL_CPU_CONFIG_REFDIV_MASK;
> +	freq = parent_rate / t;
> +
> +	t = (cpu_config >> AR933X_PLL_CPU_CONFIG_NINT_SHIFT) &
> +	    AR933X_PLL_CPU_CONFIG_NINT_MASK;
> +	freq *= t;
> +
> +	t = (cpu_config >> AR933X_PLL_CPU_CONFIG_OUTDIV_SHIFT) &
> +	    AR933X_PLL_CPU_CONFIG_OUTDIV_MASK;
> +	if (t == 0)
> +		t = 1;
> +
> +	freq >>= t;
> +
> +	pll_info = &clk_info->pll;
> +
> +	t = ((clock_ctrl >> pll_info->div_shift) & pll_info->div_mask) + 1;
> +	rate = freq / t;
> +
> +	return rate;
> +}

[...]

> +static void __init ar9130_init(struct device_node *np)
> +{
> +	int retval;
> +	struct ath79_cblk *cblk;
> +
> +	cblk = ath79_cblk_new(ar9331_clocks, ARRAY_SIZE(ar9331_clocks), np);
> +	if (!cblk) {
> +		pr_err("%s: failed to initialise clk block\n", __func__);
> +		return;
> +	}
> +
> +	retval = ath79_cblk_register_clocks(cblk);
> +	if (retval)
> +		pr_err("%s: failed to register clocks\n", __func__);
> +}
> +CLK_OF_DECLARE(ar933x_clk, "qca,ar9330-pll", ar9130_init);

Is that ar9130_init name correct? Shouldn't it be ar9330_init ?

Looks good otherwise, thanks!
