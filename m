Return-Path: <SRS0=0pQc=N3=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181115140045.24733-1-chris.brandt@renesas.com>
 <20181115140045.24733-2-chris.brandt@renesas.com> <20181115162817.GB28299@w540>
 <OSAPR01MB1553B1748C9DFC365DCF7C568ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB1553B1748C9DFC365DCF7C568ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 10:05:52 +0100
Message-ID: <CAMuHMdUnnZ=JeoYCo0_VepuZPtpqsh56OW97AJdGpsNxtT+ovQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Nov 15, 2018 at 5:50 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, November 15, 2018 1, jacopo mondi wrote:
> > > v5:
> > >  * Specify number of ports using of_device_id.data and save as priv-
> > >npins
> > >  * Use priv->npins everywhere instead of hard coded RZA2_NPINS
> > >  * Check gpio-ranges to make sure args matches SOC
> >
> > Sorry about this, I didn't want to ask you to do this now, it might
> > have had post-poned to when a new SoC will have to be supported, but..
>
> As long as I can get this driver in for 4.21, I'll still be happy

;-)

> > > +static const struct of_device_id rza2_pinctrl_of_match[] = {
> > > +   { .compatible = "renesas,r7s9210-pinctrl", .data = (void *)22, },
> >
> > ... I really don't like this, I'm sorry.
> >
> > I would rather make a 'struct rza_pinctrl_info' or similar which
> > contains all the fields you now hardcode (number of ports, pins per
> > port etc) and which is easily extensible in case you need to do so.
>
> I was going by if there is only 1 value being set, just pass in a number
> (don't make a struct). That is what is being done for the R-Car/RZA
> SDHI driver (renesas_sdhi_internal_dmac.c), and what I was also asked to do
> for the RZ/A watchdog timer (rza_wdt.c).

That's indeed what we do, typically.

> At the moment, the number of ports in the SOC is the only variable that
> would be different between SoCs. For example, "pins per port" will
> always be 8 (it's part of the HW design of this pin controller, it can never
> change).
>
> We can have Geert give his opinion on the topic since it was his
> suggestion to begin with.
>
>
> > I'm sorry this is more work, and again, it might be post-poned imo,
> > provided you drop this change you have introduced here.
>
> Since Geert is the maintainer of the Renesas pinctrl drivers, I'll let
> him decide if I should drop that part for now since only 1 SOC exists
> today.

I don't have a real preference.

Two cautions, though:
  1. You do have to remember to increase port_names[], when needed,
  2. Trying to predict the future may fail, and more driver updates may be
     needed when a new variant of this pin controller will be conceived.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
