Return-Path: <SRS0=WnMU=GT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1522265176-33226-4-git-send-email-biju.das@bp.renesas.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com> <1522265176-33226-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Mar 2018 11:11:23 +0200
Message-ID: <CAMuHMdUW6DQw3jY4vUNm-BPFiVh2L0tQkmi3w0AgQp7gB0y67Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] clk: renesas: Add r8a77470 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Wed, Mar 28, 2018 at 9:26 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G1C Clock Pulse Generator Core Clock Outputs, as listed in
> Table 7.2 ("List of Clocks [RZ/G1C]") of the RZ/G1C Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
