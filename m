From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: Support 'protected-clocks' property
Date: Mon, 5 Nov 2018 17:05:07 -0800
Message-ID: <20181106010507.GY2523@minitux>
References: <20181105194011.43770-1-swboyd@chromium.org>
 <20181105194011.43770-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105194011.43770-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 11:40 PST 2018, Stephen Boyd wrote:

> Certain firmware configurations "protect" clks and cause the entire
> system to reboot when a non-secure OS such as Linux tries to read or
> write protected clk registers. But other firmware configurations allow
> reading or writing the same registers, and they may actually require
> that the OS use the otherwise locked down clks. Support the
> 'protected-clocks' property by never registering these protected clks
> with the common clk framework. This way, when firmware is protecting
> these clks we won't have the chance to ever read or write these
> registers and take down the entire system.
> 
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/common.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index db9b2471ac40..0a48ed56833b 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -191,6 +191,22 @@ int qcom_cc_register_sleep_clk(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
>  
> +/* Drop 'protected-clocks' from the list of clocks to register */
> +static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct property *prop;
> +	const __be32 *p;
> +	u32 i;
> +
> +	of_property_for_each_u32(np, "protected-clocks", prop, p, i) {
> +		if (i >= cc->num_rclks)
> +			continue;
> +
> +		cc->rclks[i] = NULL;
> +	}
> +}
> +
>  static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -251,6 +267,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	cc->rclks = rclks;
>  	cc->num_rclks = num_clks;
>  
> +	qcom_cc_drop_protected(dev, cc);
> +
>  	for (i = 0; i < num_clks; i++) {
>  		if (!rclks[i])
>  			continue;
> -- 
> Sent by a computer through tubes
> 
