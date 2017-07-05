From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: r8a7796: add IMR-LX4 support
Date: Wed, 5 Jul 2017 11:54:20 +0200
Message-ID: <CAMuHMdXxcbkPV+Jt7Xo5emQ4fyDHm1p1RgD9nsRfR78va4XFSA@mail.gmail.com>
References: <20170627173400.581660959@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170627173400.581660959@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Jun 27, 2017 at 7:33 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the IMR-LX4 devices in the R8A7796 device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1454,5 +1454,23 @@
>                                 };
>                         };
>                 };
> +
> +               imr-lx4@fe860000 {
> +                       compatible = "renesas,r8a7796-imr-lx4",
> +                                    "renesas,imr-lx4";
> +                       reg = <0 0xfe860000 0 0x2000>;
> +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 823>;
> +                       power-domains = <&sysc R8A7796_PD_A3VC>;

resets = <&cpg 823>;

> +               };
> +
> +               imr-lx4@fe870000 {
> +                       compatible = "renesas,r8a7796-imr-lx4",
> +                                    "renesas,imr-lx4";
> +                       reg = <0 0xfe870000 0 0x2000>;
> +                       interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 822>;
> +                       power-domains = <&sysc R8A7796_PD_A3VC>;

resets = <&cpg 822>;

With the issues above fixed:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
