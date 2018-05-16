Return-Path: <SRS0=/dL+=ID=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1526386059-6173-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526386059-6173-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 May 2018 09:45:30 +0200
Message-ID: <CAMuHMdXiyKvN3mnzwN8cyRaW5z0eCjQ=p_4=JR-K5evny=PiAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: renesas: rcar-sysc: Add support for R-Car E3
 power areas
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 15, 2018 at 2:07 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
> A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [shimoda: fix 3DG-{A,B} and add SPDX-License-Identifier]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
