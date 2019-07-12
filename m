Return-Path: <SRS0=siEA=VJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2019 15:42:27 +0200
Message-ID: <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Fri, Jul 5, 2019 at 3:40 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds support for HDMI audio to the device tree
> common to the HiHope RZ/G2M and the HiHope RZ/G2N.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi

> @@ -168,6 +180,7 @@
>
>  &hdmi0 {
>         status = "okay";
> +       #sound-dai-cells = <0>;

Why the above line?

With the above question answered:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
