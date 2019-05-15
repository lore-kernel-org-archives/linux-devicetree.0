Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-14-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-14-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 09:59:16 +0200
Message-ID: <CAMuHMdUU3EBFXHpvw8y_yYf3L1qNNH6HJw+RHP_ioSFwJcd3Vg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add EHCI and OHCI host support for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi

> +               usb2_phy0: usb-phy@e8218200 {
> +                       compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
> +                       reg = <0xe8218200 0x10>;

What about the other registers?
On R-Car Gen3, size is 0x700.
Same for usb2_phy1.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
