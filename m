Return-Path: <SRS0=XPdD=V6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190801125750.GM1659@ninjato>
In-Reply-To: <20190801125750.GM1659@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Aug 2019 11:27:19 +0200
Message-ID: <CAMuHMdVBVFbcTDcXbBT18NfTnAxW-Gz6XnBgKO5REdHtw9zeaQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] dt-bindings: i2c: renesas: Rename bindings
 documentation files
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux I2C <linux-i2c@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Thu, Aug 1, 2019 at 3:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Jul 24, 2019 at 02:15:55PM +0200, Simon Horman wrote:
> > Rename the bindings documentation file for Renesas I2C controllers.
> >
> > This is part of an ongoing effort to name bindings documentation files for
> > Renesas IP blocks consistently, in line with the compat strings they
> > document.
> >
> > Based on v5.3-rc1
> >
> > Simon Horman (4):
> >   dt-bindings: i2c: sh_mobile: Rename bindings documentation file
> >   dt-bindings: i2c: rcar: Rename bindings documentation file
> >   dt-bindings: i2c: riic: Rename bindings documentation file
> >   dt-bindings: i2c: riic: Rename bindings documentation file
>
> Applied to for-next, thanks!

Without the wrong names fixed?
And with an R-b I didn't give, probably due to the two last patches having
the same oneline-summary?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
