From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: add I2C support
Date: Wed, 22 Nov 2017 14:06:59 +0100
Message-ID: <CAMuHMdV1RFyvPSZjEiJvdnu6QfHC9s-oUubvph0atGqx27MjnA@mail.gmail.com>
References: <20171116210757.729290426@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171116210757.729290426@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Nov 16, 2017 at 10:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A77970 parts of the I2C[0-4] device node.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi

> @@ -483,5 +491,85 @@
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                 };
> +
> +               i2c0: i2c@e6500000 {
> +                       compatible = "renesas,i2c-r8a77970",
> +                                    "renesas,rcar-gen3-i2c";
> +                       reg = <0 0xe6500000 0 0x40>;
> +                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 931>;
> +                       power-domains = <&sysc 32>;
> +                       resets = <&cpg 931>;
> +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;

Can't all five i2c interfaces be used with both dmac1 and dmac2?

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
