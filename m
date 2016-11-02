From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: dts: r8a7745: add [H]SCIF{A|B} support
Date: Wed, 2 Nov 2016 11:12:11 +0100
Message-ID: <CAMuHMdUZULyFwAoteXf+g=RWP=gBs0jDMVGpNUT_A=kPdDwSYQ@mail.gmail.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com> <2366203.iKt2DUneo7@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2366203.iKt2DUneo7-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2016 at 12:19 AM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Describe [H]SCIF{|A|B} ports in the R8A7745 device tree.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

After you've fixed the family-specific compatible values:
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi |  261 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 261 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7745.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7745.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7745.dtsi
> @@ -157,6 +157,267 @@
>                         #dma-cells = <1>;
>                         dma-channels = <15>;
>                 };
> +
> +               scifa0: serial@e6c40000 {
> +                       compatible = "renesas,scifa-r8a7745",
> +                                    "renesas,rzg-scifa", "renesas,scifa";

s/renesas,rzg-/renesas,rcar-gen2-/g

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
