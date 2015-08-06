From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] ARM: shmobile: r8a7794: add GPIO DT support
Date: Thu, 6 Aug 2015 09:22:45 +0200
Message-ID: <CAMuHMdUuHtmZfd7vei0qdP9n_gvd6C1xBbDWkkSdPRTrTPxiOg@mail.gmail.com>
References: <6388101.Drn6rL87rl@wasted.cogentembedded.com>
	<2762710.QvQ3jKvG4A@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2762710.QvQ3jKvG4A@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Mon, Aug 3, 2015 at 11:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe GPIO[0-6] controllers in the R8A7794 device tree.
>
> Based on original patch by Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

As CPG/MSTP Clock Domain support is in, I have to withdraw my Acked-by.

> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
> @@ -50,6 +50,90 @@
>                 interrupts = <1 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>         };
>
> +       gpio0: gpio@e6050000 {
> +               compatible = "renesas,gpio-r8a7794", "renesas,gpio-rcar";
> +               reg = <0 0xe6050000 0 0x50>;
> +               interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +               gpio-ranges = <&pfc 0 0 32>;
> +               #interrupt-cells = <2>;
> +               interrupt-controller;
> +               clocks = <&mstp9_clks R8A7794_CLK_GPIO0>;

Missing "power-domains = <&cpg_clocks>;"

> +       };

Same comment for the other gpio device nodes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
