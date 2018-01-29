From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: xilinx: dpdma: Add the Xilinx DisplayPort DMA
 engine driver
Date: Mon, 29 Jan 2018 09:49:35 +0530
Message-ID: <20180129041927.GJ18649@localhost>
References: <1515204848-3493-1-git-send-email-hyun.kwon@xilinx.com>
 <1515204848-3493-2-git-send-email-hyun.kwon@xilinx.com>
 <20180112141355.GO18649@localhost>
 <MWHPR02MB249345183B6CCD86A56A4E1ED6E30@MWHPR02MB2493.namprd02.prod.outlook.com>
 <20180124144059.GI18649@localhost>
 <CY4PR02MB248850638A4D19CE51F1E224D6E20@CY4PR02MB2488.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CY4PR02MB248850638A4D19CE51F1E224D6E20-CJeEToEUXu1uV7Svx/7JSanrV9Ap65cLvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Tejas Upadhyay <TEJASU-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 05:45:00PM +0000, Hyun Kwon wrote:

> > > > > +static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > > > +			       struct dma_slave_config *config)
> > > > > +{
> > > > > +	if (config->direction != DMA_MEM_TO_DEV)
> > > > > +		return -EINVAL;
> > > >
> > > > ?? Why are the config values not used, how else do you configure the
> > > > channel?
> > > >
> > >
> > > There's not much configuration to be done. Channels are pretty much
> > identical
> > > with fixed configurations.
> > 
> > hmmm, you do support DMA_SLAVE right?
> > 
> 
> Yes, and it's single direction, DMA_MEM_TO_DEV.

Okay how do you find the DMA data width and the burst to apply when you DMA
to device? Are these not programmable?

I think you need to go back and check that part. Moreover a client may send
you parameters and program the Device FIFO, you not honoring those will
result in bad data received on Device, am sure you don't want that

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
