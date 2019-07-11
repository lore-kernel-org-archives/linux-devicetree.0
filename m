From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 01/14] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
Date: Thu, 11 Jul 2019 08:30:13 -0700
Message-ID: <20190711153013.GP7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-2-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-2-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> specifications.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
>  drivers/clk/qcom/clk-alpha-pll.h | 1 +
>  drivers/clk/qcom/gcc-qcs404.c    | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 0ced4a5a9a17..ef51f302bdf0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -730,6 +730,14 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
>  }
>  
> +const struct clk_ops clk_alpha_pll_fixed_ops = {
> +	.enable = clk_alpha_pll_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.is_enabled = clk_alpha_pll_is_enabled,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
> +
>  const struct clk_ops clk_alpha_pll_ops = {
>  	.enable = clk_alpha_pll_enable,
>  	.disable = clk_alpha_pll_disable,
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 66755f0f84fc..6b4eb74706b4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -104,6 +104,7 @@ struct alpha_pll_config {
>  };
>  
>  extern const struct clk_ops clk_alpha_pll_ops;
> +extern const struct clk_ops clk_alpha_pll_fixed_ops;
>  extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_ops;
>  extern const struct clk_ops clk_alpha_pll_huayra_ops;
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 29cf464dd2c8..18c6563889f3 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
>  			.parent_names = (const char *[]){ "cxo" },
>  			.num_parents = 1,
>  			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_alpha_pll_ops,
> +			.ops = &clk_alpha_pll_fixed_ops,
>  		},
>  	},
>  };
> -- 
> 2.21.0
> 
