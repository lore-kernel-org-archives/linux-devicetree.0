From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv10 2/2] dma: Add Freescale eDMA engine driver support
Date: Mon, 20 Jan 2014 15:50:07 +0530
Message-ID: <20140120102007.GC26823@intel.com>
References: <1389938684-29467-1-git-send-email-b35083@freescale.com>
 <1389938684-29467-3-git-send-email-b35083@freescale.com>
 <20140120074019.GF26823@intel.com>
 <43d79ce905e24e9bb58ef49ac19db7d7@BL2PR03MB467.namprd03.prod.outlook.com>
 <20140120093541.GX26823@intel.com>
 <f173c2531461478899818365e06df437@BL2PR03MB467.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f173c2531461478899818365e06df437-AZ66ij2kwab4MB1ZSnT4iOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Huan Wang <Huan.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 20, 2014 at 11:05:03AM +0000, Jingchang Lu wrote:
> > > > > +	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
> > > > > +	struct dma_slave_config *cfg = (void *)arg;
> > > > > +	unsigned long flags;
> > > > > +	LIST_HEAD(head);
> > > > > +
> > > > > +	switch (cmd) {
> > > > > +	case DMA_TERMINATE_ALL:
> > > > > +		spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
> > > > > +		fsl_edma_disable_request(fsl_chan);
> > > > > +		fsl_chan->edesc = NULL;
> > > > > +		vchan_get_all_descriptors(&fsl_chan->vchan, &head);
> > > > > +		spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
> > > > > +		vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
> > > > > +		return 0;
> > > > well what happens to the current ongoing transactions, i don't see
> > those
> > > > getting
> > > > terminated?
> > > The fsl_edma_disable_request(fsl_chan) would end the channel's ongoing
> > transaction, then
> > > the eDMA would not response to device dma request, and the
> > vchan_dma_desc_free_list()
> > > will release all associate memory. Thanks.
> > Can you explain a bit more how terminate will happen, given taht you are
> > using
> > same thing for pause?
> It works just like an interrupt controller on irq enable and disable. It has a register called
> set/clear enable request register(SERQ/CERQ) to enable or disable the DMA request for a given
> channel. It won't transfer data any more with the enable request register cleared. So for the
> pause and terminate the pause is the same. And there is no other way to stop the channels.
well then it is not pause! If you jave no way to stop the channel, you cant
claim to support pause and resume!

Also, for terminate this will be problematic. Assuming you are doing transfers
and terminate is invoked. Then you will disable irq. The transfers may get stuck
and periphral clock may go away after transfer so current transaction never gets
completed, how do we recovery from this?


Alstly, have you looked at edma driver already existing, any similarties in teh
controller with that?


> > > > > +static struct dma_async_tx_descriptor *fsl_edma_prep_dma_cyclic(
> > > > > +		struct dma_chan *chan, dma_addr_t dma_addr, size_t
> > buf_len,
> > > > > +		size_t period_len, enum dma_transfer_direction
> > direction,
> > > > > +		unsigned long flags, void *context)
> > > > > +{
> > > > you may want to implement the capablities api subsequently for audio
> > > > usage.
> > > Do you mean the device_slave_caps function? If it is, I will add it.
> > Yes, that can be incrementally added..
> I have send the v11 patch out with a basic device_slave_caps definition. I notice
> that there is some new update of the dma capabilities, so if possible and others ok,
> could you please merge this patch first and leave me improving the driver in subsequent
> patches. Thanks.
Sure, as I said this can be incremental but atm am worried about pause and
terminate behaviour.

--
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
