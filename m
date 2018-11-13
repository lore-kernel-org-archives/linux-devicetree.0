Return-Path: <SRS0=BvA/=NY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com> <1541604267-4652-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541604267-4652-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 09:52:19 +0100
Message-ID: <CAMuHMdUq4EC0cuOePUO-WJrTi38ypT=GQoze9rpgmFm55mBXyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774a1: Replace power magic numbers
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 7, 2018 at 4:24 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Now that include/dt-bindings/power/r8a774a1-sysc.h is in Linus'
> master branch we can replace power related magic numbers with
> the corresponding labels.
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
