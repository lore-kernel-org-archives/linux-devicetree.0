From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: shmobile: r8a7790: add CAN DT support
Date: Mon, 5 Jan 2015 14:38:35 +0100
Message-ID: <CAMuHMdWridOCgiCgM79eV-K-Ry2sQk3vdB5f306fMqqme6Nnag@mail.gmail.com>
References: <2616635.bsb7mLynhA@wasted.cogentembedded.com>
	<5498306.nhRks3sT7k@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <5498306.nhRks3sT7k@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 29, 2014 at 11:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A7790 parts of the CAN0/1 device nodes.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Apart from the minor nit below

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7790.dtsi
> @@ -792,6 +792,26 @@
>                 };
>         };
>
> +       can0: can@e6e80000 {
> +               compatible = "renesas,can-r8a7790";
> +               reg = <0 0xe6e80000 0 0x1000>;
> +               interrupts = <0 186 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp9_clks R8A7790_CLK_RCAN0>,
> +                        <&cpg_clocks R8A7790_CLK_RCAN>, <&can_clk>;

.git/rebase-apply/patch:18: space before tab in indent.
      <&cpg_clocks R8A7790_CLK_RCAN>, <&can_clk>;

> +               clock-names = "clkp1", "clkp2", "can_clk";
> +               status = "disabled";
> +       };
> +
> +       can1: can@e6e88000 {
> +               compatible = "renesas,can-r8a7790";
> +               reg = <0 0xe6e88000 0 0x1000>;
> +               interrupts = <0 187 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&mstp9_clks R8A7790_CLK_RCAN1>,
> +                        <&cpg_clocks R8A7790_CLK_RCAN>, <&can_clk>;

.git/rebase-apply/patch:28: space before tab in indent.
      <&cpg_clocks R8A7790_CLK_RCAN>, <&can_clk>;

> +               clock-names = "clkp1", "clkp2", "can_clk";
> +               status = "disabled";
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
