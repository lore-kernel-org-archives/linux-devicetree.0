From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: shmobile: silk: add QSPI DT support
Date: Mon, 10 Aug 2015 16:38:46 +0200
Message-ID: <CAMuHMdXQJ4Hju477Ys0ujXCNdUjWOa6AuKGzLPc3YFJc_eLz+g@mail.gmail.com>
References: <1898263.zrOs5SAUTS@wasted.cogentembedded.com>
	<1768974.jEFIAaInqd@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1768974.jEFIAaInqd-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Sun, Aug 9, 2015 at 12:27 AM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Define the SILK board dependent part of the QSPI device node.
> Add device nodes  for Spansion  S25FL512S SPI flash and MTD partitions on it.
>
> Based on the original patch by Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

> --- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts

> +&qspi {
> +       pinctrl-0 = <&qspi_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       flash@0 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "spansion,s25fl512s";

Please add the "jedec,spi-nor" fallback.

> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +               m25p,fast-read;

Please keep all "spi-*" properties together.

> +               spi-cpol;
> +               spi-cpha;

> +               partition@0 {
> +                       label = "loader";
> +                       reg = <0x00000000 0x00040000>;
> +                       read-only;
> +               };
> +               partition@40000 {
> +                       label = "user";
> +                       reg = <0x00040000 0x00400000>;
> +                       read-only;
> +               };
> +               partition@440000 {
> +                       label = "flash";
> +                       reg = <0x00440000 0x03bc0000>;
> +               };

The above part I cannot verify, so I have to trust you.

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
