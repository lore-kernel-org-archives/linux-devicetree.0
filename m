From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Mon, 05 May 2014 22:55:49 +0200
Message-ID: <5575019.Hr92MUuDnc@wuerfel>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com> <20923376.buVzFR52Qe@wuerfel> <CAErSpo5-FXmVs8BWRYKz9Ln1g1Ls7_uo3oiPd32fUegf3d8hXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo5-FXmVs8BWRYKz9Ln1g1Ls7_uo3oiPd32fUegf3d8hXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 05 May 2014 14:45:21 Bjorn Helgaas wrote:
> [+cc Ben, Chris]
> 
> On Fri, May 2, 2014 at 12:59 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 02 May 2014 10:54:59 Bjorn Helgaas wrote:
> >> > +static void of_dma_configure(struct device *dev)
> >> > +{
> >> > +     u64 dma_addr, paddr, size;
> >> > +     int ret;
> >> > +
> >> > +     dev->coherent_dma_mask = DMA_BIT_MASK(32);
> >> > +     if (!dev->dma_mask)
> >> > +             dev->dma_mask = &dev->coherent_dma_mask;
> >> > +
> >> > +     /*
> >> > +      * if dma-coherent property exist, call arch hook to setup
> >> > +      * dma coherent operations.
> >> > +      */
> >> > +     if (of_dma_is_coherent(dev->of_node)) {
> >> > +             set_arch_dma_coherent_ops(dev);
> >> > +             dev_dbg(dev, "device is dma coherent\n");
> >> > +     }
> >> > +
> >> > +     /*
> >> > +      * if dma-ranges property doesn't exist - just return else
> >> > +      * setup the dma offset
> >> > +      */
> >> > +     ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
> >> > +     if ((ret == -ENODEV) || (ret < 0)) {
> >> > +             dev_dbg(dev, "no dma range information to setup\n");
> >> > +             return;
> >> > +     }
> >> > +
> >> > +     /* DMA ranges found. Calculate and set dma_pfn_offset */
> >> > +     dev->dma_pfn_offset = PFN_DOWN(paddr - dma_addr);
> >> > +     dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", dev->dma_pfn_offset);
> >>
> >> Is this effectively the same as an IOMMU that applies a constant offset
> >> to the bus address?  Could or should this be done by adding a simple IOMMU
> >> driver instead of adding dma_pfn_offset to struct device?
> >
> > We currently have two dma_map_ops variants on ARM (plus another set for
> > coherent/noncoherent differences, but we can ignore that for the sake
> > of this discussion): one that handles linear mappings and one that
> > handles IOMMUs by calling into the linux/iommu.h APIs.
> >
> > I guess what you mean by 'a simple IOMMU driver' would be another
> > dma_map_ops implementation that is separate from real IOMMUs, right?
> 
> I suppose so; it seems like the offset could be managed inside
> arm_dma_ops.  My idea of an IOMMU is something that maps bus addresses
> to physical memory addresses.  That's what we're doing here; it's just
> that the mapping function is very simple.  So why add something new in
> struct device for it?
> 
> I think powerpc and tile do something similar in dma_direct_map_page()
> and tile_pci_dma_map_page() (they store the offset in struct
> dev_archdata).

Ah, so the only question is whether to store it in dev_archdata or
in device. I think the argument for using struct device directly
was that it lets us access this field from architecture independent
code. It's not important to the overall design though: we could easily
put it in dev_archdata and call an architecture specific function to
set it, if there are good reasons for keeping it out of the generic
device structure.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
