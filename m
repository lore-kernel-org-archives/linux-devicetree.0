Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com> <20180725143850.32985-3-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 13:39:08 +0200
Message-ID: <CAMuHMdXxyAuhW-+Vh_TE7M+uFT6HYngg2BAg8inVJB6qhOuXmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] serial: sh-sci: Add support for separate TEI+DRI interrupts
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 4:39 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Some SCIF versions mux error and break interrupts together and then provide
> a separate interrupt ID for just TEI/DRI.
>
> Allow all 6 types of interrupts to be specified via platform data (or DT)
> and for any signals that are muxed together (have the same interrupt
> number) simply register one handler.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Move compressed SCIF reg address space to a separate commit
>  * Handle all 6 possible interrupt types

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -1683,11 +1685,26 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t sci_br_interrupt(int irq, void *ptr);

You can avoid the forward declaration by moving the whole function here.

> +
>  static irqreturn_t sci_er_interrupt(int irq, void *ptr)
>  {
>         struct uart_port *port = ptr;
>         struct sci_port *s = to_sci_port(port);
>
> +       if (s->irqs[SCIx_ERI_IRQ] == s->irqs[SCIx_BRI_IRQ]) {
> +               /* Break and Error interrupts are muxed */
> +               unsigned short ssr_status = serial_port_in(port, SCxSR);
> +
> +               /* Break Interrupt */
> +               if (ssr_status & SCxSR_BRK(port))
> +                       sci_br_interrupt(irq, ptr);
> +
> +               /* Break only? */
> +               if (!(ssr_status & SCxSR_ERRORS(port)))
> +                       return IRQ_HANDLED;
> +       }
> +
>         /* Handle errors */
>         if (port->type == PORT_SCI) {
>                 if (sci_handle_errors(port)) {

> @@ -2809,6 +2845,8 @@ static int sci_init_single(struct platform_device *dev,
>                 sci_port->irqs[1] = sci_port->irqs[0];
>                 sci_port->irqs[2] = sci_port->irqs[0];
>                 sci_port->irqs[3] = sci_port->irqs[0];
> +               sci_port->irqs[4] = sci_port->irqs[0];
> +               sci_port->irqs[5] = sci_port->irqs[0];

You may want to start using a loop from 1 to ARRAY_SIZE(sci_port->irqs) - 1
instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
