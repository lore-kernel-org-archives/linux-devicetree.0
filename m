Return-Path: <SRS0=1FZl=MJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180927141324.103146-1-chris.brandt@renesas.com>
In-Reply-To: <20180927141324.103146-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Sep 2018 16:18:21 +0200
Message-ID: <CAMuHMdX9nPYVmmE7NsYm9ERcQQ7n1PUkn6Kh-q9J8ZrDS05RuA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: rspi: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Sep 27, 2018 at 4:15 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for RZ/A2
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/spi-rspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-rspi.txt
> @@ -11,6 +11,7 @@ Required properties:
>                      Examples with soctypes are:
>                         - "renesas,rspi-sh7757" (SH)
>                         - "renesas,rspi-r7s72100" (RZ/A1H)
> +                       - "renesas,rspi-r7s9210" (RZ/A2)

Looks good, but you forgot to update the paragraph above (outside the
quoted context).

>                         - "renesas,qspi-r8a7743" (RZ/G1M)
>                         - "renesas,qspi-r8a7745" (RZ/G1E)
>                         - "renesas,qspi-r8a7790" (R-Car H2)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
