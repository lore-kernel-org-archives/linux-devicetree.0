From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/4] clk: arizona: Add clock driver for the Arizona
 devices
Date: Tue, 5 Jan 2016 17:45:04 -0800
Message-ID: <20160106014504.GE22188@codeaurora.org>
References: <1452008502-3749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452008502-3749-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452008502-3749-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 01/05, Charles Keepax wrote:
> Add an initial clock driver for the Arizona series audio CODECs.
> Currently this driver only provides support for parsing the two input
> clocks (mclk1, mclk2) and providing the internally consumed 32k clock.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Can this go through clk-tree without the other three patches and
nothing breaks?

> diff --git a/drivers/clk/clk-arizona.c b/drivers/clk/clk-arizona.c
> new file mode 100644
> index 0000000..1ab69ee
> --- /dev/null
> +++ b/drivers/clk/clk-arizona.c
> @@ -0,0 +1,192 @@
> +
> +static int arizona_32k_enable(struct clk_hw *hw)
> +{
> +	struct arizona_clk *clkdata = clk32k_to_arizona_clk(hw);
> +	struct arizona *arizona = clkdata->arizona;
> +	int ret;
> +
> +	switch (arizona->pdata.clk32k_src) {
> +	case ARIZONA_32KZ_MCLK1:
> +		ret = pm_runtime_get_sync(arizona->dev);
> +		if (ret != 0)

typically we write this as

	if (ret)


> +			goto out;
> +		break;
> +	}
> +
> +	ret = regmap_update_bits_async(arizona->regmap, ARIZONA_CLOCK_32K_1,
> +				       ARIZONA_CLK_32K_ENA,
> +				       ARIZONA_CLK_32K_ENA);
> +
> +out:
> +	return ret;
> +}
> +
> +static int arizona_clk_of_get_pdata(struct arizona *arizona)
> +{
> +	const char * const pins[] = { "mclk1", "mclk2" };
> +	struct clk *mclk;
> +	int i;
> +
> +	if (!of_property_read_bool(arizona->dev->of_node, "clocks"))
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(pins); ++i) {
> +		mclk = of_clk_get_by_name(arizona->dev->of_node, pins[i]);
> +		if (IS_ERR(mclk))
> +			return PTR_ERR(mclk);
> +
> +		if (clk_get_rate(mclk) == CLK32K_RATE) {
> +			arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK1 + i;
> +			arizona->pdata.clk32k_parent = __clk_get_name(mclk);
> +		}
> +
> +		clk_put(mclk);

Is this configuring some mux for the 32kHz source? Perhaps this
can be done with assigned clock parents and a set_parent clk_op
instead of with of_clk_get_by_name() in a loop over the possible
parents?

> +	}
> +
> +	return 0;
> +}
> +
> +static int arizona_clk_probe(struct platform_device *pdev)
> +{
[..]
> +
> +	if (arizona->pdata.clk32k_parent) {
> +		clk32k_init.num_parents = 1;
> +		clk32k_init.parent_names = &arizona->pdata.clk32k_parent;
> +	} else {
> +		clk32k_init.flags |= CLK_IS_ROOT;
> +	}
> +
> +	clkdata->clk32k_hw.init = &clk32k_init;
> +	clkdata->clk32k = devm_clk_register(&pdev->dev, &clkdata->clk32k_hw);
> +	if (IS_ERR(clkdata->clk32k)) {
> +		ret = PTR_ERR(clkdata->clk32k);
> +		dev_err(arizona->dev, "Failed to register 32k clock: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = clk_register_clkdev(clkdata->clk32k, "arizona-32k",
> +				  dev_name(arizona->dev));

Any reason we register with clkdev but don't register an of clk
provider?

> +	if (ret) {
> +		dev_err(arizona->dev, "Failed to register 32k clock dev: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, clkdata);
> +
> +	return 0;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
