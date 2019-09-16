Return-Path: <SRS0=w511=XL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com> <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568364608-46548-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Sep 2019 09:42:33 +0200
Message-ID: <CAMuHMdVwv32YbNQtMOxahSYrzicHqEqtFLORuvti+Ld5NxMPGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Add dynamic power coefficient
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 13, 2019 at 10:57 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Describe the dynamic power coefficient of A53 CPUs.
>
> Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> and others.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
