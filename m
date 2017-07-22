From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: Add Spreadtrum DMA controller driver
Date: Sat, 22 Jul 2017 13:27:31 +0530
Message-ID: <20170722075730.GU3053@localhost>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
 <4331ea088a26f515fe1f1912c568bfd07d539e9d.1500361078.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4331ea088a26f515fe1f1912c568bfd07d539e9d.1500361078.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 03:06:12PM +0800, Baolin Wang wrote:

> +/* DMA global registers definition */
> +#define DMA_GLB_PAUSE			0x0
> +#define DMA_GLB_FRAG_WAIT		0x4
> +#define DMA_GLB_REQ_PEND0_EN		0x8
> +#define DMA_GLB_REQ_PEND1_EN		0xc
> +#define DMA_GLB_INT_RAW_STS		0x10
> +#define DMA_GLB_INT_MSK_STS		0x14
> +#define DMA_GLB_REQ_STS			0x18
> +#define DMA_GLB_CHN_EN_STS		0x1c
> +#define DMA_GLB_DEBUG_STS		0x20
> +#define DMA_GLB_ARB_SEL_STS		0x24
> +#define DMA_GLB_CHN_START_CHN_CFG1	0x28
> +#define DMA_GLB_CHN_START_CHN_CFG2	0x2c
> +#define DMA_CHN_LLIST_OFFSET		0x10
> +#define DMA_GLB_REQ_CID(base, uid)	\
> +		((unsigned long)(base) + 0x2000 + 0x4 * ((uid) - 1))

why do you need a cast here...

> +/* DMA_CHN_INTC register definition */
> +#define DMA_CHN_INT_MASK		GENMASK(4, 0)
> +#define DMA_CHN_INT_CLR_OFFSET		24

Why cant this be expressed in GENMASK?

> +/* DMA_CHN_CFG register definition */
> +#define DMA_CHN_EN			BIT(0)
> +#define DMA_CHN_PRIORITY_OFFSET		12
> +#define LLIST_EN_OFFSET			4
> +#define CHN_WAIT_BDONE			24
> +#define DMA_DONOT_WAIT_BDONE		1

All these too...

> +static void sprd_dma_set_uid(struct sprd_dma_chn *mchan)
> +{
> +	struct sprd_dma_dev *sdev = to_sprd_dma_dev(&mchan->chan);
> +	u32 dev_id = mchan->dev_id;
> +
> +	if (dev_id != DMA_SOFTWARE_UID)

Whats a UID?

> +		writel(mchan->chn_num + 1, (void __iomem *)DMA_GLB_REQ_CID(
> +		       sdev->glb_base, dev_id));

And again the cast, I dont think we need casts like this...

> +static void sprd_dma_clear_int(struct sprd_dma_chn *mchan)
> +{
> +	u32 intc = readl(mchan->chn_base + DMA_CHN_INTC);
> +
> +	intc |= DMA_CHN_INT_MASK << DMA_CHN_INT_CLR_OFFSET;
> +	writel(intc, mchan->chn_base + DMA_CHN_INTC);

How about adding a updatel macro and use that here and few other places.

> +static void sprd_dma_stop_and_disable(struct sprd_dma_chn *mchan)
> +{
> +	u32 cfg = readl(mchan->chn_base + DMA_CHN_CFG);
> +	u32 pause, timeout = DMA_CHN_PAUSE_CNT;
> +
> +	if (!(cfg & DMA_CHN_EN))
> +		return;
> +
> +	pause = readl(mchan->chn_base + DMA_CHN_PAUSE);
> +	pause |= DMA_CHN_PAUSE_EN;
> +	writel(pause, mchan->chn_base + DMA_CHN_PAUSE);
> +
> +	do {
> +		pause = readl(mchan->chn_base + DMA_CHN_PAUSE);
> +		if (pause & DMA_CHN_PAUSE_STS)
> +			break;
> +
> +		cpu_relax();
> +	} while (--timeout > 0);

We should check here if timeout occured and at least log the error

> +static enum dma_int_type sprd_dma_get_int_type(struct sprd_dma_chn *mchan)
> +{
> +	u32 intc_reg = readl(mchan->chn_base + DMA_CHN_INTC);
> +
> +	if (intc_reg & CFGERR_INT_STS)
> +		return CONFIG_ERR;
> +	else if (intc_reg & LLIST_INT_STS)
> +		return LIST_DONE;
> +	else if (intc_reg & TRSC_INT_STS)
> +		return TRANS_DONE;
> +	else if (intc_reg & BLK_INT_STS)
> +		return BLK_DONE;
> +	else if (intc_reg & FRAG_INT_STS)
> +		return FRAG_DONE;

this seems a good case for using switch-cases

> +static int sprd_dma_chn_start_chn(struct sprd_dma_chn *mchan,
> +				  struct sprd_dma_desc *mdesc)
> +{
> +	struct sprd_dma_dev *sdev = to_sprd_dma_dev(&mchan->chan);
> +	enum dma_flags flag = mdesc->dma_flags;
> +	int chn = mchan->chn_num + 1;
> +	unsigned int cfg_group1, cfg_group2, start_mode = 0;
> +
> +	if (!(flag & (DMA_GROUP1_SRC | DMA_GROUP2_SRC | DMA_GROUP1_DST |
> +		      DMA_GROUP2_DST)))
> +		return 0;
> +
> +	if (flag & (DMA_GROUP1_SRC | DMA_GROUP2_SRC)) {
> +		switch (flag & (DMA_MUTL_FRAG_DONE | DMA_MUTL_BLK_DONE |
> +			DMA_MUTL_TRANS_DONE | DMA_MUTL_LIST_DONE)) {
> +		case DMA_MUTL_FRAG_DONE:
> +			start_mode = 0;
> +			break;

empty line after each break helps with readability

> +/*
> + * struct sprd_dma_cfg: DMA configuration for users
> + * @config: salve config structure

typo

> + * @chn_pri: the channel priority
> + * @datawidth: the data width
> + * @req_mode: the request mode
> + * @irq_mode: the interrupt mode
> + * @swt_mode: the switch mode
> + * @link_cfg_v: point to the virtual memory address to save link-list DMA
> + * configuration
> + * @link_cfg_p: point to the physical memory address to save link-list DMA
> + * configuration
> + * @src_addr: the source address
> + * @des_addr: the destination address
> + * @fragmens_len: one fragment request length
> + * @block_len; one block request length
> + * @transcation_len: one transaction request length
> + * @src_step: source side transfer step
> + * @des_step: destination side transfer step
> + * @src_frag_step: source fragment transfer step
> + * @dst_frag_step: destination fragment transfer step
> + * @src_blk_step: source block transfer step
> + * @dst_blk_step: destination block transfer step
> + * @wrap_ptr: wrap jump pointer address
> + * @wrap_to: wrap jump to address
> + * @dev_id: hardware device id to start DMA transfer
> + * @is_end: DMA configuration end type
> + */
> +struct sprd_dma_cfg {
> +	struct dma_slave_config config;
> +	enum dma_pri_level chn_pri;
> +	enum dma_datawidth datawidth;

why not use src/dst_addr_width

> +	enum dma_request_mode req_mode;
> +	enum dma_int_type irq_mode;
> +	enum dma_switch_mode swt_mode;

what do these modes mean?

> +	unsigned long link_cfg_v;
> +	unsigned long link_cfg_p;

why should clients know and send this, seems internal to dma

> +	unsigned long src_addr;
> +	unsigned long des_addr;

whats wrong with src/dst_addr

> +	u32 fragmens_len;
> +	u32 block_len;

oh please, I think I will stop here now :(

> +	u32 transcation_len;
> +	u32 src_step;
> +	u32 des_step;
> +	u32 src_frag_step;
> +	u32 dst_frag_step;
> +	u32 src_blk_step;
> +	u32 dst_blk_step;
> +	u32 wrap_ptr;
> +	u32 wrap_to;
> +	u32 dev_id;
> +	enum dma_end_type is_end;

Looking at this I think these are overkill, many of them can be handled
properly by current dmaengine interfaces, so please use those before you
invent your own...

Also the code is bloated because you don't use virt-dma, pls use that. I
skipped many parts of the driver as I feel driver needs more work.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
