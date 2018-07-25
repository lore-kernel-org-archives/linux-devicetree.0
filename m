Return-Path: <SRS0=3X8U=KJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com>
 <20180711144131.73552-3-chris.brandt@renesas.com> <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
 <CAMuHMdWdOoEbwPOzOfEAHH0MXNr-Wf_-37i8Qj6WdphgyKLe7g@mail.gmail.com>
 <TY1PR01MB1562A582DB067740B7D012ED8A530@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVKcGhDwdp3=+JFLONThnBpp7yT9DProNmzNp0V7fN8pQ@mail.gmail.com> <TY1PR01MB1562380998FE5D1AA4B8E5128A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562380998FE5D1AA4B8E5128A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jul 2018 09:06:10 +0200
Message-ID: <CAMuHMdWzyoqBsUDe8TqVCYq6kSmDCa6W0X-KPm0O5ewTysWSEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 3:38 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> I have one last clarification about your idea regarding documenting the
> interrupts separately for RZ/A2.
>
> On Thursday, July 19, 2018, Geert Uytterhoeven wrote:
> > For DT backwards compatibility, we have to keep support for the following
> > 2 schemes:
> >   1. Single "interrupts" value, no "interrupt-names", for fully
> > multiplexed
> >      interrupts (SH/R-Mobile, R-Car).
> >   2. Four "interrupts" values, no "interrupt-names", for ERI/RXI/TXI/TEI
> >      (RZ/A1, H8/300).
> >
> > For RZ/A2, I suggest extending the bindings with interrupt-names,
> > documenting all 6 interrupt sources, and let the driver handle that.
> > That means there should be 6, not 5, "interrupts" values.
> > Whether the driver implements all possible combinations, or only what you
> > need for RZ/A2, is up to you. I agree the interrupt handling in the driver
> > is already sufficiently complex.
> > Ideally, you would document support for RZ/A1 with interrupt-names too,
> > and handle that as well.
>
> So for backward compatibility, no existing DT or setup-xxx.c (SH) file
> should change and the driver needs to assume the order of interrupts.

You can change the setup-xxx.c (SH) files, if needed. There's no in-kernel
stable ABI.

> However, if "interrupt-names" is specified in DT, then the driver
> determines what the interrupt are based on their names, not the order in which
> they are listed.
>
> Correct?

Correct.

> So for example, RZ/A1 DT will stay the same and since "interrupt-names"
> was never used and the interrupt order will be assumed as
> ERI/RXI/TXI/BRI.
>
> RZ/A1 [ r7s72100.dtsi ]
> scif0: serial@e8007000 {
>         compatible = "renesas,scif-r7s72100", "renesas,scif";
>         reg = <0xe8007000 64>;
>         interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
>                      <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
>                      <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
>                      <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>         clocks = <&mstp4_clks R7S72100_CLK_SCIF0>;
>         clock-names = "fck";
>         power-domains = <&cpg_clocks>;
>         status = "disabled";
> };

Correct.

> However, for RZ/A2, "interrupt-names" will be used and then the driver
> will sort things out however it needs to (figuring out what signals
> are muxed together an such).
>
> RZ/A2 [ r7s9210.dtsi ]
> scif0: serial@e8007000 {
>         compatible = "renesas,scif-r7s9210", "renesas,scif";
>         reg = <0xe8007000 18>;
>         interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>, /* ERI/BRI */
>                      <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>, /* RXI */
>                      <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* TXI */
>                      <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>, /* ERI/BRI */
>                      <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>, /* TEI/DRI */
>                      <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* TEI/DRI */
>         interrupt-names = "eri", "rxi", "txi", "bri", "tei", "dri";
>
>         clocks = <&mstp4_clks R7S9210_CLK_SCIF0>;
>         clock-names = "fck";
>         power-domains = <&cpg_clocks>;
>         status = "disabled";
> };

Correct.

> Are we on the same page?

I think so.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
