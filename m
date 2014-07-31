From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dmaengine: add a driver for AMBA AXI NBPF DMAC
 IP cores
Date: Thu, 31 Jul 2014 15:42:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1407311520290.24081@axis700.grange>
References: <Pine.LNX.4.64.1407191239400.3062@axis700.grange>
 <Pine.LNX.4.64.1407191243360.3062@axis700.grange> <20140725141621.GT8181@intel.com>
 <Pine.LNX.4.64.1407251635070.13523@axis700.grange> <20140725163417.GV8181@intel.com>
 <Pine.LNX.4.64.1407262105150.24257@axis700.grange> <20140731125704.GV8181@intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731125704.GV8181-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jul 2014, Vinod Koul wrote:

> On Sat, Jul 26, 2014 at 09:32:18PM +0200, Guennadi Liakhovetski wrote:
> > On Fri, 25 Jul 2014, Vinod Koul wrote:
> > > And please also see there were regression on few of them, recently dw was
> > > fixed for this case. Similarly few other drivers were fixed for their
> > > behaviour in tasklet kill, syncronizing the irq and freeing up behaviour.
> > > 
> > > So now back to this driver, since you are using devm_ the irq is not freed,
> > > so how does it prevent race.
> > 
> > How is it not freed? Of course it is freed, but later - after .release() 
> > has completed.
> > 
> > As for races - AFAIU, no interrupts should be coming after all DMA 
> > channels have been freed, and .release() will not be called as long as any 
> > channels are in use. However, I think, there might be a chance for a race 
> > if the user would try to free a DMA channel before all descriptors have 
> > completed and without calling TERMINATE_ALL. I think this would be an 
> > abnormal behaviour - usually you either wait for all descriptors to 
> > complete or terminate any remaining ones, but if such a buggy DMA slave 
> > driver would be used, and if .device_free_chan_resources() gets called 
> > (on a different CPU core) after a hard IRQ has completed and before the 
> > IRQ thread has run (this would be the same if a tasklet was used in the 
> > driver instead of an IRQ thread), i.e.
> > 
> > CPU core #0		CPU core #1
> > 
> > DMA IRQ
> > schedule IRQ thread
> > 			.device_free_chan_resources()
> > IRQ thread:
> > nbpf_chan_irqt()
> > 
> > then there can be a problem, because .device_free_chan_resources() would 
> > free descriptor pages and the IRQ thread would try to use them.
> > 
> > Again, I consider that case to be a buggy DMA slave and even then such a 
> > race would be very unlikely, but theoretically it might be possible. The 
> > fix can be as simple as calling nbpf_chan_idle() from 
> > nbpf_free_chan_resources(). Would you like a new version with this single 
> > change or would such an incremental patch suffice?
> 
> There are two issues in the current driver.
> 1. You have a spurious irq. That will lead your irq running. Although
> your driver handlers can handle this, but with remove it will race and cause
> panic because your have not freed irq.

Why? Why should it panic? The managed resource handling framework will 
free IRQs before freeing the private driver object, so, pointers will 
still be valid, because those objects, including memory for all channels:

	nbpf = devm_kzalloc(dev, sizeof(*nbpf) + num_channels *
			    sizeof(nbpf->chan[0]), GFP_KERNEL);
 
are allocated before interrupts are requested. This is a very important 
guarantee, without which nothing would work. So, these lines in the IRQ 
handler:

static irqreturn_t nbpf_chan_irq(int irq, void *dev)
{
	struct nbpf_channel *chan = dev;
	bool done = nbpf_status_get(chan);
	struct nbpf_desc *desc;
	irqreturn_t ret;

	if (!done)
		return IRQ_NONE;

will run without problem.

> 2. There is nothing in your .remove which ensures all the threads have
> exited. Yes with the above argument this sounds not so simple to achieve as
> typically we get irq, callback and free the channel. But as your rightly
> pointed in multi-core systems there can be instance where you get back to
> back interrupts where descriptor sizes where small, so while processing your
> some thread maybe still stuck while user frees up.
> 
> The job of .remove is to ensure you clean up everything. the fact that you
> can still get irq after remove makes this a not so good design!

Ok, I mentioned in one of my previous mails the possibility of IRQ threads 
racing with .free_chan_resources(). And .free_chan_resources() should 
complete before .remove(), right? So, in fact we do have to fix my 
theoretical race, then your race will be fixed automatically too.

> > > If we do ensure that, then yes driver is fine
> > > and can be merged, otherwise needs a fix
> > > > 
> > > > > You need to run free_irq and synchronize_irq()
> > > > > to ensure everything is proper before freeing up.
> > > > > 
> > > > > Also why threaded_irq when dmaengine API mandates you to use tasklet? The
> > > > > callback is supposed to be invoked from a tasklet.
> > > > 
> > > > As for this one. Yes, I'm aware, that most other dmaengine drivers use a 
> > > > tasklet for bottom half IRQ processing. But is there a real requirement 
> > > > for that? This driver has been written in the end of last year and has 
> > > > been in use since then - no problems. As long as proper locking is used, 
> > > > an IRQ thread seems to work just fine here. And allows us to leverage the 
> > > > threaded-IRQ API instead of inventing own bottom-half processing.
> > > > 
> > > > But if there's a _real_ essential reason to use a tasklet here, I can 
> > > > switch, np. Does it really have to be done now or would an incremental 
> > > > patch suffice?
> > > The API mandates this for a reason. I think we can add this later as it
> > > doesn't break the functionality.
> > 
> > What was that reason? Is it that the network stack is using a tasklet and 
> > to make DMA usable for network TCP copy offloading? But that's only 
> > available with INTEL_IOATDMA and FSL_DMA and is broken anyway?
> The tasklets run at atomic context and have higher priority as comparaed to
> thread and workqueues.

AFAIK, IRQ threads have real-time priorities.

> The fact that lot of dma users are realtime, audio
> etc, we need to process this as fast as possible. With the tasklet assumption
> we assume that dmaengine APIs are invoked with atomic context, same is with
> callback called form tasklet).
> So you can never sleep in these calls. The whole framework has been built on
> these assumptions and I am not even talking about NET/Async as we are
> discussing only slave.

I think we have to find specific problems, point out at specific 
problematic locations. The above is too generic. I think I satisfy 
atomicity guarantees, where needed, using spinlocks etc. If not - those 
problems have to be identified and fixed.

> And only sh- driver try to do this, rest are fairly happy with tasklet.
> 
> So then why do you want to do this? What is your reason from deviating?

I explained this already. We already have a mechanism to handle top-bottom 
IRQ halves - threaded IRQ. It takes away a part of developer's work to set 
this up.

Ok. This doesn't seem to progress. You suggested in your previous mail, 
that I can provide an incremental patch to add devm_free(_threaded)_irq() 
and synchronize_irq() to .release(). I still think, that this doesn't make 
much sense, but if you insist... Alternatively, my proposal would be to 
fix the thoretical race in .free_chan_resources(). Would you accept such a 
patch instead of what you were proposing? I can also convert the driver to 
using a tasklet, if required. Would it suffice, if I do those patches as 
fixes after -rc1? I'm leaving on a holiday tomorrow and I still have to 
finalise some other work, so, preparing those patches today doesn't seem 
realistic to me... Would this be acceptable?

Thanks
Guennadi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
