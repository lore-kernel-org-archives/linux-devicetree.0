From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add GPIO device nodes
Date: Wed, 13 Sep 2017 11:21:31 +0200
Message-ID: <CAMuHMdX9qowD3039OxPyPoyUsnaq7e=kWyxqDdDqzz5RTZtSwQ@mail.gmail.com>
References: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 13, 2017 at 8:52 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds GPIO device nodes for r8a77995.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -139,6 +139,118 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               gpio0: gpio@e6050000 {
> +                       compatible = "renesas,gpio-r8a77995",
> +                                    "renesas,rcar-gen3-gpio",
> +                                    "renesas,gpio-rcar";
> +                       reg = <0 0xe6050000 0 0x50>;
> +                       interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +                       #gpio-cells = <2>;
> +                       gpio-controller;
> +                       gpio-ranges = <&pfc 0 0 9>;
> +                       #interrupt-cells = <2>;
> +                       interrupt-controller;
> +                       clocks = <&cpg CPG_MOD 912>;
> +                       power-domains = <&cpg>;

All nodes lack the power domain index (32, to be replaced by
R8A77995_PD_ALWAYS_ON later):

    power-domains = <&sysc 32>;

> +                       resets = <&cpg 912>;
> +               };

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
