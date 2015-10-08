From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 4/5] PCI: generic: Correct, and avoid overflow, in
 bus_max calculation.
Date: Thu, 8 Oct 2015 18:27:38 +0100
Message-ID: <20151008172738.GA2467@red-moon>
References: <1443811443-18878-1-git-send-email-ddaney.cavm@gmail.com>
 <20151008150243.GC3885@localhost>
 <5230007.h2fkbnOlh5@wuerfel>
 <5178627.ufUfdomGdT@wuerfel>
 <56168E4E.3070405@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56168E4E.3070405-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 08, 2015 at 08:39:58AM -0700, David Daney wrote:
> On 10/08/2015 08:18 AM, Arnd Bergmann wrote:
> >On Thursday 08 October 2015 17:11:32 Arnd Bergmann wrote:
> >>>>--- a/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> >>>>+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> >>>>@@ -34,7 +34,11 @@ Properties of the host controller node:
> >>>>  - #size-cells    : Must be 2.
> >>>>
> >>>>  - reg            : The Configuration Space base address and size, as accessed
> >>>>-                   from the parent bus.
> >>>>+                   from the parent bus.  The base address corresponds to
> >>>>+                   bus zero, even though the "bus-range" property may specify
> >>>>+                   a different starting bus number.  The driver must only map
> >>>>+                   or access the portion of the Configuration Space that
> >>>>+                   corresponds to the "bus-range"
> >>
> >>I thought we had reached an agreement that it is a bad idea to have a 'reg'
> >>property that lists registers belonging to a different device.
> >>
> >>
> >
> >To further clarify: the argument was to make it mirror what ACPI does for
> >PCI. However, this is unlike what all other devices do with DT, where you
> >have non-overlapping register ranges (start, length) for each device.
> >ACPI as far as I understand it does not give a range for a PCIe host, but
> >instead provides a way to get the start address of the ECAM register area
> >for the domain that the host is part of, and that needs to be the same
> >address for each host in the domain.
> >
> 
> We are agreed that it is a bad thing to do.  There is disagreement
> about if we should do it.
> 
> I think there are two schools of thought (I will attribute them to
> their proponents and my apologies if I misrepresent someone's
> stance):
> 
> 1) (Arnd) Don't make the the "reg" ranges overlap because it is
> ugly, dangerous and arguably incorrect in general.
> 
> 2) (Me, Will Deacon, Lorenzo Pieralisi) Overlapping "reg" properties
> should be maintained, as that is the current behavior and seems to
> agree with legacy OF device-tree specifications (although there is
> some debate about this).

I have just quoted the PCI FW specification, 4.1.4 section:

"System Software Implication of MCFG and _CBA"

which defines the ACPI behaviour of MCFG and _CBA methods for
hotplug bridges.

I understand Arnd's concerns and I do not think the DT bindings are well
defined in this respect, it is ok for me to define the DT bindings
using the "usual" reg property bindings representation, as long as we
document it and we all agree we are deviating from the PCI FW specs
(that just cover ACPI, BTW).

I think it is worth investigating why the current PCI FW specs were
defined that way for ECAM config space before proceeding any further,
to avoid pitfalls we might be missing.

Thanks,
Lorenzo

> Because the driver is broken in this area (thus the patch), it
> indicates that there are probably no users with non-zero starting
> bus numbers. So, we may have some latitude to change it.
> 
> I will generate another patch that does it Arnd's way, and if Will
> is OK with it, we might be able to do that instead.  One thing is
> certain: The driver is currently broken for non-zero starting bus
> numbers.
> 
> David Daney
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
