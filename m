From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Fri, 27 Jun 2014 15:14:51 +0100
Message-ID: <20140627141451.GJ15296@arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
 <20140407083120.GE17163@e106497-lin.cambridge.arm.com>
 <5183143.FxBNM0xTAV@wuerfel>
 <CAErSpo4iEV6khP63ZTF+YUTKi9WLFXzMv13nxw15y3qDg15Ztg@mail.gmail.com>
 <20140626085926.GB11244@arm.com>
 <CAL_JsqKCHf6VXR3FFcBSu1xuhP54dYsAJCZwT-X9p5iTZAOJfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKCHf6VXR3FFcBSu1xuhP54dYsAJCZwT-X9p5iTZAOJfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 27, 2014 at 01:44:21AM +0100, Rob Herring wrote:
> On Thu, Jun 26, 2014 at 3:59 AM, Catalin Marinas
> <catalin.marinas-5wv7dgnIgG8@public.gmane.org> wrote:
> > Although a bit late, I'm raising this now and hopefully we'll come to a
> > conclusion soon. Delaying arm64 PCIe support even further is not a real
> > option, which leaves us with:
> >
> > 1. Someone else (with enough PCIe knowledge) volunteering to take over
> >    soon or
> > 2. Dropping Liviu's work and going for an arm64-specific implementation
> >    (most likely based on the arm32 implementation, see below)
> 
> 3. Keeping Liviu's patches leaving some of the architecture specific
> bits. I know Arnd and I both commented on it still needing more common
> pieces, but compared to option 2 that would be way better.
> 
> Let's look at the patches in question:
> 
> 3e71867 pci: Introduce pci_register_io_range() helper function.
> 6681dff pci: OF: Fix the conversion of IO ranges into IO resources.
> 
> Both OF patches. I'll happily merge them.

We just need to make sure they don't break other users of
of_pci_range_to_resource() that the second patch introduces.

> 2d5dd85 pci: Create pci_host_bridge before its associated bus in
> pci_create_root_bus.
> f6f2854 pci: Introduce a domain number for pci_host_bridge.
> 524a9f5 pci: Export find_pci_host_bridge() function.
> 
> These don't seem to be too controversial.

I think here there were discussions around introducing domain_nr to
pci_host_bridge, particularly to the pci_create_root_bus_in_domain() API
change. I don't think we reached any conclusion.

> fb75718 pci: of: Parse and map the IRQ when adding the PCI device.
> 
> 6 LOC. Hardly controversial.

I agree.

> 920a685 pci: Add support for creating a generic host_bridge from device tree
> 
> This function could be moved to drivers/of/of_pci.c if having it in
> drivers/pci is too much maintenance burden.

I think it makes sense. Currently drivers/pci/host-bridge.c doesn't have
anything OF related, so of_pci.c looks more appropriate.

> However, nearly the same
> code is already being duplicated in every DT enabled ARM PCI host
> driver and will continue as more PCI hosts are added. So this isn't
> really a question of converting other architectures to common PCI host
> infrastructure, but converting DT based PCI hosts to common
> infrastructure. ARM is the only arch moving host drivers to
> drivers/pci ATM. Until other architectures start doing that,
> converting them is pointless.

I agree. It's probably more important to convert some of the
drivers/pci/host implementations to using the common parsing rather than
a new architecture (this way we avoid even more code duplication).

> bcf5c10 Fix ioport_map() for !CONFIG_GENERIC_IOMAP cases.
> 
> Seems like an independent fix that should be applied regardless.

Indeed. But it got stuck at the top of this series and hasn't been
pushed upstream.

> 7cfde80 arm64: Add architecture support for PCI
> 
> What is here is really just a function of which option we pick.

With Liviu's latest version (not posted) and with
of_create_pci_host_bridge() function moved to of_pci.c, I don't think
there is much new functionality added to drivers/pci/. What I think we
need is clarifying the domain_nr patch (and API change) and more users
of the new generic code. As you said, it doesn't need to be a separate
architecture but rather existing pci host drivers under drivers/pci. Of
course, other arch conversion should follow shortly as well but even
without an immediate conversion, I don't see too much additional
maintenance burden for the core PCIe code (and code sharing between new
PCIe host drivers is even more beneficial).

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
