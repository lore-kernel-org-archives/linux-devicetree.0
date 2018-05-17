Return-Path: <vkoul@kernel.org>
Date: Thu, 17 May 2018 11:34:30 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v4 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180517060430.GU13271@vkoul-mobl>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
 <20180514120307.15592-2-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180514120307.15592-2-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 14-05-18, 20:03, Wen He wrote:

> +
> +/* Registers for bit and genmask */
> +#define FSL_QDMA_CQIDR_SQT		0x8000

BIT() ?

> +#define QDMA_CCDF_MASK			GENMASK(28, 20)
> +#define QDMA_CCDF_FOTMAT		BIT(29)
> +#define QDMA_CCDF_SER			BIT(30)
> +#define QDMA_SG_FIN			BIT(30)
> +#define QDMA_SG_EXT			BIT(31)
> +#define QDMA_SG_LEN_MASK		GENMASK(29, 0)
> +
> +#define QDMA_CCDF_STATUS		20
> +#define QDMA_CCDF_OFFSET		20
> +#define FSL_QDMA_BCQIER_CQTIE		0x8000
> +#define FSL_QDMA_BCQIER_CQPEIE		0x800000
> +#define FSL_QDMA_BSQICR_ICEN		0x80000000

here and few other places as well

> +
> +u64 pre_addr, pre_queue;

why do we have a global?

> +static void fsl_qdma_comp_fill_memcpy(struct fsl_qdma_comp *fsl_comp,
> +					dma_addr_t dst, dma_addr_t src, u32 len)
> +{
> +	struct fsl_qdma_format *ccdf, *csgf_desc, *csgf_src, *csgf_dest;
> +	struct fsl_qdma_sdf *sdf;
> +	struct fsl_qdma_ddf *ddf;
> +
> +	ccdf = (struct fsl_qdma_format *)fsl_comp->virt_addr;

Cast are not required to/away from void

> +	csgf_desc = (struct fsl_qdma_format *)fsl_comp->virt_addr + 1;
> +	csgf_src = (struct fsl_qdma_format *)fsl_comp->virt_addr + 2;
> +	csgf_dest = (struct fsl_qdma_format *)fsl_comp->virt_addr + 3;
> +	sdf = (struct fsl_qdma_sdf *)fsl_comp->virt_addr + 4;
> +	ddf = (struct fsl_qdma_ddf *)fsl_comp->virt_addr + 5;
> +
> +	memset(fsl_comp->virt_addr, 0, FSL_QDMA_BASE_BUFFER_SIZE);
> +	/* Head Command Descriptor(Frame Descriptor) */
> +	qdma_desc_addr_set64(ccdf, fsl_comp->bus_addr + 16);
> +	qdma_ccdf_set_format(ccdf, qdma_ccdf_get_offset(ccdf));
> +	qdma_ccdf_set_ser(ccdf, qdma_ccdf_get_status(ccdf));
> +
> +	/* Status notification is enqueued to status queue. */
> +	/* Compound Command Descriptor(Frame List Table) */
> +	qdma_desc_addr_set64(csgf_desc, fsl_comp->bus_addr + 64);
> +	/* It must be 32 as Compound S/G Descriptor */
> +	qdma_csgf_set_len(csgf_desc, 32);
> +	qdma_desc_addr_set64(csgf_src, src);
> +	qdma_csgf_set_len(csgf_src, len);
> +	qdma_desc_addr_set64(csgf_dest, dst);
> +	qdma_csgf_set_len(csgf_dest, len);
> +	/* This entry is the last entry. */
> +	qdma_csgf_set_f(csgf_dest, len);
> +	/* Descriptor Buffer */
> +	sdf->cmd = cpu_to_le32(
> +			FSL_QDMA_CMD_RWTTYPE << FSL_QDMA_CMD_RWTTYPE_OFFSET);
> +	ddf->cmd = cpu_to_le32(
> +			FSL_QDMA_CMD_RWTTYPE << FSL_QDMA_CMD_RWTTYPE_OFFSET);
> +	ddf->cmd |= cpu_to_le32(
> +			FSL_QDMA_CMD_LWC << FSL_QDMA_CMD_LWC_OFFSET);
> +}
> +
> +/*
> + * Pre-request full command descriptor for enqueue.
> + */
> +static int fsl_qdma_pre_request_enqueue_desc(struct fsl_qdma_queue *queue)
> +{
> +	struct fsl_qdma_comp *comp_temp;
> +	int i;
> +
> +	for (i = 0; i < queue->n_cq; i++) {
> +		comp_temp = kzalloc(sizeof(*comp_temp), GFP_KERNEL);
> +		if (!comp_temp)
> +			return -ENOMEM;

where is the previous allocations freed? Return of this function is not even
checked??

> +		comp_temp->virt_addr = dma_pool_alloc(queue->comp_pool,
> +						      GFP_KERNEL,
> +						      &comp_temp->bus_addr);
> +		if (!comp_temp->virt_addr)
> +			return -ENOMEM;

and here too
> +		list_add_tail(&comp_temp->list, &queue->comp_free);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Request a command descriptor for enqueue.
> + */
> +static struct fsl_qdma_comp *fsl_qdma_request_enqueue_desc(
> +					struct fsl_qdma_chan *fsl_chan,
> +					unsigned int dst_nents,
> +					unsigned int src_nents)
> +{
> +	struct fsl_qdma_comp *comp_temp;
> +	struct fsl_qdma_sg *sg_block;
> +	struct fsl_qdma_queue *queue = fsl_chan->queue;
> +	unsigned long flags;
> +	unsigned int dst_sg_entry_block, src_sg_entry_block, sg_entry_total, i;
> +
> +	spin_lock_irqsave(&queue->queue_lock, flags);
> +	if (list_empty(&queue->comp_free)) {
> +		spin_unlock_irqrestore(&queue->queue_lock, flags);
> +		comp_temp = kzalloc(sizeof(*comp_temp), GFP_KERNEL);
> +		if (!comp_temp)
> +			return NULL;
> +		comp_temp->virt_addr = dma_pool_alloc(queue->comp_pool,
> +						      GFP_KERNEL,
> +						      &comp_temp->bus_addr);
> +		if (!comp_temp->virt_addr) {
> +			kfree(comp_temp);
> +			return NULL;
> +		}
> +
> +	} else {
> +		comp_temp = list_first_entry(&queue->comp_free,
> +					     struct fsl_qdma_comp,
> +					     list);
> +		list_del(&comp_temp->list);
> +		spin_unlock_irqrestore(&queue->queue_lock, flags);
> +	}
> +
> +	if (dst_nents != 0)
> +		dst_sg_entry_block = dst_nents /
> +					(FSL_QDMA_EXPECT_SG_ENTRY_NUM - 1) + 1;

DIV_ROUND_UP()?

> +	else
> +		dst_sg_entry_block = 0;
> +
> +	if (src_nents != 0)
> +		src_sg_entry_block = src_nents /
> +					(FSL_QDMA_EXPECT_SG_ENTRY_NUM - 1) + 1;
> +	else
> +		src_sg_entry_block = 0;
> +
> +	sg_entry_total = dst_sg_entry_block + src_sg_entry_block;
> +	if (sg_entry_total) {
> +		sg_block = kzalloc(sizeof(*sg_block) *
> +					      sg_entry_total,
> +					      GFP_KERNEL);

kcalloc?

> +		if (!sg_block) {
> +			dma_pool_free(queue->comp_pool,
> +					comp_temp->virt_addr,
> +					comp_temp->bus_addr);
> +			return NULL;
> +		}
> +		comp_temp->sg_block = sg_block;
> +		for (i = 0; i < sg_entry_total; i++) {
> +			sg_block->virt_addr = dma_pool_alloc(queue->sg_pool,
> +							GFP_KERNEL,
> +							&sg_block->bus_addr);

no check if this succeeded?

> +			memset(sg_block->virt_addr, 0,
> +					FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16);

why FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16? and not what you allocated?

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
> +		}
> +		queue_temp = queue_head + i;
> +		queue_temp->cq = dma_alloc_coherent(&pdev->dev,
> +						sizeof(struct fsl_qdma_format) *
> +						queue_size[i],
> +						&queue_temp->bus_addr,
> +						GFP_KERNEL);
> +		if (!queue_temp->cq)
> +			return NULL;
> +		queue_temp->n_cq = queue_size[i];
> +		queue_temp->id = i;
> +		queue_temp->virt_head = queue_temp->cq;
> +		queue_temp->virt_tail = queue_temp->cq;
> +		/*
> +		 * The dma pool for queue command buffer
> +		 */
> +		queue_temp->comp_pool = dma_pool_create("comp_pool",
> +						&pdev->dev,
> +						FSL_QDMA_BASE_BUFFER_SIZE,
> +						16, 0);
> +		if (!queue_temp->comp_pool)
> +			goto err_free_comp;
> +
> +		/*
> +		 * The dma pool for queue command buffer

same comment as prev?

> +static int fsl_qdma_queue_transfer_complete(struct fsl_qdma_engine *fsl_qdma)
> +{
> +	struct fsl_qdma_queue *fsl_queue = fsl_qdma->queue;
> +	struct fsl_qdma_queue *fsl_status = fsl_qdma->status;
> +	struct fsl_qdma_queue *temp_queue;
> +	struct fsl_qdma_comp *fsl_comp;
> +	struct fsl_qdma_format *status_addr;
> +	struct fsl_qdma_format *csgf_src;
> +	void __iomem *block = fsl_qdma->block_base;
> +	u32 reg, i;
> +	bool duplicate, duplicate_handle;
> +
> +	while (1) {
> +		duplicate = 0;
> +		duplicate_handle = 0;
> +		reg = qdma_readl(fsl_qdma, block + FSL_QDMA_BSQSR);
> +		if (reg & FSL_QDMA_BSQSR_QE)
> +			return 0;
> +		status_addr = fsl_status->virt_head;
> +		if (qdma_ccdf_get_queue(status_addr) == pre_queue &&
> +			qdma_ccdf_addr_get64(status_addr) == pre_addr)
> +			duplicate = 1;
> +		i = qdma_ccdf_get_queue(status_addr);
> +		pre_queue = qdma_ccdf_get_queue(status_addr);
> +		pre_addr = qdma_ccdf_addr_get64(status_addr);
> +		temp_queue = fsl_queue + i;
> +		spin_lock(&temp_queue->queue_lock);
> +		if (list_empty(&temp_queue->comp_used)) {
> +			if (duplicate)
> +				duplicate_handle = 1;
> +			else {
> +				spin_unlock(&temp_queue->queue_lock);
> +				return -1;

-1? really. You are in while(1) wouldn't break make sense here?

> +static enum dma_status fsl_qdma_tx_status(struct dma_chan *chan,
> +		dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	struct fsl_qdma_chan *fsl_chan = to_fsl_qdma_chan(chan);

why do you need this here, its unused

-- 
~Vinod
