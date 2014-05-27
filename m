From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Tue, 27 May 2014 13:56:55 +0100
Message-ID: <20140527125655.63A46C40FCB@trevor.secretlab.ca>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
	<53610663.7070305@ti.com> <20140501131210.CCC13C409DA@trevor.secretlab.ca>
	<5279118.J5305KQNjB@wuerfel>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5279118.J5305KQNjB@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 02 May 2014 11:58:30 +0200, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 01 May 2014 14:12:10 Grant Likely wrote:
> > > > I've got two concerns here. of_dma_get_range() retrieves only the first
> > > > tuple from the dma-ranges property, but it is perfectly valid for
> > > > dma-ranges to contain multiple tuples. How should we handle it if a
> > > > device has multiple ranges it can DMA from?
> > > > 
> > > 
> > > We've not found any cases in current Linux where more than one dma-ranges
> > > would be used. Moreover, The MM (definitely for ARM) isn't supported such
> > > cases at all (if i understand everything right).
> > > - there are only one arm_dma_pfn_limit
> > > - there is only one MM zone is used for ARM
> > > - some arches like x86,mips can support 2 zones (per arch - not per device or bus)
> > >   DMA & DMA32, but they configured once and forever per arch.
> > 
> > Okay. If anyone ever does implement multiple ranges then this code will
> > need to be revisited.
> 
> I wonder if it's needed for platforms implementing the standard "ARM memory map" [1].
> The document only talks about addresses as seen from the CPU, and I can see
> two logical interpretations how the RAM is supposed to be visible from a device:
> either all RAM would be visible contiguously at DMA address zero, or everything
> would be visible at the same physical address as the CPU sees it.
> 
> If anyone picks the first interpretation, we will have to implement that
> in Linux. We can of course hope that all hardware designs follow the second
> interpretation, which would be more convenient for us here.

Indeed. Hope though we might, I would not be surprised to see a platform
that does the first. In that case we could probably handle it with a
ranges property that is DMA-controller facing instead of device facing.
That would be able to handle the translation between CPU addressing and
DMA addressing.

Come to think of it, doesn't PCI DMA have to deal with that situation if
the PCI window is not 1:1 mapped into the CPU address space?

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
