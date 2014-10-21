From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/3] dma: at_xdmac: creation of the atmel eXtended
 DMA Controller driver
Date: Tue, 21 Oct 2014 16:20:54 +0530
Message-ID: <20141021105054.GM28745@intel.com>
References: <1412175565-810-1-git-send-email-ludovic.desroches@atmel.com>
 <1412175565-810-2-git-send-email-ludovic.desroches@atmel.com>
 <20141015133004.GP1638@intel.com>
 <20141020150837.GH7443@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141020150837.GH7443@ldesroches-Latitude-E6320>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 20, 2014 at 05:08:38PM +0200, Ludovic Desroches wrote:
> Hi Vinod,
> 
> On Wed, Oct 15, 2014 at 07:00:04PM +0530, Vinod Koul wrote:
> > On Wed, Oct 01, 2014 at 04:59:23PM +0200, Ludovic Desroches wrote:
> > > New atmel DMA controller known as XDMAC, introduced with SAMA5D4
> > > devices.
> > > 
> > > +static int at_xdmac_set_slave_config(struct dma_chan *chan,
> > > +				      struct dma_slave_config *sconfig)
> > > +{
> > > +	struct at_xdmac_chan 	*atchan = to_at_xdmac_chan(chan);
> > > +
> > > +	atchan->cfg = AT91_XDMAC_DT_PERID(atchan->perid)
> > > +		      |	AT_XDMAC_CC_SWREQ_HWR_CONNECTED
> > > +		      | AT_XDMAC_CC_MBSIZE_SIXTEEN
> > > +		      | AT_XDMAC_CC_TYPE_PER_TRAN;
> > > +
> > > +	if (sconfig->direction == DMA_DEV_TO_MEM) {
> > > +		atchan->cfg |= AT_XDMAC_CC_DAM_INCREMENTED_AM
> > > +			       | AT_XDMAC_CC_SAM_FIXED_AM
> > > +			       | AT_XDMAC_CC_DIF(atchan->memif)
> > > +			       | AT_XDMAC_CC_SIF(atchan->perif)
> > > +			       | AT_XDMAC_CC_DSYNC_PER2MEM;
> > > +		atchan->dwidth = ffs(sconfig->src_addr_width) - 1;
> > > +		atchan->cfg |= AT_XDMAC_CC_DWIDTH(atchan->dwidth);
> > > +		atchan->cfg |= at_xdmac_csize(sconfig->src_maxburst);
> > > +	} else if (sconfig->direction == DMA_MEM_TO_DEV) {
> > > +		atchan->cfg |= AT_XDMAC_CC_DAM_FIXED_AM
> > > +			       | AT_XDMAC_CC_SAM_INCREMENTED_AM
> > > +			       | AT_XDMAC_CC_DIF(atchan->perif)
> > > +			       | AT_XDMAC_CC_SIF(atchan->memif)
> > > +			       | AT_XDMAC_CC_DSYNC_MEM2PER;
> > > +		atchan->dwidth = ffs(sconfig->dst_addr_width) - 1;
> > > +		atchan->cfg |= AT_XDMAC_CC_DWIDTH(atchan->dwidth);
> > > +		atchan->cfg |= at_xdmac_csize(sconfig->dst_maxburst);
> > please store both direction configs and use them based on direction in
> > prep_xxx calls. We will remove the direction here.
> > 
> 
> Ok so direction will disappear the dma_slave_config structure I assume
> but what is planned for src/dst_addr_width and src/dst_maxburst. If
> slave config looses the direction, there is no sense to have some src
> and dst fields. So where should I get them?
No there is!

So you get both src and dstn fields programmed by client. Then in prep_xxx
calls, based on the direction (which is arg for prep_xxx) we need to to use
either src or dstn fields

HTH

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
