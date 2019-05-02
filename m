From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Date: Thu, 2 May 2019 12:01:27 +0200
Message-ID: <CAMuHMdVWG4LDAAht-6Rendt8L96vW+VEJK4tGnOCMJ38pRDybA@mail.gmail.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
 <29e95406-b9fb-fbb6-9240-c3914d885e88@arm.com> <CAL_Jsq+FJDdka9BMcXvGveBHiUf=YUU=3gz3e2wxjtXZ+K+NEA@mail.gmail.com>
 <CAMuHMdWgrcfABOVZti+BYn6ujcYjUHNL7oeyJLgaxB8uPp5hwg@mail.gmail.com> <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKq0KP9H4DumyxJTjD=7rqwgOM=+5jHhkUxQqamrA3h7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, May 1, 2019 at 9:38 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, May 1, 2019 at 2:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Apr 30, 2019 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > On Tue, Apr 30, 2019 at 10:34 AM Marc Zyngier <marc.zyngier@arm.com> wrote:
> > > > On 30/04/2019 16:02, Rob Herring wrote:
> > > > > On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> > > > > <geert+renesas@glider.be> wrote:
> > > > >>
> > > > >> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> > > > >>
> > > > >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >> ---
> > > > >> v2:
> > > > >>   - Add "renesas,gic-spi-base",
> > > > >>   - Document RZ/A2M.
> > > > >> ---
> > > > >>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
> > > > >>  1 file changed, 30 insertions(+)
> > > > >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > >>
> > > > >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > >> new file mode 100644
> > > > >> index 0000000000000000..ea8ddb6955338ccd
> > > > >> --- /dev/null
> > > > >> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > > > >> @@ -0,0 +1,30 @@
> > > > >> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > > > >> +
> > > > >> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > > > >> +RZ/A1 and RZ/A2 SoCs:
> > > > >> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > > > >> +    interrupts,
> > > > >> +  - NMI edge select.
> > > > >> +
> > > > >> +Required properties:
> > > > >> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > > > >> +               fallback.
> > > > >> +               Examples with soctypes are:
> > > > >> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > > > >> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > > > >> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > > > >> +                                in interrupts.txt in this directory)
> > > > >> +  - interrupt-controller: Marks the device as an interrupt controller
> > > > >> +  - reg: Base address and length of the memory resource used by the interrupt
> > > > >> +         controller
> > > > >> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
> > > > >
> > > > > Why isn't this just an 'interrupts' property?
> > > >
> > > > That's likely because of kernel limitations. The DT code does an
> > > > of_populate() on any device that it finds, parse the "interrupts"
> > > > propertiy, resulting in the irq_descs being populated.
> > > >
> > > > That creates havoc, as these interrupts are not for this device, but for
> > > > something that is connected to it. This is merely a bridge of some sort.
> > >
> > > 'interrupt-map' would avoid that problem I think.
> >
> > "interrupt-map" seems to be meant for translation on a bus?
> > What to do with the child and parent unit addresses fields?
> > The parent unit address size depends on the #address-cells of the parent
> > interrupt-controller (i.e. GIC, so it's zero).
> > But the child unit address size depends on the #address-cells of the bus node
> > on which the child is located, so that's a (non-zero) bus #address-cells
> > (from the root node), not an interrupt-controller #address-cells.
>
> The #address-cells is always retrieved from the interrupt-parent node
> (or its parent). The interrupt-parent can implicitly be the child's
> parent, but that is rarely used in modern systems.

That's not what Devicetree Specification, Release v0.2 says:

    child unit address The unit address of the child node being mapped.
    The number of 32-bit cells required to specify this is described by
    the #address-cells property of the bus node on which the child is
    located.

2.4.4 Interrupt Mapping Example (for PCI) says the bus node is the PCI
bridge, with #address-cells = <3>.

But in the RZ/A1 case the child unit address is irrelevant, as its an
external interrupt input not related to a specific bus.  It could be
used by a device without unit address (e.g. gpio-keys), or some device
on an external local bus (root #adress-cells is <1> on 32-bit without
LPAE, but this block could be reused in a future LPAE or arm64 SoCs),
or on e.g. an SPI or i2c bus, with its own #adress-cells value
(coincidentally <1>, too).

I see of_irq_parse_raw() does use the address-cells of the parent
interrupt controller (which is usually 0) when iterating its way up,
following interrupt-map.

So the child unit address does have two different meanings?

> > Each line in an interrupt-map also contains a child interrupt specifier.
> > As the RZ/A1 IRQC supports 8 interrupt inputs with 4 sense types,
> > that would mean 32 lines? Or should I just ignore the senses here,
> > and specify 0?
>
> You can ignore parts of the child cells with interrupt-map-mask, so
> you should just need 8 entries.

Right, thanks.



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
