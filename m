Return-Path: <SRS0=hJ7p=KO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180727210916.66642-1-chris.brandt@renesas.com> <20180727210916.66642-5-chris.brandt@renesas.com>
In-Reply-To: <20180727210916.66642-5-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 11:08:58 +0200
Message-ID: <CAMuHMdVSF-qncCA4sMd8c0d28QaanvPTPqJZ1gtvAja_cf-dVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] serial: sh-sci: Improve support for separate TEI and
 DRI interrupts
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Fri, Jul 27, 2018 at 11:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Some SCIF versions mux error and break interrupts together and then provide
> a separate interrupt ID for just TEI/DRI.
>
> Allow all 6 types of interrupts to be specified via platform data (or DT)
> and for any signals that are muxed together (have the same interrupt
> number) simply register one handler.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -2842,17 +2832,17 @@ static int sci_init_single(struct platform_device *dev,
>
>         /* The SCI generates several interrupts. They can be muxed together or
>          * connected to different interrupt lines. In the muxed case only one
> -        * interrupt resource is specified. In the non-muxed case three or four
> -        * interrupt resources are specified, as the BRI interrupt is optional.
> +        * interrupt resource is specified as there is only one interrupt ID.
> +        * In the non-muxed case, up to 6 interrupt signals might be generated
> +        * from the SCI, however those signals might have their own individual
> +        * interrupt ID numbers, or muxed together with another interrupt.
>          */
>         if (sci_port->irqs[0] < 0)
>                 return -ENXIO;
>
> -       if (sci_port->irqs[1] < 0) {
> -               sci_port->irqs[1] = sci_port->irqs[0];
> -               sci_port->irqs[2] = sci_port->irqs[0];
> -               sci_port->irqs[3] = sci_port->irqs[0];
> -       }
> +       if (sci_port->irqs[1] < 0)
> +               for (i = 1; i < ARRAY_SIZE(sci_port->irqs) - 1; i++)

Shouldn't the "- 1" be dropped?

> +                       sci_port->irqs[i] = sci_port->irqs[0];
>
>         sci_port->params = sci_probe_regmap(p);
>         if (unlikely(sci_port->params == NULL))

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
