Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com> <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 09:54:20 +0100
Message-ID: <CAMuHMdUgfrGyA1Y6vpRT-2KwfM6Gpzy945Oac-2_06HRed3Hjw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7744: Add SMP support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 22, 2018 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add DT node for the Advanced Power Management Unit (APMU), add the
> second CPU core, and use "renesas,apmu" as "enable-method".
>
> Also add cpu1 phandle node to the PMU interrupt-affinity property.

Please change GIC_CPU_MASK_SIMPLE() from 1 to 2 in this patch, too.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
