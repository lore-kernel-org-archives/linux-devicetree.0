From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 5/5] phy: renesas: rcar-gen3-usb2: add gpio handling
Date: Wed, 13 Dec 2017 09:55:16 +0100
Message-ID: <CAMuHMdU2YhLC3VPV8=KDw7U2=eudk35TmW7VfLYBDXrooQbx-g@mail.gmail.com>
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513146460-20326-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513146460-20326-6-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 13, 2017 at 7:27 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> Some R-Car SoCs (e.g. R-Car D3) doesn't have dedicated pins of VBUS
> and ID. So, they may be connected to gpio pins. To handle the gpio
> pins, this patch adds the handling of VBUS and ID pins instead of
> dedicated pins.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 77 ++++++++++++++++++++--
>  2 files changed, 72 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index 99b651b..851582f 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -27,6 +27,8 @@ channel as USB OTG:
>  - interrupts: interrupt specifier for the PHY.
>  - vbus-supply: Phandle to a regulator that provides power to the VBUS. This
>                regulator will be managed during the PHY power on/off sequence.
> +- renesas,vbus-gpios: use gpio to control vbus instead of dedicated pin.
> +- renesas,id-gpios: use gpio to detect id instead of dedicated pin.

Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt already uses
"vbus-gpios" and "id-gpios" without vendor-specific prefixes, so perhaps
the "renesas," can be dropped?

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
