Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-14-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-14-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 11:05:14 +0200
Message-ID: <CAMuHMdW7z-segBTq_9Vjc54GZqKhCwsCFSz559fER=rwbhy7Cg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: r7s9210: Add USB Host support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add EHCI and OHCI host support for RZ/A2.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -329,6 +329,72 @@

> +               usb2_phy0: usb-phy@e8218200 {
> +                       compatible = "renesas,usb2-phy-r7s9210", "renesas,rcar-gen3-usb2-phy";
> +                       reg = <0xe8218200 0x10>;
> +                       interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 61>, <&usb_x1_clk>;
> +                       clock-names = "fclk", "usb_x1";

So this should be "fck" too, probably.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
