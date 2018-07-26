Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <20180725143850.32985-2-chris.brandt@renesas.com> <CAMuHMdXxS3T+L4jf1nCJcYQx_mAZ7_u++6RkJxX2cUScijDAkw@mail.gmail.com>
 <TYXPR01MB156868D7BA9D4048D8E255CE8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB156868D7BA9D4048D8E255CE8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:41:17 +0200
Message-ID: <CAMuHMdW=K6doLGP2w8pUxaHpKaZ9wKC4PPX1xr96WYXrxkH7pQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] serial: sh-sci: Allow for compressed SCIF address space
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 26, 2018 at 2:14 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 26, 2018, Geert Uytterhoeven wrote:
> > On Wed, Jul 25, 2018 at 4:39 PM Chris Brandt <chris.brandt@renesas.com>
> > wrote:
> > > Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
> > > Use the register area size to determine the spacing between register.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thank you.
>
> > > +       if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
> > > +               if (sci_port->reg_size >= 0x20)
> > > +                       port->regshift = 1;
> > > +
> >
> > So you have to be careful not to round up the reg size in DT to the next
> > power of two (0x20), like you did for RZ/A1 (64 is used there).
>
> Me????
> It was Wolfram that committed the RZ/A1 DT scif code back in 2014 ;)

I stand corrected.

(and RZLSP didn't use resources yet, but the old mapbase, so there are no
 sizes ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
