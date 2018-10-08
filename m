Return-Path: <SRS0=VkId=MU=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com> <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
In-Reply-To: <51491585-16fb-93b1-bb1a-09e89683f2f0@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Oct 2018 10:12:59 +0200
Message-ID: <CAMuHMdWsW-E_a17LJ-i4Wts531B-PyYqW9mqWQmt=jH6fUpOPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add thermal support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Fri, Oct 5, 2018 at 9:26 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe THS/CIVM in the R8A77970 device trees.
>
> Based on the original (and large) patches by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
> Horman's 'renesas.git' repo.
>
> The thermal driver/bindings patches have been posted yesterday...
>
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -300,6 +300,19 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               thermal: thermal@e6190000 {
> +                       compatible = "renesas,thermal-r8a77970";
> +                       reg =  <0 0xe6190000 0 0x14

0x14 was appropriate for R-Mobile APE6...


> +                               0 0xe6190100 0 0x38>;

What about the CIVM status register? DT describes hardware, not driver
limitations.

> +                       interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 522>;
> +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +                       resets = <&cpg 522>;
> +                       #thermal-sensor-cells = <0>;
> +               };
> +
>                 intc_ex: interrupt-controller@e61c0000 {
>                         compatible = "renesas,intc-ex-r8a77970", "renesas,irqc";
>                         #interrupt-cells = <2>;

The rest looks good to me, so with the above fixed:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
