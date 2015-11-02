From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Mon, 02 Nov 2015 17:33:34 +0100
Message-ID: <3962829.iR3I63FEm8@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <4552697.VhjWnxQoIo@wuerfel> <56365F0D.6010508@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56365F0D.6010508-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 01 November 2015 13:50:53 Sinan Kaya wrote:
> 
> >> The issue is not writel_relaxed vs. writel. After I issue reset, I need
> >> wait for some time to confirm reset was done. I can use readl_polling
> >> instead of mdelay if we don't like mdelay.
> >
> > I meant that both _relaxed() and mdelay() are probably wrong here.
> 
> You are right about redundant writel_relaxed + wmb. They are effectively 
> equal to writel.

Actually, writel() is wmb()+writel_relaxed(), not the other way round:

When sending a command to a device that can start a DMA transfer,
the barrier is required to ensure that the DMA happens after previously
written data has gone from the CPU write buffers into the memory that
is used as the source for the transfer.

A barrier after the writel() has no effect, as MMIO writes are posted
on the bus.

> However, after issuing the command; I still need to wait some amount of 
> time until hardware acknowledges the commands like reset/enable/disable. 
> These are relatively faster operations happening in microseconds. That's 
> why, I have mdelay there.
> 
> I'll take a look at workqueues but it could turn out to be an overkill 
> for few microseconds.

Most devices are able to provide an interrupt for long-running commands.
Are you sure that yours is unable to do this? If so, is this a design
mistake or an implementation bug?

> >>> Reading the status probably requires a readl() rather than readl_relaxed()
> >>> to guarantee that the DMA data has arrived in memory by the time that the
> >>> register data is seen by the CPU. If using readl_relaxed() here is a valid
> >>> and required optimization, please add a comment to explain why it works
> >>> and how much you gain.
> >>
> >> I will add some description. This is a high speed peripheral. I don't
> >> like spreading barriers as candies inside the readl and writel unless I
> >> have to.
> >>
> >> According to the barriers video, I watched on youtube this should be the
> >> rule for ordering.
> >>
> >> "if you do two relaxed reads and check the results of the returned
> >> variables, ARM architecture guarantees that these two relaxed variables
> >> will get observed during the check."
> >>
> >> this is called implied ordering or something of that sort.
> >
> > My point was a bit different: while it is guaranteed that the
> > result of the readl_relaxed() is observed in order, they do not
> > guarantee that a DMA from device to memory that was started by
> > the device before the readl_relaxed() has arrived in memory
> > by the time that the readl_relaxed() result is visible to the
> > CPU and it starts accessing the memory.
> >
> I checked with the hardware designers. Hardware guarantees that by the 
> time interrupt is observed, all data transactions in flight are 
> delivered to their respective places and are visible to the CPU. I'll 
> add a comment in the code about this.

I'm curious about this. Does that mean the device is not meant for
high-performance transfers and just synchronizes the bus before
triggering the interrupt?

> > In other words, when the hardware sends you data followed by an
> > interrupt to tell you the data is there, your interrupt handler
> > can tell the driver that is waiting for this data that the DMA
> > is complete while the data itself is still in flight, e.g. waiting
> > for an IOMMU to fetch page table entries.
> >
> There is HW guarantee for ordering.
> 
> On demand paging for IOMMU is only supported for PCIe via PRI (Page 
> Request Interface) not for HIDMA. All other hardware instances work on 
> pinned DMA addresses. I'll drop a note about this too to the code as well.

I wasn't talking about paging, just fetching the IOTLB from the
preloaded page tables in RAM. This can takes several uncached memory
accesses, so it would generally be slow.


	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
