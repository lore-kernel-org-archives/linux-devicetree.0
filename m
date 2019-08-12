From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] arm64: allwinner: h6: add I2C nodes
Date: Mon, 12 Aug 2019 12:12:38 +0800
Message-ID: <CAGb2v67_GjWFOEiThMp5o8m+nqYrrTCrNdSkscRfe5vmoJM47Q@mail.gmail.com>
References: <20190811090503.32396-1-bshah@kde.org> <20190811090503.32396-2-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811090503.32396-2-bshah@kde.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 11, 2019 at 5:05 PM Bhushan Shah <bshah@kde.org> wrote:
>
> Add device-tree nodes for i2c0 to i2c2, and also add relevant pinctrl
> nodes.
>
> Suggested-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Bhushan Shah <bshah@kde.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 54 ++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index bcecca17d61d..1d9ad3ec0b65 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -329,6 +329,21 @@
>                                 function = "hdmi";
>                         };
>
> +                       i2c0_pins: i2c0-pins {
> +                               pins = "PD25", "PD26";
> +                               function = "i2c0";
> +                       };
> +
> +                       i2c1_pins: i2c1-pins {
> +                               pins = "PH5", "PH6";
> +                               function = "i2c1";
> +                       };
> +
> +                       i2c2_pins: i2c2-pins {
> +                               pins = "PD23", "PD24";
> +                               function = "i2c2";
> +                       };
> +
>                         mmc0_pins: mmc0-pins {
>                                 pins = "PF0", "PF1", "PF2", "PF3",
>                                        "PF4", "PF5";
> @@ -464,6 +479,45 @@
>                         status = "disabled";
>                 };
>
> +               i2c0: i2c@5002000 {
> +                       compatible = "allwinner,sun6i-a31-i2c";

Please add an soc-specific compatible string, like "allwinner,sun50i-h6-i2c".
This is a last-resort way out in case the hardware isn't so compatible with
the A31.

You'll also need to update the bindings in

    Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml

The file also shows that we do this for other chips, such as the A23,
A64 and A83T.

ChenYu

> +                       reg = <0x05002000 0x400>;
> +                       interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_I2C0>;
> +                       resets = <&ccu RST_BUS_I2C0>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&i2c0_pins>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               i2c1: i2c@5002400 {
> +                       compatible = "allwinner,sun6i-a31-i2c";
> +                       reg = <0x05002400 0x400>;
> +                       interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_I2C1>;
> +                       resets = <&ccu RST_BUS_I2C1>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&i2c1_pins>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               i2c2: i2c@5002800 {
> +                       compatible = "allwinner,sun6i-a31-i2c";
> +                       reg = <0x05002800 0x400>;
> +                       interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_I2C2>;
> +                       resets = <&ccu RST_BUS_I2C2>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&i2c2_pins>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
>                 emac: ethernet@5020000 {
>                         compatible = "allwinner,sun50i-h6-emac",
>                                      "allwinner,sun50i-a64-emac";
> --
> 2.17.1
>
