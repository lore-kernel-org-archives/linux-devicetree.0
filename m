From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
Date: Fri, 16 Sep 2016 09:08:25 +0200
Message-ID: <CAMuHMdU6DKuxYUKNV_-FyczV-pPFpTLso=5HruWgNiXNOenVRQ@mail.gmail.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com> <20160915193405.26943-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160915193405.26943-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Sep 15, 2016 at 9:34 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index e18d4e6..4054db3 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -450,4 +450,15 @@
>                 #size-cells = <0>;
>                 status = "disabled";
>         };
> +
> +       mmcif: mmc@e804c800 {
> +               compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
> +               reg = <0xe804c800 0x80>;
> +               interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
> +                             GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;

The bindings do not say anything about interrupts (hence that should be
added).
The driver handles either 1 combined or 2 separate interrupts.
The datasheet says MMC has 3 interrupt requests, though?

> +               clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
> +               reg-io-width = <4>;
> +               bus-width = <8>;
> +               status = "disabled";
> +       };
>  };

The rest looks OK to me.

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
