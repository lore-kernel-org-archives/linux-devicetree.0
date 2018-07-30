Return-Path: <SRS0=hJ7p=KO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180727210916.66642-1-chris.brandt@renesas.com>
 <20180727210916.66642-3-chris.brandt@renesas.com> <CAMuHMdXgeo1rHmXEifXHFQbt=EL=iizeVLWjoMi_=tXPwNj3xw@mail.gmail.com>
In-Reply-To: <CAMuHMdXgeo1rHmXEifXHFQbt=EL=iizeVLWjoMi_=tXPwNj3xw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 10:05:29 +0200
Message-ID: <CAMuHMdXPecFC=gA2oJpq0sf0+NbBSkDOs0ncGOx9sJXOyonY2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] serial: sh-sci: Allow for compressed SCIF address
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Rob Landley <rob@landley.net>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Sun, Jul 29, 2018 at 1:11 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jul 27, 2018 at 11:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
> > Use the register area size to determine the spacing between register.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> >  drivers/tty/serial/sh-sci.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 6ff6f2bf3b9b..138296ec9a7d 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -348,15 +348,15 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
> >         [SCIx_SH4_SCIF_REGTYPE] = {
> >                 .regs = {
> >                         [SCSMR]         = { 0x00, 16 },
> > -                       [SCBRR]         = { 0x04,  8 },
> > -                       [SCSCR]         = { 0x08, 16 },
> > -                       [SCxTDR]        = { 0x0c,  8 },
> > -                       [SCxSR]         = { 0x10, 16 },
> > -                       [SCxRDR]        = { 0x14,  8 },
> > -                       [SCFCR]         = { 0x18, 16 },
> > -                       [SCFDR]         = { 0x1c, 16 },
> > -                       [SCSPTR]        = { 0x20, 16 },
> > -                       [SCLSR]         = { 0x24, 16 },
> > +                       [SCBRR]         = { 0x02,  8 },
> > +                       [SCSCR]         = { 0x04, 16 },
> > +                       [SCxTDR]        = { 0x06,  8 },
> > +                       [SCxSR]         = { 0x08, 16 },
> > +                       [SCxRDR]        = { 0x0a,  8 },
> > +                       [SCFCR]         = { 0x0c, 16 },
> > +                       [SCFDR]         = { 0x0e, 16 },
> > +                       [SCSPTR]        = { 0x10, 16 },
> > +                       [SCLSR]         = { 0x12, 16 },
> >                 },
> >                 .fifosize = 16,
> >                 .overrun_reg = SCLSR,
> > @@ -2939,6 +2939,10 @@ static int sci_init_single(struct platform_device *dev,
> >                         port->regshift = 1;
> >         }
> >
> > +       if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
> > +               if (sci_port->reg_size >= 0x20)
> > +                       port->regshift = 1;
>
> I've accidentally discovered this breaks SCIF on SH7751R2D (QEMU), as the
> board code doesn't fill in regtype, so it is 0 = SCIx_PROBE_REGTYPE.
> The proper (default) regtype of SCIx_SH4_SCIF_REGTYPE is derived by
> sci_probe_regmap(). However, that value is never fed back to sci_init_single(),
> as plat_sci_port is const. So regshift ends up being wrong.
>
> I made it work by changing the check to:
>
> -       if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
> +       if (p->regtype == SCIx_SH4_SCIF_REGTYPE ||
> +           (p->regtype == SCIx_PROBE_REGTYPE && port->type == PORT_SCIF))
>
> Perhaps there's a better way?

Like (whitespace-damaged-gmail):

--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3340,7 +3340,7 @@ static int sci_init_single(struct platform_device *dev,
 {
        struct uart_port *port = &sci_port->port;
        const struct resource *res;
-       unsigned int i;
+       unsigned int i, regtype;
        int ret;

        sci_port->cfg   = p;
@@ -3381,6 +3381,7 @@ static int sci_init_single(struct platform_device *dev,
        if (unlikely(sci_port->params == NULL))
                return -EINVAL;

+       regtype = sci_port->params - sci_port_params;
        switch (p->type) {
        case PORT_SCIFB:
                sci_port->rx_trigger = 48;
@@ -3435,7 +3436,7 @@ static int sci_init_single(struct platform_device *dev,
                        port->regshift = 1;
        }

-       if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
+       if (regtype == SCIx_SH4_SCIF_REGTYPE)
                if (sci_port->reg_size >= 0x20)
                        port->regshift = 1;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
