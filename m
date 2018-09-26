Return-Path: <SRS0=Rhmc=MI=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537895896-25734-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537895896-25734-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 13:32:38 +0200
Message-ID: <CAMuHMdXV-ntTbT_+PsC8ji2JDiWJSkMHCLRBDVA2ZxaAtF7V+w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7744 CMT support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 25, 2018 at 7:25 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document SoC specific compatible strings for r8a7744. No driver change
> is needed as the fallback strings will activate the right code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
