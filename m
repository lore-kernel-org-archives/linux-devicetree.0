From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dmaengine: add a driver for AMBA AXI NBPF DMAC
 IP cores
Date: Fri, 25 Jul 2014 17:00:53 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1407251635070.13523@axis700.grange>
References: <Pine.LNX.4.64.1407191239400.3062@axis700.grange>
 <Pine.LNX.4.64.1407191243360.3062@axis700.grange> <20140725141621.GT8181@intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140725141621.GT8181-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Fri, 25 Jul 2014, Vinod Koul wrote:

Thanks for your review. However, I find the following a bit odd. As you 
remember, you already reviewed v2 of this driver:

http://www.spinics.net/lists/dmaengine/msg00880.html

and provided your comments to it, which I addressed in versions 3 and 4. 
Code, that you're commenting on here, hasn't (significantly) changed since 
v1. During your v2 review it didn't seem offending to you, now it does. 
Does this mean, that if / once I fix these issues, your next review might 
find some more _old_ code snippets, that you decide aren't appropriate?

This isn't the first time such a thing is happening with various reviewers 
and patch submitters. I think a reasonable approach is to "trust your own 
review." Once I've reviewed a piece of code and found it ok, I _normally_ 
won't ask a patch author to modify code, that didn't change since my 
previous review. Simple. Of course, sometimes it does happen, that the 
first review skips some important flaws, but then I consider that my 
fault, if I didn't find them during the first round and try to find a 
solution to minimise the damage to the author. Now, to specific comments.

> On Sat, Jul 19, 2014 at 12:48:51PM +0200, Guennadi Liakhovetski wrote:
> > This patch adds a driver for NBPF DMAC IP cores from Renesas, designed for
> > the AMBA AXI bus.
> > 
> 
> > +struct nbpf_desc {
> > +	struct dma_async_tx_descriptor async_tx;
> > +	bool user_wait;
> sounds odd?

Maybe it's not the best name, I can gladly try to improve it, but I'm sure 
I'm not the best "namer," so, the same can be said about more or less 
every identifier in all my code - it could be improved. However, I don't 
think it's critical enough to delay mainlining until the next kernel 
version?

> > +static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
> > +{
> > +	struct dma_device *dma_dev = &nbpf->dma_dev;
> > +	struct nbpf_channel *chan = nbpf->chan + n;
> > +	int ret;
> > +
> > +	chan->nbpf = nbpf;
> > +	chan->base = nbpf->base + NBPF_REG_CHAN_OFFSET + NBPF_REG_CHAN_SIZE * n;
> > +	INIT_LIST_HEAD(&chan->desc_page);
> > +	spin_lock_init(&chan->lock);
> > +	chan->dma_chan.device = dma_dev;
> > +	dma_cookie_init(&chan->dma_chan);
> > +	nbpf_chan_prepare_default(chan);
> > +
> > +	dev_dbg(dma_dev->dev, "%s(): channel %d: -> %p\n", __func__, n, chan->base);
> > +
> > +	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
> > +
> > +	ret = devm_request_threaded_irq(dma_dev->dev, chan->irq,
> > +			nbpf_chan_irq, nbpf_chan_irqt, IRQF_SHARED,
> > +			chan->name, chan);
> devm_request_irq and friends arent apt here. You are in .remove and get an
> irq, what prevents that race?

How is this your comment different for DMA drivers from any other drivers? 
Of course you have to make sure no more interrupts are arriving once in 
.remove() you lost the ability to handle IRQs. So, AFAIU, it's always a 
per-case study: you have to look at .remove() and consider, what happens 
if IRQ hits at any point inside it - if at all possible. Besides, DMA 
engine drivers are additionally protected by incremented module 
use-counts, once a channel is in use? As soon as a channel is released 
your driver has to make sure no more IRQs are occurring. Besides, there's 
a dmaengine_get()... So, I think, we really need to first find a race 
possibility, and then fix it. Besides, you could try

grep -rl devm_request_irq drivers/dma/*.c

> You need to run free_irq and synchronize_irq()
> to ensure everything is proper before freeing up.
> 
> Also why threaded_irq when dmaengine API mandates you to use tasklet? The
> callback is supposed to be invoked from a tasklet.

As for this one. Yes, I'm aware, that most other dmaengine drivers use a 
tasklet for bottom half IRQ processing. But is there a real requirement 
for that? This driver has been written in the end of last year and has 
been in use since then - no problems. As long as proper locking is used, 
an IRQ thread seems to work just fine here. And allows us to leverage the 
threaded-IRQ API instead of inventing own bottom-half processing.

But if there's a _real_ essential reason to use a tasklet here, I can 
switch, np. Does it really have to be done now or would an incremental 
patch suffice?

Thanks
Guennadi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
