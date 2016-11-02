From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 1/7] clk: qcom: ipq4019: Added the clock nodes and
 operations for pll
Date: Tue, 1 Nov 2016 18:22:11 -0700
Message-ID: <20161102012211.GC16026@codeaurora.org>
References: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
 <1474460512-31994-2-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474460512-31994-2-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/21, Abhishek Sahu wrote:
> The current ipq4019 clock driver registered the PLL clocks and
> dividers as fixed clock. These fixed clock needs to be removed
> from driver probe function and same need to be registered with
> clock framework. These PLL clocks should be programmed only
> once and the same are being programmed already by the boot
> loader so the set rate operation is not required for these
> clocks. Only the rate can be calculated by clock operations
> in clock driver file so this patch adds the same.
> 
> The PLL takes the reference clock from XO and generates the
> intermediate VCO frequency. This VCO frequency will be divided
> down by different PLL internal dividers. Some of the PLL
> internal dividers are fixed while other are programmable.
> 
> This patch does the following changes.

This should never be in the commit text. What a patch does should
be obvious from the patch itself. Why we're doing it is much more
important to express.

> 1. Operation for calculating PLL intermediate VCO frequency by
>    reading the reference clock divider and feedback divider from
>    register. Since VCO frequency falls outside the limit of
>    unsigned long for IPQ4019, so this operation will return the
>    VCO frequency in kHz.
> 
> 2. Operation for calculating the internal PLL divider clock
>    frequency. Clock Divider node should give either fixed
>    divider value or divider table(maps the register divider
>    value to actual divider value).
> 
> 3. Adds and registers clock nodes for VCO(APPS DDR PLL and FE
>    PLL) and PLL internal dividers(SDCC, FEPLL 500 MHz, FEPLL
>    200 MHz, FEPLL 125 MHz, FEPLL 125 MHz with delay,
>    programmable WCSS 2G and 5G).
> 
> 4. Changes the regmap limit from 0x2dffff to 0x2ffff for
>    supporting the PLL registers read.

Yep that's obvious from the patch.

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/clk/qcom/gcc-ipq4019.c               | 292 ++++++++++++++++++++++++++-
>  include/dt-bindings/clock/qcom,gcc-ipq4019.h |   9 +
>  2 files changed, 290 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index 3cd1af0..9251457 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -28,6 +28,16 @@
>  #include "clk-rcg.h"
>  #include "clk-branch.h"
>  #include "reset.h"
> +#include "clk-regmap-divider.h"
> +
> +#define to_clk_regmap_div(_hw) container_of(to_clk_regmap(_hw),\
> +					struct clk_regmap_div, clkr)
> +
> +#define to_clk_pll_div(_hw) container_of((to_clk_regmap_div(_hw)),\
> +						struct clk_pll_div, cdiv)
> +
> +#define to_clk_pll_vco(_hw) container_of((to_clk_regmap_div(_hw)),\
> +						struct clk_pll_vco, cdiv)
>  

Please remove double parenthesis around to_clk_regmap_div()
unlesss there's some reason for that?

>  enum {
>  	P_XO,
> @@ -40,6 +50,35 @@ enum {
>  	P_DDRPLLAPSS,
>  };
>  
> +/*
> + * struct clk_pll_vco - vco feedback divider corresponds to PLL_DIV register
> + * @fdbkdiv_shift: lowest bit for FDBKDIV
> + * @fdbkdiv_width: number of bits in FDBKDIV
> + * @cdiv: divider values for PLL_DIV
> + */
> +struct clk_pll_vco {
> +	u32 fdbkdiv_shift;
> +	u32 fdbkdiv_width;
> +	struct clk_regmap_div cdiv;
> +};
> +
> +/*
> + * struct clk_pll_div - clk divider corresponds to PLL_DIV register
> + * @fixed_div: fixed divider value if divider is fixed
> + * @parent_map: map from software's parent index to hardware's src_sel field
> + * @cdiv: divider values for PLL_DIV
> + * @div_table: mapping for actual divider value to register divider value
> + *             in case of non fixed divider
> + * @freq_tbl: frequency table
> + */
> +struct clk_pll_div {

s/clk_pll_div/clk_fepll/?

> +	u32 fixed_div;
> +	const u8 *parent_map;
> +	struct clk_regmap_div cdiv;
> +	const struct clk_div_table *div_table;
> +	const struct freq_tbl *freq_tbl;
> +};
> +
>  static struct parent_map gcc_xo_200_500_map[] = {
>  	{ P_XO, 0 },
>  	{ P_FEPLL200, 1 },
> @@ -1155,6 +1194,238 @@ static struct clk_branch gcc_wcss5g_rtc_clk = {
>  	},
>  };
>  
> +/*
> + * Calculates the rate from parent rate and divider and round the rate
> + * in MHz. This function takes the parent rate in kHz and returns the
> + * rate in Hz.
> + */
> +static unsigned long clk_calc_divider_rate(unsigned long parent_rate,

Umm... parent_rate should be in Hz here.

> +				unsigned int div)
> +{
> +	u32 rate;
> +
> +	rate = parent_rate / div;
> +
> +	/*
> +	 * This rate is in kHz and returned value should be rounded
> +	 * in MHz. So divide the value with 1000 and multiply it with
> +	 * 1000(rate value was divided with 1000) * 1000(kHz to MHz).
> +	 */
> +	rate /= 1000;
> +	rate *= 1000000;

Is this some complicated mechanism to round down to the nearest
MHz? Why? Also, can this function be rolled into the single
caller?

> +
> +	return rate;
> +}
> +
> +/*
> + * Calculates the VCO rate for PLL.
> + * VCO rate value is greater than unsigned long limit. Since this is an
> + * intermediate clock node for actual PLL dividers, so it returns the
> + * rate in kHz. The child nodes will return the value in Hz after its
> + * divide operation.
> + */
> +static unsigned long clk_regmap_vco_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct clk_pll_vco *rcg = to_clk_pll_vco(hw);
> +	u32 fdbkdiv, refclkdiv, cdiv, vco;
> +
> +	regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
> +	refclkdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
> +	fdbkdiv = (cdiv >> rcg->fdbkdiv_shift) & (BIT(rcg->fdbkdiv_width) - 1);
> +
> +	vco = parent_rate / refclkdiv;
> +	vco /= 1000;
> +	vco *= 2;
> +	vco *= fdbkdiv;
> +
> +	return vco;

Urgh. Bad. We shouldn't be changing the units in this case
because unsigned long is limiting. One solution is to make a
"mega clock" and do the division as well in one recalc_rate
function. That circumvents the need to pass large frequencies as
khz to get around the limit of unsigned long on 32 bit platforms.
Otherwise, we need to go ahead and make the "rate" member of
struct clk_rate_request be u64 and then this problem doesn't
exist inside the clk drivers (just with the consumer APIs).

> +}
> +
> +static const struct clk_ops clk_regmap_vco_ops = {
> +	.recalc_rate = clk_regmap_vco_recalc_rate,
> +};
> +
> +static struct clk_pll_vco gcc_apps_ddrpll_vco = {
> +	.fdbkdiv_shift = 16,
> +	.fdbkdiv_width = 8,
> +	.cdiv.reg = 0x2e020,
> +	.cdiv.shift = 24,
> +	.cdiv.width = 5,
> +	.cdiv.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_apps_ddrpll_vco",
> +			.parent_names = (const char *[]){
> +				"xo",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_vco_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_pll_vco gcc_fepll_vco = {
> +	.fdbkdiv_shift = 16,
> +	.fdbkdiv_width = 8,
> +	.cdiv.reg = 0x2f020,
> +	.cdiv.shift = 24,
> +	.cdiv.width = 5,
> +	.cdiv.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_fepll_vco",
> +			.parent_names = (const char *[]){
> +				"xo",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_vco_ops,
> +		},
> +	},
> +};
> +
> +/*
> + * Calculates the rate for PLL divider.
> + * If the divider value is not fixed then it gets the actual divider value
> + * from divider table. Then, it calculate the clock rate by dividing the
> + * parent rate with actual divider value.
> + */
> +static unsigned long clk_regmap_clk_div_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_pll_div *rcg = to_clk_pll_div(hw);
> +	u32 cdiv, pre_div = 1;
> +	const struct clk_div_table *clkt;
> +
> +	if (rcg->fixed_div) {
> +		pre_div = rcg->fixed_div;
> +	} else {
> +		regmap_read(rcg->cdiv.clkr.regmap, rcg->cdiv.reg, &cdiv);
> +		cdiv = (cdiv >> rcg->cdiv.shift) & (BIT(rcg->cdiv.width) - 1);
> +
> +		for (clkt = rcg->div_table; clkt->div; clkt++) {
> +			if (clkt->val == cdiv)
> +				pre_div = clkt->div;
> +		}
> +	}
> +
> +	return clk_calc_divider_rate(parent_rate, pre_div);
> +};
> +
> +static const struct clk_ops clk_regmap_clk_div_ops = {

clk_fepll_div_ops?

> +	.recalc_rate = clk_regmap_clk_div_recalc_rate,
> +};
> +
> +static struct clk_pll_div gcc_apps_sdcc_clk = {
> +	.fixed_div = 28,
> +	.cdiv.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "ddrpllsdcc",
> +			.parent_names = (const char *[]){
> +				"gcc_apps_ddrpll_vco",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_regmap_clk_div_ops,
> +		},
> +	},
> +};
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
