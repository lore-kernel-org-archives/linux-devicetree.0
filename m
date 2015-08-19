From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] dmaengine: Add support for the Analog Devices AXI-DMAC
 DMA controller
Date: Wed, 19 Aug 2015 19:44:10 +0200
Message-ID: <55D4C06A.8070902@metafoo.de>
References: <20150819171234.GP13546@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150819171234.GP13546@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/19/2015 07:12 PM, Vinod Koul wrote:
> On Tue, Jul 28, 2015 at 11:38:06AM +0200, Lars-Peter Clausen wrote:
>> +static void axi_dmac_start_transfer(struct axi_dmac_chan *chan)
>> +{
>> +	struct axi_dmac *dmac = chan_to_axi_dmac(chan);
>> +	struct virt_dma_desc *vdesc;
>> +	struct axi_dmac_desc *desc;
>> +	struct axi_dmac_sg *sg;
>> +	unsigned int flags = 0;
>> +	unsigned int val;
>> +
>> +	val = axi_dmac_read(dmac, AXI_DMAC_REG_START_TRANSFER);
>> +	if (val) /* Queue is full, wait for the next SOT IRQ */
>> +		return;
>> +
>> +	desc = chan->next_desc;
>> +
>> +	if (!desc) {
>> +		vdesc = vchan_next_desc(&chan->vchan);
>> +		if (!vdesc)
>> +			return;
>> +		list_move_tail(&vdesc->node, &chan->active_descs);
>> +		desc = to_axi_dmac_desc(vdesc);
>> +	}
>> +	sg = &desc->sg[desc->num_submitted];
>> +
>> +	desc->num_submitted++;
>> +	if (desc->num_submitted == desc->num_sgs)
>> +		chan->next_desc = NULL;
>> +	else
>> +		chan->next_desc = desc;
>> +
>> +	sg->id = axi_dmac_read(dmac, AXI_DMAC_REG_TRANSFER_ID);
>> +
>> +	if (axi_dmac_dest_is_mem(chan)) {
>> +		axi_dmac_write(dmac, AXI_DMAC_REG_DEST_ADDRESS, sg->dest_addr);
>> +		axi_dmac_write(dmac, AXI_DMAC_REG_DEST_STRIDE, sg->dest_stride);
>> +	}
>> +
>> +	if (axi_dmac_src_is_mem(chan)) {
>> +		axi_dmac_write(dmac, AXI_DMAC_REG_SRC_ADDRESS, sg->src_addr);
>> +		axi_dmac_write(dmac, AXI_DMAC_REG_SRC_STRIDE, sg->src_stride);
>> +	}
>> +
>> +	/*
>> +	 * If the hardware supports cyclic transfers and there is no callback to
>> +	 * call, enable hw cyclic mode to avoid unnecessary interrupts.
>> +	 */
>> +	if (chan->hw_cyclic && desc->cyclic && !desc->vdesc.tx.callback)
>> +		flags |= AXI_DMAC_FLAG_CYCLIC;
>> +
>> +	axi_dmac_write(dmac, AXI_DMAC_REG_X_LENGTH, sg->x_len - 1);
>> +	axi_dmac_write(dmac, AXI_DMAC_REG_Y_LENGTH, sg->y_len - 1);
>> +	axi_dmac_write(dmac, AXI_DMAC_REG_FLAGS, flags);
>> +	axi_dmac_write(dmac, AXI_DMAC_REG_START_TRANSFER, 1);
>> +}
> 
> On Wed, Aug 19, 2015 at 06:55:34PM +0200, Lars-Peter Clausen wrote:
>> On 08/19/2015 06:32 PM, Vinod Koul wrote:
>>> On Tue, Jul 28, 2015 at 11:38:06AM +0200, Lars-Peter Clausen wrote:
>>>> +	desc = axi_dmac_alloc_desc(sg_len);
>>>> +	if (!desc)
>>>> +		return NULL;
>>>> +
>>>> +	for_each_sg(sgl, sg, sg_len, i) {
>>>> +		if (!axi_dmac_check_addr(chan, sg_dma_address(sg)) ||
>>>> +		    !axi_dmac_check_len(chan, sg_dma_len(sg))) {
>>>> +			kfree(desc);
>>>> +			return NULL;
>>>> +		}
>>>> +
>>>> +		if (direction == DMA_DEV_TO_MEM)
>>>> +			desc->sg[i].dest_addr = sg_dma_address(sg);
>>>> +		else
>>>> +			desc->sg[i].src_addr = sg_dma_address(sg);
>>> where is device side programming ?
>>
>> in the start_transfer() function.
> 
> I must have missed that but still don't see it here, can you point me

Oh you mean the DMA address for the device? It's a dedicated bus on the
device side, so there is no address to program on the device side.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
