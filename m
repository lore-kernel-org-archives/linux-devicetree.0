From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 05/12] arm64: dts: h3ulcb: enable GPIO leds
Date: Thu, 1 Sep 2016 09:52:56 +0200
Message-ID: <CAMuHMdUpcajev3CsdhtpaD4PrqAOPsAcnv+65TFv-we6FPmDVw@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637789-14780-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472637789-14780-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 12:03 PM, Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> This supports GPIO leds on H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -31,6 +31,19 @@
>                 /* first 128MB is reserved for secure area. */
>                 reg = <0x0 0x48000000 0x0 0x38000000>;
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               led4 {
> +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> +               };
> +               led5 {
> +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +               };
> +               led6 {
> +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +               };
> +       };

The LEDs share GPIOs with the switches. Unfortunately you cannot use both
at the same time.
Perhaps we want to configure one of them for the switch, to be used as a
wakeup-source?

The same applies to Salvator-X, where we haven't wired up the LEDs nor
switches (yet).

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
