From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 2/6] pci: OF: Fix the conversion of IO ranges into IO resources.
Date: Fri, 14 Mar 2014 20:16:10 +0100
Message-ID: <201403142016.11105.arnd@arndb.de>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com> <201403141946.23921.arnd@arndb.de> <20140314190017.GA6457@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140314190017.GA6457-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 14 March 2014, Liviu Dudau wrote:
> On Fri, Mar 14, 2014 at 06:46:23PM +0000, Arnd Bergmann wrote:
> > On Friday 14 March 2014, Liviu Dudau wrote:
> > 
> > > +int of_pci_range_to_resource(struct of_pci_range *range,
> > > +       struct device_node *np, struct resource *res)
> > > +{
> > > +       res->flags = range->flags;
> > > +       res->parent = res->child = res->sibling = NULL;
> > > +       res->name = np->full_name;
> > > +
> > > +       if (res->flags & IORESOURCE_IO) {
> > > +               unsigned long port = -1;
> > > +               int err = pci_register_io_range(range->cpu_addr, range->size);
> > > +               if (err)
> > > +                       goto invalid_range;
> > > +               port = pci_address_to_pio(range->cpu_addr);
> > > +               if (port == (unsigned long)-1) {
> > > +                       err = -EINVAL;
> > > +                       goto invalid_range;
> > > +               }
> > > +               res->start = port;
> > > +       } else {
> > 
> > This one concatenates the I/O spaces and assumes that each space starts
> > at bus address zero, and takes little precaution to avoid filling up IO_SPACE_LIMIT
> > if the sizes are too big.
> 
> Actually, you are attaching too much meaning to this one. pci_register_io_range()
> only tries to remember the ranges, nothing else. And it *does* check that the
> total sum of registered ranges does not exceed IO_SPACE_LIMIT. This is used before
> we have any resource mapped for that range (actually it is used to *create* the
> resource for the range) so there is no other helping hand.
> 
> It doesn't assume that space starts at bus address zero, it ignores the bus address.
> It only handles CPU addresses for the range, to help with generating logical IO ports.
> If you have overlapping CPU addresses with different bus addresses it will not work,
> but then I guess you will have different problems then.

The problem is that it tries to set up a mapping so that pci_address_to_pio
returns the actual port number, but the port that you assign to res->start
above is assumed to match the 'start' variable below. If the value ends
up different, the BARs that get set by the PCI bus scan are not in the
same place that got ioremapped into the virtual I/O aperture.

> > >+unsigned long pci_ioremap_io(const struct resource *res, phys_addr_t phys_addr)
> > >+{
> > >+       unsigned long start, len, virt_start;
> > >+       int err;
> > >+
> > >+       if (res->end > IO_SPACE_LIMIT)
> > >+               return -EINVAL;
> > >+
> > >+       /*
> > >+        * try finding free space for the whole size first,
> > >+        * fall back to 64K if not available
> > >+        */
> > >+       len = resource_size(res);
> > >+       start = bitmap_find_next_zero_area(pci_iospace, IO_SPACE_PAGES,
> > >+                               res->start / PAGE_SIZE, len / PAGE_SIZE, 0);
> > >+       if (start == IO_SPACE_PAGES && len > SZ_64K) {
> > >+               len = SZ_64K;
> > >+               start = 0;
> > >+               start = bitmap_find_next_zero_area(pci_iospace, IO_SPACE_PAGES,
> > >+                                       start, len / PAGE_SIZE, 0);
> > >+       }
> > >+
> > >+       /* no 64K area found */
> > >+       if (start == IO_SPACE_PAGES)
> > >+               return -ENOMEM;
> > >+
> > >+       /* ioremap physical aperture to virtual aperture */
> > >+       virt_start = start * PAGE_SIZE + (unsigned long)PCI_IOBASE;
> > >+       err = ioremap_page_range(virt_start, virt_start + len,
> > >+                               phys_addr, __pgprot(PROT_DEVICE_nGnRE));
> > >+       if (err)
> > >+               return err;
> > >+
> > >+       bitmap_set(pci_iospace, start, len / PAGE_SIZE);
> > >+
> > >+       /* return io_offset */
> > >+       return start * PAGE_SIZE - res->start;
> > >+}

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
