Return-Path: <vkoul@kernel.org>
Date: Fri, 18 May 2018 09:51:25 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v4 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180518042125.GE2932@vkoul-mobl>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
 <20180514120307.15592-2-wen.he_1@nxp.com>
 <20180517060430.GU13271@vkoul-mobl>
 <DB6PR0401MB2503E7EEB3C97028AD131C7CE2910@DB6PR0401MB2503.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB2503E7EEB3C97028AD131C7CE2910@DB6PR0401MB2503.eurprd04.prod.outlook.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 17-05-18, 11:27, Wen He wrote:
> > > +
> > > +/* Registers for bit and genmask */
> > > +#define FSL_QDMA_CQIDR_SQT		0x8000
> > 
> > BIT() ?
> 
> Sorry, Maybe I should replace 0x8000 to BIT(15).

yes please

> > > +u64 pre_addr, pre_queue;
> > 
> > why do we have a global?
> 
> Let's us see qDMA that how is works?
> 
> First, the status notification for DMA jobs are reported back to the status queue.
> Status information is carried within the command descriptor status/command field,
> bits 120-127. The command descriptor dequeue pointer advances only after the
> transaction has completed and the status information field has been updated.
> 
> Then, the command descriptor address field wiil pointer to the command descriptor in
> its original format. It is the responsibity of the address of the status queue consumer
> to deallocate buffers as needed when the command descriptor address pointer is non-zero.
> 
> More details of the Status Queue can be found in QorIQ Layerscape Soc datasheet.
> 
> So, these variable is used to record latest value that command descriptor queue
> and status field.
> 
> Every time variables value is zero when set these variable to local, that's not what I want.

Why not store them in driver context?

> > > +static void fsl_qdma_comp_fill_memcpy(struct fsl_qdma_comp *fsl_comp,
> > > +					dma_addr_t dst, dma_addr_t src, u32 len) {
> > > +	struct fsl_qdma_format *ccdf, *csgf_desc, *csgf_src, *csgf_dest;
> > > +	struct fsl_qdma_sdf *sdf;
> > > +	struct fsl_qdma_ddf *ddf;
> > > +
> > > +	ccdf = (struct fsl_qdma_format *)fsl_comp->virt_addr;
> > 
> > Cast are not required to/away from void
> > 
> 
> Does means: remove force conver?

yes and it would work

> > > +static struct fsl_qdma_comp *fsl_qdma_request_enqueue_desc(
> > > +					struct fsl_qdma_chan *fsl_chan,
> > > +					unsigned int dst_nents,
> > > +					unsigned int src_nents)
> > > +{
> > > +	struct fsl_qdma_comp *comp_temp;
> > > +	struct fsl_qdma_sg *sg_block;
> > > +	struct fsl_qdma_queue *queue = fsl_chan->queue;
> > > +	unsigned long flags;
> > > +	unsigned int dst_sg_entry_block, src_sg_entry_block, sg_entry_total,
> > > +i;
> > > +
> > > +	spin_lock_irqsave(&queue->queue_lock, flags);
> > > +	if (list_empty(&queue->comp_free)) {
> > > +		spin_unlock_irqrestore(&queue->queue_lock, flags);
> > > +		comp_temp = kzalloc(sizeof(*comp_temp), GFP_KERNEL);
> > > +		if (!comp_temp)
> > > +			return NULL;
> > > +		comp_temp->virt_addr = dma_pool_alloc(queue->comp_pool,
> > > +						      GFP_KERNEL,
> > > +						      &comp_temp->bus_addr);
> > > +		if (!comp_temp->virt_addr) {
> > > +			kfree(comp_temp);
> > > +			return NULL;
> > > +		}
> > > +
> > > +	} else {
> > > +		comp_temp = list_first_entry(&queue->comp_free,
> > > +					     struct fsl_qdma_comp,
> > > +					     list);
> > > +		list_del(&comp_temp->list);
> > > +		spin_unlock_irqrestore(&queue->queue_lock, flags);
> > > +	}
> > > +
> > > +	if (dst_nents != 0)
> > > +		dst_sg_entry_block = dst_nents /
> > > +					(FSL_QDMA_EXPECT_SG_ENTRY_NUM - 1) + 1;
> > 
> > DIV_ROUND_UP()?
> > 
> 
> The DIV_ROUND_UP() definition see below:
> 
> #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
> #define __KERNEL_DIV_ROUND_UP(n ,d) (((n) + (d) - 1) / (d))
> 
> But here is 'd / (n - 1) + 1' ?

Yeah this doesn't look apt here, check if any other macros suits...

> > > +			memset(sg_block->virt_addr, 0,
> > > +					FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16);
> > 
> > why FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16? and not what you
> > allocated?
> > 
> 
> see line 497.
> The sg_pool buffer size created is FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16.

Please document this

> > > +static int fsl_qdma_queue_transfer_complete(struct fsl_qdma_engine
> > > +*fsl_qdma) {
> > > +	struct fsl_qdma_queue *fsl_queue = fsl_qdma->queue;
> > > +	struct fsl_qdma_queue *fsl_status = fsl_qdma->status;
> > > +	struct fsl_qdma_queue *temp_queue;
> > > +	struct fsl_qdma_comp *fsl_comp;
> > > +	struct fsl_qdma_format *status_addr;
> > > +	struct fsl_qdma_format *csgf_src;
> > > +	void __iomem *block = fsl_qdma->block_base;
> > > +	u32 reg, i;
> > > +	bool duplicate, duplicate_handle;
> > > +
> > > +	while (1) {
> > > +		duplicate = 0;
> > > +		duplicate_handle = 0;
> > > +		reg = qdma_readl(fsl_qdma, block + FSL_QDMA_BSQSR);
> > > +		if (reg & FSL_QDMA_BSQSR_QE)
> > > +			return 0;
> > > +		status_addr = fsl_status->virt_head;
> > > +		if (qdma_ccdf_get_queue(status_addr) == pre_queue &&
> > > +			qdma_ccdf_addr_get64(status_addr) == pre_addr)
> > > +			duplicate = 1;
> > > +		i = qdma_ccdf_get_queue(status_addr);
> > > +		pre_queue = qdma_ccdf_get_queue(status_addr);
> > > +		pre_addr = qdma_ccdf_addr_get64(status_addr);
> > > +		temp_queue = fsl_queue + i;
> > > +		spin_lock(&temp_queue->queue_lock);
> > > +		if (list_empty(&temp_queue->comp_used)) {
> > > +			if (duplicate)
> > > +				duplicate_handle = 1;
> > > +			else {
> > > +				spin_unlock(&temp_queue->queue_lock);
> > > +				return -1;
> > 
> > -1? really. You are in while(1) wouldn't break make sense here?
> > 
> 
> Does means: using break?

it means two things, we don't use return -1, if it is valid error then return
a proper kernel error code
second, since it is a while loop, do you want to use a break?
 
-- 
~Vinod
