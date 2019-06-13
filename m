From: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for MediaTek IP
Date: Thu, 13 Jun 2019 10:29:21 +0800
Message-ID: <1560392961.12217.7.camel@mhfsdcap03>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
 <1559533863-10292-3-git-send-email-qii.wang@mediatek.com>
 <20190604095858.38ed9a28@collabora.com>
 <1559651200.5871.2.camel@mhfsdcap03> <1560255922.12217.3.camel@mhfsdcap03>
 <20190611142849.43f6d1e4@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190611142849.43f6d1e4@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, bbrezillon@kernel.org, leilk.liu@mediatek.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, linux-i3c@lists.infradead.org, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-11 at 14:28 +0200, Boris Brezillon wrote:
> On Tue, 11 Jun 2019 20:25:22 +0800
> Qii Wang <qii.wang@mediatek.com> wrote:
> 
> > On Tue, 2019-06-04 at 20:26 +0800, Qii Wang wrote:
> > > On Tue, 2019-06-04 at 09:58 +0200, Boris Brezillon wrote:  
> > > > On Mon, 3 Jun 2019 11:51:03 +0800
> > > > Qii Wang <qii.wang@mediatek.com> wrote:
> > > > 
> > > >   
> > > > > +static int mtk_i3c_master_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +	struct device *dev = &pdev->dev;
> > > > > +	struct mtk_i3c_master *master;
> > > > > +	struct resource *res;
> > > > > +	int ret, irqnr;
> > > > > +
> > > > > +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > > > > +	if (!master)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "main");
> > > > > +	master->regs = devm_ioremap_resource(dev, res);
> > > > > +	if (IS_ERR(master->regs))
> > > > > +		return PTR_ERR(master->regs);
> > > > > +
> > > > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dma");
> > > > > +	master->dma_regs = devm_ioremap_resource(dev, res);
> > > > > +	if (IS_ERR(master->dma_regs))
> > > > > +		return PTR_ERR(master->dma_regs);
> > > > > +
> > > > > +	irqnr = platform_get_irq(pdev, 0);
> > > > > +	if (irqnr < 0)
> > > > > +		return irqnr;
> > > > > +
> > > > > +	ret = devm_request_irq(dev, irqnr, mtk_i3c_master_irq,
> > > > > +			       IRQF_TRIGGER_NONE, DRV_NAME, master);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Request I3C IRQ %d fail\n", irqnr);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = of_property_read_u32(pdev->dev.of_node, "clock-div",
> > > > > +				   &master->clk_src_div);  
> > > > 
> > > > You say in one comment that this clock divider is fixed in HW but might
> > > > change on a per-SoC basis. If that's the case, you should get rid of
> > > > this clock-div prop and attach the divider to the compatible (using an
> > > > mtk_i3c_master_variant struct that contains a divider field).
> > > >   
> > > 
> > > ok, I will attach the divider to the compatible.
> > >   
> > I have rechecked your comment, maybe I have misunderstood what you mean.
> > "clock-div" changes according to i2c source clock, different project may
> > change i2c source clock, The previous dt-binding may be misleading, I
> > will modify it.
> 
> Is it fixed or configurable? Maybe it should be modeled as a clk
> driver. What's for sure is that we shouldn't have this divider defined
> in the DT.

ok, I have let the clk driver handle it, and remove it in DT and i3c
driver. Thanks!
