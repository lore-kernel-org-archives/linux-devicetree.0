Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com> <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
In-Reply-To: <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 13:29:29 +0200
Message-ID: <CAMuHMdXFCtEc5z1k9jHJaY-mS=ELZ69c+1RDO6TdZJ=TNovRAA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TPU support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 22, 2018 at 10:30 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe TPU in the R8A779{7|8}0 device trees.
>
> Based on the original (and large) patches by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -614,6 +614,14 @@
>                         status = "disabled";
>                 };
>
> +               tpu: pwm@e6e80000 {
> +                       compatible = "renesas,tpu-r8a77970", "renesas,tpu";
> +                       reg = <0 0xe6e80000 0 0x148>;
> +                       clocks = <&cpg CPG_MOD 304>;
> +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };

While not used by the driver, I think it would be good to describe its interrupt
(SPI 135). Same for r8a77980.dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
