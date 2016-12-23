From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC PATCHv2 2/4] clk: mdm9615: Add EBI2 clock
Date: Fri, 23 Dec 2016 20:50:43 +0100
Message-ID: <585D8013.50707@baylibre.com>
References: <1482468884-31027-1-git-send-email-zmarkovic@sierrawireless.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482468884-31027-1-git-send-email-zmarkovic@sierrawireless.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zoran Markovic <zmarkovic@sierrawireless.com>, linux-kernel@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 23/12/2016 05:54, Zoran Markovic a écrit :
> Add definition of EBI2 clock used by MDM9615 NAND controller.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Zoran Markovic <zmarkovic@sierrawireless.com>
> ---
>  drivers/clk/qcom/gcc-mdm9615.c               |   30 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-mdm9615.h |    3 +++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index 581a17f..e9e98b1 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -1563,6 +1563,34 @@ enum {
>  	},
>  };
>  
> +static struct clk_branch ebi2_clk = {
> +	.hwcg_reg = 0x2664,
> +	.hwcg_bit = 6,
> +	.halt_reg = 0x2fcc,
> +	.halt_bit = 23,
> +	.clkr = {
> +		.enable_reg = 0x2664,
> +		.enable_mask = BIT(6) | BIT(4),
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
> +			.name = "ebi2_aon_clk",
> +			.ops = &clk_branch_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_hw *gcc_mdm9615_hws[] = {
>  	&cxo.hw,
>  };
> @@ -1637,6 +1665,8 @@ enum {
>  	[PMIC_ARB1_H_CLK] = &pmic_arb1_h_clk.clkr,
>  	[PMIC_SSBI2_CLK] = &pmic_ssbi2_clk.clkr,
>  	[RPM_MSG_RAM_H_CLK] = &rpm_msg_ram_h_clk.clkr,
> +	[EBI2_CLK] = &ebi2_clk.clkr,
> +	[EBI2_AON_CLK] = &ebi2_aon_clk.clkr,
>  };
>  
>  static const struct qcom_reset_map gcc_mdm9615_resets[] = {
> diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9615.h b/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> index 9ab2c40..57cdca6 100644
> --- a/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> +++ b/include/dt-bindings/clock/qcom,gcc-mdm9615.h
> @@ -323,5 +323,8 @@
>  #define CE3_H_CLK				305
>  #define USB_HS1_SYSTEM_CLK_SRC			306
>  #define USB_HS1_SYSTEM_CLK			307
> +#define EBI2_CLK				308
> +#define EBI2_AON_CLK				309
> +
>  
>  #endif
> 

Hi Zoran,

Thanks for this patch, we did not found the definition for these clocks at all !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
