From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Date: Tue, 30 Apr 2019 17:24:28 +0200
Message-ID: <CAMuHMdW9h8u81NkvSH8jSoCK5g=dFzSGJzmknmc9x-dNkqOycg@mail.gmail.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-2-geert+renesas@glider.be> <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Apr 30, 2019 at 5:03 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Add "renesas,gic-spi-base",
> >   - Document RZ/A2M.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> > @@ -0,0 +1,30 @@
> > +DT bindings for the Renesas RZ/A1 Interrupt Controller
> > +
> > +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> > +RZ/A1 and RZ/A2 SoCs:
> > +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> > +    interrupts,
> > +  - NMI edge select.
> > +
> > +Required properties:
> > +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> > +               fallback.
> > +               Examples with soctypes are:
> > +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> > +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> > +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> > +                                in interrupts.txt in this directory)
> > +  - interrupt-controller: Marks the device as an interrupt controller
> > +  - reg: Base address and length of the memory resource used by the interrupt
> > +         controller
> > +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
>
> Why isn't this just an 'interrupts' property? Plus, without

Because Marc told me this is what everyone uses...

> 'interrupts' walking the hierarchy is broken.

What is "interrupts walking"? Can you please elaborate?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
