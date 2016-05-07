From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] clk: arizona: Add clock driver for the Arizona
 devices
Date: Fri, 6 May 2016 17:55:01 -0700
Message-ID: <20160507005501.GN3492@codeaurora.org>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1452252582-20834-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452252582-20834-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

I've applied this to clk-next but still have a question, see
below.

On 01/08, Charles Keepax wrote:
> diff --git a/drivers/clk/clk-arizona.c b/drivers/clk/clk-arizona.c
> new file mode 100644
> index 0000000..eaf2877
> --- /dev/null
> +++ b/drivers/clk/clk-arizona.c
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

Could this be done through assigned parents instead of this rate
checking stuff? Presumably DT could tell us how the clk tree
should be configured.

> +	}
> +
> +	return 0;
> +}
> +
> +static int arizona_clk_probe(struct platform_device *pdev)
> +{
> +	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
> +	struct arizona_clk *clkdata;
> +	int ret;
> +
> +	struct clk_init_data clk32k_init = {
> +		.name = "arizona-32k",
> +		.ops = &arizona_32k_ops,
> +	};
> +
> +	if (IS_ENABLED(CONFIG_OF) && !dev_get_platdata(arizona->dev)) {
> +		ret = arizona_clk_of_get_pdata(arizona);
> +		if (ret) {
> +			dev_err(arizona->dev, "Failed parsing clock DT: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	clkdata = devm_kzalloc(&pdev->dev, sizeof(*clkdata), GFP_KERNEL);
> +	if (!clkdata)
> +		return -ENOMEM;
> +
> +	clkdata->arizona = arizona;
> +
> +	switch (arizona->pdata.clk32k_src) {
> +	case 0:
> +		arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK2;
> +		/* Fall through */
> +	case ARIZONA_32KZ_MCLK1:
> +	case ARIZONA_32KZ_MCLK2:
> +	case ARIZONA_32KZ_NONE:
> +		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
> +				   ARIZONA_CLK_32K_SRC_MASK,
> +				   arizona->pdata.clk32k_src - 1);
> +		break;
> +	default:
> +		dev_err(arizona->dev, "Invalid 32kHz clock source: %d\n",
> +			arizona->pdata.clk32k_src);
> +		return -EINVAL;
> +	}
> +
> +	if (arizona->pdata.clk32k_parent) {
> +		clk32k_init.num_parents = 1;
> +		clk32k_init.parent_names = &arizona->pdata.clk32k_parent;
> +	} else {
> +		clk32k_init.flags |= CLK_IS_ROOT;

This flag is going away so I deleted it.

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

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
