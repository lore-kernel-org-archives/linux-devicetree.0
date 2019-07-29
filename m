Return-Path: <SRS0=MEFD=V2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190724121559.19079-3-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2019 13:42:57 +0200
Message-ID: <CAMuHMdUYTo1_zz4sCv5=PRL90EyFSU_b5WgUJoc4Oii08F_tww@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: rcar: Rename bindings documentation file
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux I2C <linux-i2c@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 24, 2019 at 3:25 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Rename the bindings documentation file for R-Car I2C controller
> from i2c-rcar.txt to renesas,rcar.txt.

renesas,i2c.txt

> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
