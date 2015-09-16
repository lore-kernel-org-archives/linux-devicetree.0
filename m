From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/6] PCI: generic: Correct, and avoid overflow, in
 bus_max calculation.
Date: Wed, 16 Sep 2015 12:28:52 +0100
Message-ID: <20150916112852.GC17510@red-moon>
References: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com>
 <1442013719-5001-5-git-send-email-ddaney.cavm@gmail.com>
 <20150915174934.GL31157@arm.com>
 <55F85D4E.9020604@caviumnetworks.com>
 <20150915183500.GR31157@arm.com>
 <55F86764.4060502@caviumnetworks.com>
 <20150916104152.GC28771@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150916104152.GC28771-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 11:41:53AM +0100, Will Deacon wrote:

[...]

> > Here is the current code:
> > 
> > >> 	bus_range = pci->cfg.bus_range;
> > >> 	for (busn = bus_range->start; busn <= bus_range->end; ++busn) {
> > >> 		u32 idx = busn - bus_range->start;
> > 
> > The index is offset by the bus range start...
> > 
> > >> 		u32 sz = 1 << pci->cfg.ops.bus_shift;
> > >>
> > >> 		pci->cfg.win[idx] = devm_ioremap(dev,
> > >> 						 pci->cfg.res.start + busn * sz,
> > >> 						 sz);
> > 
> > But, the offset into the "reg" property is the raw bus number.
> > 
> > 
> > >> 		if (!pci->cfg.win[idx])
> > >> 			return -ENOMEM;
> > >> 	}
> > 
> > 
> > I hope that makes it more clear.
> 
> Got it. So we should be using idx instead of busn in the devm_ioremap
> call above.

I think that's not what's specified in the PCI firmware specification,
at least for the MMCFG regions. For MMCFG regions (quoting the specs)
the "base address of the memory mapped configuration space always
corresponds to bus number 0 (regardless of the start bus number decoded
by the host bridge)..."

For the x86 implementation have a look at:

arch/x86/pci/mmconfig_64.c mcfg_ioremap()

static void __iomem *mcfg_ioremap(struct pci_mmcfg_region *cfg)
{
	void __iomem *addr;
	u64 start, size;
	int num_buses;

	start = cfg->address + PCI_MMCFG_BUS_OFFSET(cfg->start_bus);
	num_buses = cfg->end_bus - cfg->start_bus + 1;
	size = PCI_MMCFG_BUS_OFFSET(num_buses);
	addr = ioremap_nocache(start, size);
	if (addr)
		addr -= PCI_MMCFG_BUS_OFFSET(cfg->start_bus);
	return addr;
}

The MCFG config accessors add back the PCI_MMCFG_BUS_OFFSET(cfg->start_bus)
to the virtual address so that the proper virtual address is used when
issuing the config cycles, that's my understanding.

So IMO we have to define what "reg" represents for ECAM in DT, we can't
leave this open to interpretation (and I think makng MCFG and DT config
work the same way would be ideal).

Thoughts appreciated, I will countercheck on my side.

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
