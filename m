Return-Path: <SRS0=7tr2=KE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com> <20180711144131.73552-2-chris.brandt@renesas.com>
In-Reply-To: <20180711144131.73552-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 10:09:39 +0200
Message-ID: <CAMuHMdXpLvz3zD3=ji-ro0R6C-OUyBv6bgY2a3Hp85wYYAav5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: sh-sci: Add support for R7S9210
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 11, 2018 at 4:42 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for a "RZ_SCIFA" which is different than a traditional
> SCIFA. It looks like a normal SCIF with FIFO data, but with a
> compressed address space. Also, the break out of interrupts
> are different then traditinal SCIF: ERI/BRI, RXI, TXI, TEI, DRI.
> The R7S9210 (RZ/A2) contains this type of SCIF.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -65,6 +65,7 @@ enum {
>         SCIx_RXI_IRQ,
>         SCIx_TXI_IRQ,
>         SCIx_BRI_IRQ,
> +       SCIx_TEIDRI_IRQ,

Why not separate enum values for TEI and DRI? According to the RZ/A2 docs,
there are 6 separate interrupts, but they are multiplexed at the interrupt
controller level.

>         SCIx_NR_IRQS,

If you add interrupt value heres, you have to update the comment in
sci_init_single(), which talks about "three or four" interrupts.

sci_init_single() also fills in all unused sci_port->irqs[], so that code
must be updated for the new interrupts.

>
>         SCIx_MUX_IRQ = SCIx_NR_IRQS,    /* special case */
> @@ -76,6 +77,9 @@ enum {
>         ((port)->irqs[SCIx_ERI_IRQ] &&  \
>          ((port)->irqs[SCIx_RXI_IRQ] < 0))
>
> +#define SCIx_TEIDRI_IRQ_EXISTS(port)           \
> +       ((port)->irqs[SCIx_TEIDRI_IRQ] > 0)
> +
>  enum SCI_CLKS {
>         SCI_FCK,                /* Functional Clock */
>         SCI_SCK,                /* Optional External Clock */
> @@ -287,6 +291,33 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>                 .error_clear = SCIF_ERROR_CLEAR,
>         },
>
> +       /*
> +        * The "SCIFA" that is in RZ/T and RZ/A2.
> +        * It looks like a normal SCIF with FIFO data, but with a
> +        * compressed address space. Also, the break out of interrupts
> +        * are different: ERI/BRI, RXI, TXI, TEI, DRI.
> +        */
> +       [SCIx_RZ_SCIFA_REGTYPE] = {
> +               .regs = {
> +                       [SCSMR]         = { 0x00, 16 },
> +                       [SCBRR]         = { 0x02,  8 },
> +                       [SCSCR]         = { 0x04, 16 },
> +                       [SCxTDR]        = { 0x06,  8 },
> +                       [SCxSR]         = { 0x08, 16 },
> +                       [SCxRDR]        = { 0x0A,  8 },
> +                       [SCFCR]         = { 0x0C, 16 },
> +                       [SCFDR]         = { 0x0E, 16 },
> +                       [SCSPTR]        = { 0x10, 16 },
> +                       [SCLSR]         = { 0x12, 16 },
> +               },
> +               .fifosize = 16,
> +               .overrun_reg = SCLSR,
> +               .overrun_mask = SCLSR_ORER,
> +               .sampling_rate_mask = SCI_SR(32),
> +               .error_mask = SCIF_DEFAULT_ERROR_MASK,
> +               .error_clear = SCIF_ERROR_CLEAR,
> +       },


"Compressed addres space", like SCIx_SH4_SCIF_REGTYPE with regshift -1? ;-)
Perhaps we should adjust all offsets in SCIx_SH4_SCIF_REGTYPE and let the
current parts use regshift 1, so RZ/A2 can use the same definition with
regshift 0?

For DT systems, the regshift value could be stored in of_device_id.data
by adjusting the SCI_OF_DATA() macro.
For legacy SH, probably lots of platform data must be updated.

> +
>         /*
>          * Common SH-3 SCIF definitions.
>          */
> @@ -1683,11 +1714,26 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t sci_br_interrupt(int irq, void *ptr);
> +

For interrupts, please see my response to the DT binding patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
