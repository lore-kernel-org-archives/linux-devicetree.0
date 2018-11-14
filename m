Return-Path: <SRS0=YHMS=NZ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107173558.54481-1-chris.brandt@renesas.com> <20181107173558.54481-4-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Nov 2018 12:02:32 +0100
Message-ID: <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Nov 7, 2018 at 6:36 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document RZ/A2 (R7S9210) SoC bindings.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index de7b5393c163..b545daf8ccb3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -1,10 +1,12 @@
>  * Renesas R-Car generation 3 USB 2.0 PHY
>
>  This file provides information on what the device node for the R-Car generation
> -3 and RZ/G2 USB 2.0 PHY contain.
> +3, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
>
>  Required properties:
> -- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
> +- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
> +             SoC.
> +             "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
>               SoC.
>               "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>               SoC.
> @@ -16,8 +18,8 @@ Required properties:
>               R8A77990 SoC.
>               "renesas,usb2-phy-r8a77995" if the device is a part of an
>               R8A77995 SoC.
> -             "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
> -             compatible device.
> +             "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
> +             RZ/A2 compatible device.

Is it a good idea to declare RZ/A2 compatible to R-Car Gen3?
Usually we don't do that for Renesas IP cores used in different families[*].
Of course, I know you do have a good relationship with the actual RZ/A2
hardware designers ;-)

In light of Shimoda-san's comment w.r.t. R-Car H3 USB port1 in the driver
code, perhaps "renesas,rcar-gen3-usb2-phy" should not be used?

[*] Sole exceptions I'm aware of are:
      - "renesas,rmobile-iic", in addition to "renesas,rcar-gen2-iic" or
        "renesas,rcar-gen3-iic" on R-Car Gen2/3,
      - "renesas,rcar-gen2-cmt1" and "renesas,rcar-thermal" on R-Mobile APE6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
