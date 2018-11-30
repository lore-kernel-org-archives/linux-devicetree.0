Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com> <1543319795-48325-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 09:55:50 +0100
Message-ID: <CAMuHMdVt2DDQJ9Ud6i=GWAeWW0TdpF5xiCxtRiv0dZTGCPEt8A@mail.gmail.com>
Subject: Re: [PATCH 02/22] ARM: dts: r8a7744: Add I2C and IIC support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the I2C[0-5] and IIC[0,1,3] devices nodes to the R8A7744 device tree.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -15,6 +15,18 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +       aliases {
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &iic0;
> +               i2c7 = &iic1;
> +               i2c8 = &iic3;
> +       };

Please drop the i2c aliases. If needed at all, device aliases are board-specific
(for ports labeled e.g. "i2c0").

> +               iic3: i2c@e60b0000 {
> +                       /* doesn't need pinmux */
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "renesas,iic-r8a7744",
> +                                    "renesas,rcar-gen2-iic",
> +                                    "renesas,rmobile-iic";

It seems iic3 on RZ/G1N is different, in that it does not support
automatic transmission.
This is a bit similar like on R-Car E3, where we dropped compatibility
with the generic version to indicate this.  But on RZ/G1N we cannot use
the same solution, as the limitation does not apply to all instances.

RZ/G1H and RZ/G1M have the same issue.

> +                       reg = <0 0xe60b0000 0 0x425>;
> +                       interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 926>;
> +                       dmas = <&dmac0 0x77>, <&dmac0 0x78>,
> +                              <&dmac1 0x77>, <&dmac1 0x78>;
> +                       dma-names = "tx", "rx", "tx", "rx";
> +                       power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
> +                       resets = <&cpg 926>;
> +                       status = "disabled";
>                 };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
