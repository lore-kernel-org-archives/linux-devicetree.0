Return-Path: <SRS0=WogO=XE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1567666326-27373-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567666326-27373-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2019 14:55:15 +0200
Message-ID: <CAMuHMdUeMZ5MOfgS7k+PTV8GO1u_gBWTffEuZA96djX=sF0EBw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add r8a774b1 SYSC power domain definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 5, 2019 at 8:58 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds power domain indices for RZ/G2N(a.k.a r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5, on a branch to be shared by the
SYSC driver and DTS user.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
