From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77970: add LVDS support
Date: Fri, 19 Jan 2018 21:13:04 +0100
Message-ID: <CAMuHMdXOLLizyzm6wFbV-0_oYXvF5xmRQBQn20f6oCe4HOe8CA@mail.gmail.com>
References: <20180119195439.145129729@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180119195439.145129729-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Jan 19, 2018 at 8:42 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Define the generic R8A77970 part of the LVDS device node.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

I love your patch! Yet something to improve...

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -654,6 +654,31 @@
>                                 port@1 {
>                                         reg = <1>;
>                                         du_out_lvds: endpoint {
> +                                               remote-endpoint = <&lvds_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               lvds: lvds@feb90000 {
> +                       compatible = "renesas,r8a77970-lvds";
> +                       reg = <0 0xfeb90000 0 0x14>;
> +                       clocks = <&cpg CPG_MOD 727>;

Missing resets and power-domains properties.

> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       lvds_in: endpoint {
> +                                               remote-endpoint = <&du_out_lvds>;
> +                                       };
> +                               };
> +                               port@1 {
> +                                       reg = <1>;
> +                                       lvds_out: endpoint {
>                                         };
>                                 };
>                         };
>

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
