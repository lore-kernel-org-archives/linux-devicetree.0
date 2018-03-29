Return-Path: <SRS0=WnMU=GT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1522265176-33226-5-git-send-email-biju.das@bp.renesas.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com> <1522265176-33226-5-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Mar 2018 11:11:55 +0200
Message-ID: <CAMuHMdU6Mv2AL5qRJ4RrkEWGrVpU-c5J7-uNAeLviDo0g+m8Xw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] clk: renesas: cpg-mssr: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Wed, Mar 28, 2018 at 9:26 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G1C (R8A77470) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> V1->V2:
> * incorporated geert's review comment

Thanks for the update, will queue in clk-renesas-for v4.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
