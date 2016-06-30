From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 08/10] clk: mvebu Add the time base generator clocks for
 Armada 3700
Date: Thu, 30 Jun 2016 12:48:13 -0700
Message-ID: <20160630194813.GA1521@codeaurora.org>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
 <1465565018-14172-9-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465565018-14172-9-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

On 06/10, Gregory CLEMENT wrote:
> +
> +struct tbg_def tbg[NUM_TBG] = {

const?

> +	{"TBG-A-P", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL8, TBG_A_VCODIV_DIFF},
> +	{"TBG-B-P", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL8, TBG_B_VCODIV_DIFF},
> +	{"TBG-A-S", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL1, TBG_A_VCODIV_SE},
> +	{"TBG-B-S", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL1, TBG_B_VCODIV_SE},
> +};
> +
> +static struct clk_onecell_data clk_tbg_data;

Please allocate this in the driver probe.

> +
> +unsigned int tbg_get_mult(void __iomem *reg, struct tbg_def *ptbg)
> +{
> +	u32 val;
> +
> +	val = readl(reg + TBG_CTRL0);
> +
> +	return ((val >> ptbg->fbdiv_offset) & TBG_DIV_MASK) << 2;
> +}
> +
> +unsigned int tbg_get_div(void __iomem *reg, struct tbg_def *ptbg)
> +{
> +	u32 val;
> +	unsigned int div;
> +
> +	val = readl(reg + TBG_CTRL7);
> +
> +	div = (val >> ptbg->refdiv_offset) & TBG_DIV_MASK;
> +	if (div == 0)
> +		div = 1;
> +	val = readl(reg + ptbg->vcodiv_reg);
> +
> +	div *= 1 << ((val >>  ptbg->vcodiv_offset) & TBG_DIV_MASK);
> +
> +	return div;
> +}
> +
> +
> +static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	const char *parent_name;
> +	struct resource *res;
> +	struct clk *parent;
> +	void __iomem *reg;
> +	int i, ret;
> +
> +	parent = of_clk_get(np, 0);

Why not devm_clk_get() instead? Don't make things dependent on DT
APIs unnecessarily please.

> +	if (IS_ERR(parent)) {
> +		dev_err(dev, "Could get the clock parent\n");
> +		return -EINVAL;
> +	}
> +	parent_name = __clk_get_name(parent);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(reg)) {
> +		dev_err(dev, "Could not map the tbg clock registers\n");

devm_ioremap_resource() already spits out an error on failure so
please drop this print.

> +		ret = PTR_ERR(reg);
> +		goto put_clk;
> +	}
> +
> +	clk_tbg_data.clk_num = NUM_TBG;
> +	clk_tbg_data.clks = devm_kcalloc(dev, clk_tbg_data.clk_num,
> +					 sizeof(struct clk *), GFP_KERNEL);

Please move to clk_hw based registration.

> +	if (!clk_tbg_data.clks) {
> +		ret = -ENOMEM;
> +		goto put_clk;
> +	}
> +
> +	for (i = 0; i < NUM_TBG; i++) {
> +		const char *name;
> +		unsigned int mult, div;
> +
> +		name = tbg[i].name;
> +		mult = tbg_get_mult(reg, &tbg[i]);
> +		div = tbg_get_div(reg, &tbg[i]);
> +		clk_tbg_data.clks[i] = clk_register_fixed_factor(NULL, name,
> +						 parent_name, 0, mult, div);
> +		if (IS_ERR(clk_tbg_data.clks[i]))
> +			dev_err(dev, "Can't register TBG clock %s\n", name);
> +	}
> +
> +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_tbg_data);

What if this fails?

> +
> +	return 0;
> +
> +put_clk:
> +	clk_put(parent);
> +	return ret;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
