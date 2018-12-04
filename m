Return-Path: <SRS0=yP1+=ON=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com> <1543319795-48325-18-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-18-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 15:55:28 +0100
Message-ID: <CAMuHMdW6_3Vmv=vCxM9DaJwmpAsCUdK_sBk=ipGn5rD=1+ZF6Q@mail.gmail.com>
Subject: Re: [PATCH 17/22] ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out
 of RZ/G1M SOM
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The iWave RZ/G1N board is almost identical to RZ/G1M. cmt and rwdt modules
> are SoC specific and should be part of board dts rather than SoM dtsi. By
> moving these nodes to the common dtsi it allows cmt and rwdt to be enabled
> on both of these boards with less lines of code.
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
