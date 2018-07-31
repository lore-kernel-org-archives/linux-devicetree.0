Return-Path: <SRS0=WFOB=KP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180730131716.75484-1-chris.brandt@renesas.com> <20180730131716.75484-5-chris.brandt@renesas.com>
In-Reply-To: <20180730131716.75484-5-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jul 2018 12:26:26 +0200
Message-ID: <CAMuHMdWfftK00Qndu3sxGgRnKcrU29Z_oAUK2e+kC25mu8bA3g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] serial: sh-sci: Improve support for separate TEI
 and DRI interrupts
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Jul 30, 2018 at 3:17 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Some SCIF versions mux error and break interrupts together and then provide
> a separate interrupt ID for just TEI/DRI.
>
> Allow all 6 types of interrupts to be specified via platform data (or DT)
> and for any signals that are muxed together (have the same interrupt
> number) simply register one handler.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
> * Removed - 1 from loop
> * Added Reviewed-by

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -1845,31 +1858,8 @@ static int sci_request_irq(struct sci_port *port)
>
>                 desc = sci_irq_desc + i;
>                 port->irqstr[j] = NULL;

The above line can be removed again, too.

> -               if (SCIx_TEIDRI_IRQ_EXISTS(port)) {
> -                       /*
> -                        * ERI and BRI are muxed, just register ERI and
> -                        * ignore BRI.
> -                        * TEI and DRI are muxed, but only DRI
> -                        * is enabled, so use RXI handler
> -                        */
> -                       if (i == SCIx_ERI_IRQ)
> -                               port->irqstr[j] = kasprintf(GFP_KERNEL,
> -                                                           "%s:err + break",
> -                                                           dev_name(up->dev));
> -                       if (i == SCIx_BRI_IRQ)
> -                               continue;
> -                       if (i == SCIx_TEIDRI_IRQ) {
> -                               port->irqstr[j] = kasprintf(GFP_KERNEL,
> -                                                           "%s:tx end + rx ready",
> -                                                           dev_name(up->dev));
> -                               desc = sci_irq_desc + SCIx_RXI_IRQ;
> -                       }
> -               }
> -
> -               if (!port->irqstr[j])
> -                       port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
> -                                                   dev_name(up->dev),
> -                                                   desc->desc);
> +               port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
> +                                           dev_name(up->dev), desc->desc);
>                 if (!port->irqstr[j]) {
>                         ret = -ENOMEM;
>                         goto out_nomem;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
