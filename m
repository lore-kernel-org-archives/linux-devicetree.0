From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: r8a7740: Add CEU0
Date: Wed, 16 May 2018 09:40:09 +0200
Message-ID: <CAMuHMdWSasm9PfurphB5wrgrhkO8v7YBpSZNnnC+mS_Vs4AJ5Q@mail.gmail.com>
References: <1524767083-19862-1-git-send-email-jacopo+renesas@jmondi.org> <1524767083-19862-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524767083-19862-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Thu, Apr 26, 2018 at 8:24 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Describe CEU0 peripheral for Renesas R-Mobile A1 R8A7740 Soc.
>
> Reported-by: Geert Uytterhoeven <geert@glider.be>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Minor question below.

> --- a/arch/arm/boot/dts/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/r8a7740.dtsi
> @@ -67,6 +67,16 @@
>                 power-domains = <&pd_d4>;
>         };
>
> +       ceu0: ceu@fe910000 {
> +               reg = <0xfe910000 0x3000>;
> +               compatible = "renesas,r8a7740-ceu";
> +               interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp1_clks R8A7740_CLK_CEU20>;
> +               clock-names = "ceu20";

Why the "clock-names" property? It's not mentioned in the DT bindings, and
may cause issues if the bindings are ever amended.

> +               power-domains = <&pd_a4r>;
> +               status = "disabled";
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
