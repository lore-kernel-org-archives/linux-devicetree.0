From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dma: Add Xilinx AXI Direct Memory Access Engine
 driver support
Date: Tue, 19 Aug 2014 22:33:46 +0530
Message-ID: <20140819170346.GS13288@intel.com>
References: <1406549869-24422-1-git-send-email-sthokal@xilinx.com>
 <1406549869-24422-2-git-send-email-sthokal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406549869-24422-2-git-send-email-sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, levex-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 28, 2014 at 05:47:49PM +0530, Srikanth Thokala wrote:
> +struct xilinx_dma_chan {
> +	struct xilinx_dma_device *xdev;
> +	u32 ctrl_offset;
> +	spinlock_t lock;
> +	struct list_head pending_list;
> +	struct xilinx_dma_tx_descriptor *active_desc;
> +	struct xilinx_dma_tx_descriptor *allocated_desc;
> +	struct list_head done_list;
> +	struct list_head free_seg_list;
> +	struct dma_chan common;
> +	struct xilinx_dma_tx_segment *seg_v;
> +	dma_addr_t seg_p;
> +	struct device *dev;
> +	int irq;
> +	int id;
> +	enum dma_transfer_direction direction;
This looks suspect. Why should channel have direction, for a descriptor it
makes sense though.

> +static enum dma_status xilinx_dma_tx_status(struct dma_chan *dchan,
> +					    dma_cookie_t cookie,
> +					    struct dma_tx_state *txstate)
> +{
> +	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
> +	enum dma_status ret;
> +	unsigned long flags;
> +
> +	ret = dma_cookie_status(dchan, cookie, txstate);
> +	if (ret != DMA_COMPLETE) {
> +		spin_lock_irqsave(&chan->lock, flags);
> +		dma_set_residue(txstate, chan->residue);
> +		spin_unlock_irqrestore(&chan->lock, flags);
> +	}
No residue reporting?

> +static int xilinx_dma_device_control(struct dma_chan *dchan,
> +				     enum dma_ctrl_cmd cmd, unsigned long arg)
> +{
> +	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
> +	unsigned long flags;
> +
> +	if (cmd != DMA_TERMINATE_ALL)
> +		return -ENXIO;
> +
> +	/* Halt the DMA engine */
> +	xilinx_dma_halt(chan);
> +
> +	spin_lock_irqsave(&chan->lock, flags);
> +
> +	/* Remove and free all of the descriptors in the lists */
> +	xilinx_dma_free_desc_list(chan, &chan->pending_list);
> +	xilinx_dma_free_desc_list(chan, &chan->done_list);

> +
> +	spin_unlock_irqrestore(&chan->lock, flags);
> +
> +	return 0;
> +}
> +
> +/**
> + * xilinx_dma_channel_set_config - Configure DMA channel
> + * @dchan: DMA channel
> + * @cfg: DMA device configuration pointer
> + *
> + * Return: '0' on success and failure value on error
> + */
> +int xilinx_dma_channel_set_config(struct dma_chan *dchan,
> +				  struct xilinx_dma_config *cfg)
> +{
> +	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
> +	u32 reg = dma_ctrl_read(chan, XILINX_DMA_REG_CONTROL);
> +
> +	if (cfg->reset)
> +		return xilinx_dma_reset(chan);
> +
> +	if (cfg->coalesc <= XILINX_DMA_CR_COALESCE_MAX)
> +		reg |= cfg->coalesc << XILINX_DMA_CR_COALESCE_SHIFT;
> +
> +	if (cfg->delay <= XILINX_DMA_CR_DELAY_MAX)
> +		reg |= cfg->delay << XILINX_DMA_CR_DELAY_SHIFT;
> +
> +	dma_ctrl_write(chan, XILINX_DMA_REG_CONTROL, reg);
You aren't checking if a transaction is already running on this channel.
Also don't you need other slave parameters, I see you have removed the
dma_slave_config entirely

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
