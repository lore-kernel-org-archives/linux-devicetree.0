Return-Path: <SRS0=9+2E=TA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-6-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Apr 2019 15:11:06 +0200
Message-ID: <CAMuHMdVostrVZA-_g1Kpxn4hRrJL73eh7TCjmgKm3ju2v6WaJw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Hook up r8a774a1 Audio-DMAC nodes to the IPMMU-MP.
>
> Based on work for the r8a7795 by Magnus Damm.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
