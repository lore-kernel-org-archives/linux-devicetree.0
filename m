Return-Path: <SRS0=Ncy5=WP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1563183169-15084-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1563183169-15084-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2019 15:37:09 +0200
Message-ID: <CAMuHMdVVf_t3Sd7o2iYYX_M2DtehHd_2ykhLqfV1y+nNRb25Cw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 15, 2019 at 11:33 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds support for HDMI audio to the device tree
> common to the HiHope RZ/G2M and the HiHope RZ/G2N.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> v1->v2:
> * Removed #sound-dai-cells from hdmi0 node

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
