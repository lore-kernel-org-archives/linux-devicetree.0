From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dmaengine: Add support for the Analog Devices
 AXI-DMAC DMA controller
Date: Wed, 19 Aug 2015 22:02:03 +0530
Message-ID: <20150819163203.GF13546@localhost>
References: <1438076286-21164-1-git-send-email-lars@metafoo.de>
 <1438076286-21164-2-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438076286-21164-2-git-send-email-lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28, 2015 at 11:38:06AM +0200, Lars-Peter Clausen wrote:
> +	active = axi_dmac_active_desc(chan);
> +	if (!active)
> +		return;
> +
> +	if (active->cyclic) {
> +		vchan_cyclic_callback(&active->vdesc);
> +	} else {
> +		while (active &&
do you need to check this, you did that few lines back?

> +static struct axi_dmac_desc *axi_dmac_alloc_desc(unsigned int num_sgs)
> +{
> +	struct axi_dmac_desc *desc;
> +
> +	desc = kzalloc(sizeof(struct axi_dmac_desc) +
> +		sizeof(struct axi_dmac_sg) * num_sgs, GFP_ATOMIC);

we recommend GFP_NOWAIT for these...

> +static struct dma_async_tx_descriptor *axi_dmac_prep_slave_sg(
> +	struct dma_chan *c, struct scatterlist *sgl,
> +	unsigned int sg_len, enum dma_transfer_direction direction,
> +	unsigned long flags, void *context)
> +{
> +	struct axi_dmac_chan *chan = to_axi_dmac_chan(c);
> +	struct axi_dmac_desc *desc;
> +	struct scatterlist *sg;
> +	unsigned int i;
> +
> +	if (direction != chan->direction)

are the channels unidirectional

> +		return NULL;
> +
> +	desc = axi_dmac_alloc_desc(sg_len);
> +	if (!desc)
> +		return NULL;
> +
> +	for_each_sg(sgl, sg, sg_len, i) {
> +		if (!axi_dmac_check_addr(chan, sg_dma_address(sg)) ||
> +		    !axi_dmac_check_len(chan, sg_dma_len(sg))) {
> +			kfree(desc);
> +			return NULL;
> +		}
> +
> +		if (direction == DMA_DEV_TO_MEM)
> +			desc->sg[i].dest_addr = sg_dma_address(sg);
> +		else
> +			desc->sg[i].src_addr = sg_dma_address(sg);
where is device side programming ?

> +
> +	if (axi_dmac_dest_is_mem(chan) && axi_dmac_src_is_mem(chan))
> +		chan->direction = DMA_MEM_TO_MEM;
> +	else if (!axi_dmac_dest_is_mem(chan) && axi_dmac_src_is_mem(chan))
> +		chan->direction = DMA_MEM_TO_DEV;
> +	else if (axi_dmac_dest_is_mem(chan) && !axi_dmac_src_is_mem(chan))
> +		chan->direction = DMA_DEV_TO_MEM;
> +	else
> +		chan->direction = DMA_DEV_TO_DEV;

ok this seems to answer my other question but is this something we are
specifying in SW or capability of a channel?

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
