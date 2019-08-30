Return-Path: <SRS0=wKvI=W2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2019 15:25:39 +0200
Message-ID: <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Fix eMMC status
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 30, 2019 at 3:15 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> SDHI3 got accidentally disabled while adding USB 2.0 support,
> this patch fixes it.
>
> Fixes: 734d277f412a ("arm64: dts: renesas: hihope-common: Add USB 2.0 support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is a fix for v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
