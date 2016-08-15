From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: qcom: ipq4019: Added the apss cpu pll
 divider clock node
Date: Mon, 15 Aug 2016 15:31:32 -0700
Message-ID: <20160815223132.GN361@codeaurora.org>
References: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
 <1466516962-18087-3-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466516962-18087-3-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pradeepb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ntelkar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/21, Abhishek Sahu wrote:
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index 17ca6d3..4c8a97f 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -154,7 +154,7 @@ static const char * const gcc_xo_ddr_500_200[] = {
>  	"xo",
>  	"gcc_fepll200_clk",
>  	"gcc_fepll500_clk",
> -	"ddrpllapss",
> +	"gcc_apps_cpu_plldiv_clk",
>  };
>  
>  #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> @@ -571,6 +571,7 @@ static struct clk_rcg2 apps_clk_src = {
>  		.parent_names = gcc_xo_ddr_500_200,
>  		.num_parents = 4,
>  		.ops = &clk_rcg2_ops,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -1273,6 +1274,114 @@ static struct clk_pll_vco gcc_fepll_vco = {
>  	},
>  };
>  
> +/*
> + * Round rate function for APPS CPU PLL Clock divider.
> + * It Returns the input rate without changing it. The hardware supported rate
> + * will be calculated in set function by getting the same from frequency table.
> + */
> +static long clk_cpu_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *p_rate)
> +{
> +	return rate;

This needs to calculate what the rate will be if clk_set_rate()
is called with the rate parameter. Blindly returning rate back is not
acceptable.

> +};
> +
> +/*
> + * Clock set rate function for APPS CPU PLL Clock divider.
> + * It looks up the frequency table and updates the PLL divider to corresponding
> + * divider value.
> + */
> +static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	struct clk_pll_div *rcg = to_clk_pll_div(hw);
> +	const struct freq_tbl *f;
> +	u32 mask;
> +	int ret;
> +
> +	f = qcom_find_freq(rcg->freq_tbl, rate);
> +	if (!f)
> +		return -EINVAL;
> +
> +	mask = (BIT(rcg->cdiv.width) - 1) << rcg->cdiv.shift;
> +	ret = regmap_update_bits(rcg->cdiv.clkr.regmap,
> +				rcg->cdiv.reg, mask,
> +				(f->pre_div << rcg->cdiv.shift) & mask);

Why are we masking a value that will be masked by
regmap_update_bits()?

> +	udelay(1);

Why do we wait? Please add some comment.

> +
> +	return 0;
> +};
> +
> +/*
> + * Clock frequency calculation function for APPS CPU PLL Clock divider.
> + * This clock divider is nonlinear so this function calculates the actual
> + * divider and returns the output frequency by dividing VCO Frequency
> + * with this actual divider value.
> + */
> +static unsigned long clk_cpu_div_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_pll_div *rcg = to_clk_pll_div(hw);
> +	u32 cdiv, pre_div;
> +
> +	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
> +	cdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
> +
> +	/*
> +	 * Some dividers have value in 0.5 fraction so multiply both VCO
> +	 * frequency(parent_rate) and pre_div with 2 to make integer
> +	 * calculation.
> +	 */
> +	if (cdiv > 10)
> +		pre_div = (cdiv + 1) * 2;
> +	else
> +		pre_div = cdiv + 12;
> +
> +	return clk_calc_divider_rate(parent_rate * 2, pre_div);
> +};
> +
> +const struct clk_ops clk_regmap_cpu_div_ops = {

static?

> +	.round_rate = clk_cpu_div_round_rate,
> +	.set_rate = clk_cpu_div_set_rate,
> +	.recalc_rate = clk_cpu_div_recalc_rate,
> +};
> +
> +static const struct freq_tbl ftbl_apps_ddr_pll[] = {
> +	{380000000, P_XO, 0xD, 0},
> +	{409000000, P_XO, 0xC, 0, 0},
> +	{444000000, P_XO, 0xB, 0, 0},
> +	{484000000, P_XO, 0xA, 0, 0},
> +	{507000000, P_XO, 0x9, 0, 0},
> +	{532000000, P_XO, 0x8, 0, 0},
> +	{560000000, P_XO, 0x7, 0, 0},
> +	{592000000, P_XO, 0x6, 0, 0},
> +	{626000000, P_XO, 0x5, 0, 0},
> +	{666000000, P_XO, 0x4, 0, 0},
> +	{710000000, P_XO, 0x3, 0, 0},
> +	{761000000, P_XO, 0x2, 0, 0},
> +	{819000000, P_XO, 0x1, 0, 0},
> +	{888000000, P_XO, 0x0, 0, 0},

Style nits from before apply here (lowercase, spaces)

> +	{}
> +};
> +
> +static struct clk_pll_div gcc_apps_cpu_plldiv_clk = {
> +	.cdiv.reg = 0x2E020,
> +	.cdiv.shift = 4,
> +	.cdiv.width = 4,
> +	.cdiv.clkr = {
> +		.enable_reg = 0x2E000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_apps_cpu_plldiv_clk",
> +			.parent_names = (const char *[]){
> +				"gcc_apps_ddrpll_vco",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_cpu_div_ops,
> +		},
> +	},
> +	.freq_tbl = ftbl_apps_ddr_pll,
> +};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
