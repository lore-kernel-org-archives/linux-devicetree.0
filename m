Return-Path: <SRS0=7tr2=KE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com>
 <20180711144131.73552-3-chris.brandt@renesas.com> <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
 <CAMuHMdWdOoEbwPOzOfEAHH0MXNr-Wf_-37i8Qj6WdphgyKLe7g@mail.gmail.com>
 <TY1PR01MB1562A582DB067740B7D012ED8A530@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVKcGhDwdp3=+JFLONThnBpp7yT9DProNmzNp0V7fN8pQ@mail.gmail.com> <TY1PR01MB156281CF1C2EF61F9823BBA58A520@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB156281CF1C2EF61F9823BBA58A520@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 10:16:51 +0200
Message-ID: <CAMuHMdWwZsQ2sovgYpeCsHBs=KYTm0AO3tOf4VKeZCXz+OXQAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 19, 2018 at 2:59 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 19, 2018, Geert Uytterhoeven wrote:
> > > The issue that I ran into was the device driver assumed some signals
> > > were muxed together (TXI and DRI), and that other signals were
> > individual.
> > >
> > > The existing driver wanted interrupts to be specified in this order:
> > >   1. Error
> > >   2. RX
> > >   3. TX (assumes DRI)
> > >   4. Break
>
> First, sorry for my mis-type.
> DRI mean 'Data Ready Interrupt' and for SCIF it is normally muxed with RX (not TX).

OK.

> > > Of course I have no problem documenting all this, but I first I just
> > > wanted to make sure I was not going to get push back when I submit a DT
> > > later that lists the same interrupt twice.
> >
> > Listing them twice does make sense to me, as the interrupt controller
> > source list in the RZ/A2 docs has only four, and explicitly lists how they
> > are
> > multiplexed:
> >   base + 0 = ERI/BRI,
> >   base + 1 = RXI,
> >   base + 2 = TXI,
> >   base + 3 = TEI/DRI.
> > But future SoCS with the same SCIFA variant may wire them differently?
>
> This SCIF seems to be related to ones used in H8S devices. It's also been
> used in RX and RZ/T devices. So I think the order seems to be stable.
>
>
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
> >
> > Does this make sense?
>
> What about this idea:
> Since we can't break any old DTs, what if we just say that you simply
> list all the interrupts in DT, and the driver just registers all those
> vectors with the same ISR function (sci_mpxed_interrupt) and process
> everything the same way R-Car devices do with their single interrupt.
>
> For this class of device, having separate interrupt vectors probably
> doesn't buy you that much extra performance.
>
> The driver could also check to see if "interrupt-names" was specified,
> and if it was, the driver could simply use those names when registering
> the interrupts so everything shows up nicely in /proc/interrupts.
>
> What's your thoughts on that idea?

I don't know if using the same handler for all separate interrupts won't cause
problems. What if two interrupts fire, the first one calls the common handler,
handles both, and the second one returns IRQ_NONE? Spurious interrupts
detected by the core interrupt, leading to "Disabling IRQ #n" once it has seen
too many of them?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
