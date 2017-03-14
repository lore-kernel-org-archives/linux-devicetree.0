From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] dmaengine: Add DW AXI DMAC driver
Date: Tue, 14 Mar 2017 08:30:40 +0530
Message-ID: <20170314030040.GZ2843@localhost>
References: <1487709484-868-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1487709484-868-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487709484-868-3-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 11:38:04PM +0300, Eugeniy Paltsev wrote:

> +static struct axi_dma_desc *axi_desc_get(struct axi_dma_chan *chan)
> +{
> +	struct dw_axi_dma *dw = chan->chip->dw;
> +	struct axi_dma_desc *desc;
> +	dma_addr_t phys;
> +
> +	desc = dma_pool_zalloc(dw->desc_pool, GFP_ATOMIC, &phys);

GFP_NOWAIT please

> +static void axi_desc_put(struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_chan *chan = desc->chan;
> +	struct dw_axi_dma *dw = chan->chip->dw;
> +	struct axi_dma_desc *child, *_next;
> +	unsigned int descs_put = 0;
> +
> +	list_for_each_entry_safe(child, _next, &desc->xfer_list, xfer_list) {
> +		list_del(&child->xfer_list);
> +		dma_pool_free(dw->desc_pool, child, child->vd.tx.phys);
> +		descs_put++;
> +	}
> +
> +	dma_pool_free(dw->desc_pool, desc, desc->vd.tx.phys);
> +	descs_put++;
> +
> +	chan->descs_allocated -= descs_put;

why not decrement chan->descs_allocated?

> +
> +	dev_vdbg(chan2dev(chan), "%s: %d descs put, %d still allocated\n",
> +		axi_chan_name(chan), descs_put, chan->descs_allocated);
> +}
> +
> +static void vchan_desc_put(struct virt_dma_desc *vdesc)
> +{
> +	axi_desc_put(vd_to_axi_desc(vdesc));
> +}

well this has no logic and becomes a dummy fn, so why do we need it.

> +
> +static enum dma_status
> +dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
> +		  struct dma_tx_state *txstate)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	enum dma_status ret;
> +
> +	ret = dma_cookie_status(dchan, cookie, txstate);
> +
> +	if (chan->is_paused && ret == DMA_IN_PROGRESS)
> +		return DMA_PAUSED;

no residue calculation?

> +static void axi_chan_start_first_queued(struct axi_dma_chan *chan)
> +{
> +	struct axi_dma_desc *desc;
> +	struct virt_dma_desc *vd;
> +
> +	vd = vchan_next_desc(&chan->vc);

unnecessary empty line

> +static void dma_chan_free_chan_resources(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +
> +	/* ASSERT: channel is idle */
> +	if (axi_chan_is_hw_enable(chan))
> +		dev_err(dchan2dev(dchan), "%s is non-idle!\n",
> +			axi_chan_name(chan));
> +
> +	axi_chan_disable(chan);
> +	axi_chan_irq_disable(chan, DWAXIDMAC_IRQ_ALL);
> +
> +	vchan_free_chan_resources(&chan->vc);
> +
> +	dev_vdbg(dchan2dev(dchan), "%s: %s: descriptor still allocated: %u\n",
> +		__func__, axi_chan_name(chan), chan->descs_allocated);
> +
> +	pm_runtime_put_sync_suspend(chan->chip->dev);

any reason why sync variant is used?

> +static struct dma_async_tx_descriptor *
> +dma_chan_prep_dma_sg(struct dma_chan *dchan,
> +		     struct scatterlist *dst_sg, unsigned int dst_nents,
> +		     struct scatterlist *src_sg, unsigned int src_nents,
> +		     unsigned long flags)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	struct axi_dma_desc *first = NULL, *desc = NULL, *prev = NULL;
> +	size_t dst_len = 0, src_len = 0, xfer_len = 0;
> +	dma_addr_t dst_adr = 0, src_adr = 0;
> +	u32 src_width, dst_width;
> +	size_t block_ts, max_block_ts;
> +	u32 reg;
> +	u8 lms = 0;
> +
> +	dev_vdbg(chan2dev(chan), "%s: %s: sn: %d dn: %d flags: 0x%lx",
> +		__func__, axi_chan_name(chan), src_nents, dst_nents, flags);
> +
> +	if (unlikely(dst_nents == 0 || src_nents == 0))
> +		return NULL;
> +
> +	if (unlikely(dst_sg == NULL || src_sg == NULL))
> +		return NULL;
> +
> +	max_block_ts = chan->chip->dw->hdata->block_size[chan->id];
> +
> +	/*
> +	 * Loop until there is either no more source or no more destination
> +	 * scatterlist entry.
> +	 */
> +	while ((dst_len || (dst_sg && dst_nents)) &&
> +	       (src_len || (src_sg && src_nents))) {
> +		if (dst_len == 0) {
> +			dst_adr = sg_dma_address(dst_sg);
> +			dst_len = sg_dma_len(dst_sg);
> +
> +			dst_sg = sg_next(dst_sg);
> +			dst_nents--;
> +		}
> +
> +		/* Process src sg list */
> +		if (src_len == 0) {
> +			src_adr = sg_dma_address(src_sg);
> +			src_len = sg_dma_len(src_sg);
> +
> +			src_sg = sg_next(src_sg);
> +			src_nents--;
> +		}
> +
> +		/* Min of src and dest length will be this xfer length */
> +		xfer_len = min_t(size_t, src_len, dst_len);
> +		if (xfer_len == 0)
> +			continue;
> +
> +		/* Take care for the alignment */
> +		src_width = axi_chan_get_xfer_width(chan, src_adr,
> +						    dst_adr, xfer_len);
> +		/*
> +		 * Actually src_width and dst_width can be different, but make
> +		 * them same to be simpler.
> +		 * TODO: REVISIT: Can we optimize it?
> +		 */
> +		dst_width = src_width;

this is memcpy so you should assume default which give optimal perf. If
required you can have a configurable parameter to help people tune

> +
> +		/*
> +		 * block_ts indicates the total number of data of width
> +		 * src_width to be transferred in a DMA block transfer.
> +		 * BLOCK_TS register should be set to block_ts -1
> +		 */
> +		block_ts = xfer_len >> src_width;
> +		if (block_ts > max_block_ts) {
> +			block_ts = max_block_ts;
> +			xfer_len = max_block_ts << src_width;
> +		}
> +
> +		desc = axi_desc_get(chan);
> +		if (unlikely(!desc))
> +			goto err_desc_get;
> +
> +		write_desc_sar(desc, src_adr);
> +		write_desc_dar(desc, dst_adr);
> +		desc->lli.block_ts_lo = cpu_to_le32(block_ts - 1);
> +		desc->lli.ctl_hi = cpu_to_le32(CH_CTL_H_LLI_VALID);
> +
> +		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> +		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
> +		       dst_width << CH_CTL_L_DST_WIDTH_POS |
> +		       src_width << CH_CTL_L_SRC_WIDTH_POS |
> +		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> +		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
> +		desc->lli.ctl_lo = cpu_to_le32(reg);
> +
> +		set_desc_src_master(desc);
> +		set_desc_dest_master(desc);
> +
> +		/* Manage transfer list (xfer_list) */
> +		if (!first) {
> +			first = desc;
> +		} else {
> +			list_add_tail(&desc->xfer_list, &first->xfer_list);

and since you use vchan why do you need this list

> +/* Deep inside these burning buildings voices die to be heard */

??

> +#define CH_CTL_L_DST_MSIZE_POS	18
> +#define CH_CTL_L_SRC_MSIZE_POS	14

empty line here

> +#define CH_CTL_L_DST_MAST_POS	2
> +#define CH_CTL_L_DST_MAST	BIT(CH_CTL_L_DST_MAST_POS)

do we need to define _POS and can't we do BIT(2)..?

> +enum {
> +	DWAXIDMAC_IRQ_NONE		= 0x0,
> +	DWAXIDMAC_IRQ_BLOCK_TRF		= BIT(0),  /* block transfer complete */
> +	DWAXIDMAC_IRQ_DMA_TRF		= BIT(1),  /* dma transfer complete */
> +	DWAXIDMAC_IRQ_SRC_TRAN		= BIT(3),  /* source transaction complete */
> +	DWAXIDMAC_IRQ_DST_TRAN		= BIT(4),  /* destination transaction complete */

Pls add these comments kernel-doc style for the enum

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
