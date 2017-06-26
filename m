From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock
 controller
Date: Mon, 26 Jun 2017 15:47:35 -0700
Message-ID: <20170626224735.GQ4493@codeaurora.org>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-4-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170623161533.20449-4-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/23, Georgi Djakov wrote:
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 9924c6d7f05d..da363c6580da 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -11,6 +11,8 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
> @@ -19,6 +21,34 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/mailbox_controller.h>
> +#include <linux/regmap.h>
> +
> +#include "../clk/qcom/clk-regmap.h"
> +#include "../clk/qcom/clk-regmap-mux-div.h"

Why?

> +
> +
> +static int msm8916_register_clk(struct device *dev, void __iomem *base)
> +{
> +	struct clk_regmap_mux_div *a53cc;
> +	struct clk *pclk;
> +	struct regmap *regmap;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
> +	if (!a53cc)
> +		return -ENOMEM;
> +
> +	a53cc->reg_offset = 0x50;
> +	a53cc->hid_width = 5;
> +	a53cc->hid_shift = 0;
> +	a53cc->src_width = 3;
> +	a53cc->src_shift = 8;
> +	a53cc->parent_map = gpll0_a53cc_map;
> +
> +	init.name = "a53mux";
> +	init.parent_names = gpll0_a53cc;
> +	init.num_parents = 2;

ARRAY_SIZE(gpll0_a53cc) instead of 2 please

> +	init.ops = &clk_regmap_mux_div_ops;
> +	init.flags = CLK_SET_RATE_PARENT;
> +	a53cc->clkr.hw.init = &init;
> +
> +	pclk = __clk_lookup(gpll0_a53cc[1]);

Urgh.. ok. We can't clk_get()?

> +	if (!pclk)
> +		return -EPROBE_DEFER;
> +
> +	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
> +	ret = clk_notifier_register(pclk, &a53cc->clk_nb);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
> +		goto err;
> +	}
> +
> +	a53cc->clkr.regmap = regmap;
> +
> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);

Regmap is not a requirement to work with the qcom clk driver.

> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> +				     &a53cc->clkr.hw);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	clk_notifier_unregister(pclk, &a53cc->clk_nb);
> +	return ret;
> +}
> +
>  static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct qcom_apcs_ipc *apcs;
>  	struct resource *res;
>  	unsigned long offset;
> @@ -63,6 +178,13 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> +		/* register the APCS mux and divider clock */
> +		ret = msm8916_register_clk(&pdev->dev, base);

Register a child platform device here instead of creating clks in the
same driver?

> +		if (ret)
> +			return ret;
> +	}
> +
>  	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
>  
>  	apcs->reg = base + offset;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
