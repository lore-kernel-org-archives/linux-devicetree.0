From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Date: Thu, 2 May 2019 20:55:36 +0200
Message-ID: <CAMuHMdV+ee3fEHvt2dv14s1nYK1JH3yi0RnJ3Xqtarn9MrZ7jA@mail.gmail.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
 <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com>
 <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com>
 <CAMuHMdVWG4LDAAht-6Rendt8L96vW+VEJK4tGnOCMJ38pRDybA@mail.gmail.com> <CAL_JsqJ34-0T_XjmRaXc3YTp4OHhptUaO3F+yygAy6L0iaNhdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ34-0T_XjmRaXc3YTp4OHhptUaO3F+yygAy6L0iaNhdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, May 2, 2019 at 6:51 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, May 2, 2019 at 5:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, May 1, 2019 at 9:38 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > On Wed, May 1, 2019 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Apr 30, 2019 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > > > 'interrupt-map' would avoid that problem I think.
> > > >
> > > > "interrupt-map" seems to be meant for translation on a bus?
> > > > What to do with the child and parent unit addresses fields?
> > > > The parent unit address size depends on the #address-cells of the parent
> > > > interrupt-controller (i.e. GIC, so it's zero).
> > > > But the child unit address size depends on the #address-cells of the bus node
> > > > on which the child is located, so that's a (non-zero) bus #address-cells
> > > > (from the root node), not an interrupt-controller #address-cells.
> > >
> > > The #address-cells is always retrieved from the interrupt-parent node
> > > (or its parent). The interrupt-parent can implicitly be the child's
> > > parent, but that is rarely used in modern systems.
> >
> > That's not what Devicetree Specification, Release v0.2 says:
> >
> >     child unit address The unit address of the child node being mapped.
> >     The number of 32-bit cells required to specify this is described by
> >     the #address-cells property of the bus node on which the child is
> >     located.
> >
> > 2.4.4 Interrupt Mapping Example (for PCI) says the bus node is the PCI
> > bridge, with #address-cells = <3>.
>
> PCI is more inline with the spec wording, but systems evolved where
> the interrupt hierarchy doesn't match the bus hierarchy.

OK.

> > But in the RZ/A1 case the child unit address is irrelevant, as its an
> > external interrupt input not related to a specific bus.  It could be
> > used by a device without unit address (e.g. gpio-keys), or some device
> > on an external local bus (root #adress-cells is <1> on 32-bit without
> > LPAE, but this block could be reused in a future LPAE or arm64 SoCs),
> > or on e.g. an SPI or i2c bus, with its own #adress-cells value
> > (coincidentally <1>, too).
> >
> > I see of_irq_parse_raw() does use the address-cells of the parent
> > interrupt controller (which is usually 0) when iterating its way up,
> > following interrupt-map.
> >
> > So the child unit address does have two different meanings?
>
> Indeed. That's why you'll see interrupt-controller nodes with the odd
> '#address-cells = <0>;' in them. It's often omitted because it only
> matters if there's an interrupt-map. We should clarify the spec.

Yeah, I had noticed that, but didn't want to dive too deep into that
(at that time).  I always assumed it was some silly mistake, combined
with dtsi cargo cult copying.  Thanks, now I know better....

BTW, the GIC bindings don't help that much: #address-cells can be
0, 1, or 2, #size-cells can be 1 or 2. No explanation why...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
