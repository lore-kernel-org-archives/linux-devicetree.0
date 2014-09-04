From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dma: Add Xilinx AXI Direct Memory Access Engine
 driver support
Date: Thu, 4 Sep 2014 12:06:13 +0530
Message-ID: <20140904063613.GD1610@intel.com>
References: <1406549869-24422-1-git-send-email-sthokal@xilinx.com>
 <1406549869-24422-2-git-send-email-sthokal@xilinx.com>
 <20140819170346.GS13288@intel.com>
 <CA+mB=1L14Os=ZdJzj8_+XXa+oq4ZOS_kadQHpKQ2yws2tqGVSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+mB=1L14Os=ZdJzj8_+XXa+oq4ZOS_kadQHpKQ2yws2tqGVSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Levente Kurusa <levex-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 03, 2014 at 12:17:43PM +0530, Srikanth Thokala wrote:
> Hi Vinod,
> 
> Apologies for the delay.
> 
> On Tue, Aug 19, 2014 at 10:33 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, Jul 28, 2014 at 05:47:49PM +0530, Srikanth Thokala wrote:
> >> +struct xilinx_dma_chan {
> >> +     struct xilinx_dma_device *xdev;
> >> +     u32 ctrl_offset;
> >> +     spinlock_t lock;
> >> +     struct list_head pending_list;
> >> +     struct xilinx_dma_tx_descriptor *active_desc;
> >> +     struct xilinx_dma_tx_descriptor *allocated_desc;
> >> +     struct list_head done_list;
> >> +     struct list_head free_seg_list;
> >> +     struct dma_chan common;
> >> +     struct xilinx_dma_tx_segment *seg_v;
> >> +     dma_addr_t seg_p;
> >> +     struct device *dev;
> >> +     int irq;
> >> +     int id;
> >> +     enum dma_transfer_direction direction;
> > This looks suspect. Why should channel have direction, for a descriptor it
> > makes sense though.
> 
> The channel only supports transfers in one direction. Either from memory to
> peripheral or from peripheral to memory, that's fixed and can't be changed
> at runtime.  So, the driver needs to know which direction the channel supports
> and hence it can reject transfers with the wrong direction.
But you already have this information in descriptor so why duplicate?

> >> +/**
> >> + * xilinx_dma_channel_set_config - Configure DMA channel
> >> + * @dchan: DMA channel
> >> + * @cfg: DMA device configuration pointer
> >> + *
> >> + * Return: '0' on success and failure value on error
> >> + */
> >> +int xilinx_dma_channel_set_config(struct dma_chan *dchan,
> >> +                               struct xilinx_dma_config *cfg)
> >> +{
> >> +     struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
> >> +     u32 reg = dma_ctrl_read(chan, XILINX_DMA_REG_CONTROL);
> >> +
> >> +     if (cfg->reset)
> >> +             return xilinx_dma_reset(chan);
> >> +
> >> +     if (cfg->coalesc <= XILINX_DMA_CR_COALESCE_MAX)
> >> +             reg |= cfg->coalesc << XILINX_DMA_CR_COALESCE_SHIFT;
> >> +
> >> +     if (cfg->delay <= XILINX_DMA_CR_DELAY_MAX)
> >> +             reg |= cfg->delay << XILINX_DMA_CR_DELAY_SHIFT;
> >> +
> >> +     dma_ctrl_write(chan, XILINX_DMA_REG_CONTROL, reg);
> > You aren't checking if a transaction is already running on this channel.
> > Also don't you need other slave parameters, I see you have removed the
> > dma_slave_config entirely
> 
> All the parameters that are required for this DMA engine are provided by
> SG list, so I don't see the need of dma_slave_config.  There are some
> specific IP parameters that are not part of dma_slave_config and these
> are being set by 'dma_channel_set_config' which is exported to slave
> drivers.
And that means you dont have any common parameters between dma_slave_config
right?

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
