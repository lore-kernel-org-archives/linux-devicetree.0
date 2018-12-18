Return-Path: <SRS0=Xrcn=O3=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Dec 2018 13:07:19 +0100
Message-ID: <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Fix hsusb reg size
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 18, 2018 at 1:02 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> HS-USB has registers outside the currently specified memory area,
> therefore change the definition accordingly.
>
> Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and
> HSUSB device nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
