From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 4/6] PCI: generic: Correct, and avoid overflow, in bus_max calculation.
Date: Wed, 23 Sep 2015 21:35:26 +0200
Message-ID: <1589576.R6XolM4Vbv@wuerfel>
References: <1442965757-12925-1-git-send-email-ddaney.cavm@gmail.com> <1496061.0ds89jTH75@wuerfel> <5602CA55.10604@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5602CA55.10604-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 September 2015 08:50:45 David Daney wrote:
> On 09/23/2015 01:01 AM, Arnd Bergmann wrote:
> > On Tuesday 22 September 2015 16:49:15 David Daney wrote:
> >> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >> diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.txt b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> >> index cf3e205..105a968 100644
> >> --- a/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> >> +++ b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> >> @@ -34,7 +34,9 @@ Properties of the host controller node:
> >>   - #size-cells    : Must be 2.
> >>
> >>   - reg            : The Configuration Space base address and size, as accessed
> >> -                   from the parent bus.
> >> +                   from the parent bus.  The base address corresponds to
> >> +                   bus zero, even though the "bus-range" property may specify
> >> +                   a different starting bus number.
> >
> > This sounds like very unusual behavior. If you have a system with faked
> > bus numbers where the registers only physically exist for a subset of the
> > buses, this requires defining a reg property that contains MMIO space
> > which is outside of the device and potentially contains other devices.
> 
> The pci-host-generic driver only maps the ranges that correspond to the 
> "bus-range" buses, so mapping of illegal address ranges should not be a 
> problem.

There is still a problem with what the driver is allowed to map,
the current behavior is just an implementation detail that should
not mean the binding can rely on that.

We do the per-bus mapping because the vmalloc space on 32-bit systems
is very limited. A driver for a purely 64-bit OS could simplify this
by just mapping the entire 'reg' property as most drivers do, and
then use the device as an offset into that.

> > What would break if we instead defined it the expected way and only
> > list the registers for the bus numbers in the "bus-range" property?
> 
> I'm not sure if we have the luxury of being able to change the 
> definition, although the existing code only works with a starting bus 
> number of zero.  From this we might conclude that non-zero starting bus 
> numbers cannot exist in the wild, so changing the the definition of 
> "reg" so that it starts at the starting bus number might be possible.
>
> My reading of:
> 
> http://www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf
> 
> Section 3.1.1, does not preclude your interpretation.  Although that is 
> for PCI-PCI bridges, and not this pci-host-generic root complex.
> 
> If we really want to go with a different definition of what the "reg" 
> property means, then actual code has to change, and we risk breaking 
> something.

My understanding is that the code has to change anyway in one place
or another. The change you did in this patch is not needed then, but
you say that something else has to change. Is this the only change
we'd need?

diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
index 265dd25169bf..d8a5c0047155 100644
--- a/drivers/pci/host/pci-host-generic.c
+++ b/drivers/pci/host/pci-host-generic.c
@@ -196,7 +196,7 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
 		u32 sz = 1 << pci->cfg.ops->bus_shift;
 
 		pci->cfg.win[idx] = devm_ioremap(dev,
-						 pci->cfg.res.start + busn * sz,
+						 pci->cfg.res.start + idx * sz,
 						 sz);
 		if (!pci->cfg.win[idx])
 			return -ENOMEM;

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
