Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-5-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-5-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 09:35:44 +0200
Message-ID: <CAMuHMdVVu23_8=8CLwM46QAJsxUbYyN1TYQaAzoE+d2uM3YshQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 4:57 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document the USB_X1 input and add clock-names to identify
> functional and USB_X1 clocks.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -28,7 +28,11 @@ Required properties:
>               followed by the generic version.
>
>  - reg: offset and length of the partial USB 2.0 Host register block.
> -- clocks: clock phandle and specifier pair(s).
> +- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
> +          dedicated USB_X1 input for the PLL, that is also listed.
> +- clock-names: Name of the clocks. The functional clock shall be called "fclk"

Names?

> +              and USB_X1 shall be called "usb_x1". If only one clock is listed,
> +              this property is not required.
>  - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
>               using <0> is deprecated).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
