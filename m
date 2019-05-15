Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-3-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 09:43:02 +0200
Message-ID: <CAMuHMdWctj6bEBQ9OF93T6h10Chb-ankN4QRaY+UPLLQuBJDHQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] ARM: dts: rza2mevb: Add 48MHz USB clock
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 14, 2019 at 4:57 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2M EVB has a 48MHz clock attached to USB_X1.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -58,6 +58,11 @@
>         clock-frequency = <32768>;
>  };
>
> +/* USB_X1 */
> +&usb_x1_clk {
> +       clock-frequency = <48000000>;
> +};
> +
>  &pinctrl {
>         /* Serial Console */
>         scif4_pins: serial4 {

BTW, it looks like this file can use a sorting sweep.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
