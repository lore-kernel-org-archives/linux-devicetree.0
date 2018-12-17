Return-Path: <SRS0=Jkdf=O2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Dec 2018 17:18:59 +0100
Message-ID: <CAMuHMdXZ4fuz-N3uhtGZQ6Gu=j4wF4OB_tJ8H+dO93k17_sWwQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 SYS-DMAC to IPMMU
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Hook up SYS-DMAC0, SYS-DMAC1, and SYS-DMAC2 to IPMMU-DS0 and
> IPMMU-DS1, according to what reported by the RZ/G2 User's manual.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
