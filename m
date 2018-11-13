Return-Path: <SRS0=BvA/=NY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com> <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 09:53:55 +0100
Message-ID: <CAMuHMdWqZNN8FMjpqZ2skjJvnzC+Ek4dMZKaFgg=E1=b-qam7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774a1: Replace clock magic numbers
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 7, 2018 at 4:24 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Now that include/dt-bindings/clock/r8a774a1-cpg-mssr.h is in Linus'
> master branch we can replace clock related magic numbers with the
> corresponding labels.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi

> @@ -87,7 +87,7 @@
>                         power-domains = <&sysc R8A774A1_PD_CA53_CPU0>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> -                       clocks =<&cpg CPG_CORE 1>;
> +                       clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;

There are a few pre-existing whitespace issues in the CPU nodes' clocks
properties.

>                 };
>
>                 a53_1: cpu@101 {
> @@ -97,7 +97,7 @@
>                         power-domains = <&sysc R8A774A1_PD_CA53_CPU1>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> -                       clocks =<&cpg CPG_CORE 1>;
> +                       clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
>                 };
>
>                 a53_2: cpu@102 {
> @@ -107,7 +107,7 @@
>                         power-domains = <&sysc R8A774A1_PD_CA53_CPU2>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> -                       clocks =<&cpg CPG_CORE 1>;
> +                       clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;
>                 };
>
>                 a53_3: cpu@103 {
> @@ -117,7 +117,7 @@
>                         power-domains = <&sysc R8A774A1_PD_CA53_CPU3>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> -                       clocks =<&cpg CPG_CORE 1>;
> +                       clocks =<&cpg CPG_CORE R8A774A1_CLK_Z2>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
