From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/5] clk: berlin: add common clk driver for newer SoCs
Date: Thu, 1 Oct 2015 15:38:36 -0700
Message-ID: <20151001223836.GR19319@codeaurora.org>
References: <1442931156-5877-1-git-send-email-jszhang@marvell.com>
 <1442931156-5877-3-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442931156-5877-3-git-send-email-jszhang@marvell.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/22, Jisheng Zhang wrote:
> +
> +static u8 clk_div[] = {1, 2, 4, 6, 8, 12, 1, 1};
> +
> +static unsigned long berlin_clk_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	u32 val, divider;
> +	struct berlin_clk *clk = to_berlin_clk(hw);
> +
> +	val = readl_relaxed(clk->base);
> +	if (val & CLKD3SWITCH)
> +		divider = 3;
> +	else {
> +		if (val & CLKSWITCH) {
> +			val >>= CLKSEL_SHIFT;
> +			val &= CLKSEL_MASK;
> +			divider = clk_div[val];
> +		} else
> +			divider = 1;
> +	}

How about we drop the clk_div array and use code?

		if (val & CLKSWITCH) {
			val >>= CLKSEL_SHIFT;
			val &= CLKSEL_MASK;
		}

		divider = 1
		if (val < 6)
			divider <<= val;

> +
> +	return parent_rate / divider;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
