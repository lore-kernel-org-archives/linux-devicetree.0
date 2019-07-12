Return-Path: <SRS0=siEA=VJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2019 15:27:38 +0200
Message-ID: <CAMuHMdXnwXaaQi9wcqRhHbfsbWFHOWW+HaK-ePpyxc3POPVBpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add SSIU support for sound
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add SSIU support to the SoC DT as the sound driver supports
> it now, and also since the sound driver can now handle
> BUSIF0-7 via SSIU remove the no longer needed "rxu" and "txu"
> properties.
>
> Based on similar work from Kuninori Morimoto and Simon Horman:
> 8d14bfa074db ("arm64: dts: renesas: r8a7796: add SSIU support for
> sound")
> 10bd03fa896e ("arm64: dts: renesas: r8a7796: remove BUSIF0 settings from
> rcar_sound,ssi")
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
