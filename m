From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: r7s72100: add ostm to device tree
Date: Sun, 22 Jan 2017 10:40:15 +0100
Message-ID: <CAMuHMdXQCqs4bCR8o+BC5ak0rE64bQOEz65udFntcQSRkU6+cw@mail.gmail.com>
References: <20170120212055.4157-1-chris.brandt@renesas.com> <20170120212055.4157-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120212055.4157-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 10:20 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> v2:
> * wrap clock lines to avoid 80 char max
> * split into 2 separate channel nodes
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index d5946df..47b2165 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -505,4 +505,20 @@
>                 cap-sdio-irq;
>                 status = "disabled";
>         };
> +
> +       ostm0: ostm@fcfec000 {
> +               compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +               reg = <0xfcfec000 0x30>;
> +               interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;

Missing power-domains property:

        power-domains = <&cpg_clocks>;

> +               status = "disabled";
> +       };
> +
> +       ostm1: ostm@fcfec400 {
> +               compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +               reg = <0xfcfec400 0x30>;
> +               interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&mstp5_clks R7S72100_CLK_OSTM1>;

Likewise.

BTW, they're also missing for the last added device nodes (MMC and SDHI).

> +               status = "disabled";
> +       };
>  };

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
