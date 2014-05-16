From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI
 I/O memory type
Date: Fri, 16 May 2014 10:53:33 +0100
Message-ID: <20140516095333.GE12341@arm.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <4972763.mtuLYh6sDH@wuerfel>
 <20140515153430.GM27594@arm.com>
 <11787153.NWVGbVfAPV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11787153.NWVGbVfAPV@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 04:55:52PM +0100, Arnd Bergmann wrote:
> On Thursday 15 May 2014 16:34:30 Will Deacon wrote:
> > > The way I understand it, the CPU would continue with the next instruction
> > > as soon as the write has made it out to the AXI fabric, i.e. before
> > > the PIO instruction is complete.
> > 
> > The CPU can continue regardless -- you'd need a DSB if you want to hold up
> > the instruction stream based on completion of a memory access. With the
> > posted write (device type), the write may complete as soon as it reaches an
> > ordered bus.
> > 
> > Note that nGnRnE accesses in AArch64 (the equivalent to strongly-ordered)
> > *can* still get an early write response -- that is simply a hint to the
> > memory subsystem.
> > 
> > > If this is used to synchronize with a DMA, there is no guarantee that the
> > > transaction from PCI will be visible in memory by then.
> > 
> > Can you elaborate on this scenario please? When would we use an I/O space
> > write to synchronise with a DMA transfer from a PCI endpoint? You're
> > definitely referring to I/O space as opposed to Configuration Space, right?
> 
> Correct. Assume a PCI device uses PIO and DMA. It sends a DMA to main memory
> and lets the CPU know about the data using a level (IntA as opposed to MSI)
> interrupt. The CPU performs an outl() operation to an I/O port to let the
> hardware know it has received the IRQ and the response of the outl() is
> guaranteed to flush the DMA transaction: by the time the outl() completes
> we know that the data in memory is valid because it is strongly ordered
> relative to the DMA.

Hmm, when you say `guaranteed to flush the DMA transaction', is that a PCI
requirement? If so, whether or not that DMA data is then visible to the CPU
is really specific to the host-controller implementation. It could easily be
buffered somewhere between the host controller and memory, for example.

> outl() actually does a dsb() internally, but unfortunately that is
> before the store, not after, so I assume that a driver relying on the
> behavior above would still be racy.

Yup, we'd need an additional dsb. I think we're confusing what the PCI
specification says about ordering and what the inb/outb instructions provide
on x86. It may well be that we want to emulate the x86 behaviour on ARM, but
that's not going to come cheap and I don't think it's a decision we should
take lightly.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
