Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537544044-57906-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537544044-57906-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 11:20:41 +0200
Message-ID: <CAMuHMdVycu34uMmAmahoyJxeCipJzRx_vhUyGBUPhxvcKAB5PQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add r8a7744 (RZ/G1N) support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 5:41 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Renesas RZ/G1N (R8A7744) SoC GPIO blocks are identical to the R-Car Gen2
> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
