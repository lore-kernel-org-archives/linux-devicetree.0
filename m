Return-Path: <SRS0=caN8=VF=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560513214-28031-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-5-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2019 14:57:39 +0200
Message-ID: <CAMuHMdUTWztD05c+p-jgrfDSqa4JxCRdJR=wE5bCgOg+gzo56w@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a774a1: Add missing
 assigned-clocks for CAN[01]
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 14, 2019 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Define "assigned-clocks" and "assigned-clock-rates" properties
> for CAN[01] DT nodes, as required by the dt-bindings.
>
> Fixes: eccc40002972 ("arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
