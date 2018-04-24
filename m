Return-Path: <SRS0=jzey=HN=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1524560164-30040-2-git-send-email-biju.das@bp.renesas.com>
References: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com> <1524560164-30040-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 16:42:19 +0200
Message-ID: <CAMuHMdUQoNkRq1_fHV6a2yVseTMSYaw+07aKpcUaw0fD1RqhOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: r8a77470: Add SCIF support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 10:56 AM, Biju Das <biju.das@bp.renesas.com> wrote:
> Describe SCIF ports in the R8A77470 device tree.
> Also it fixes the CPG clock index ZS from 6 to 5.
>
> Fixes: 6929dfc5918049 ("ARM: dts: r8a77470: Initial SoC device tree")
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
