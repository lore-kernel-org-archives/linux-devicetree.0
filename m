From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] DMA: add a driver for AMBA AXI NBPF DMAC IP cores
Date: Wed, 21 May 2014 10:53:48 +0530
Message-ID: <20140521052348.GG21128@intel.com>
References: <Pine.LNX.4.64.1404261344520.21367@axis700.grange>
 <20140507064453.GJ28638@intel.com>
 <Pine.LNX.4.64.1405101009220.29796@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1405101009220.29796-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 10, 2014 at 11:15:28AM +0200, Guennadi Liakhovetski wrote:
> Hi Vinod,
> 
> Thanks for a review.
> 
> On Wed, 7 May 2014, Vinod Koul wrote:
> 
> > On Sat, Apr 26, 2014 at 02:03:44PM +0200, Guennadi Liakhovetski wrote:
> > > This patch adds a driver for NBPF DMAC IP cores from Renesas, designed for
> > > the AMBA AXI bus.
> > > 
> >  
> > > diff --git a/Documentation/devicetree/bindings/dma/nbpfaxi.txt b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
> > > new file mode 100644
> > > index 0000000..d5e2522
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
> > > @@ -0,0 +1,61 @@
> > > +* Renesas "Type-AXI" NBPFAXI* DMA controllers
> > > +
> > > +* DMA controller
> > > +
> > > +Required properties
> > > +
> > > +- compatible:	must be one of
> > > +		"renesas,nbpfaxi64dmac1b4"
> > > +		"renesas,nbpfaxi64dmac1b8"
> > > +		"renesas,nbpfaxi64dmac1b16"
> > > +		"renesas,nbpfaxi64dmac4b4"
> > > +		"renesas,nbpfaxi64dmac4b8"
> > > +		"renesas,nbpfaxi64dmac4b16"
> > > +		"renesas,nbpfaxi64dmac8b4"
> > > +		"renesas,nbpfaxi64dmac8b8"
> > > +		"renesas,nbpfaxi64dmac8b16"
> > > +- #dma-cells:	must be 2: the first integer is a terminal number, to which this
> > > +		slave is connected, the second one is flags. Flags is a bitmask
> > > +		with the following bits defined:
> > > +
> > > +#define NBPF_SLAVE_RQ_HIGH	1
> > > +#define NBPF_SLAVE_RQ_LOW	2
> > > +#define NBPF_SLAVE_RQ_LEVEL	4
> > > +
> > > +Optional properties:
> > > +
> > > +You can use dma-channels and dma-requests as described in dma.txt, although they
> > > +won't be used, this information is derived from the compatibility string.
> > > +
> > > +Example:
> > > +
> > > +	dma: dma-controller@48000000 {
> > > +		compatible = "renesas,nbpfaxi64dmac8b4";
> > > +		reg = <0x48000000 0x400>;
> > > +		interrupts = <0 12 0x4
> > > +			      0 13 0x4
> > > +			      0 14 0x4
> > > +			      0 15 0x4
> > > +			      0 16 0x4
> > > +			      0 17 0x4
> > > +			      0 18 0x4
> > > +			      0 19 0x4>;
> > > +		#dma-cells = <2>;
> > > +		dma-channels = <8>;
> > > +		dma-requests = <8>;
> > > +	};
> > > +
> > > +* DMA client
> > > +
> > > +Required properties:
> > > +
> > > +dmas and dma-names are required, as described in dma.txt.
> > > +
> > > +Example:
> > > +
> > > +#include <dt-bindings/dma/nbpfaxi.h>
> > > +
> > > +...
> > > +		dmas = <&dma 0 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)
> > > +			&dma 1 (NBPF_SLAVE_RQ_HIGH | NBPF_SLAVE_RQ_LEVEL)>;
> > > +		dma-names = "rx", "tx";
> > 
> > Pls split the DT bindings to seprate patch. This part needs ack from DT folks
> 
> I thaught it would be preferable for both to go into the tree 
> simultaneously, i.e. as a single patch, they can review and ack this patch 
> too, but ok, can do, np.
That helps in getting that part acked by DT folks and track independent of DMA
changes. Ofocurse both will be applied togther or DT first :)

> > > +static size_t nbpf_xfer_size(struct nbpf_device *nbpf,
> > > +			     enum dma_slave_buswidth width, u32 burst)
> > > +{
> > > +	size_t size;
> > > +
> > > +	if (!burst)
> > > +		burst = 1;
> > > +
> > > +	switch (width) {
> > > +	case DMA_SLAVE_BUSWIDTH_8_BYTES:
> > > +		size = 8 * burst;
> > > +		break;
> > > +	case DMA_SLAVE_BUSWIDTH_4_BYTES:
> > > +		size = 4 * burst;
> > > +		break;
> > > +	case DMA_SLAVE_BUSWIDTH_2_BYTES:
> > > +		size = 2 * burst;
> > why not
> > 		size = width * burst; 
> > for all these three cases?
> 
> because width is an enum, that "accidentally" coincides with the 
> respective numerical value. I find this confusing - if it's an enum, you 
> shouldn't use it in calculations. If it's a numerical value, just use it 
> explicitly, but mixing both...
ah, i dont agree with the reasoning. We have fair examples of using enums for
these calculations to covert dmaengine values to driver type. This is juts a
conversion and saves code space and simplfies the routine...

> 
> > > +		break;
> > > +	default:
> > > +		pr_warn("%s(): invalid bus width %u\n", __func__, width);
> > > +	case DMA_SLAVE_BUSWIDTH_1_BYTE:
> > > +		size = burst;
> > this would fit too in above :)
> > 
> > > +static void nbpf_cookie_update(struct nbpf_channel *chan, dma_cookie_t cookie)
> > > +{
> > > +	dma_cookie_t forgotten = cookie - NBPF_STATUS_KEEP;
> > > +
> > > +	if (cookie < NBPF_STATUS_KEEP && !chan->cookie_forgotten)
> > > +		/* Not forgetting yet */
> > > +		return;
> > > +
> > > +	if (forgotten < DMA_MIN_COOKIE)
> > > +		/* Wrapped */
> > > +		forgotten = (DMA_MAX_COOKIE & ~NBPF_STATUS_MASK) + cookie;
> > > +	chan->cookie_forgotten = forgotten;
> > > +}
> > why dont use core handler for this? Why do you need to track forgotten?
> 
> This has been discussed in 
> http://thread.gmane.org/gmane.linux.kernel/1573412, where I mentioned, 
> that only an extended cookie handling algorithm in respective drivers can 
> provide status of failed / aborted transfers. You also proposed a patch 
> "[PATCH] dmaengine: add error callback for reporting transaction errors" 
> but it has been "put on hold" too. The above is such an attempt of 
> extended status handling, caching several latest transactions' status and 
> using that cache to report back to the user. But if it's not desired, I 
> can remove it, np.
That would be great.

> > > +
> > > +static bool nbpf_cookie_in_cache(struct nbpf_channel *chan,
> > > +		dma_cookie_t cookie, struct dma_tx_state *state)
> > > +{
> > > +	if (cookie > chan->cookie_forgotten)
> > > +		return true;
> > > +
> > > +	/*
> > > +	 * We still remember the cookie, if it has wrapped beyond INT_MAX:
> > > +	 * (1) forgotten is almost INT_MAX
> > > +	 * cookie_forgotten >> NBPF_STATUS_SHIFT == DMA_MAX_COOKIE >> NBPF_STATUS_SHIFT
> > > +	 * and enquired is small
> > > +	 * (2)
> > > +	 * cookie & ~NBPF_STATUS_MASK == 0
> > Again this logic is handled so driver shoudl worry about this
> > 
> > > +	 */
> > > +
> > > +	return chan->cookie_forgotten >> NBPF_STATUS_SHIFT ==
> > > +		DMA_MAX_COOKIE >> NBPF_STATUS_SHIFT &&
> > > +		!(cookie < ~NBPF_STATUS_MASK);
> > > +}
> > > +
> > 
> > > +static enum dma_status nbpf_tx_status(struct dma_chan *dchan,
> > > +		dma_cookie_t cookie, struct dma_tx_state *state)
> > > +{
> > > +	struct nbpf_channel *chan = nbpf_to_chan(dchan);
> > > +	enum dma_status status = dma_cookie_status(dchan, cookie, state);
> > > +	dma_cookie_t running = chan->running ? chan->running->async_tx.cookie : -EINVAL;
> > > +
> > > +	if (chan->paused)
> > > +		status = DMA_PAUSED;
> > > +
> > > +	/* Note: we cannot return residues for old cookies */
> > ??? If cookie is completed then reside is 0. So how is this comment valid?
> 
> For completed ones it's 0, sure.
so what does comment mean here about "old" cookies?

> 
> > > +	if (state && cookie == running) {
> > > +		state->residue = nbpf_bytes_left(chan);
> > > +		dev_dbg(dchan->device->dev, "%s(): residue %u\n", __func__,
> > > +			state->residue);
> > > +	}
> > > +
> > > +	if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
> > > +		return status;
> > no residue here?
> 
> I only report back residue of the currently active transfer, or do you 
> mean I should put the complete size as a residue for not yet started 
> transfers?
Yes that would be the expectation as we have DMA_IN_PROGRESS for submitted as
well as running ones...

> 
> > > +
> > > +	if (nbpf_cookie_in_cache(chan, cookie, state))
> > > +		return nbpf_cookie_cached(chan, cookie, state);
> > > +
> > > +	return status;
> > > +}
> > > +
> > 
> > > +static int nbpf_control(struct dma_chan *dchan, enum dma_ctrl_cmd cmd,
> > > +			unsigned long arg)
> > > +{
> > > +	struct nbpf_channel *chan = nbpf_to_chan(dchan);
> > > +	struct dma_slave_config *config;
> > > +
> > > +	dev_dbg(dchan->device->dev, "Entry %s(%d)\n", __func__, cmd);
> > > +
> > > +	switch (cmd) {
> > > +	case DMA_TERMINATE_ALL:
> > > +		dev_dbg(dchan->device->dev, "Terminating\n");
> > > +		nbpf_chan_halt(chan);
> > > +		nbpf_chan_idle(chan);
> > > +		break;
> > > +	case DMA_SLAVE_CONFIG:
> > > +		if (!arg)
> > > +			return -EINVAL;
> > > +		config = (struct dma_slave_config *)arg;
> > > +
> > > +		/*
> > > +		 * We could check config->slave_id to match chan->terminal here,
> > > +		 * but with DT they would be coming from the same source, so
> > > +		 * such a check would be superflous
> > > +		 */
> > > +
> > > +		switch (config->direction) {
> > > +		case DMA_MEM_TO_DEV:
> > > +			chan->slave_addr = config->dst_addr;
> > > +			chan->slave_width = nbpf_xfer_size(chan->nbpf,
> > > +							config->dst_addr_width, 1);
> > > +			chan->slave_burst = nbpf_xfer_size(chan->nbpf,
> > > +							config->dst_addr_width,
> > > +							config->dst_maxburst);
> > > +			break;
> > > +		case DMA_DEV_TO_MEM:
> > > +			chan->slave_addr = config->src_addr;
> > > +			chan->slave_width = nbpf_xfer_size(chan->nbpf,
> > > +							config->src_addr_width, 1);
> > > +			chan->slave_burst = nbpf_xfer_size(chan->nbpf,
> > > +							config->src_addr_width,
> > > +							config->src_maxburst);
> > pls store all as direction makes no sense here and will be removed.
> > Now based on descriptor direction you need to use one set of above.
> 
> Hm, I find it a pity, since we don't actually need both. In this and most 
> other drivers, I think, only one side can be a slave device, the other 
> side is always RAM. So, we only need to configure addresses and burst 
> sizes of the slave size?
That might be true for your controller but we have a fair share of controllers
which are bidirectional in nature and transfer in either direction. So setting
direction runtime using API makes more sense..

> 
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		break;
> > > +	case DMA_PAUSE:
> > > +		chan->paused = true;
> > > +		nbpf_pause(chan);
> > > +		break;
> > > +	case DMA_RESUME:
> > > +		/* Leave unimplemented until we get a use case. */
> > why not remove?
> 
> Ok
> 
> > > +	default:
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct dma_async_tx_descriptor *nbpf_prep_sg(struct nbpf_channel *chan,
> > > +		struct scatterlist *src_sg, struct scatterlist *dst_sg,
> > > +		size_t len, enum dma_transfer_direction direction,
> > > +		unsigned long flags)
> > > +{
> > > +	struct nbpf_link_desc *ldesc;
> > > +	struct scatterlist *mem_sg;
> > > +	struct nbpf_desc *desc;
> > > +	bool inc_src, inc_dst;
> > > +	int i = 0;
> > > +
> > > +	switch (direction) {
> > > +	case DMA_DEV_TO_MEM:
> > > +		mem_sg = dst_sg;
> > > +		inc_src = false;
> > > +		inc_dst = true;
> > > +		break;
> > empty line here and similar instance pls
> 
> Is this specified in the CodingStyle document or does checkpatch.pl 
> complain about such cases?...
Readablity...

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
