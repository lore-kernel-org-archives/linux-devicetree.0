From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] ARM: dts: r7s72100: add sdhi to device tree
Date: Fri, 23 Sep 2016 09:05:56 +0200
Message-ID: <CAMuHMdU8PKGwJ+5JzMix_GHohdYdXPEXwDm4HwmQfSxDY4h95w@mail.gmail.com>
References: <20160922213211.7988-1-chris.brandt@renesas.com> <20160922213211.7988-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160922213211.7988-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Sep 22, 2016 at 11:32 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(due to lack of documentation about SDHI, for the interrupt numbers only)

> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -458,4 +458,32 @@
>                 #size-cells = <0>;
>                 status = "disabled";
>         };
> +
> +       sdhi0: sd@e804e000 {
> +               compatible = "renesas,sdhi-r7s72100";
> +               reg = <0xe804e000 0x100>;
> +               interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
> +                             GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
> +                             GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +

Cannot chcck the required order, but the interrupts are called SDHI0_3,
SDHI0_0, and SDHI0_1 in the datasheet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
