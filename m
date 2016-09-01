From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 04/12] arm64: dts: h3ulcb: enable EthernetAVB
Date: Thu, 1 Sep 2016 09:48:39 +0200
Message-ID: <CAMuHMdVwO+uyR9P7NBGFCyMPHzwFX2umZL=UT2-B7qme8nenPg@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637779-14741-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472637779-14741-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 31, 2016 at 12:02 PM, Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> This supports Ethernet AVB on H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts

> @@ -62,3 +68,29 @@
>         clock-frequency = <14745600>;
>         status = "okay";
>  };
> +
> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               rxc-skew-ps = <900>;
> +               rxdv-skew-ps = <0>;
> +               rxd0-skew-ps = <0>;
> +               rxd1-skew-ps = <0>;
> +               rxd2-skew-ps = <0>;
> +               rxd3-skew-ps = <0>;
> +               txc-skew-ps = <900>;
> +               txen-skew-ps = <0>;
> +               txd0-skew-ps = <0>;
> +               txd1-skew-ps = <0>;
> +               txd2-skew-ps = <0>;
> +               txd3-skew-ps = <0>;
> +               reg = <0>;
> +               interrupt-parent = <&gpio2>;
> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

Just wondering (it's done the same way on Salvator-X) why this is using a
GPIO interrupt, and not the dedicated AVB_PHY_INT?

> +       };
> +};

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
