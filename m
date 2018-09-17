Return-Path: <SRS0=q19Y=L7=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com> <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 10:53:16 +0200
Message-ID: <CAMuHMdVmwevtcjHyKcY5Y0pXFOQhAGeyhdSqF4PGJzVt5C2XMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Perhaps "ARM: dts: r8a77470: Add SMP support"?

On Mon, Sep 17, 2018 at 10:44 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add DT node for the Advanced Power Management Unit (APMU), add the
> second CPU core, and use "renesas,apmu" as "enable-method".
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
