Return-Path: <SRS0=3X8U=KJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com>
 <20180711144131.73552-3-chris.brandt@renesas.com> <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
 <CAMuHMdWdOoEbwPOzOfEAHH0MXNr-Wf_-37i8Qj6WdphgyKLe7g@mail.gmail.com>
 <TY1PR01MB1562A582DB067740B7D012ED8A530@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVKcGhDwdp3=+JFLONThnBpp7yT9DProNmzNp0V7fN8pQ@mail.gmail.com>
 <TY1PR01MB1562380998FE5D1AA4B8E5128A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWzyoqBsUDe8TqVCYq6kSmDCa6W0X-KPm0O5ewTysWSEA@mail.gmail.com> <TYXPR01MB1568D38DAAF110EAB44417228A540@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568D38DAAF110EAB44417228A540@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jul 2018 14:34:46 +0200
Message-ID: <CAMuHMdW45_pDZeon=DorEbqoP+_BttQ41-33cmNP-w15K=MMJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 2:05 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, July 25, 2018, Geert Uytterhoeven wrote:
> > > However, if "interrupt-names" is specified in DT, then the driver
> > > determines what the interrupt are based on their names, not the order in
> > which
> > > they are listed.
> > >
> > > Correct?
> >
> > Correct.
>
> One final note on this before I submit v2 of the patch.
>
> I just coded up something that works and is more simple and I don't even
> need "interrupt-names".
>
> Basically by using your suggestion from the code review made everything
> work.
>
> On Friday, July 20, 2018, Geert Uytterhoeven wrote:
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -65,6 +65,7 @@ enum {
> > >         SCIx_RXI_IRQ,
> > >         SCIx_TXI_IRQ,
> > >         SCIx_BRI_IRQ,
> > > +       SCIx_TEIDRI_IRQ,
> >
> > Why not separate enum values for TEI and DRI? According to the RZ/A2 docs,
> > there are 6 separate interrupts, but they are multiplexed at the interrupt
> > controller level.
>
>
> enum {
>         SCIx_ERI_IRQ,
>         SCIx_RXI_IRQ,
>         SCIx_TXI_IRQ,
>         SCIx_BRI_IRQ,
> +       SCIx_DRI_IRQ,
> +       SCIx_TEI_IRQ,
>         SCIx_NR_IRQS,
>
>         SCIx_MUX_IRQ = SCIx_NR_IRQS,    /* special case */
> };
>
> Listing the same interrupt ID number twice in the DT (because it is
> muxed) is fine because the driver will check for that.
>
> This seems to satisfy all the SCI/SCIF variants in all the SH and ARM
> SoCs in the kernel today (DT and non-DT).
>
> So as long as I describe the interrupt order in the DT Documentation,
> all seems good.

Yes, that should work too.

"interrupt-names" is handy for DTS writers, so they don't have to look up the
order in the bindings, and it's less likely they make mistakes in the
order of the
interrupts.

However, as soon as there will be an SoC where you will need a "hole"
in the list,
you're gonna need interrupt-names anyway.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
