Return-Path: <SRS0=CNAl=KS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com> <1533219087-33695-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533219087-33695-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Aug 2018 11:09:35 +0200
Message-ID: <CAMuHMdW62Mcgy+RSm4FeN3Aj98O4TkmopdRFji_7jX=vBY1jpw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: r8a77470: Add GPIO support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Aug 2, 2018 at 4:17 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Describe GPIO blocks in the R8A77470 device tree.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi

> +               gpio3: gpio@e6053000 {
> +                       compatible = "renesas,gpio-r8a77470",
> +                                    "renesas,rcar-gen2-gpio";
> +                       reg = <0 0xe6053000 0 0x50>;
> +                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                       #gpio-cells = <2>;
> +                       gpio-controller;
> +                       gpio-reserved-ranges = <17 10>;
> +                       gpio-ranges = <&pfc 0 96 30>;

I would reverse the order of these two properties, but that's purely cosmetic.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
