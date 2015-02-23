From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: jz4780: add driver for the Ingenic JZ4780 DMA
 controller
Date: Mon, 23 Feb 2015 16:45:44 +0530
Message-ID: <20150223111544.GA5208@intel.com>
References: <1422533980-42761-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1422533980-42761-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422533980-42761-3-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 29, 2015 at 12:19:39PM +0000, Zubair Lutfullah Kakakhel wrote:
> From: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> 
> This patch adds a driver for the DMA controller found in the Ingenic
> JZ4780.
> 
> It currently does not implement any support for the programmable firmware
> feature of the controller - this is not necessary for most uses. It also
> does not take priority into account when allocating channels, it just
> allocates the first available channel. This can be implemented later.
> 
> +++ b/drivers/dma/dma-jz4780.c
> @@ -0,0 +1,856 @@
> +/*
> + * Ingenic JZ4780 DMA controller
> + *
> + * Copyright (c) 2013 Imagination Technologies
nitpick we are in '15 now

> +static uint32_t jz4780_dma_transfer_size(unsigned long val, int *ord)
> +{
> +	*ord = ffs(val) - 1;
> +
> +	/* 8 byte transfer sizes unsupported so fall back on 4. */
> +	if (*ord == 3)
> +		*ord = 2;
> +	else if (*ord > 7)
> +		*ord = 7;
> +
> +	switch (*ord) {
> +	case 0:
> +		return JZ_DMA_SIZE_1_BYTE;
> +	case 1:
> +		return JZ_DMA_SIZE_2_BYTE;
> +	case 2:
> +		return JZ_DMA_SIZE_4_BYTE;
> +	case 4:
> +		return JZ_DMA_SIZE_16_BYTE;
> +	case 5:
> +		return JZ_DMA_SIZE_32_BYTE;
> +	case 6:
> +		return JZ_DMA_SIZE_64_BYTE;
> +	default:
> +		return JZ_DMA_SIZE_128_BYTE;
you should fail rather than assuming default for slave, and why aren't we
using the maxburst value for this?

> +
> +static struct dma_async_tx_descriptor *jz4780_dma_prep_dma_cyclic(
> +	struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
> +	size_t period_len, enum dma_transfer_direction direction,
> +	unsigned long flags, void *context)
> +{
> +	struct jz4780_dma_chan *jzchan = to_jz4780_dma_chan(chan);
> +	struct jz4780_dma_desc *desc;
> +	unsigned int periods, i;
> +
> +	if (buf_len % period_len)
> +		return NULL;
this would be a common requirement, I am wondering if we should add this in
capabilities and let sound-dmaengine layer enforce it

> +static int jz4780_dma_slave_config(struct jz4780_dma_chan *jzchan,
> +	const struct dma_slave_config *config)
> +{
> +	if ((config->src_addr_width == DMA_SLAVE_BUSWIDTH_8_BYTES)
> +	   || (config->dst_addr_width == DMA_SLAVE_BUSWIDTH_8_BYTES))
> +		return -EINVAL;
> +
> +	if ((config->src_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
> +	   && (config->dst_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED))
> +		return -EINVAL;
this is understandable but latter check is not, if this is a limitation pls
mention it here

> 
> +static int jz4780_dma_control(struct dma_chan *chan, enum dma_ctrl_cmd cmd,
> +	unsigned long arg)
> +{
> +	struct jz4780_dma_chan *jzchan = to_jz4780_dma_chan(chan);
> +	struct dma_slave_config *config = (void *)arg;
> +
> +	switch (cmd) {
> +	case DMA_TERMINATE_ALL:
> +		return jz4780_dma_terminate_all(jzchan);
> +	case DMA_SLAVE_CONFIG:
> +		return jz4780_dma_slave_config(jzchan, config);
> +	default:
> +		return -ENOSYS;
> +	}
> +}
you haven't kept up with dmaengine development, this needs update.

> +
> +static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
> +	dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	struct jz4780_dma_chan *jzchan = to_jz4780_dma_chan(chan);
> +	struct virt_dma_desc *vdesc;
> +	enum dma_status status;
> +	unsigned long flags;
> +
> +	status = dma_cookie_status(chan, cookie, txstate);
> +	if (status == DMA_COMPLETE)
> +		return status;
> +
> +	spin_lock_irqsave(&jzchan->vchan.lock, flags);
> +
> +	vdesc = vchan_find_desc(&jzchan->vchan, cookie);
> +	if (vdesc && jzchan->desc && vdesc == &jzchan->desc->vdesc
> +		&& jzchan->desc->status & (JZ_DMA_DCS_AR | JZ_DMA_DCS_HLT))
> +			status = DMA_ERROR;
what about residue reporting?

> +
> +static void jz4780_dma_chan_irq(struct jz4780_dma_dev *jzdma,
> +	struct jz4780_dma_chan *jzchan)
> +{
> +	uint32_t dcs;
> +
> +	spin_lock(&jzchan->vchan.lock);
> +
> +	dcs = jz4780_dma_readl(jzdma, JZ_DMA_REG_DCS(jzchan->id));
> +	jz4780_dma_writel(jzdma, JZ_DMA_REG_DCS(jzchan->id), 0);
> +
> +	if (dcs & JZ_DMA_DCS_AR) {
> +		dev_warn(&jzchan->vchan.chan.dev->device,
> +			 "address error (DCS=0x%x)\n", dcs);
> +	}
> +
> +	if (dcs & JZ_DMA_DCS_HLT) {
> +		dev_warn(&jzchan->vchan.chan.dev->device,
> +			 "channel halt (DCS=0x%x)\n", dcs);
> +	}
> +
> +	if (jzchan->desc) {
> +		jzchan->desc->status = dcs;
> +
> +		if ((dcs & (JZ_DMA_DCS_AR | JZ_DMA_DCS_HLT)) == 0) {
> +			if (jzchan->desc->type == DMA_CYCLIC) {
> +				vchan_cyclic_callback(&jzchan->desc->vdesc);
> +			} else {
> +				vchan_cookie_complete(&jzchan->desc->vdesc);
> +				jzchan->desc = NULL;
> +			}
> +
> +			jz4780_dma_begin(jzchan);
this bit is good :)

> +
> +	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
> +	dma_cap_set(DMA_SLAVE, dd->cap_mask);
> +	dma_cap_set(DMA_CYCLIC, dd->cap_mask);
> +
> +	dd->dev = dev;
> +	dd->chancnt = JZ_DMA_NR_CHANNELS;
> +	dd->copy_align = 2; /* 2^2 = 4 byte alignment */
> +	dd->device_alloc_chan_resources = jz4780_dma_alloc_chan_resources;
> +	dd->device_free_chan_resources = jz4780_dma_free_chan_resources;
> +	dd->device_prep_slave_sg = jz4780_dma_prep_slave_sg;
> +	dd->device_prep_dma_cyclic = jz4780_dma_prep_dma_cyclic;
> +	dd->device_prep_dma_memcpy = jz4780_dma_prep_dma_memcpy;
> +	dd->device_control = jz4780_dma_control;
> +	dd->device_tx_status = jz4780_dma_tx_status;
> +	dd->device_issue_pending = jz4780_dma_issue_pending;

Please initialize controller capabilities as well, this bit is mandatory now


> +
> +static int jz4780_dma_remove(struct platform_device *pdev)
> +{
> +	struct jz4780_dma_dev *jzdma = platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&jzdma->dma_device);
you are unregistering device even though you can still get an
irq...

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
