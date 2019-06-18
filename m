Return-Path: <SRS0=RbSA=UR=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2019 17:10:19 +0200
Message-ID: <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Fri, Jun 14, 2019 at 3:17 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
> common device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,30 @@
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led0 {
> +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> +                       label = "LED0";

There's no need for a label property, if it matches the node name
(applies to all four LEDs).

Note that this GPIO is shared with a switch, like on Salvator-X(S) and
ULCB.  As currently Linux cannot handle both, describing the LED
precludes adding the switch later.
(applies to the first 3 LEDs).

> +               led3 {
> +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> +                       label = "LED3";
> +               };

I cannot find LED3. According to the schematics GP0_0 == CS0n is used
as the chipselect for the LVDS switch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
