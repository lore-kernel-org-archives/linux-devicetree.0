Return-Path: <SRS0=CNAl=KS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com> <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Aug 2018 10:14:15 +0200
Message-ID: <CAMuHMdVbkeuJ=_wwPGP6NEctFPKcF9zqjBShq=VxhHxzTq8DRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 2, 2018 at 4:17 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Update the DT bindings documentation with the optional gpio-reserved-ranges
> properties.
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
