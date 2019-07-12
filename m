Return-Path: <SRS0=siEA=VJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2019 15:14:33 +0200
Message-ID: <CAMuHMdWqpyC5=nA_pFM9Y-9LbU83xDHL1jN1OUA1mAbx17Sycw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Use extended audio
 dmac register
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7 extended audio dmac registers
> need to be used.
>
> Based on similar work from Jiada Wang:
> 7a516e49d975 ("arm64: dts: renesas: use extended audio dmac register")
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
