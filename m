From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2] DMA: add a driver for AMBA AXI NBPF DMAC IP cores
Date: Wed, 21 May 2014 08:22:08 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1405210802580.10381@axis700.grange>
References: <Pine.LNX.4.64.1404261344520.21367@axis700.grange>
 <20140507064453.GJ28638@intel.com> <Pine.LNX.4.64.1405101009220.29796@axis700.grange>
 <20140521052348.GG21128@intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140521052348.GG21128-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

As you've seen, I've submitted a v3 of this patch with all your comments 
addressed - except one - macros vs. numbers. Would that version be 
acceptable or would you like a v4? Also see a couple of comments below.

On Wed, 21 May 2014, Vinod Koul wrote:

> On Sat, May 10, 2014 at 11:15:28AM +0200, Guennadi Liakhovetski wrote:
> > Hi Vinod,
> > 
> > Thanks for a review.
> > 
> > On Wed, 7 May 2014, Vinod Koul wrote:
> > 
> > > On Sat, Apr 26, 2014 at 02:03:44PM +0200, Guennadi Liakhovetski wrote:
> > > > This patch adds a driver for NBPF DMAC IP cores from Renesas, designed for
> > > > the AMBA AXI bus.
> > > > 
> > >  
> > > > diff --git a/Documentation/devicetree/bindings/dma/nbpfaxi.txt b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
> > > > new file mode 100644
> > > > index 0000000..d5e2522
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/dma/nbpfaxi.txt

[snip]

> > > Pls split the DT bindings to seprate patch. This part needs ack from DT folks
> > 
> > I thaught it would be preferable for both to go into the tree 
> > simultaneously, i.e. as a single patch, they can review and ack this patch 
> > too, but ok, can do, np.
> That helps in getting that part acked by DT folks and track independent of DMA
> changes. Ofocurse both will be applied togther or DT first :)

Done. As for applying after the DT part is in - can it also not be helped 
by the fact, that I'm not adding any own bindings, only using standard 
dmaengine ones?

> > > > +static size_t nbpf_xfer_size(struct nbpf_device *nbpf,
> > > > +			     enum dma_slave_buswidth width, u32 burst)
> > > > +{
> > > > +	size_t size;
> > > > +
> > > > +	if (!burst)
> > > > +		burst = 1;
> > > > +
> > > > +	switch (width) {
> > > > +	case DMA_SLAVE_BUSWIDTH_8_BYTES:
> > > > +		size = 8 * burst;
> > > > +		break;
> > > > +	case DMA_SLAVE_BUSWIDTH_4_BYTES:
> > > > +		size = 4 * burst;
> > > > +		break;
> > > > +	case DMA_SLAVE_BUSWIDTH_2_BYTES:
> > > > +		size = 2 * burst;
> > > why not
> > > 		size = width * burst; 
> > > for all these three cases?
> > 
> > because width is an enum, that "accidentally" coincides with the 
> > respective numerical value. I find this confusing - if it's an enum, you 
> > shouldn't use it in calculations. If it's a numerical value, just use it 
> > explicitly, but mixing both...
> ah, i dont agree with the reasoning. We have fair examples of using enums for
> these calculations to covert dmaengine values to driver type. This is juts a
> conversion and saves code space and simplfies the routine...

I'm fine with using the width for calculations, but then 
DMA_SLAVE_BUSWIDTH_*_BYTES should be killed! Looking through grep results, 
personally I would find

	.src_info.data_width = 1,

in drivers/dma/ste_dma40.c at least as understandable as the present

	.src_info.data_width = DMA_SLAVE_BUSWIDTH_1_BYTE,

or even more. And if someone doesn't find this clear enough, you can 
always add comments. Then all calculations are jastified, including those, 
using the BIT() macro.

[snip]

> > > > +static enum dma_status nbpf_tx_status(struct dma_chan *dchan,
> > > > +		dma_cookie_t cookie, struct dma_tx_state *state)
> > > > +{
> > > > +	struct nbpf_channel *chan = nbpf_to_chan(dchan);
> > > > +	enum dma_status status = dma_cookie_status(dchan, cookie, state);
> > > > +	dma_cookie_t running = chan->running ? chan->running->async_tx.cookie : -EINVAL;
> > > > +
> > > > +	if (chan->paused)
> > > > +		status = DMA_PAUSED;
> > > > +
> > > > +	/* Note: we cannot return residues for old cookies */
> > > ??? If cookie is completed then reside is 0. So how is this comment valid?
> > 
> > For completed ones it's 0, sure.
> so what does comment mean here about "old" cookies?

Think about the amba-pl011.c serial driver. The way it handles Rx is it 
submits a 4k buffer, but then waits for an Rx timeout IRQ and pauses, 
reads out status / residue and terminates that transfer. So, Rx transfers 
are routinely incomplete. Their residue was != 0, but ones they are 
terminated you cannot retrieve that residue any longer.

Thanks
Guennadi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
