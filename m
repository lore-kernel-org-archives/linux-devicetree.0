Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-16-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-16-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 10:21:30 +0200
Message-ID: <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Enable USB Host support for both the Type-C connector on the CPU board
> and the Type-A plug on the sub board.
>
> Both boards are also capable of USB Device operation as well after the
> appropriate Device Tree modifications.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One question below.

> --- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts

> @@ -161,3 +173,28 @@
>         bus-width = <4>;
>         status = "okay";
>  };
> +
> +/* USB-0 as Host */
> +/* NOTE: Requires JP3 to be fitted */

This not applies to the dr_mode property below, right?
So perhaps it should be moved there...

> +&usb2_phy0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&usb0_pins>;
> +       dr_mode = "host";

... like:

    dr_mode = "host";    /* Requires JP3 to be fitted */

Does resistor R78 need to be mounted, too?

> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
