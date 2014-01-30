From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Thu, 30 Jan 2014 17:12:39 +0000
Message-ID: <alpine.DEB.2.02.1401301710210.4373@kaball.uk.xensource.com>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com> <52EA83D6.9050506@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52EA83D6.9050506-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jan 2014, Christopher Covington wrote:
> Hi Ian,
> 
> On 01/30/2014 11:11 AM, Ian Campbell wrote:
> > mach-virt has existed for a while but it is not written down what it actually
> > consists of. Although it seems a bit unusual to document a binding for an
> > entire platform since mach-virt is entirely virtual it is helpful to have
> > something to refer to in the absence of a single concrete implementation.
> > 
> > I've done my best to capture the requirements based on the git log and my
> > memory/understanding.
> > 
> > While here remove the xenvm dts example, the Xen tools will now build a
> > suitable mach-virt compatible dts when launching the guest.
> 
> [...]
> 
> > +++ b/Documentation/devicetree/bindings/arm/mach-virt.txt
> > @@ -0,0 +1,32 @@
> > +* Mach-virt "Dummy Virtual Machine" platform
> > +
> > +"mach-virt" is the smallest, dumbest platform possible, to be used as
> > +a guest for Xen, KVM and other hypervisors.
> 
> The platform is also useful to, and used by, simulators like QEMU in TCG mode.
> 
> >                                              It has no
> > +properties/functionality of its own and is driven entirely by device
> > +tree.
> 
> I find this wording confusing. I read it as saying the platform has no
> properties or functionality. Perhaps you could phrase it slightly differently,
> such as having no properties or functionality beyond what's described in the
> device tree.

Right, something like making no assumptions on the presence of devices
or hardware interfaces beyond what is described on device tree.


> > +This document defines the requirements for such a platform.
> > +
> > +* Required properties:
> > +
> > +- compatible: should be one of:
> > +	"linux,dummy-virt"
> > +	"xen,xenvm"
> > +
> > +In addition to the standard nodes (chosen, cpus, memory etc) the
> > +platform is required to provide certain other basic functionality
> > +which must be described in the device tree:
> > +
> > +    The platform must provide an ARM Generic Interrupt Controller
> > +    (GIC), defined in Documentation/devicetree/bindings/arm/gic.txt.
> > +
> > +    The platform must provide ARM architected timer, defined in
> > +    Documentation/devicetree/bindings/arm/arch_timer.txt.
> > +
> > +    If the platform is SMP then it must provide the Power State
> > +    Coordination Interface (PSCI) described in
> > +    Documentation/devicetree/bindings/arm/psci.txt.
> > +
> > +The platform may also provide hypervisor specific functionality
> > +(e.g. PV I/O), if it does so then this functionality must be
> > +discoverable (directly or indirectly) via device tree.
> 
> I think it would be informative to provide pointers here to commonly used
> paravirtualized devices, especially VirtIO PCI/MMIO.

In that case I would appreciate a link to the Xen hypervisor node:

Documentation/devicetree/bindings/arm/xen.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
