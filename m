Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com> <20180725143850.32985-2-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 13:31:27 +0200
Message-ID: <CAMuHMdXxS3T+L4jf1nCJcYQx_mAZ7_u++6RkJxX2cUScijDAkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] serial: sh-sci: Allow for compressed SCIF address space
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 4:39 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
> Use the register area size to determine the spacing between register.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -2869,6 +2869,10 @@ static int sci_init_single(struct platform_device *dev,
>                         port->regshift = 1;
>         }
>
> +       if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
> +               if (sci_port->reg_size >= 0x20)
> +                       port->regshift = 1;
> +

So you have to be careful not to round up the reg size in DT to the next
power of two (0x20), like you did for RZ/A1 (64 is used there).

Note that while no SH board file uses SCIx_SH4_SCIF_REGTYPE, it is the
default reg type for PORT_SCIF, so some board files may be affected.
However, they all set reg_size to 0x100, so this change should be OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
