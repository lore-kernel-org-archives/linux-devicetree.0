From: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Thu, 30 Jan 2014 17:21:15 +0000
Message-ID: <1391102475.9495.44.camel@kazak.uk.xensource.com>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
	 <52EA8853.8080709@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52EA8853.8080709-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-01-30 at 17:13 +0000, Marc Zyngier wrote:
> Hi Ian,
> 
> On 30/01/14 16:11, Ian Campbell wrote:
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
> > 
> > Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> > Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> > Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > ---
> > I'm not sure which tree this sort of thing should go though, sorry for the
> > huge Cc.
> > ---
> >  .../devicetree/bindings/arm/mach-virt.txt          |   32 ++++++++
> >  arch/arm/boot/dts/xenvm-4.2.dts                    |   81 --------------------
> >  2 files changed, 32 insertions(+), 81 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mach-virt.txt
> >  delete mode 100644 arch/arm/boot/dts/xenvm-4.2.dts
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mach-virt.txt b/Documentation/devicetree/bindings/arm/mach-virt.txt
> > new file mode 100644
> > index 0000000..562bcda
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mach-virt.txt
> > @@ -0,0 +1,32 @@
> > +* Mach-virt "Dummy Virtual Machine" platform
> > +
> > +"mach-virt" is the smallest, dumbest platform possible, to be used as
> > +a guest for Xen, KVM and other hypervisors. It has no
> > +properties/functionality of its own and is driven entirely by device
> > +tree.
> > +
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
> 
> I'm afraid I disagree with most of the above. The whole point of
> mach-virt is to provide a shell for DT platforms. None of this hardware
> is mandated. Instead, all the necessary information should be described
> in DT.

"Add support for the smallest, dumbest possible platform, to be
 used as a guest for KVM or other hypervisors.

 It only mandates a GIC and architected timers"

(your original commit message :-P)

> Actually, mach-virt doesn't really stand for Virtual Machine. It stands
> for virtual mach-* directory! Eventually, mach-virt should become the
> default platform, the one we use when we don't match anything else in
> the kernel

I can word it more like that for sure, along with the alternative
wording suggested by Christopher/Stefano to clarify the intent that
everything comes from DTB and removal of the specific requirements for
GIC/timer/PSCI I think that suit the (new) intention better?

> What you've described here are requirements for a hypervisor like Xen or
> KVM. mach-virt itself shouldn't have any of that.
> 
> Cheers,
> 
> 	M.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
