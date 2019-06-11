From: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for MediaTek IP
Date: Tue, 11 Jun 2019 20:25:22 +0800
Message-ID: <1560255922.12217.3.camel@mhfsdcap03>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
         <1559533863-10292-3-git-send-email-qii.wang@mediatek.com>
         <20190604095858.38ed9a28@collabora.com>
         <1559651200.5871.2.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559651200.5871.2.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: bbrezillon@kernel.org, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, gregkh@linuxfoundation.org, xinping.qian@mediatek.com, linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-i3c@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-04 at 20:26 +0800, Qii Wang wrote:
> On Tue, 2019-06-04 at 09:58 +0200, Boris Brezillon wrote:
> > On Mon, 3 Jun 2019 11:51:03 +0800
> > Qii Wang <qii.wang@mediatek.com> wrote:
> > 
> > 
> > > +static int mtk_i3c_master_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct mtk_i3c_master *master;
> > > +	struct resource *res;
> > > +	int ret, irqnr;
> > > +
> > > +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > > +	if (!master)
> > > +		return -ENOMEM;
> > > +
> > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
> > > +	master->regs = devm_ioremap_resource(dev, res);
> > > +	if (IS_ERR(master->regs))
> > > +		return PTR_ERR(master->regs);
> > > +
> > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
> > > +	master->dma_regs = devm_ioremap_resource(dev, res);
> > > +	if (IS_ERR(master->dma_regs))
> > > +		return PTR_ERR(master->dma_regs);
> > > +
> > > +	irqnr = platform_get_irq(pdev, 0);
> > > +	if (irqnr < 0)
> > > +		return irqnr;
> > > +
> > > +	ret = devm_request_irq(dev, irqnr, mtk_i3c_master_irq,
> > > +			       IRQF_TRIGGER_NONE, DRV_NAME, master);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Request I3C IRQ %d fail\n", irqnr);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = of_property_read_u32(pdev->dev.of_node, "clock-div",
> > > +				   &master->clk_src_div);
> > 
> > You say in one comment that this clock divider is fixed in HW but might
> > change on a per-SoC basis. If that's the case, you should get rid of
> > this clock-div prop and attach the divider to the compatible (using an
> > mtk_i3c_master_variant struct that contains a divider field).
> > 
> 
> ok, I will attach the divider to the compatible.
> 
I have rechecked your comment, maybe I have misunderstood what you mean.
"clock-div" changes according to i2c source clock, different project may
change i2c source clock, The previous dt-binding may be misleading, I
will modify it.

> > > +	if (ret < 0)
> > > +		return -EINVAL;
> > > +
> > > +	spin_lock_init(&master->xferqueue.lock);
> > > +	INIT_LIST_HEAD(&master->xferqueue.list);
> > > +
> > > +	if (dma_set_mask(dev, DMA_BIT_MASK(33))) {
> > > +		dev_err(dev, "dma_set_mask return error.\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	master->clk_main = devm_clk_get(dev, "main");
> > > +	if (IS_ERR(master->clk_main)) {
> > > +		dev_err(dev, "cannot get main clock\n");
> > > +		return PTR_ERR(master->clk_main);
> > > +	}
> > > +	master->clk_dma = devm_clk_get(dev, "dma");
> > > +	if (IS_ERR(master->clk_dma)) {
> > > +		dev_err(dev, "cannot get dma clock\n");
> > > +		return PTR_ERR(master->clk_dma);
> > > +	}
> > > +
> > > +	master->clk_arb = devm_clk_get_optional(dev, "arb");
> > > +	if (IS_ERR(master->clk_arb))
> > > +		return PTR_ERR(master->clk_arb);
> > > +
> > > +	ret = mtk_i3c_master_clock_enable(master);
> > > +	if (ret) {
> > > +		dev_err(dev, "clock enable failed!\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	master->dev = dev;
> > > +	platform_set_drvdata(pdev, master);
> > > +
> > > +	ret = i3c_master_register(&master->mas_ctrler, dev,
> > > +				  &mtk_i3c_master_ops, false);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to add i3c bus to i3c core\n");
> > > +		mtk_i3c_master_clock_disable(master);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> 
