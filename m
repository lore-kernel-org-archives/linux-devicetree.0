From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic
 host_bridge from device tree
Date: Tue, 8 Jul 2014 16:37:37 -0600
Message-ID: <20140708223737.GA19512@google.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-9-git-send-email-Liviu.Dudau@arm.com>
 <20140708010103.GD22939@google.com>
 <20140708102940.GZ6501@e106497-lin.cambridge.arm.com>
 <20140708213305.GB4555@google.com>
 <20140708222738.GA4980@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140708222738.GA4980-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 11:27:38PM +0100, Liviu Dudau wrote:
> On Tue, Jul 08, 2014 at 10:33:05PM +0100, Bjorn Helgaas wrote:
> > On Tue, Jul 08, 2014 at 11:29:40AM +0100, Liviu Dudau wrote:
> > > On Tue, Jul 08, 2014 at 02:01:04AM +0100, Bjorn Helgaas wrote:
> > > > On Tue, Jul 01, 2014 at 07:43:33PM +0100, Liviu Dudau wrote:
> > > > > ...
> > > > > +int __weak pcibios_fixup_bridge_ranges(struct list_head *resources)
> > > > > +{
> > > > > +     return 0;
> > > > > +}
> > > > 
> > > > I'd wait to add this until there's a platform that needs to implement it.
> > > > Splitting it out will make this patch that much smaller and easier to
> > > > understand.
> > > 
> > > I need this as this is the default implementation (i.e. do nothing). Otherwise the
> > > link phase will give errors. 
> > 
> > I meant that you could remove the default implementation *and* the call of
> > it, since it currently does nothing.
> 
> True. But it looks like converting Will's pci-host-generic.c driver will make use of this.

I think we should move this part of the patch to the conversion of
that driver.  That will keep related changes grouped together, which 
makes them easier to review and easier to backport, e.g., to distro
kernels.

> > > > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > > > index 7e7b939..556dc5f 100644
> > > > > --- a/include/linux/pci.h
> > > > > +++ b/include/linux/pci.h
> > > > > @@ -402,6 +402,7 @@ struct pci_host_bridge {
> > > > >       struct device dev;
> > > > >       struct pci_bus *bus;            /* root bus */
> > > > >       int domain_nr;
> > > > > +     resource_size_t io_base;        /* physical address for the start of I/O area */
> > > > 
> > > > I don't see where this is used yet.
> > > 
> > > It's used in pci_host_bridge_of_get_ranges() (earlier in this patch).
> > 
> > of_create_pci_host_bridge() fills in bridge->io_base, but I don't see
> > anything that ever *reads* bridge->io_base.
> 
> Ah, understood. It is used by the host bridge drivers to set their ATR registers to the
> correct CPU address values.

Same applies here.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
