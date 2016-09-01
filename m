From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 06/12] arm64: dts: h3ulcb: enable SDHI0
Date: Thu, 1 Sep 2016 10:11:45 +0200
Message-ID: <CAMuHMdWakZuEu-gTo5=3VWxRdSc8V9gpL28yhjrVhHh1oZVu+Q@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637799-14819-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472637799-14819-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, Aug 31, 2016 at 12:03 PM, Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> This supports SDHI0 on H3ULCB board SD card slot
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts

> @@ -82,6 +118,18 @@
>         status = "okay";
>  };
>
> +&sdhi0 {
> +       pinctrl-0 = <&sdhi0_pins_3v3>;
> +       pinctrl-1 = <&sdhi0_pins_1v8>;
> +       pinctrl-names = "default", "state_uhs";
> +
> +       vmmc-supply = <&vcc_sdhi0>;
> +       vqmmc-supply = <&vccq_sdhi0>;
> +       cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
> +       bus-width = <4>;
> +       status = "okay";
> +};

According to the schematics, SD0_WP is wired, so I think you want to add

    wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;

As you add UHS pins, I think you want to add

    sd-uhs-sdr50

too.

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
