From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v3 2/3] clk: hisilicon: Add support for Hi3660 stub clocks
Date: Thu, 7 Dec 2017 16:04:49 +0800
Message-ID: <20171207080449.GB5371@leoy-linaro>
References: <1510910852-2175-1-git-send-email-xuyiping@hisilicon.com>
 <1510910852-2175-3-git-send-email-xuyiping@hisilicon.com>
 <20171207070550.GY4283@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207070550.GY4283@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Xu YiPing <xuyiping@hisilicon.com>, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, xuejiancheng@hisilicon.com, wenpan@hisilicon.com, zhangfei.gao@linaro.org, guodong.xu@linaro.org, zhongkaihua@huawei.com, chenjun14@huawei.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, kevin.wangtao@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 11:05:50PM -0800, Stephen Boyd wrote:
> On 11/17, Xu YiPing wrote:
> > From: Kaihua Zhong <zhongkaihua@huawei.com>
> > +
> > +static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
> > +					     void *data)
> > +{
> > +	unsigned int idx = clkspec->args[0];
> > +
> > +	if (idx > HI3660_CLK_STUB_NUM) {
> 
> This should be >=
> 
> > +	}
> > +
> > +	return &hi3660_stub_clks[idx].hw;
> > +}
> > +
> > +static int hi3660_stub_clk_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Use mailbox client without blocking */
> > +	stub_clk_chan.cl.dev = dev;
> > +	stub_clk_chan.cl.tx_done = NULL;
> > +	stub_clk_chan.cl.tx_block = false;
> > +	stub_clk_chan.cl.knows_txdone = false;
> > +
> > +	/* Allocate mailbox channel */
> > +	stub_clk_chan.mbox = mbox_request_channel(&stub_clk_chan.cl, 0);
> > +	if (IS_ERR(stub_clk_chan.mbox))
> > +		return PTR_ERR(stub_clk_chan.mbox);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
> > +	if (IS_ERR(freq_reg))
> 
> Pretty sure this returns NULL on failure, not an error pointer.
> 
> > +		return -ENOMEM;
> > +
> > +	freq_reg += HI3660_STUB_CLOCK_DATA;
> > +
> > +	for (i = 0; i < HI3660_CLK_STUB_NUM; i++) {
> > +		ret = devm_clk_hw_register(&pdev->dev, &hi3660_stub_clks[i].hw);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = of_clk_add_hw_provider(pdev->dev.of_node, hi3660_stub_clk_hw_get,
> > +				     hi3660_stub_clks);
> 
> This can use devm
> 
> > +	return ret;
> > +}
> > +
> 
> I fixed it all and merged into clk-next.

Ah, very appreciate your help, Stephen.

Thanks,
Leo Yan
