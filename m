From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: mt8183: Add node for the Mali GPU
Date: Thu, 5 Sep 2019 10:09:18 +0100
Message-ID: <CAL_JsqJCO2G90TTT9Mpy4kjVKQyXWw4aXEEnbRp_SE8X=EGc5g@mail.gmail.com>
References: <20190905081546.42716-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905081546.42716-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Fan <nick.fan@mediatek.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 5, 2019 at 9:16 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Add a basic GPU node and opp table for mt8183.
>
> The binding we use with out-of-tree Mali drivers includes more
> clocks, I assume this would be required eventually if we have an
> in-tree driver:

We have an in-tree driver...

> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> ---
> Upstreaming what matches existing bindings from our Chromium OS tree:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/arch/arm64/boot/dts/mediatek/mt8183.dtsi#1348
>
> The evb part of this change depends on this patch to add PMIC dtsi:
> https://patchwork.kernel.org/patch/10928161/
>
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts |   7 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 103 ++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 1fb195c683c3d01..200d8e65a6368a1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>  #include "mt8183.dtsi"
> +#include "mt6358.dtsi"
>
>  / {
>         model = "MediaTek MT8183 evaluation board";
> @@ -30,6 +31,12 @@
>         status = "okay";
>  };
>
> +&gpu {
> +       supply-names = "mali", "mali_sram";
> +       mali-supply = <&mt6358_vgpu_reg>;
> +       mali_sram-supply = <&mt6358_vsram_gpu_reg>;

Not documented. Just 'sram-supply' is enough.

Note that the binding doc queued up for 5.4 has been converted to DT schema.

> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c_pins_0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 97f84aa9fc6e1c1..8ea548a762ea252 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -579,6 +579,109 @@
>                         #clock-cells = <1>;
>                 };
>
> +               gpu: mali@13040000 {

gpu@...

> +                       compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";

You need to add this compatible string too.

> +                       reg = <0 0x13040000 0 0x4000>;
> +                       interrupts =
> +                               <GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
> +                               <GIC_SPI 279 IRQ_TYPE_LEVEL_LOW>,
> +                               <GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupt-names = "job", "mmu", "gpu";
> +
> +                       clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> +                       power-domains =
> +                               <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>,
> +                               <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>,
> +                               <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;

This needs to be documented too.

> +
> +                       operating-points-v2 = <&gpu_opp_table>;
> +               };
> +
> +               gpu_opp_table: opp_table0 {
> +                       compatible = "operating-points-v2";
> +                       opp-shared;
> +
> +                       opp-300000000 {
> +                               opp-hz = /bits/ 64 <300000000>;
> +                               opp-microvolt = <625000>, <850000>;
> +                       };
> +
> +                       opp-320000000 {
> +                               opp-hz = /bits/ 64 <320000000>;
> +                               opp-microvolt = <631250>, <850000>;
> +                       };
> +
> +                       opp-340000000 {
> +                               opp-hz = /bits/ 64 <340000000>;
> +                               opp-microvolt = <637500>, <850000>;
> +                       };
> +
> +                       opp-360000000 {
> +                               opp-hz = /bits/ 64 <360000000>;
> +                               opp-microvolt = <643750>, <850000>;
> +                       };
> +
> +                       opp-380000000 {
> +                               opp-hz = /bits/ 64 <380000000>;
> +                               opp-microvolt = <650000>, <850000>;
> +                       };
> +
> +                       opp-400000000 {
> +                               opp-hz = /bits/ 64 <400000000>;
> +                               opp-microvolt = <656250>, <850000>;
> +                       };
> +
> +                       opp-420000000 {
> +                               opp-hz = /bits/ 64 <420000000>;
> +                               opp-microvolt = <662500>, <850000>;
> +                       };
> +
> +                       opp-460000000 {
> +                               opp-hz = /bits/ 64 <460000000>;
> +                               opp-microvolt = <675000>, <850000>;
> +                       };
> +
> +                       opp-500000000 {
> +                               opp-hz = /bits/ 64 <500000000>;
> +                               opp-microvolt = <687500>, <850000>;
> +                       };
> +
> +                       opp-540000000 {
> +                               opp-hz = /bits/ 64 <540000000>;
> +                               opp-microvolt = <700000>, <850000>;
> +                       };
> +
> +                       opp-580000000 {
> +                               opp-hz = /bits/ 64 <580000000>;
> +                               opp-microvolt = <712500>, <850000>;
> +                       };
> +
> +                       opp-620000000 {
> +                               opp-hz = /bits/ 64 <620000000>;
> +                               opp-microvolt = <725000>, <850000>;
> +                       };
> +
> +                       opp-653000000 {
> +                               opp-hz = /bits/ 64 <653000000>;
> +                               opp-microvolt = <743750>, <850000>;
> +                       };
> +
> +                       opp-698000000 {
> +                               opp-hz = /bits/ 64 <698000000>;
> +                               opp-microvolt = <768750>, <868750>;
> +                       };
> +
> +                       opp-743000000 {
> +                               opp-hz = /bits/ 64 <743000000>;
> +                               opp-microvolt = <793750>, <893750>;
> +                       };
> +
> +                       opp-800000000 {
> +                               opp-hz = /bits/ 64 <800000000>;
> +                               opp-microvolt = <825000>, <925000>;
> +                       };

Okay, but I seriously doubt the OPP selection logic is sophisticated
enough or will ever be to use all these levels...

> +               };
> +
>                 mmsys: syscon@14000000 {
>                         compatible = "mediatek,mt8183-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
> --
> 2.23.0.187.g17f5b7556c-goog
>
