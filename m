From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC PATCH 2/4] clk: mdm9615: Add EBI2 clock
Date: Thu, 22 Dec 2016 17:12:16 -0800
Message-ID: <20161223011216.GE8288@codeaurora.org>
References: <1482437139-29329-1-git-send-email-zmarkovic@sierrawireless.com>
 <1482437139-29329-3-git-send-email-zmarkovic@sierrawireless.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482437139-29329-3-git-send-email-zmarkovic@sierrawireless.com>
Sender: linux-clk-owner@vger.kernel.org
To: Zoran Markovic <zmarkovic@sierrawireless.com>
Cc: linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/22, Zoran Markovic wrote:
> +static struct clk_branch ebi2_clk = {
> +	.hwcg_reg = 0x2664,
> +	.hwcg_bit = 6,
> +	.halt_reg = 0x2fcc,
> +	.halt_bit = 23,
> +	.clkr = {
> +		.enable_reg = 0x2664,
> +		.enable_mask = BIT(6)|BIT(4),

Some spaces here around | please.

> +		.hw.init = &(struct clk_init_data){
> +			.name = "ebi2_clk",
> +			.ops = &clk_branch_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch ebi2_aon_clk = {
> +	.halt_reg = 0x2fcc,
> +	.halt_bit = 23,
> +	.clkr = {
> +		.enable_reg = 0x2664,
> +		.enable_mask = BIT(8),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "ebi2_always_on_clk",

Maybe just ebi2_aon_clk to keep things simple.

> +			.ops = &clk_branch_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_hw *gcc_mdm9615_hws[] = {
>  	&cxo.hw,
>  };
> diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9615.h b/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> index 9ab2c40..57cdca6 100644
> --- a/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> +++ b/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> @@ -323,5 +323,8 @@
>  #define CE3_H_CLK				305
>  #define USB_HS1_SYSTEM_CLK_SRC			306
>  #define USB_HS1_SYSTEM_CLK			307
> +#define EBI2_CLK				309

Why jump from 307 to 309?

> +#define EBI2_AON_CLK				310
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
