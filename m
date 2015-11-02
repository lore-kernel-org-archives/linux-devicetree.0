From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Mon, 02 Nov 2015 21:55:13 +0100
Message-ID: <17979873.Bg2pv5SLy6@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <3962829.iR3I63FEm8@wuerfel> <5637B7C1.2070200@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5637B7C1.2070200-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 02 November 2015 14:21:37 Sinan Kaya wrote:
> On 11/2/2015 11:33 AM, Arnd Bergmann wrote:
> > On Sunday 01 November 2015 13:50:53 Sinan Kaya wrote:
> > A barrier after the writel() has no effect, as MMIO writes are posted
> > on the bus.
> 
> I had two use cases in the original code. We are talking about start 
> routine here. I was giving reference to enable/reset/disable uses above.
> 
> 1. Start routine
> --------------
> spin_lock
> writel_relaxed
> spin_unlock
> 
> and
> 
> 2. enable/reset/disable
> --------------
> writel_relaxed
> wmb
> 
> I changed writel_relaxed to writel now in start routine and submitted 
> the second version of the patchset yesterday. I hope you have received 
> it. I was relying on the spinlocks before.

Ok

> >
> >> However, after issuing the command; I still need to wait some amount of
> >> time until hardware acknowledges the commands like reset/enable/disable.
> >> These are relatively faster operations happening in microseconds. That's
> >> why, I have mdelay there.
> >>
> >> I'll take a look at workqueues but it could turn out to be an overkill
> >> for few microseconds.
> >
> > Most devices are able to provide an interrupt for long-running commands.
> > Are you sure that yours is unable to do this? If so, is this a design
> > mistake or an implementation bug?
> 
> I think I was not clear on how long these command take. These command 
> are really fast and get acknowledged at status register in few 
> microseconds. That's why I choose polling.
> 
> I was waiting up to 10ms before and manually sleeping 1 milliseconds in 
> between each using mdelay. I followed your suggestion and got rid of the 
> mdelay. Then, I used polled read command which calls the usleep_range 
> function as you suggested.
> 
> Hardware supports error interrupts but this is a SW design philosophy 
> discussion. Why would you want to trigger an interrupt for few 
> microseconds delay that only happens during the first time init from probe?

If you get called in sleeping context and can use usleep_range() for
delaying, that is fine, but in effect that just means you generate another
interrupt from the timer that is not synchronized to your device, and
hide the complexity behind the usleep_range() function call.

My first choice would have been to use a struct completion to wait for
the next interrupt here, which has similar complexity on the source code
side, but never waits longer than necessary. If the hrtimer based method
works for you, there is no need to change that.

> >> I checked with the hardware designers. Hardware guarantees that by the
> >> time interrupt is observed, all data transactions in flight are
> >> delivered to their respective places and are visible to the CPU. I'll
> >> add a comment in the code about this.
> >
> > I'm curious about this. Does that mean the device is not meant for
> > high-performance transfers and just synchronizes the bus before
> > triggering the interrupt?
> 
> HIDMA meaning, as you probably guessed, is high performance DMA. We had 
> several name iterations in the company and this was the one that sticked.
> 
> I'm a SW person. I don't have the expertise to go deeper into HW design.
> I'm following the programming document. It says coherency and guaranteed 
> interrupt ordering. High performance can mean how fast you can move data 
> from one location to the other one vs. how fast you can queue up 
> multiple requests and get acks in response.
> 
> I followed a simple design here. HW can take multiple requests 
> simultaneously and give me an ack when it is finished with interrupt.
> 
> If there are requests in flight, other requests will get queued up in SW 
> and will not be serviced until the previous requests get acknowledged. 
> Then, as soon as HW stops processing; I queue a bunch of other requests 
> and kick start it. Current SW design does not allow simultaneous SW 
> queuing vs. HW processing. I can try this on the next iteration. This 
> implementation, IMO, is good enough now and has been working reliably 
> for a long time (since 2014).

Are you using message signaled interrupts then? Typically MSI guarantees
ordering against DMA, but level or edge triggered interrupts by definition
cannot (at least on PCI, but most other buses are the same way), because
the DMA master has no insight into when a DMA is actually complete.

If you use MSI, please add a comment to the readl_relaxed() that it
is safe because of that, otherwise the next person who tries to debug
a problem with your driver has to look into this.

> >>> In other words, when the hardware sends you data followed by an
> >>> interrupt to tell you the data is there, your interrupt handler
> >>> can tell the driver that is waiting for this data that the DMA
> >>> is complete while the data itself is still in flight, e.g. waiting
> >>> for an IOMMU to fetch page table entries.
> >>>
> >> There is HW guarantee for ordering.
> >>
> >> On demand paging for IOMMU is only supported for PCIe via PRI (Page
> >> Request Interface) not for HIDMA. All other hardware instances work on
> >> pinned DMA addresses. I'll drop a note about this too to the code as well.
> >
> > I wasn't talking about paging, just fetching the IOTLB from the
> > preloaded page tables in RAM. This can takes several uncached memory
> > accesses, so it would generally be slow.
> >
> I see.
> 
> HIDMA is not aware of IOMMU presence since it follows the DMA API. All 
> IOMMU latency will be built into the data movement time. By the time 
> interrupt happens, IOMMU lookups + data movement has already taken place.

Ok.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
