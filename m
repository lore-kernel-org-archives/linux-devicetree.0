Return-Path: <vkoul@kernel.org>
Date: Thu, 28 Jun 2018 10:46:42 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v6 3/7] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180628051642.GK22377@vkoul-mobl>
References: <20180615102236.32859-1-wen.he_1@nxp.com>
 <20180615102236.32859-3-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180615102236.32859-3-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: dmaengine@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 15-06-18, 18:22, Wen He wrote:

> +static struct fsl_qdma_comp *fsl_qdma_request_enqueue_desc(
> +					struct fsl_qdma_chan *fsl_chan,
> +					unsigned int dst_nents,
> +					unsigned int src_nents)
> +{
> +	struct fsl_qdma_comp *comp_temp;
> +	struct fsl_qdma_queue *queue = fsl_chan->queue;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&queue->queue_lock, flags);
> +	if (list_empty(&queue->comp_free)) {
> +		spin_unlock_irqrestore(&queue->queue_lock, flags);
> +		comp_temp = kzalloc(sizeof(*comp_temp), GFP_KERNEL);

this is invoked from fsl_qdma_prep_memcpy, so needs to be GFP_NOWAIT
flag

> +		if (!comp_temp)
> +			return NULL;
> +
> +		comp_temp->virt_addr = dma_pool_alloc(queue->comp_pool,
> +						      GFP_KERNEL,

here as well

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

we have kcalloc variant for this

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
> +		if (queue_size[i] > FSL_QDMA_CIRCULAR_DESC_SIZE_MAX ||
> +			    queue_size[i] < FSL_QDMA_CIRCULAR_DESC_SIZE_MIN) {
> +			dev_err(&pdev->dev, "Get wrong queue-sizes.\n");
> +			return NULL;
> +		}
> +		queue_temp = queue_head + i;
> +		queue_temp->cq = dma_alloc_coherent(&pdev->dev,
> +						sizeof(struct fsl_qdma_format) *
> +						queue_size[i],
> +						&queue_temp->bus_addr,
> +						GFP_KERNEL);
> +		if (!queue_temp->cq) {
> +			devm_kfree(&pdev->dev, queue_head);

any reason this is freed explicitly

> +static int fsl_qdma_halt(struct fsl_qdma_engine *fsl_qdma)
> +{
> +	void __iomem *ctrl = fsl_qdma->ctrl_base;
> +	void __iomem *block = fsl_qdma->block_base;
> +	int i, count = 5;

why 5

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

this loop can potentially read bad data from HW and keep spining
forever. Good practice would be to add safeguards and loop 'N' times
which you deem is large enough to process 

> +		duplicate = 0;
> +		duplicate_handle = 0;

empty line here

> +		reg = qdma_readl(fsl_qdma, block + FSL_QDMA_BSQSR);
> +		if (reg & FSL_QDMA_BSQSR_QE)
> +			return 0;

here..

> +		status_addr = fsl_status->virt_head;
> +		if (qdma_ccdf_get_queue(status_addr) == pre.queue &&
> +			qdma_ccdf_addr_get64(status_addr) == pre.addr)
> +			duplicate = 1;

here (basically after each logical block to help read)

> +		i = qdma_ccdf_get_queue(status_addr);
> +		pre.queue = qdma_ccdf_get_queue(status_addr);
> +		pre.addr = qdma_ccdf_addr_get64(status_addr);
> +		temp_queue = fsl_queue + i;
> +		spin_lock(&temp_queue->queue_lock);
> +		if (list_empty(&temp_queue->comp_used)) {
> +			if (duplicate) {
> +				duplicate_handle = 1;

why do this, you can remove duplicate_handle and use duplicate below?

-- 
~Vinod
