From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Mon, 5 May 2014 14:45:21 -0600
Message-ID: <CAErSpo5-FXmVs8BWRYKz9Ln1g1Ls7_uo3oiPd32fUegf3d8hXQ@mail.gmail.com>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
 <1398353407-2345-5-git-send-email-santosh.shilimkar@ti.com>
 <20140502165459.GA29511@google.com> <20923376.buVzFR52Qe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20923376.buVzFR52Qe@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[+cc Ben, Chris]

On Fri, May 2, 2014 at 12:59 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 02 May 2014 10:54:59 Bjorn Helgaas wrote:
>> > +static void of_dma_configure(struct device *dev)
>> > +{
>> > +     u64 dma_addr, paddr, size;
>> > +     int ret;
>> > +
>> > +     dev->coherent_dma_mask = DMA_BIT_MASK(32);
>> > +     if (!dev->dma_mask)
>> > +             dev->dma_mask = &dev->coherent_dma_mask;
>> > +
>> > +     /*
>> > +      * if dma-coherent property exist, call arch hook to setup
>> > +      * dma coherent operations.
>> > +      */
>> > +     if (of_dma_is_coherent(dev->of_node)) {
>> > +             set_arch_dma_coherent_ops(dev);
>> > +             dev_dbg(dev, "device is dma coherent\n");
>> > +     }
>> > +
>> > +     /*
>> > +      * if dma-ranges property doesn't exist - just return else
>> > +      * setup the dma offset
>> > +      */
>> > +     ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
>> > +     if ((ret == -ENODEV) || (ret < 0)) {
>> > +             dev_dbg(dev, "no dma range information to setup\n");
>> > +             return;
>> > +     }
>> > +
>> > +     /* DMA ranges found. Calculate and set dma_pfn_offset */
>> > +     dev->dma_pfn_offset = PFN_DOWN(paddr - dma_addr);
>> > +     dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", dev->dma_pfn_offset);
>>
>> Is this effectively the same as an IOMMU that applies a constant offset
>> to the bus address?  Could or should this be done by adding a simple IOMMU
>> driver instead of adding dma_pfn_offset to struct device?
>
> We currently have two dma_map_ops variants on ARM (plus another set for
> coherent/noncoherent differences, but we can ignore that for the sake
> of this discussion): one that handles linear mappings and one that
> handles IOMMUs by calling into the linux/iommu.h APIs.
>
> I guess what you mean by 'a simple IOMMU driver' would be another
> dma_map_ops implementation that is separate from real IOMMUs, right?

I suppose so; it seems like the offset could be managed inside
arm_dma_ops.  My idea of an IOMMU is something that maps bus addresses
to physical memory addresses.  That's what we're doing here; it's just
that the mapping function is very simple.  So why add something new in
struct device for it?

I think powerpc and tile do something similar in dma_direct_map_page()
and tile_pci_dma_map_page() (they store the offset in struct
dev_archdata).

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
