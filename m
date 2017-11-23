From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Move nodes which have no
 reg property out of bus
Date: Thu, 23 Nov 2017 10:27:55 +0100
Message-ID: <CAMuHMdXqPqhiCZFseBGFDEh9R+_kFcrmjWWgCSudtnHkuXoFgw@mail.gmail.com>
References: <20171120110125.12267-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171120110125.12267-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Nov 20, 2017 at 12:01 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Move pmu_a5[73], timer and thermal-zones nodes from soc node to root node.
> The nodes that have been moved do not have any register properties and thus
> shouldn't be placed on the bus.
>
> This problem is flagged by the compiler as follows:
> $ make
> ...
>   DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a57 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pmu_a53 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/thermal-zones missing or empty reg/ranges property

[...]

Thanks for your patch!

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -126,6 +126,86 @@

The node above is called "cpus".

>                 };
>         };
>
> +       pmu_a57 {

> +       };
> +
> +       pmu_a53 {

> +       };
> +
> +       timer {

> +       };
> +
> +       thermal-zones {

> +       };
> +
>         extal_clk: extal {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;

Any sorting rules (alphabetically?) for nodes at the root level?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
