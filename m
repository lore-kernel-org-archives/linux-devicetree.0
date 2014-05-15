From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI I/O memory type
Date: Thu, 15 May 2014 16:32:43 +0200
Message-ID: <4972763.mtuLYh6sDH@wuerfel>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com> <20140515155130.193c3181@free-electrons.com> <20140515142924.GI27594@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515142924.GI27594-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 15 May 2014 15:29:24 Will Deacon wrote:
>  Thu, May 15, 2014 at 02:51:30PM +0100, Thomas Petazzoni wrote:
> > On Thu, 15 May 2014 15:21:25 +0200, Arnd Bergmann wrote:
> > > On Thursday 15 May 2014 11:18:37 Thomas Petazzoni wrote:
> > > > @@ -445,7 +452,7 @@ int pci_ioremap_io(unsigned int offset, phys_addr_t phys_addr)
> > > >         return ioremap_page_range(PCI_IO_VIRT_BASE + offset,
> > > >                                   PCI_IO_VIRT_BASE + offset + SZ_64K,
> > > >                                   phys_addr,
> > > > -                                 __pgprot(get_mem_type(MT_DEVICE)->prot_pte));
> > > > +                                 __pgprot(get_mem_type(pci_ioremap_mem_type)->prot_pte));
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(pci_ioremap_io);
> > > > 
> > > 
> > > As discussed on IRC, I think we'd be better off making this a strong-ordered
> > > mapping for all platforms unconditionally. The PCI I/O space semantics
> > > require non-posted writes, which is the main difference between device
> > > and SO mappings, so the same fix is required both for mvebu as a workaround
> > > for the deadlock as well as for everyone else as a fix for an incorrect
> > > PCI behavior.
> > 
> > Ok, I'll take that into account when posting a v4.
> 
> Actually, I don't think this reasoning is correct. The memory type here
> applies to accesses mastered by the CPU onto AXI -- it is the job of the
> AXI/PCI bridge (i.e. the host controller) to ensure that writes are not
> posted, so this is irrelevant.
> 
> Of course, the erratum in question requires SO memory, but that's an
> entirely different problem. The default should remain as device memory.

How can a write be non-posted on the PCI bus if it's posted on AXI?
The way I understand it, the CPU would continue with the next instruction
as soon as the write has made it out to the AXI fabric, i.e. before
the PIO instruction is complete. If this is used to synchronize with a
DMA, there is no guarantee that the transaction from PCI will be visible
in memory by then.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
