From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt/bindings: Add bindings for Layerscape external irqs
Date: Mon, 30 Sep 2019 07:22:08 -0500
Message-ID: <CAL_JsqKZQXGtrDUiAJj+xMnYowzDdxTdvDOXTbr_n3KWMrL7_w@mail.gmail.com>
References: <20190923101513.32719-1-kurt@linutronix.de> <20190923101513.32719-3-kurt@linutronix.de>
 <20190927161118.GA19333@bogus> <f63da257-95b4-bcb8-9ba4-9786645caf26@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f63da257-95b4-bcb8-9ba4-9786645caf26@prevas.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Kurt Kanzenbach <kurt@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 4:16 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 27/09/2019 18.11, Rob Herring wrote:
> > On Mon, Sep 23, 2019 at 12:15:13PM +0200, Kurt Kanzenbach wrote:
> >> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >>
> >> This adds Device Tree binding documentation for the external interrupt
> >> lines with configurable polarity present on some Layerscape SOCs.
> >>
> >> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> >> ---
> >>
> >> +* Freescale Layerscape external IRQs
> >> +
> >> +Some Layerscape SOCs (LS1021A, LS1043A, LS1046A, LS2088A) support
> >> +inverting the polarity of certain external interrupt lines.
> >> +
> >> +The device node must be a child of the node representing the
> >> +Supplemental Configuration Unit (SCFG) or the Interrupt Sampling
> >> +Control (ISC) Unit.
> >> +
> >> +Required properties:
> >> +- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
> >> +- interrupt-controller: Identifies the node as an interrupt controller
> >> +- #interrupt-cells: Must be 2. The first element is the index of the
> >> +  external interrupt line. The second element is the trigger type.
> >> +- interrupt-parent: phandle of GIC.
> >> +- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in the SCFG.
> >> +- fsl,extirq-map: Specifies the mapping to interrupt numbers in the parent
> >> +  interrupt controller. Interrupts are mapped one-to-one to parent
> >> +  interrupts.
> >
> > This should be an 'interrupt-map' instead.
>
> Rob, thanks for your review comments. I know you said the same thing at
> v5, and it might seem like they are ignored. However, I asked a couple
> of followup questions
> (https://lore.kernel.org/lkml/0bb4533d-c749-d8ff-e1f2-4b08eb724713@prevas.dk/).
> I'd really appreciate it if you could (a) point to some documentation on
> how to write that interrupt-map and (b) explain how this is different
> from the Qualcomm PDC case I tried to copy and which had your Reviewed-By.

https://www.devicetree.org/specifications/
https://elinux.org/Device_Tree_Usage#Advanced_Interrupt_Mapping

For QC PDC, it could be a large number of interrupts to remap which
interrupt-map doesn't scale to very well. Also, I think it sits in
parallel to the GIC rather than downstream. The interrupt binding
doesn't really have a way to express that.


> >> +Optional properties:
> >> +- fsl,bit-reverse: This boolean property should be set on the LS1021A
> >> +  if the SCFGREVCR register has been set to all-ones (which is usually
> >> +  the case), meaning that all reads and writes of SCFG registers are
> >> +  implicitly bit-reversed. Other compatible platforms do not have such
> >> +  a register.
> >
> > Couldn't you just read that register and tell?
>
> In theory, yes, but as far as I understand (and as I wrote) it's
> specific to the ls1021a. Of course one can decide whether it's
> necessary/possible to read it based on the compatible string, but one
> would also need an extra reg property to have its address - but that
> register is not really part of the extirq "device" we're trying to
> describe. So would it need to be represented as its own subnode of scfg?

Why? You should know where the register is because you know what chip
you are on (from the compatible).

>
> If it is set at all, it's done within the first few instructions after
> reset (before control is even handed to the bootloader), so I see it as
> a kind of quirk of the hardware. The data sheet says "SCFG bit reverse
> (SCFG_SCFGREVCR) must be written 0xFFFF_FFFF as a part of initialization
> sequence before writing to any other SCFG register." which, taken
> literally, means we don't need the property at all and can just assume
> it for the ls1021a (i.e., do it based on compatible string alone) - but
> I think it should be read as "if you're going to write this register, it
> must be done first thing".
>
> > Does this apply to only the extirq register or all of scfg?
>
> All of scfg. It really seems like some accident/bad joke coming out of a
> discussion between a hardware and software engineer on the enumeration
> of bits, with the hardware guy ending up saying "alright, have it
> whichever way you want it", causing even more pain :(

If all of the scfg bits change, then if you have this property, it
should be in the scfg node. But I prefer you use the compatible
instead if that works.

Rob
