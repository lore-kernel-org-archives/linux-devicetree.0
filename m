From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI I/O memory type
Date: Wed, 21 May 2014 10:20:57 +0200
Message-ID: <8688804.rOhvi9AvoE@wuerfel>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com> <20140516095333.GE12341@arm.com> <20140521052007.GA14888@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140521052007.GA14888-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 23:20:07 Jason Gunthorpe wrote:
> On Fri, May 16, 2014 at 10:53:33AM +0100, Will Deacon wrote:
> 
> > > Correct. Assume a PCI device uses PIO and DMA. It sends a DMA to main memory
> > > and lets the CPU know about the data using a level (IntA as opposed to MSI)
> > > interrupt. The CPU performs an outl() operation to an I/O port to let the
> > > hardware know it has received the IRQ and the response of the outl() is
> > > guaranteed to flush the DMA transaction: by the time the outl() completes
> > > we know that the data in memory is valid because it is strongly ordered
> > > relative to the DMA.
> 
> Keep in mind that the IntA message itself is going to flush the DMA,
> no sane host bridge implementation should process the IntA until all
> prior DMA writes are completed, just like MSI.

I was thinking of PCI, not PCIe here, where the interrupt can be directly
wired to the irqchip.

> Also, legacy non-MSI interrupts are always sharable, so the ISR must
> always start with a read of a device specific status reguster, which
> will also flush any DMA writes.

Right, good point.

> The simplest common scenario to show synchronous outl is this:
> 
> void pci_isr()
> {
>    if (inl(status_reg) & INT_PENDING)
>       outl(ACK_INT,status_reg);
> }
> 
> Where the outl is not expected to complete at the CPU until the device
> has lowered the level triggered interrupt line.
> 
> If outl is not synchronous then a spurious interrupt will be caused.
> 
> When converting a driver to MMIO you'd often have to do this:
> 
> void pci_isr()
> {
>    if (readl(status_reg) & INT_PENDING) {
>       writel(ACK_INT,status_reg);
>       readl(status_reg); // Synchronizing read, flushes write.
>    }
> }
> 
> Which is one of the software visible impacts of io vs mmio.
> 
> > Hmm, when you say `guaranteed to flush the DMA transaction', is that a PCI
> > requirement? If so, whether or not that DMA data is then visible to the CPU
> > is really specific to the host-controller implementation. It could easily be
> > buffered somewhere between the host controller and memory, for example.
> 
> PCI has the producer/consumer ordering model as part of the
> driving concept in the spec. Basically it wants to see the ordering
> model preserved right to the driver code itself.
> 
> Realistically, way back, archs that couldn't do the synchronous IO
> (like my old MIPS design) had to convert their drivers to MMIO and run
> that way. It never worked 100% properly, or made sense to try an use an
> async outl, even though some systems provided it 

Thanks for the extra background information!

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
