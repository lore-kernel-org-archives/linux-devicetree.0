Return-Path: <SRS0=CNAl=KS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1533221794-59181-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533221794-59181-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Aug 2018 10:48:20 +0200
Message-ID: <CAMuHMdXMzbfyG9DM0=3UD807Mdt5s2A4Vwwi8xAxzQLJpgcM-g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: renesas: Add r8a774a1 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Aug 2, 2018 at 5:02 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G2M Clock Pulse Generator Core Clock Outputs, as listed in
> Table 8.2b ("List of Clocks [RZ/G2M]") of the RZ/G2M Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1--> V2
>   * Removed internal clock POST2.

Thanks for the update!

Will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
