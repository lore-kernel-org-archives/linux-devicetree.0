From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 4/7] clk: qcom: Add A53 PLL support
Date: Wed, 25 Oct 2017 21:19:23 -0700
Message-ID: <20171026041923.GK1575@tuxbook>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-5-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-5-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
[..]
> +
> +static const struct of_device_id qcom_a53pll_match_table[] = {
> +	{ .compatible = "qcom,msm8916-a53pll" },
> +	{ }
> +};

Move the match table below the probe.

> +
> +static int qcom_a53pll_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	struct resource *res;
> +	struct clk_pll *pll;
> +	void __iomem *base;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &a53pll_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	pll->l_reg = 0x04;
> +	pll->m_reg = 0x08;
> +	pll->n_reg = 0x0c;
> +	pll->config_reg = 0x14;
> +	pll->mode_reg = 0x00;
> +	pll->status_reg = 0x1c;
> +	pll->status_bit = 16;
> +	pll->freq_tbl = a53pll_freq;
> +
> +	init.name = "a53pll";
> +	init.parent_names = (const char *[]){ "xo" };
> +	init.num_parents = 1;
> +	init.ops = &clk_pll_sr2_ops;
> +	init.flags = CLK_IS_CRITICAL;
> +	pll->clkr.hw.init = &init;
> +
> +	ret = devm_clk_register_regmap(dev, &pll->clkr);
> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> +				     &pll->clkr.hw);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_a53pll_driver = {
> +	.probe = qcom_a53pll_probe,

I think you should either have a remove here that
of_clk_del_hw_provider() or set suppress_bind_attrs in the .driver.

> +	.driver = {
> +		.name = "qcom-a53pll",
> +		.of_match_table = qcom_a53pll_match_table,
> +	},
> +};
> +
> +builtin_platform_driver(qcom_a53pll_driver);

Other than these nits I think this looks good.

Regards,
Bjorn
