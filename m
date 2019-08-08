From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Date: Thu, 8 Aug 2019 10:43:01 +0530
Message-ID: <20190808051301.GL12733@vkoul-mobl.Dlink>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-3-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807181301.15326-3-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette =?iso-8859-1?Q?=A0?= <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On 07-08-19, 23:43, Taniya Das wrote:

> +static struct clk_alpha_pll gpll0;
> +static struct clk_alpha_pll gpll1;
> +static struct clk_alpha_pll gpll4;
> +static struct clk_alpha_pll gpll6;
> +static struct clk_alpha_pll gpll7;
> +static struct clk_alpha_pll_postdiv gpll0_out_even;

I am not sure we need these, reordering code and getting rid of them
should be easy enough (i did that for sm8150)

> +static const struct parent_map gcc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_MAIN, 1 },
> +	{ P_GPLL0_OUT_EVEN, 6 },
> +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] = {
> +	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> +	{ .hw = &gpll0.clkr.hw },
> +	{ .hw = &gpll0_out_even.clkr.hw },
> +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },

This is legacy test, so we would want only fw_name being there

> +static struct clk_branch gcc_camera_ahb_clk = {
> +	.halt_reg = 0xb008,
> +	.halt_check = BRANCH_HALT,
> +	.hwcg_reg = 0xb008,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0xb008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_camera_ahb_clk",
> +			.flags = CLK_IS_CRITICAL,

It would help to explain why this clk is critical

> +static struct clk_branch gcc_disp_gpll0_div_clk_src = {
> +	.halt_check = BRANCH_HALT_DELAY,

And why this needs a delay
-- 
~Vinod
