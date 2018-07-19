Return-Path: <SRS0=8tzP=KD=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com>
 <20180711144131.73552-3-chris.brandt@renesas.com> <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
 <CAMuHMdWdOoEbwPOzOfEAHH0MXNr-Wf_-37i8Qj6WdphgyKLe7g@mail.gmail.com> <TY1PR01MB1562A582DB067740B7D012ED8A530@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562A582DB067740B7D012ED8A530@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jul 2018 10:13:06 +0200
Message-ID: <CAMuHMdVKcGhDwdp3=+JFLONThnBpp7yT9DProNmzNp0V7fN8pQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 19, 2018 at 12:19 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Tuesday, July 17, 2018, Geert Uytterhoeven wrote:
> > On Fri, Jul 13, 2018 at 5:50 PM Geert Uytterhoeven <geert@linux-m68k.org>
> > wrote:
> > > On Wed, Jul 11, 2018 at 4:42 PM Chris Brandt <chris.brandt@renesas.com>
> > wrote:
> > > > Add R7S9210 (RZ/A2) support
> > > >
> > > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Sorry, I spoke too soon.
> > It seems the bindings were never updated for the use of multiple
> > interrupts
> > on RZ/A1.  As RZ/A2 adds one new interrupt, can you please document which
> > interrupts are required?
> > Thanks!
>
> The issue that I ran into was the device driver assumed some signals
> were muxed together (TXI and DRI), and that other signals were individual.
>
> The existing driver wanted interrupts to be specified in this order:
>   1. Error
>   2. RX
>   3. TX (assumes DRI)
>   4. Break

Yes, that matches the RZ/A1 SCIFA and interrupt controller docs.

> However, for the SCIF that is present in the RZ/A2M, Error and Break are
> muxed together, and then DRI is not muxed with TX. This is different
> than any other SCIF supported by the driver.

Right, the RZ/A2 SCIFA variant is documented to provide 6 interrupt sources:
  1. TEI,
  2. TXI,
  3. RXI,
  4. DRI,
  5. ERI,
  6. BRI.

> My solution was to list the Error/Break twice, and then add a new
> interrupt for DRI.
>
> As reference, here is what the DT node would look like:
>
>         scif0: serial@e8007000 {
>                 compatible = "renesas,scif-r7s9210", "renesas,scif";
>                 reg = <0xe8007000 18>;
>                 interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>, /* ERI0/BRI0 */
>                              <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,   /* RXI0 */
>                              <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,   /* TXI0 */
>                              <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,   /* ERI0/BRI0 */
>                              <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;   /* TEI/DRI0 */
>                 clocks = <&mstp4_clks R7S9210_CLK_SCIF0>;
>                 clock-names = "fck";
>                 power-domains = <&cpg_clocks>;
>                 status = "disabled";
>         };
>
> Of course I have no problem documenting all this, but I first I just
> wanted to make sure I was not going to get push back when I submit a DT
> later that lists the same interrupt twice.

Listing them twice does make sense to me, as the interrupt controller
source list in the RZ/A2 docs has only four, and explicitly lists how they are
multiplexed:
  base + 0 = ERI/BRI,
  base + 1 = RXI,
  base + 2 = TXI,
  base + 3 = TEI/DRI.
But future SoCS with the same SCIFA variant may wire them differently?

For DT backwards compatibility, we have to keep support for the following
2 schemes:
  1. Single "interrupts" value, no "interrupt-names", for fully multiplexed
     interrupts (SH/R-Mobile, R-Car).
  2. Four "interrupts" values, no "interrupt-names", for ERI/RXI/TXI/TEI
     (RZ/A1, H8/300).

For RZ/A2, I suggest extending the bindings with interrupt-names,
documenting all 6 interrupt sources, and let the driver handle that.
That means there should be 6, not 5, "interrupts" values.
Whether the driver implements all possible combinations, or only what you
need for RZ/A2, is up to you. I agree the interrupt handling in the driver
is already sufficiently complex.
Ideally, you would document support for RZ/A1 with interrupt-names too,
and handle that as well.

Does this make sense?
Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
