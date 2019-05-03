Return-Path: <SRS0=4akJ=TD=gmail.com=jonas.gorski@kernel.org>
MIME-Version: 1.0
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com> <27a90951-9525-c9b2-2c61-1a5db345cd70@gmail.com>
In-Reply-To: <27a90951-9525-c9b2-2c61-1a5db345cd70@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 3 May 2019 11:47:55 +0200
Message-ID: <CAOiHx=mbvqN16NG-gEOjVcSm6rV0P7iZd4XfzPHNS+Ns03+V_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
Content-Type: text/plain; charset="UTF-8"
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, 3 May 2019 at 03:44, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/2/2019 5:26 AM, Jonas Gorski wrote:
> > Add binding documentation for the gated clock controller found on MIPS
> > based BCM63XX SoCs.
> >
> > Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

>
> > ---
> >  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> >
> > diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> > new file mode 100644
> > index 000000000000..3041657e2f96
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> > @@ -0,0 +1,22 @@
> > +Gated Clock Controller Bindings for MIPS based BCM63XX SoCs
> > +
> > +Required properties:
> > +- compatible: must be one of:
> > +      "brcm,bcm3368-clocks"
> > +      "brcm,bcm6328-clocks"
> > +      "brcm,bcm6358-clocks"
> > +      "brcm,bcm6362-clocks"
> > +      "brcm,bcm6368-clocks"
> > +      "brcm,bcm63268-clocks"
>
> We could always add 6348/6338 to that list later one.

That's the plan*. But currently neither one is supported by
BMIPS_GENERIC, which was my starting point. And making BCM63XX use the
driver is ... complicated, due to (important) consumers not being
platform drivers (the MPI/PCIe controller codes). And they can't be
just converted to platform drivers, as they should then be non-legacy
PCI controller drivers, so a full rewrite is needed.

So let's stick with BMIPS_GENERIC first, else we never get anything
done ;-). In the end BCM63XX should go away anyway, once BMIPS_GENERIC
has reached feature parity.


Regards
Jonas

* if it even makes sense, as these are quite old, and systems will
quite struggle running a modern kernel/OS.

Jonas
