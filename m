From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 2/6] ARM: dts: r8a7794: add MSTP5 clocks
Date: Thu, 19 May 2016 18:25:02 +0200
Message-ID: <CAMuHMdXaUNwOTQ7827+iTTfuRne_Z1F=-qgxu2cs07==AeqzCA@mail.gmail.com>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
	<1576909.nm8MtQ2Ln5@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1576909.nm8MtQ2Ln5-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, May 12, 2016 at 10:45 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Add some MSTP5 clocks to the R8A7794 device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
> Changes in version 3:
> - refreshed the patch.
>
> Changes in version 2:
> - added "the" article to the change log.
>
>  arch/arm/boot/dts/r8a7794.dtsi            |    9 +++++++++
>  include/dt-bindings/clock/r8a7794-clock.h |    1 +
>  2 files changed, 10 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
> @@ -1172,6 +1172,15 @@
>                         clock-indices = <R8A7794_CLK_IRQC>;
>                         clock-output-names = "irqc";
>                 };
> +               mstp5_clks: mstp5_clks@e6150144 {
> +                       compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
> +                       reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
> +                       clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;
> +                       #clock-cells = <1>;
> +                       clock-indices = <R8A7794_CLK_AUDIO_DMAC0
> +                                        R8A7794_CLK_THERMAL R8A7794_CLK_PWM>;
> +                       clock-output-names = "audmac0", "thermal", "pwm";

R-Car E2 does not have the thermal module.

> +               };
>                 mstp7_clks: mstp7_clks@e615014c {
>                         compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
>                         reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
> Index: renesas/include/dt-bindings/clock/r8a7794-clock.h
> ===================================================================
> --- renesas.orig/include/dt-bindings/clock/r8a7794-clock.h
> +++ renesas/include/dt-bindings/clock/r8a7794-clock.h
> @@ -67,6 +67,7 @@
>  #define R8A7794_CLK_IRQC               7
>
>  /* MSTP5 */
> +#define R8A7794_CLK_AUDIO_DMAC0                2
>  #define R8A7794_CLK_THERMAL            22

Hence R8A7794_CLK_THERMAL should be removed.

>  #define R8A7794_CLK_PWM                        23

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
