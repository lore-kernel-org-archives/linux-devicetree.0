From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 5/7] irqchip/irq-bcm2836: Add support for the 7211
 interrupt controller
Date: Thu, 3 Oct 2019 09:29:50 +0100
Message-ID: <20191003092950.04440d74@why>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
        <20191001224842.9382-6-f.fainelli@gmail.com>
        <20191002134041.5a181d96@why>
        <72f07d2e-b070-301a-6a5d-8e89d32adcd7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72f07d2e-b070-301a-6a5d-8e89d32adcd7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2 Oct 2019 10:06:31 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> On 10/2/19 5:40 AM, Marc Zyngier wrote:
> > On Tue,  1 Oct 2019 15:48:40 -0700
> > Florian Fainelli <f.fainelli@gmail.com> wrote:
> >   
> >> The root interrupt controller on 7211 is about identical to the one
> >> existing on BCM2836, except that the SMP cross call are done through the
> >> standard ARM GIC-400 interrupt controller. This interrupt controller is
> >> used for side band wake-up signals though.  
> > 
> > I don't fully grasp how this thing works.
> > 
> > If the 7211 interrupt controller is root and the GIC is used for SGIs,
> > this means that the GIC outputs (IRQ/FIQ/VIRQ/VFIQ, times eight) are
> > connected to individual inputs to the 7211 controller. Seems totally
> > braindead, and unexpectedly so.
> > 
> > If the GIC is root and the 7211 outputs into the GIC all of its
> > interrupts as a secondary irqchip, it would at least match an existing
> > (and pretty bad) pattern.
> > 
> > So which one of the two is it?  
> 
> The nominal configuration on 7211 is to have all interrupts go through
> the ARM GIC. It is possible however, to fallback to the legacy 2836 mode
> whereby the root interrupt controller for peripheral interrupts is this
> ARMCTL IC. There is a mux that the firmware can control which will
> dictate which root interrupt controller is used for peripherals.
> 
> I have used this mostly for silicon verification and since those are
> fairly harmless patches, just decided to send them out to avoid
> maintaining them out of tree.

This doesn't really answer my question. What I understand is that your
system is laid out like this:

     DEVICES -> ARMCTL -> CPUs
                  ^
                 GIC

How are the various GIC outputs mapped into the ARMCTL? It has 4 of
them per CPU (IRQ/FIQ + vIRQ/vFIQ), which the ARMCTL must somehow map
to its own interrupts, specially if you want to signal IPIs using the
GIC's SGIs (to which you hint in the commit log).

There is a link I'm missing here.

> We have a plan to use those as an "alternate" interrupt domain for low
> power modes and use the fact that peripheral interrupts could be active
> in both domains (GIC and ARMCTRL IC) to help support configuring and
> identifying wake-up sources fro m within Linux.

That's usually done with a hierarchy, where the ARMCTL IC would be a
child of the GIC and see all interrupt configuration calls before they
reach the GIC driver. We have plenty of examples in the tree already.

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
