From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6] arm64: dts: Add spi bus dts
Date: Mon, 17 Aug 2015 12:32:29 +0800
Message-ID: <CAGS+omCFQRoH3ft2O5qPLBgngCuLPaminTys5OU6QcKmRXTyNw@mail.gmail.com>
References: <1439782198-32396-1-git-send-email-leilk.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439782198-32396-1-git-send-email-leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leilk Liu <leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 17, 2015 at 11:29 AM, Leilk Liu <leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> This patch adds MT8173 spi bus controllers into device tree.
>
> Signed-off-by: Leilk Liu <leilk.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
> Change in this patch:
> pinctl and pad-select fields are board specific, so move to
> mt8173-evb.dtsi, and status = "okay".
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 12 ++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 4be66ca..811cb76 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -387,6 +387,24 @@
>         };
>  };
>
> +&pio {
> +       spi_pins_a: spi0 {
> +               pins_spi {
> +                       pinmux = <MT8173_PIN_69_SPI_CK__FUNC_SPI_CK_0_>,
> +                               <MT8173_PIN_70_SPI_MI__FUNC_SPI_MI_0_>,
> +                               <MT8173_PIN_71_SPI_MO__FUNC_SPI_MO_0_>,
> +                               <MT8173_PIN_72_SPI_CS__FUNC_SPI_CS_0_>;
> +               };
> +       };
> +};
> +
> +&spi {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spi_pins_a>;
> +       mediatek,pad-select = <0>;
> +       status = "okay";
> +};
> +
>  &uart0 {
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..3dfb6ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -365,6 +365,18 @@
>                         status = "disabled";
>                 };
>
> +               spi: spi@1100a000 {
> +                       compatible = "mediatek,mt8173-spi";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0 0x1100a000 0 0x1000>;
> +                       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
> +                       clocks = <&topckgen CLK_TOP_SPI_SEL>,
> +                                <&topckgen CLK_TOP_SYSPLL3_D2>;
> +                       clock-names = "spi-clk", "parent-clk";
> +                       status = "disabled";
> +               };
> +
>                 i2c3: i2c3@11010000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11010000 0 0x70>,
> --
> 1.8.1.1.dirty
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
