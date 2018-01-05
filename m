From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Fri, 5 Jan 2018 09:53:09 +0100
Message-ID: <CAMuHMdWmoi3D9-XGXjefCsB2SgNjAH_G6uteSaTiWAN_krXhng@mail.gmail.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com> <20180104200150.11352-4-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180104200150.11352-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 4, 2018 at 9:01 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Add USB device support.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Minor nits below.

> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -667,4 +667,24 @@
>                 power-domains = <&cpg_clocks>;
>                 status = "disabled";
>         };
> +
> +       usbhs0: usbhs@e8010000 {
> +               compatible = "renesas,usbhs-r7s72100";
> +               reg = <0xe8010000 0x1A0>;

0x1a0

> +               interrupts = <GIC_SPI (73-32) IRQ_TYPE_LEVEL_HIGH>;

"41", all other interrupt properties already have the SPI offset subtracted?

> +               clocks = <&mstp7_clks R7S72100_CLK_USB0>;
> +               renesas,buswait = <4>;
> +               power-domains = <&cpg_clocks>;
> +               status = "disabled";
> +       };
> +
> +       usbhs1: usbhs@e8207000 {
> +               compatible = "renesas,usbhs-r7s72100";
> +               reg = <0xe8207000 0x1A0>;

0x1a0

> +               interrupts = <GIC_SPI (74-32) IRQ_TYPE_LEVEL_HIGH>;

"42", all other interrupt properties already have the SPI offset subtracted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
