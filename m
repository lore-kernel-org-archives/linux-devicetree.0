Return-Path: <SRS0=CNAl=KS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1533221871-62069-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533221871-62069-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Aug 2018 10:49:29 +0200
Message-ID: <CAMuHMdX-1-Twu4-PW+i1M3HewAqYUQyPEyGPaA1NcJeuhzL5Lg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: cpg-mssr: Add r8a774a1 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Aug 2, 2018 at 5:03 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G2M (R8A774A1) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Based on the Table 8.2b of "RZ/G Series, 2nd Generation User's Manual:
> Hardware ((Rev. 0.61, June 12, 2018)".
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> V1-->V2
>   * Added OSC predividers, rename rint to .r

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
