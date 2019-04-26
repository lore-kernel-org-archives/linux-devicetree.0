From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] dmaengine: milbeaut: Add Milbeaut AXI DMA controller
Date: Fri, 26 Apr 2019 17:16:29 +0530
Message-ID: <20190426114629.GU28103@vkoul-mobl>
References: <1553487314-9185-1-git-send-email-kasai.kazuhiro@socionext.com>
 <1553487314-9185-3-git-send-email-kasai.kazuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553487314-9185-3-git-send-email-kasai.kazuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kanematsu.shinji@socionext.com, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25-03-19, 13:15, Kazuhiro Kasai wrote:
> Add Milbeaut AXI DMA controller. This DMA controller has
> only capable of memory to memory transfer.

Have you tested this with dmatest?

> +struct m10v_dma_chan {
> +	struct dma_chan chan;
> +	struct m10v_dma_device *mdmac;
> +	void __iomem *regs;
> +	int irq;
> +	struct m10v_dma_desc mdesc;

So there is a *single* descriptor? Not a list??

> +static void m10v_xdmac_disable_dma(struct m10v_dma_device *mdmac)
> +{
> +	unsigned int val;
> +
> +	val = readl(mdmac->regs + M10V_XDACS);
> +	val &= ~M10V_XDACS_XE;
> +	val |= FIELD_PREP(M10V_XDACS_XE, 0);
> +	writel(val, mdmac->regs + M10V_XDACS);

Why not create a modifyl() macro and use it here

> +static void m10v_xdmac_issue_pending(struct dma_chan *chan)
> +{
> +	struct m10v_dma_chan *mchan = to_m10v_dma_chan(chan);
> +
> +	m10v_xdmac_config_chan(mchan);
> +
> +	m10v_xdmac_enable_chan(mchan);

You dont check if anything is already running or not?

> +static dma_cookie_t m10v_xdmac_tx_submit(struct dma_async_tx_descriptor *txd)
> +{
> +	struct m10v_dma_chan *mchan = to_m10v_dma_chan(txd->chan);
> +	dma_cookie_t cookie;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	cookie = dma_cookie_assign(txd);
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> +
> +	return cookie;

sounds like vchan_tx_submit() i think you can use virt-dma layer and then
get rid of artificial limit in driver and be able to queue up the txn on
dmaengine.

> +static struct dma_async_tx_descriptor *
> +m10v_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
> +			   dma_addr_t src, size_t len, unsigned long flags)
> +{
> +	struct m10v_dma_chan *mchan = to_m10v_dma_chan(chan);
> +
> +	dma_async_tx_descriptor_init(&mchan->mdesc.txd, chan);
> +	mchan->mdesc.txd.tx_submit = m10v_xdmac_tx_submit;
> +	mchan->mdesc.txd.callback = NULL;
> +	mchan->mdesc.txd.flags = flags;
> +	mchan->mdesc.txd.cookie = -EBUSY;
> +
> +	mchan->mdesc.len = len;
> +	mchan->mdesc.src = src;
> +	mchan->mdesc.dst = dst;
> +
> +	return &mchan->mdesc.txd;

So you support single descriptor and dont check if this has been already
configured. So I guess this has been tested by doing txn one at a time
and not submitted bunch of txn and wait for them to complete. Please fix
that to really enable dmaengine capabilities.

> +static int m10v_xdmac_remove(struct platform_device *pdev)
> +{
> +	struct m10v_dma_chan *mchan;
> +	struct m10v_dma_device *mdmac = platform_get_drvdata(pdev);
> +	int i;
> +
> +	m10v_xdmac_disable_dma(mdmac);
> +
> +	for (i = 0; i < mdmac->channels; i++) {
> +		mchan = &mdmac->mchan[i];
> +		devm_free_irq(&pdev->dev, mchan->irq, mchan);
> +	}

No call to dma_async_device_unregister()?
-- 
~Vinod
