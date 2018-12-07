From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add generic bindings
Date: Fri, 7 Dec 2018 10:33:56 +0100
Message-ID: <20181207093356.GG8952@piout.net>
References: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
 <CAMuHMdX9xZgAiBeXCXxLRSJYMefsFwhH3NGC7=EYteFd6kODMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9xZgAiBeXCXxLRSJYMefsFwhH3NGC7=EYteFd6kODMQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/12/2018 11:36:59+0100, Geert Uytterhoeven wrote:
> > +The following properties may not be supported by all drivers. However, if a
> > +driver wants to support one of the below features, it should adapt the bindings
> > +below.
> > +- trickle-resistor-ohms : Selected resistor for trickle charger. Should be given
> 
> Can this resistor be less than 1 ohm?
> trickle-resistor-milli-ohms?
> 

Well, this is what current drivers already use so we are stuck with that
for now.

The value should be a few kOhm anyway. I think the lowest I know about
is 250 Ohm.

> > +                          if trickle charger should be enabled
> > +- trickle-diode-disable : Do not use internal trickle charger diode Should be
> > +                          given if internal trickle charger diode should be
> > +                          disabled
> > +- wakeup-source :         Enables wake up of host system on alarm
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
