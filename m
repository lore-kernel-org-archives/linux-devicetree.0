Return-Path: <SRS0=siEA=VJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2019 15:54:45 +0200
Message-ID: <CAMuHMdUu7YesYt6JgH-hYBCF7s7M7HHBC5OxEmipcpqFBMezrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add HDMI audio support to the HiHope RZ/G2[MN]
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> this series adds HDMI audio support to the HiHope RZ/G2[MN].
>
> Thanks,
> Fab
>
> Fabrizio Castro (3):
>   arm64: dts: renesas: r8a774a1: Use extended audio dmac register
>   arm64: dts: renesas: r8a774a1: Add SSIU support for sound
>   arm64: dts: renesas: hihope-common: Add HDMI audio support

Thanks, I have applied and queued for v5.4 the first two patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
