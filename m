From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] phy: rcar-gen3-usb2: revise the example of device
 tree doc
Date: Thu, 25 Aug 2016 10:29:55 +0200
Message-ID: <CAMuHMdX6QRLJyvc6XMTptVd9mPoj1m4eXgRc3L0ukyPMr9Lwaw@mail.gmail.com>
References: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1472021362-8085-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472021362-8085-2-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Aug 24, 2016 at 8:49 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> The clocks property should be set to &cpg, not &mstpX_clks.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index 2281d6c..b54fb36 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -30,11 +30,11 @@ Example (R-Car H3):
>                 compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
>                 reg = <0 0xee080200 0 0x700>;
>                 interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&mstp7_clks R8A7795_CLK_EHCI0>;
> +               clocks = <&cpg CPG_MOD 703>;
>         };
>
>         usb-phy@ee0a0200 {
>                 compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
>                 reg = <0 0xee0a0200 0 0x700>;
> -               clocks = <&mstp7_clks R8A7795_CLK_EHCI0>;
> +               clocks = <&cpg CPG_MOD 702>;
>         };

BTW, do you want to add #phy-cells and power-domains properties?

BTW2, the actual .dtsi doesn't have the "renesas,rcar-gen3-usb2-phy"
fallback properties.

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
