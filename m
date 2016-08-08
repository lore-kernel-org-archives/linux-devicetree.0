From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: r8a7794: add Audio-DMAC support
Date: Mon, 8 Aug 2016 15:14:03 +0200
Message-ID: <CAMuHMdWofFF9PrBW4n0GTytP8Mm7_mwPU=O7mXRPWUDXBOfOTA@mail.gmail.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com> <6419837.qqlciQTB8q@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <6419837.qqlciQTB8q@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jul 27, 2016 at 11:02 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe Audio-DMAC in the R8A7794 device tree.
>
> This patch is loosely based on the commit 8994fff67761 ("ARM: shmobile:
> r8a7791: Add Audio DMAC devices to DT").
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 4:
> - refreshed the patch.
>
> Changes in version 3:
> - refreshed the patch.
>
>  arch/arm/boot/dts/r8a7794.dtsi |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
> @@ -296,6 +296,34 @@
>                 dma-channels = <15>;
>         };
>
> +       audma0: dma-controller@ec700000 {
> +               compatible = "renesas,dmac-r8a7794", "renesas,rcar-dmac";
> +               reg = <0 0xec700000 0 0x10000>;
> +               interrupts =    <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
> +                                GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "error",
> +                                 "ch0", "ch1", "ch2", "ch3", "ch4", "ch5",
> +                                 "ch6", "ch7", "ch8", "ch9", "ch10", "ch11",
> +                                 "ch12";
> +               clocks = <&mstp5_clks R8A7794_CLK_AUDIO_DMAC0>;
> +               clock-names = "fck";
> +               power-domains = <&cpg_clocks>;
> +               #dma-cells = <1>;
> +               dma-channels = <13>;
> +       };

According to R-Car-Gen2-common-v2.00.pdf (Audio-DMAC and INTC-SYS
chapters), V2H has only 2 audio DMA channels, not 13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
