From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: xilinx: dpdma: Add the Xilinx DisplayPort DMA
 engine driver
Date: Wed, 24 Jan 2018 20:10:59 +0530
Message-ID: <20180124144059.GI18649@localhost>
References: <1515204848-3493-1-git-send-email-hyun.kwon@xilinx.com>
 <1515204848-3493-2-git-send-email-hyun.kwon@xilinx.com>
 <20180112141355.GO18649@localhost>
 <MWHPR02MB249345183B6CCD86A56A4E1ED6E30@MWHPR02MB2493.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <MWHPR02MB249345183B6CCD86A56A4E1ED6E30-RUky8eZECECTw9ZLCNw7fKnrV9Ap65cLvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Tejas Upadhyay <TEJASU-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 23, 2018 at 05:03:19PM +0000, Hyun Kwon wrote:

> > why should this be a compile option
> > 
> 
> This debugfs code is for testing / regression, and we don't want to enable it
> for regular users.

Right and that is why you have CONFIG_DEBUGFS, why not use that?

> > do you need all these headers?
> > 
> 
> I directly included all headers that are used in this driver. Some of them can
> be removed from indirect inclusions, and I'm fine with that. Please let me know
> if that's your preference.

Yes pls remove the ones that are needed

> > > +#define XILINX_DPDMA_INTR_DESC_DONE_SHIFT		0
> > 
> > you can define a common shift using ffs
> > 
> 
> I guess you mean to replace, (value & MASK) << SHIFT, with
> (value & MASK) << ffs(MASK). I'll change to that way. Let me know otherwise.

yes and you may use the ones in bitfield.h

> > what does it mean (lower 32 bit of Nth 4KB page)
> > 
> 
> Each descriptor can point up to 5 - 48bit address payloads. src_addr* fields
> contain lower 32bit of 48bit address. Remaining upper 16bit is programmed in
> addr_ext* fields.

pls document this

> > > +static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > +			       struct dma_slave_config *config)
> > > +{
> > > +	if (config->direction != DMA_MEM_TO_DEV)
> > > +		return -EINVAL;
> > 
> > ?? Why are the config values not used, how else do you configure the
> > channel?
> > 
> 
> There's not much configuration to be done. Channels are pretty much identical
> with fixed configurations.

hmmm, you do support DMA_SLAVE right?

> > why have these wrappers which do not do anything?
> > 
> 
> It's just my personal preference to split into different code partitions, and
> each section is partitioned / grouped with some comment line. :-)
> Ex, a partition for struct dma_chan, and another one for
> struct xilinx_dpdma_chan. It gives me sort of abstracted view. But it may be
> just me, and it comes with extra indirections. I'll remove unnecessary wrappers.

wrapper without any logic dont help

> > > +	for (i = 0; i < XILINX_DPDMA_NUM_CHAN; i++)
> > > +		if (xdev->chan[i])
> > > +			xilinx_dpdma_chan_remove(xdev->chan[i]);
> > 
> > At this point your irq is still enabled and can fire, and can schedule
> > tasklet.. Are you sure you are okay with that?
> > 
> 
> Ok. You mean that an interrupt can occur right before
> xilinx_dpdma_disable_intr(), and the interrupt may be handled  in the middle or
> after removing this driver. I'll switch to request_irq() from
> devm_request_irq(), and remove the irq when removing the driver.

yes and ensure tasklets are quiesced

> > > +MODULE_AUTHOR("Xilinx, Inc.");
> > > +MODULE_DESCRIPTION("Xilinx DPDMA driver");
> > > +MODULE_LICENSE("GPL v2");
> > 
> > No MODULE_ALIAS()?
> 
> Is it required? Could you please elaborate, to help my understanding? 

did you try builing as modules and testing this?

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
