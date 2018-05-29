Return-Path: <vkoul@kernel.org>
Date: Tue, 29 May 2018 12:37:24 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v5 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180529070724.GE5666@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
 <20180525111920.24498-2-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525111920.24498-2-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: dmaengine@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 25-05-18, 19:19, Wen He wrote:

> +/**
> + * struct fsl_qdma_format - This is the struct holding describing compound
> + *			    descriptor format with qDMA.
> + * @status:		    This field which describes command status and
> + *			    enqueue status notification.
> + * @cfg:		    This field which describes frame offset and frame
> + *			    format.
> + * @addr_lo:		    This field which indicating the start of the buffer
> + *			    holding the compound descriptor of the lower 32-bits
> + *			    address in memory 40-bit address.
> + * @addr_hi:		    This field's the same as above field, but point high
> + *			    8-bits in memory 40-bit address.
> + * @__reserved1:	    Reserved field.
> + * @cfg8b_w1:		    This field which describes compound descriptor
> + *			    command queue origin produced by qDMA and dynamic

you may remove 'This field which describes'... in above lines, give reader no
information :)

> + *			    debug field.
> + * @data		    Pointer to the memory 40-bit address, describes DMA
> + *			    source informaion and DMA destination information.

typo informaion

> +static struct fsl_qdma_queue *fsl_qdma_alloc_queue_resources(
> +					struct platform_device *pdev,
> +					unsigned int queue_num)
> +{
> +	struct fsl_qdma_queue *queue_head, *queue_temp;
> +	int ret, len, i;
> +	unsigned int queue_size[FSL_QDMA_QUEUE_MAX];
> +
> +	if (queue_num > FSL_QDMA_QUEUE_MAX)
> +		queue_num = FSL_QDMA_QUEUE_MAX;
> +	len = sizeof(*queue_head) * queue_num;
> +	queue_head = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	if (!queue_head)
> +		return NULL;
> +
> +	ret = device_property_read_u32_array(&pdev->dev, "queue-sizes",
> +					queue_size, queue_num);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't get queue-sizes.\n");
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < queue_num; i++) {
> +		if (queue_size[i] > FSL_QDMA_CIRCULAR_DESC_SIZE_MAX
> +			|| queue_size[i] < FSL_QDMA_CIRCULAR_DESC_SIZE_MIN) {
> +			dev_err(&pdev->dev, "Get wrong queue-sizes.\n");
> +			return NULL;

the indents here are bad for reading..

> +static int fsl_qdma_queue_transfer_complete(struct fsl_qdma_engine *fsl_qdma)
> +{
> +	struct fsl_qdma_queue *fsl_queue = fsl_qdma->queue;
> +	struct fsl_qdma_queue *fsl_status = fsl_qdma->status;
> +	struct fsl_qdma_queue *temp_queue;
> +	struct fsl_qdma_comp *fsl_comp;
> +	struct fsl_qdma_format *status_addr;
> +	struct fsl_qdma_format *csgf_src;
> +	struct fsl_pre_status pre;
> +	void __iomem *block = fsl_qdma->block_base;
> +	u32 reg, i;
> +	bool duplicate, duplicate_handle;
> +
> +	memset(&pre, 0, sizeof(struct fsl_pre_status));
> +
> +	while (1) {
> +		duplicate = 0;
> +		duplicate_handle = 0;
> +		reg = qdma_readl(fsl_qdma, block + FSL_QDMA_BSQSR);
> +		if (reg & FSL_QDMA_BSQSR_QE)
> +			return 0;
> +		status_addr = fsl_status->virt_head;
> +		if (qdma_ccdf_get_queue(status_addr) == pre.queue &&
> +			qdma_ccdf_addr_get64(status_addr) == pre.addr)
> +			duplicate = 1;
> +		i = qdma_ccdf_get_queue(status_addr);
> +		pre.queue = qdma_ccdf_get_queue(status_addr);
> +		pre.addr = qdma_ccdf_addr_get64(status_addr);
> +		temp_queue = fsl_queue + i;
> +		spin_lock(&temp_queue->queue_lock);
> +		if (list_empty(&temp_queue->comp_used)) {
> +			if (duplicate)
> +				duplicate_handle = 1;

code style mandates braces for this as else has braces..

> +			else {
> +				spin_unlock(&temp_queue->queue_lock);
> +				return -EAGAIN;
> +			}
> +		} else {
> +			fsl_comp = list_first_entry(&temp_queue->comp_used,
> +							struct fsl_qdma_comp,
> +							list);
> +			csgf_src = fsl_comp->virt_addr + 2;
> +			if (fsl_comp->bus_addr + 16 != pre.addr) {
> +				if (duplicate)
> +					duplicate_handle = 1;

here as well

> +static irqreturn_t fsl_qdma_error_handler(int irq, void *dev_id)
> +{
> +	struct fsl_qdma_engine *fsl_qdma = dev_id;
> +	unsigned int intr;
> +	void __iomem *status = fsl_qdma->status_base;
> +
> +	intr = qdma_readl(fsl_qdma, status + FSL_QDMA_DEDR);
> +
> +	if (intr)
> +		dev_err(fsl_qdma->dma_dev.dev, "DMA transaction error!\n");
> +
> +	qdma_writel(fsl_qdma, 0xffffffff, status + FSL_QDMA_DEDR);

why unconditional write, was expecting that you would write if intr is non null

> +static int fsl_qdma_reg_init(struct fsl_qdma_engine *fsl_qdma)
> +{
> +	struct fsl_qdma_queue *fsl_queue = fsl_qdma->queue;
> +	struct fsl_qdma_queue *temp;
> +	void __iomem *ctrl = fsl_qdma->ctrl_base;
> +	void __iomem *status = fsl_qdma->status_base;
> +	void __iomem *block = fsl_qdma->block_base;
> +	int i, ret;
> +	u32 reg;
> +
> +	/* Try to halt the qDMA engine first. */
> +	ret = fsl_qdma_halt(fsl_qdma);
> +	if (ret) {
> +		dev_err(fsl_qdma->dma_dev.dev, "DMA halt failed!");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Clear the command queue interrupt detect register for all queues.
> +	 */
> +	qdma_writel(fsl_qdma, 0xffffffff, block + FSL_QDMA_BCQIDR(0));

bunch of writes with 0xffffffff, can you explain why? Also helps to make a
macro for this

> +
> +	for (i = 0; i < fsl_qdma->n_queues; i++) {
> +		temp = fsl_queue + i;
> +		/*
> +		 * Initialize Command Queue registers to point to the first
> +		 * command descriptor in memory.
> +		 * Dequeue Pointer Address Registers
> +		 * Enqueue Pointer Address Registers
> +		 */
> +		qdma_writel(fsl_qdma, temp->bus_addr,
> +				block + FSL_QDMA_BCQDPA_SADDR(i));
> +		qdma_writel(fsl_qdma, temp->bus_addr,
> +				block + FSL_QDMA_BCQEPA_SADDR(i));
> +
> +		/* Initialize the queue mode. */
> +		reg = FSL_QDMA_BCQMR_EN;
> +		reg |= FSL_QDMA_BCQMR_CD_THLD(ilog2(temp->n_cq)-4);
> +		reg |= FSL_QDMA_BCQMR_CQ_SIZE(ilog2(temp->n_cq)-6);

space around - in the above two lines

> +static enum dma_status fsl_qdma_tx_status(struct dma_chan *chan,
> +		dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	enum dma_status ret;
> +
> +	ret = dma_cookie_status(chan, cookie, txstate);
> +	if (ret == DMA_COMPLETE || !txstate)
> +		return ret;
> +
> +	return ret;

hmmm, this seems same as return dma_cookie_status() so why should we have rest
of the code

> +static void fsl_qdma_issue_pending(struct dma_chan *chan)
> +{
> +	struct fsl_qdma_chan *fsl_chan = to_fsl_qdma_chan(chan);
> +	struct fsl_qdma_queue *fsl_queue = fsl_chan->queue;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fsl_queue->queue_lock, flags);
> +	spin_lock(&fsl_chan->vchan.lock);
> +	if (vchan_issue_pending(&fsl_chan->vchan))
> +		fsl_qdma_enqueue_desc(fsl_chan);
> +	spin_unlock(&fsl_chan->vchan.lock);
> +	spin_unlock_irqrestore(&fsl_queue->queue_lock, flags);

why do we need two locks, and since you are doing vchan why should you add your
own lock on top

...

Overall the patch has some code style issues which keep catching my eye, can
you please check them. Also would help to run checkpatch with --strict and
--codespell option to catch typos and alignment issue. Please beware checkpatch
is a guide and NOT a rulebook so use your discretion :)

-- 
~Vinod
