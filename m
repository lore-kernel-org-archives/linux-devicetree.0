From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v10 6/6] clk: qcom: Add APCS clock controller support
Date: Mon, 4 Dec 2017 22:01:30 -0800
Message-ID: <20171205060129.GI28761@minitux>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
 <20171201170224.25053-7-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201170224.25053-7-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 01 Dec 09:02 PST 2017, Georgi Djakov wrote:
[..]
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> new file mode 100644
> index 000000000000..f71039ff2347
> --- /dev/null
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -0,0 +1,149 @@
> +/*
> + * Qualcomm APCS clock controller driver
> + *
> + * Copyright (c) 2017, Linaro Limited
> + * Author: Georgi Djakov <georgi.djakov@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0

The SPDX-License-Identifier should be on the first line in the file,
commented by //

> + */
> +
[..]
> +static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = pdev->dev.parent;

Call this "parent" instead.

> +	struct device_node *np = dev->of_node;
> +	struct clk_regmap_mux_div *a53cc;
> +	struct regmap *regmap;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	regmap = dev_get_regmap(dev, NULL);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "failed to get regmap: %d\n", ret);

dev_* prints should be on &pdev->dev and not on parent device.

> +		return ret;
> +	}
> +
> +	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);

Perform this allocation on behalf of this device (i.e. &pdev->dev and
not parent)

> +	if (!a53cc)
> +		return -ENOMEM;
> +
> +	init.name = "a53mux";
> +	init.parent_names = gpll0_a53cc;
> +	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> +	init.ops = &clk_regmap_mux_div_ops;
> +	init.flags = CLK_SET_RATE_PARENT;
> +
> +	a53cc->clkr.hw.init = &init;
> +	a53cc->clkr.regmap = regmap;
> +	a53cc->reg_offset = 0x50;
> +	a53cc->hid_width = 5;
> +	a53cc->hid_shift = 0;
> +	a53cc->src_width = 3;
> +	a53cc->src_shift = 8;
> +	a53cc->parent_map = gpll0_a53cc_map;
> +
> +	a53cc->pclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(a53cc->pclk)) {
> +		ret = PTR_ERR(a53cc->pclk);
> +		dev_err(dev, "failed to get clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
> +	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);

This you can do on the &pdev->dev, it won't find a regmap on this node
and will try the parent.

> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get,

Be explicit here and do parent->of_node.

> +				     &a53cc->clkr.hw);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto err;
> +	}
> +
> +	platform_set_drvdata(pdev, a53cc);
> +
> +	return 0;
> +
> +err:
> +	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	return ret;
> +}
> +
> +static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
> +{
> +	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
> +
> +	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	of_clk_del_provider(pdev->dev.of_node);

You registered the provider on pdev->dev->parent.of_node.

> +
> +	return 0;
> +}
> +

Regards,
Bjorn
