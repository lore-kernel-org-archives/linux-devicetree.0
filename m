Return-Path: <SRS0=YHMS=NZ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com> <1541661895-7064-3-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1541661895-7064-3-git-send-email-gaku.inami.xh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 10:56:04 +0100
Message-ID: <CAMuHMdXvkoMwrXy_878AmAPChaGCzMGbq6RVY3Z_CrFV5nTyAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: Add CPU capacity-dmips-mhz
Content-Type: text/plain; charset="UTF-8"
To: Gaku Inami <gaku.inami.xh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Inami-san,

On Thu, Nov 8, 2018 at 8:25 AM Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> Set the capacity-dmips-mhz for R-Car Gen3 SoCs, that is based on
> dhrystone. The average in 10 times of dhrystone result as follows:

[...]

> Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
> ---
> v1 -> v2:
>  - Consolidate two patches for r8a7795 and r8a7796 into one patch
>  - Add the formula for capacity-dmips-mhz into description

Thanks for the update, and the extensive and clear description!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
