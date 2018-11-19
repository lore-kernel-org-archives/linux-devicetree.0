Return-Path: <SRS0=snf9=N6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com> <20181118231807.GE2553@kunai>
In-Reply-To: <20181118231807.GE2553@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Nov 2018 09:43:00 +0100
Message-ID: <CAMuHMdXOonhf3kJM7kqA2Tx_Zsuq7D-jE71xgwJCJN_Nt2YEjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965 support
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Mon, Nov 19, 2018 at 12:18 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
>
> Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
> of course. But Simon, shall we fix that for all CANFD?

Unfortunately we cannot, due to backwards compatibility.
Hence we keep following existing compatible value conventions for existing
bindings, but follow the recommended way for new devices/bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
