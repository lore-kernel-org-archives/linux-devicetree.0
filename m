From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add generic bindings
Date: Fri, 7 Dec 2018 10:47:35 +0100
Message-ID: <CAMuHMdXHtUPKEFrWMrtDSZ1_n7c73L-g7t+OPnN7ctq9Cm8Nvw@mail.gmail.com>
References: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
 <CAMuHMdX9xZgAiBeXCXxLRSJYMefsFwhH3NGC7=EYteFd6kODMQ@mail.gmail.com> <20181207093356.GG8952@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207093356.GG8952@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Fri, Dec 7, 2018 at 10:34 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 06/12/2018 11:36:59+0100, Geert Uytterhoeven wrote:
> > > +The following properties may not be supported by all drivers. However, if a
> > > +driver wants to support one of the below features, it should adapt the bindings
> > > +below.
> > > +- trickle-resistor-ohms : Selected resistor for trickle charger. Should be given
> >
> > Can this resistor be less than 1 ohm?
> > trickle-resistor-milli-ohms?
>
> Well, this is what current drivers already use so we are stuck with that
> for now.
>
> The value should be a few kOhm anyway. I think the lowest I know about
> is 250 Ohm.

OK, good to know. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
