From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH V3] of: Set the DMA mask to 64 bits when dma_addr_t is
 64-bits
Date: Mon, 8 Jul 2013 11:44:36 +0100
Message-ID: <20130708104436.GT24642@n2100.arm.linux.org.uk>
References: <1367008266-1431-1-git-send-email-lauraa@codeaurora.org>
 <517AF270.8040106@gmail.com>
 <CACVXFVPfkqP+UyoGd-+QFRzndSam_DtU=utrBPYCPjQCGQ_F6g@mail.gmail.com>
 <51D71F81.5090503@codeaurora.org>
 <CACVXFVNT3j5o9a+N9FDA07Si+cngqAZkcqh6YYOf3rHsMvRgRg@mail.gmail.com>
 <20130706091511.GN24642@n2100.arm.linux.org.uk>
 <CACVXFVNF0ZukAw5d1Uv_d0oE6arci7AyVtVEPRb0=hx+0dX6pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACVXFVNF0ZukAw5d1Uv_d0oE6arci7AyVtVEPRb0=hx+0dX6pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2013 at 06:03:57PM +0800, Ming Lei wrote:
> On Sat, Jul 6, 2013 at 5:15 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > On Sat, Jul 06, 2013 at 10:21:05AM +0800, Ming Lei wrote:
> >> But please see below words in Documentation/DMA-API.txt:
> >>
> >>            Further, the physical address of the memory must be within the
> >>            dma_mask of the device (the dma_mask represents a bit mask of the
> >>            addressable region for the device.  I.e., if the physical address of
> >>            the memory anded with the dma_mask is still equal to the physical
> >>            address, then the device can perform DMA to the memory).
> >>
> >> You may argue that the description is about dev->dma_mask, but the
> >> usage should be same.
> >>
> >> In fact, most of devices in ARM SoC(even with LPAE enabled) doesn't
> >> support 64bit DMA, so I don't see the point that the default mask is set
> >> as 64bit.
> >
> > There's another couple of issues there:
> >
> > (a) Linux assumes that physical memory starts at location zero.  There
> >     are various places in the kernel that assume that this holds true:
> >
> >         max_dma_pfn = (dma_mask >> PAGE_SHIFT) + 1
> >
> >     One notable place is the block layer.  I've suggested to Santosh a
> >     way to fix this but I need to help him a little more with it.
> >
> > (b) Device DMA addresses are a *separate* address space to the physical
> >     address space.  Device DMA addresses are the addresses which need to
> >     be programmed into the device to perform DMA to the identified
> >     location.
> >
> > What (b) means is that if you are ending up with a 64-bit address to be
> > programmed into a 32-bit only register, there is something very very
> > wrong.  What this also means is that a 32-bit DMA mask should suffice,
> > because if the DMA address results in a 32-bit address _for the DMA
> > device_ then we are within its capabilities.
> >
> > In any case, the work around is not to set the DMA mask to be 64-bit.
> 
> So how about working around the problem by setting arm_dma_limit as
> (phys_addr_t)0xffffffff if CONFIG_ZONE_DMA is unset? Or other better
> solutions?
> 
> Otherwise enabling LPAE may cause system boot failure because
> mmc card may not work when arm_dma_limit becomes (u64)-1.

Well, working around it by bodging it means that the bodges will stay
and the problem will become even worse later, and we won't have the
weight of people saying it doesn't work to use as leverage to persuade
people that DMA masks need to change.  Sorry.
