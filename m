From: Shun-Chih.Yu <shun-chih.yu@mediatek.com>
Subject: Re: [PATCH 2/2] dmaengine: mediatek: Add MediaTek Command-Queue DMA
 controller for MT6765 SoC
Date: Thu, 27 Dec 2018 13:06:06 +0800
Message-ID: <1545887166.25257.19.camel@mtkswgap22>
References: <1539848951-14798-1-git-send-email-shun-chih.yu@mediatek.com>
 <1539848951-14798-3-git-send-email-shun-chih.yu@mediatek.com>
 <20181111101911.GF12092@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181111101911.GF12092@vkoul-mobl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vkoul@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "srv_wsdupstream@mediatek.com" <srv_wsdupstream@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2018-11-11 at 18:19 +0800, Vinod Koul wrote:
> On 18-10-18, 15:49, shun-chih.yu@mediatek.com wrote:
> > From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> > 
> > MediaTek Command-Queue DMA controller (CQDMA) on MT6765 SoC is dedicated
> > to memory-to-memory transfer through queue based descriptor management.
> > 
> > There are only 3 physical channels inside CQDMA, while the driver is
> > extended to support 32 virtual channels for multiple dma users to issue
> > dma requests onto the CQDMA simultaneously.
> 
> I see some warns in the driver when I compile with C=1 please do fix
> those in next rev

Sure, warnings with W=1 would be fixed in the next rev.

> > +struct mtk_cqdma_vdesc {
> > +	struct virt_dma_desc vd;
> > +	size_t len;
> > +	size_t residue;
> 
> why should you store residue in descriptor, it will get stale very soon!
I would remove this in the next rev.

> > +	dma_addr_t dest;
> > +	dma_addr_t src;
> > +	struct dma_chan *ch;
> > +
> > +	struct list_head node;
> 
> why do you need your own list, vd has a list for descriptors!
This node is to build a linked-list of mtk_cqdma_vdesc (CVD), which is a
queue of submitted descriptors for a physical dma channel. On a transfer
completion, we would pick the next CVD from the queue and start the
transaction based on the src/dest/len information stored in the CVD.
The reason we could not leverage the list in vd is that we need the
src/dest/len information for the subsequent dma transactions.


> > +struct mtk_cqdma_pchan {
> > +	struct list_head queue;
> > +	void __iomem *base;
> > +	u32 irq;
> > +
> > +	refcount_t refcnt;
> 
> Can you submit more than one descriptor at any point of time?
Yes, multiple users could submit descriptors simultaneously to a single physical dma channel.

> > +struct mtk_cqdma_vchan {
> > +	struct virt_dma_chan vc;
> > +	struct mtk_cqdma_pchan *pc;
> > +	struct completion issue_completion;
> > +	bool issue_synchronize;
> 
> what lock protects this?
using the vc.lock

> > +static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
> > +			    struct mtk_cqdma_vdesc *cvd)
> > +{
> > +	/* wait for the previous transaction done */
> > +	if (mtk_cqdma_poll_engine_done(pc, true) < 0)
> > +		dev_err(cqdma2dev(to_cqdma_dev(cvd->ch)), "cqdma wait transaction timeout\n");
> 
> Please split this to 2 lines to adhere to 80 chars limit
> 
> Also no bailout of error?
I would fix this in the next rev.

> > +static struct mtk_cqdma_vdesc
> > +*mtk_cqdma_consume_work_queue(struct mtk_cqdma_pchan *pc)
> > +{
> > +	struct mtk_cqdma_vchan *cvc;
> > +	struct mtk_cqdma_vdesc *cvd, *ret = NULL;
> 
> ret initialization seems superfluous
ret would be removed in the next rev.

> > +static void mtk_cqdma_tasklet_cb(unsigned long data)
> > +{
> > +	struct mtk_cqdma_pchan *pc = (struct mtk_cqdma_pchan *)data;
> > +	struct mtk_cqdma_vdesc *cvd = NULL;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&pc->lock, flags);
> > +	/* consume the queue */
> > +	cvd = mtk_cqdma_consume_work_queue(pc);
> 
> why not do this from ISR, DMA should be submitted as fast as possible!
I would remove this in the next rev.

> > +static int mtk_cqdma_alloc_chan_resources(struct dma_chan *c)
> > +{
> > +	struct mtk_cqdma_device *cqdma = to_cqdma_dev(c);
> > +	struct mtk_cqdma_vchan *vc = to_cqdma_vchan(c);
> > +	struct mtk_cqdma_pchan *pc = NULL;
> > +	u32 i, min_refcnt = U32_MAX, refcnt;
> > +	unsigned long flags;
> > +
> > +	/* allocate PC with the minimun refcount */
>                                 ^^^^^^^
> typo 
I would fix this in the next rev.

> > +static int mtk_cqdma_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_cqdma_device *cqdma;
> > +	struct mtk_cqdma_vchan *vc;
> > +	struct dma_device *dd;
> > +	struct resource *res;
> > +	int err;
> > +	u32 i;
> > +
> > +	cqdma = devm_kzalloc(&pdev->dev, sizeof(*cqdma), GFP_KERNEL);
> > +	if (!cqdma)
> > +		return -ENOMEM;
> > +
> > +	dd = &cqdma->ddev;
> > +
> > +	cqdma->clk = devm_clk_get(&pdev->dev, "cqdma");
> > +	if (IS_ERR(cqdma->clk)) {
> > +		dev_err(&pdev->dev, "No clock for %s\n",
> > +			dev_name(&pdev->dev));
> > +		return PTR_ERR(cqdma->clk);
> > +	}
> > +
> > +	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
> > +
> > +	dd->copy_align = MTK_CQDMA_ALIGN_SIZE;
> > +	dd->device_alloc_chan_resources = mtk_cqdma_alloc_chan_resources;
> > +	dd->device_free_chan_resources = mtk_cqdma_free_chan_resources;
> > +	dd->device_tx_status = mtk_cqdma_tx_status;
> > +	dd->device_issue_pending = mtk_cqdma_issue_pending;
> > +	dd->device_prep_dma_memcpy = mtk_cqdma_prep_dma_memcpy;
> > +	dd->device_terminate_all = mtk_cqdma_terminate_all;
> > +	dd->src_addr_widths = MTK_CQDMA_DMA_BUSWIDTHS;
> > +	dd->dst_addr_widths = MTK_CQDMA_DMA_BUSWIDTHS;
> > +	dd->directions = BIT(DMA_MEM_TO_MEM);
> > +	dd->residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
> > +	dd->dev = &pdev->dev;
> > +	INIT_LIST_HEAD(&dd->channels);
> > +
> > +	if (pdev->dev.of_node && of_property_read_u32(pdev->dev.of_node,
> > +						      "dma-requests",
> > +						      &cqdma->dma_requests)) {
> > +		dev_info(&pdev->dev,
> > +			 "Using %u as missing dma-requests property\n",
> > +			 MTK_CQDMA_NR_VCHANS);
> > +
> > +		cqdma->dma_requests = MTK_CQDMA_NR_VCHANS;
> > +	}
> > +
> > +	if (pdev->dev.of_node && of_property_read_u32(pdev->dev.of_node,
> > +						      "dma-channels",
> > +						      &cqdma->dma_channels)) {
> > +		dev_info(&pdev->dev,
> > +			 "Using %u as missing dma-channels property\n",
> > +			 MTK_CQDMA_NR_PCHANS);
> > +
> > +		cqdma->dma_channels = MTK_CQDMA_NR_PCHANS;
> > +	}
> > +
> > +	cqdma->pc = devm_kcalloc(&pdev->dev, cqdma->dma_channels,
> > +				 sizeof(*cqdma->pc), GFP_KERNEL);
> > +	if (!cqdma->pc)
> > +		return -ENOMEM;
> > +
> > +	/* initialization for PCs */
> > +	for (i = 0; i < cqdma->dma_channels; ++i) {
> > +		cqdma->pc[i] = devm_kcalloc(&pdev->dev, 1,
> > +					    sizeof(**cqdma->pc), GFP_KERNEL);
> > +		if (!cqdma->pc[i])
> > +			return -ENOMEM;
> > +
> > +		INIT_LIST_HEAD(&cqdma->pc[i]->queue);
> > +		spin_lock_init(&cqdma->pc[i]->lock);
> > +		refcount_set(&cqdma->pc[i]->refcnt, 0);
> > +
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> > +		if (!res) {
> > +			dev_err(&pdev->dev, "No mem resource for %s\n",
> > +				dev_name(&pdev->dev));
> > +			return -EINVAL;
> > +		}
> > +
> > +		cqdma->pc[i]->base = devm_ioremap_resource(&pdev->dev, res);
> > +		if (IS_ERR(cqdma->pc[i]->base))
> > +			return PTR_ERR(cqdma->pc[i]->base);
> > +
> > +		/* allocate IRQ resource */
> > +		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
> > +		if (!res) {
> > +			dev_err(&pdev->dev, "No irq resource for %s\n",
> > +				dev_name(&pdev->dev));
> > +			return -EINVAL;
> > +		}
> > +		cqdma->pc[i]->irq = res->start;
> > +
> > +		err = devm_request_irq(&pdev->dev, cqdma->pc[i]->irq,
> > +				       mtk_cqdma_irq, 0, dev_name(&pdev->dev),
> > +				       cqdma);
> > +		if (err) {
> > +			dev_err(&pdev->dev,
> > +				"request_irq failed with err %d\n", err);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	/* allocate resource for VCs */
> > +	cqdma->vc = devm_kcalloc(&pdev->dev, cqdma->dma_requests,
> > +				 sizeof(*cqdma->vc), GFP_KERNEL);
> > +	if (!cqdma->vc)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < cqdma->dma_requests; i++) {
> > +		vc = &cqdma->vc[i];
> > +		vc->vc.desc_free = mtk_cqdma_vdesc_free;
> > +		vchan_init(&vc->vc, dd);
> > +		init_completion(&vc->issue_completion);
> > +	}
> > +
> > +	err = dma_async_device_register(dd);
> > +	if (err)
> > +		return err;
> > +
> > +	err = of_dma_controller_register(pdev->dev.of_node,
> > +					 of_dma_xlate_by_chan_id, cqdma);
> > +	if (err) {
> > +		dev_err(&pdev->dev,
> > +			"MediaTek CQDMA OF registration failed %d\n", err);
> > +		goto err_unregister;
> > +	}
> > +
> > +	err = mtk_cqdma_hw_init(cqdma);
> > +	if (err) {
> > +		dev_err(&pdev->dev,
> > +			"MediaTek CQDMA HW initialization failed %d\n", err);
> > +		goto err_unregister;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, cqdma);
> > +
> > +	/* initialize tasklet for each PC */
> > +	for (i = 0; i < cqdma->dma_channels; ++i)
> > +		tasklet_init(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb,
> > +			     (unsigned long)cqdma->pc[i]);
> > +
> > +	dev_info(&pdev->dev, "MediaTek CQDMA driver registered\n");
> 
> debug log please
I would fix this in the next rev.

> > +static int mtk_cqdma_remove(struct platform_device *pdev)
> > +{
> > +	struct mtk_cqdma_device *cqdma = platform_get_drvdata(pdev);
> > +	struct mtk_cqdma_vchan *vc;
> > +	unsigned long flags;
> > +	int i;
> > +
> > +	/* kill VC task */
> > +	for (i = 0; i < cqdma->dma_requests; i++) {
> > +		vc = &cqdma->vc[i];
> > +
> > +		list_del(&vc->vc.chan.device_node);
> > +		tasklet_kill(&vc->vc.task);
> > +	}
> > +
> > +	/* disable interrupt */
> > +	for (i = 0; i < cqdma->dma_channels; i++) {
> > +		spin_lock_irqsave(&cqdma->pc[i]->lock, flags);
> > +		mtk_dma_clr(cqdma->pc[i], MTK_CQDMA_INT_EN,
> > +			    MTK_CQDMA_INT_EN_BIT);
> > +		spin_unlock_irqrestore(&cqdma->pc[i]->lock, flags);
> > +
> > +		/* Waits for any pending IRQ handlers to complete */
> > +		synchronize_irq(cqdma->pc[i]->irq);
> > +
> > +		tasklet_kill(&cqdma->pc[i]->tasklet);
> > +	}
> 
> please kill VC tasks after this, they can still be fired while you are
> disabling interrupt, so interrupt first and then tasklets
tasklets would be removed in the next rev.
