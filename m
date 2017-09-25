From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Mon, 25 Sep 2017 15:17:59 +0530
Message-ID: <20170925094759.GB30097@localhost>
References: <69228f2ae8af7cff6b2a5e75503a08bd756a0d5e.1504777856.git.baolin.wang@spreadtrum.com>
 <6225db538d6f22c608da89520576669784a82e1e.1504777856.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6225db538d6f22c608da89520576669784a82e1e.1504777856.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 07, 2017 at 06:00:04PM +0800, Baolin Wang wrote:

> +static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
> +				u32 mask, u32 val)

right justfied pls

> +static void sprd_dma_clear_int(struct sprd_dma_chn *schan)
> +{
> +	u32 mask = SPRD_DMA_INT_MASK << SPRD_DMA_INT_CLR_OFFSET;
> +	u32 val = SPRD_DMA_INT_MASK << SPRD_DMA_INT_CLR_OFFSET;

both seems same..?

> +
> +	sprd_dma_chn_update(schan, SPRD_DMA_CHN_INTC, mask, val);

do you need local values here, we can just call sprd_dma_chn_update() with
the mask and values!

Also looking at thus shoulnt SPRD_DMA_INT_MASK bits be defined for the bits
we have in spec, if so why are we shifting then, perhpas u should redo the
clear routine to pass mask, shift, bits..?

Same comment for this and others

> +static enum dma_int_type sprd_dma_get_int_type(struct sprd_dma_chn *schan)
> +{
> +	u32 intc_sts = readl(schan->chn_base + SPRD_DMA_CHN_INTC) &
> +		       SPRD_DMA_CHN_INT_STS;

right justfied

> +static enum dma_request_mode sprd_dma_get_req_type(struct sprd_dma_chn *schan)
> +{
> +	u32 frag_reg = readl(schan->chn_base + SPRD_DMA_CHN_FRG_LEN);
> +	u32 req_type = (frag_reg >> SPRD_DMA_REQ_MODE_OFFSET) &
> +		       SPRD_DMA_REQ_MODE_MASK;
> +
> +	switch (req_type) {
> +	case 0:
> +		return SPRD_DMA_FRAG_REQ;

which is 0

> +
> +	case 1:
> +		return SPRD_DMA_BLK_REQ;

and 1 and so on so why the coonversion?

you can do:

	switch (req_type) {
	case 0:
	case 1:
	case 2:
	case 3:
		return req_type;
	default:
		return SPRD_DMA_FRAG_REQ;

> +
> +	case 2:
> +		return SPRD_DMA_TRANS_REQ;
> +
> +	case 3:
> +		return SPRD_DMA_LIST_REQ;
> +
> +	default:
> +		return SPRD_DMA_FRAG_REQ;
> +	}
> +}
> +	if ((src_step != 0 && des_step != 0) || (src_step | des_step) == 0) {
> +		fix_en = 0;
> +	} else {
> +		fix_en = 1;
> +		if (src_step)
> +			fix_mode = 1;
> +		else
> +			fix_mode = 0;
> +	}
> +
> +	hw->frg_len = datawidth << SPRD_DMA_SRC_DATAWIDTH_OFFSET |
> +		datawidth << SPRD_DMA_DES_DATAWIDTH_OFFSET |
> +		req_mode << SPRD_DMA_REQ_MODE_OFFSET |
> +		fix_mode << SPRD_DMA_FIX_SEL_OFFSET |
> +		fix_en << SPRD_DMA_FIX_SEL_EN |
> +		(fragment_len & SPRD_DMA_FRG_LEN_MASK);
> +	hw->blk_len = block_len & SPRD_DMA_BLK_LEN_MASK;
> +
> +	hw->intc = SPRD_DMA_CFG_ERR_INT_EN;

empty line here please

> +	switch (irq_mode) {
> +	case SPRD_DMA_NO_INT:
> +		break;

no handling?

> +	case SPRD_DMA_FRAG_INT:
> +		hw->intc |= SPRD_DMA_FRAG_INT_EN;
> +		break;

empty line after break helps readablity

> +	case SPRD_DMA_BLK_INT:
> +		hw->intc |= SPRD_DMA_BLK_INT_EN;
> +		break;
> +	case SPRD_DMA_BLK_FRAG_INT:
> +		hw->intc |= SPRD_DMA_BLK_INT_EN | SPRD_DMA_FRAG_INT_EN;
> +		break;
> +	case SPRD_DMA_TRANS_INT:
> +		hw->intc |= SPRD_DMA_TRANS_INT_EN;
> +		break;
> +	case SPRD_DMA_TRANS_FRAG_INT:
> +		hw->intc |= SPRD_DMA_TRANS_INT_EN | SPRD_DMA_FRAG_INT_EN;
> +		break;
> +	case SPRD_DMA_TRANS_BLK_INT:
> +		hw->intc |= SPRD_DMA_TRANS_INT_EN | SPRD_DMA_BLK_INT_EN;
> +		break;
> +	case SPRD_DMA_LIST_INT:
> +		hw->intc |= SPRD_DMA_LIST_INT_EN;
> +		break;
> +	case SPRD_DMA_CFGERR_INT:
> +		hw->intc |= SPRD_DMA_CFG_ERR_INT_EN;
> +		break;
> +	default:
> +		dev_err(sdev->dma_dev.dev, "invalid irq mode\n");
> +		return -EINVAL;

[snip]

> +struct dma_async_tx_descriptor *sprd_dma_prep_dma_memcpy(struct dma_chan *chan,
> +							 dma_addr_t dest,
> +							 dma_addr_t src,
> +							 size_t len,
> +							 unsigned long flags)
> +{
> +	struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
> +	struct sprd_dma_desc *sdesc;
> +	int ret;
> +
> +	sdesc = kzalloc(sizeof(struct sprd_dma_desc), GFP_NOWAIT);

sizeof(*sdesc) pls

> +	ret = dma_async_device_register(&sdev->dma_dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "register dma device failed:%d\n", ret);
> +		goto err_register;
> +	}
> +
> +	sprd_dma_info.dma_cap = sdev->dma_dev.cap_mask;
> +	ret = of_dma_controller_register(np, of_dma_simple_xlate,
> +					 &sprd_dma_info);
> +	if (ret)
> +		goto err_of_register;
> +
> +	pm_runtime_put_sync(&pdev->dev);

why put_sync, i though you didnt want these?
 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
