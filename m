From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [v3 2/6] dmaengine: fsl-qdma: add NXP Layerscape qDMA engine
 driver support
Date: Tue, 23 Jan 2018 14:38:12 +0530
Message-ID: <20180123090812.GX18649@localhost>
References: <20180111093215.12636-1-wen.he_1@nxp.com>
 <20180111093215.12636-2-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180111093215.12636-2-wen.he_1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, jiafei.pan-3arQi8VN3Tc@public.gmane.org, jiaheng.fan-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 05:32:11PM +0800, Wen He wrote:

>  config FSL_RAID
>          tristate "Freescale RAID engine Support"
> -        depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
> +	depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH

Why this change?

> +/*
> + * Driver for NXP Layerscape Queue direct memory access controller (qDMA)
> + *
> + * Copyright 2017 NXP
> + *
> + * Author:
> + *  Jiaheng Fan <jiaheng.fan-3arQi8VN3Tc@public.gmane.org>
> + *  Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0+

this needs to be:

//SPDX-License-Identifier: GPL-2.0+
//Copyright 2017 NXP

and at top of the file

> +
> +#define FSL_QDMA_CQIDR_CQT		0xff000000
> +#define FSL_QDMA_CQIDR_SQPE		0x800000
> +#define FSL_QDMA_CQIDR_SQT		0x8000

BIT and GENMASK() for these and rest of them please

> +static inline u64
> +qdma_ccdf_addr_get64(const struct fsl_qdma_format *ccdf)
> +{
> +	return le64_to_cpu(ccdf->data) & 0xffffffffffLLU;
						^^^^^

Do you want something like INT_MAX, if not GENMASK() pls for the constant

> +}
> +
> +static inline void
> +qdma_desc_addr_set64(struct fsl_qdma_format *ccdf, u64 addr)
> +{
> +	ccdf->addr_hi = upper_32_bits(addr);
> +	ccdf->addr_lo = cpu_to_le32(lower_32_bits(addr));
> +}
> +
> +static inline u64
> +qdma_ccdf_get_queue(const struct fsl_qdma_format *ccdf)
> +{
> +	return ccdf->cfg8b_w1 & 0xff;

USHRT_MAX

> +static void fsl_qdma_comp_fill_memcpy(struct fsl_qdma_comp *fsl_comp,
> +					dma_addr_t dst, dma_addr_t src, u32 len)
> +{
> +	struct fsl_qdma_format *ccdf, *csgf_desc, *csgf_src, *csgf_dest;
> +	struct fsl_qdma_sdf *sdf;
> +	struct fsl_qdma_ddf *ddf;
> +
> +	ccdf = (struct fsl_qdma_format *)fsl_comp->virt_addr;

why are doing a cast away from void *?

> +	csgf_desc = (struct fsl_qdma_format *)fsl_comp->virt_addr + 1;
> +	csgf_src = (struct fsl_qdma_format *)fsl_comp->virt_addr + 2;
> +	csgf_dest = (struct fsl_qdma_format *)fsl_comp->virt_addr + 3;

why not ccdf + 1 and so on?
 
> +	sdf = (struct fsl_qdma_sdf *)fsl_comp->virt_addr + 4;
> +	ddf = (struct fsl_qdma_ddf *)fsl_comp->virt_addr + 5;
> +
> +	memset(fsl_comp->virt_addr, 0, FSL_QDMA_BASE_BUFFER_SIZE);
> +	/* Head Command Descriptor(Frame Descriptor) */
> +	qdma_desc_addr_set64(ccdf, fsl_comp->bus_addr + 16);
> +	qdma_ccdf_set_format(ccdf, qdma_ccdf_get_offset(ccdf));
> +	qdma_ccdf_set_ser(ccdf, qdma_ccdf_get_status(ccdf));

empty line after each logical block to help read the code better

> +static int fsl_qdma_pre_request_enqueue_desc(struct fsl_qdma_queue *queue)
> +{
> +	struct fsl_qdma_comp *comp_temp;
> +	int i;
> +
> +	for (i = 0; i < queue->n_cq; i++) {
> +		comp_temp = kzalloc(sizeof(*comp_temp), GFP_KERNEL);

GFP_KERNEL here

> +		if (!comp_temp)
> +			return -ENOMEM;
> +		comp_temp->virt_addr = dma_pool_alloc(queue->comp_pool,
> +						      GFP_NOWAIT,

GFP_NOWAIT here ??

this seems to be called in probe right?


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
> +						      GFP_NOWAIT,

here too! this is called from prep_ context

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

DIV_ROUND_UP or something. PLs check kernel has defines for these sort of
things...

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
> +		if (!sg_block) {
> +			dma_pool_free(queue->comp_pool,
> +					comp_temp->virt_addr,
> +					comp_temp->bus_addr);
> +			return NULL;
> +		}
> +		comp_temp->sg_block = sg_block;
> +		for (i = 0; i < sg_entry_total; i++) {
> +			sg_block->virt_addr = dma_pool_alloc(queue->sg_pool,
> +							GFP_NOWAIT,

i guess these are copy paster errors. And this code should then be in
helper and used everywhere...

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

so we allocated here

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

and here

> +		if (!queue_temp->comp_pool) {
> +			dma_free_coherent(&pdev->dev,
> +						sizeof(struct fsl_qdma_format) *
> +						queue_size[i],
> +						queue_temp->cq,
> +						queue_temp->bus_addr);
> +			return NULL;

and freed here on error

> +		}
> +		/*
> +		 * The dma pool for queue command buffer
> +		 */
> +		queue_temp->sg_pool = dma_pool_create("sg_pool",
> +					&pdev->dev,
> +					FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16,
> +					64, 0);
> +		if (!queue_temp->sg_pool) {
> +			dma_free_coherent(&pdev->dev,
> +						sizeof(struct fsl_qdma_format) *
> +						queue_size[i],
> +						queue_temp->cq,
> +						queue_temp->bus_addr);
> +			dma_pool_destroy(queue_temp->comp_pool);
> +			return NULL;

and repeated same here, maybe you should add goto's and have common error
handling rather these everywhere..

> +static struct fsl_qdma_queue *fsl_qdma_prep_status_queue(
> +						struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct fsl_qdma_queue *status_head;
> +	unsigned int status_size;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "status-sizes", &status_size);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't get status-sizes.\n");
> +		return NULL;
> +	}
> +	if (status_size > FSL_QDMA_CIRCULAR_DESC_SIZE_MAX
> +			|| status_size < FSL_QDMA_CIRCULAR_DESC_SIZE_MIN) {
> +		dev_err(&pdev->dev, "Get wrong status_size.\n");
> +		return NULL;
> +	}
> +	status_head = devm_kzalloc(&pdev->dev, sizeof(*status_head),
> +								GFP_KERNEL);
> +	if (!status_head)
> +		return NULL;
> +
> +	/*
> +	 * Buffer for queue command
> +	 */
> +	status_head->cq = dma_alloc_coherent(&pdev->dev,
> +						sizeof(struct fsl_qdma_format) *
> +						status_size,
> +						&status_head->bus_addr,
> +						GFP_KERNEL);
> +	if (!status_head->cq)
> +		return NULL;

empty line here...

> +static enum dma_status fsl_qdma_tx_status(struct dma_chan *chan,
> +		dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	return dma_cookie_status(chan, cookie, txstate);

why not set this to dma_cookie_status()
-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
