From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6765 support
Date: Tue, 12 Jun 2018 18:58:28 -0600
Message-ID: <CAL_JsqJX3VF0YPMqcYAG53ib1SO8eFfFsFP39XMHO5YiHLWq1Q@mail.gmail.com>
References: <1528843243-29782-1-git-send-email-mars.cheng@mediatek.com> <1528843243-29782-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528843243-29782-3-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 4:40 PM, Mars Cheng <mars.cheng@mediatek.com> wrote:
> This adds basic chip support for MT6765 SoC.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>  arch/arm64/boot/dts/mediatek/mt6765-evb.dts |   39 +++++++
>  arch/arm64/boot/dts/mediatek/mt6765.dtsi    |  148 +++++++++++++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6765-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6765.dtsi
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index ac17f60..7506b0d 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6765-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6765-evb.dts b/arch/arm64/boot/dts/mediatek/mt6765-evb.dts
> new file mode 100644
> index 0000000..e5efbe5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6765-evb.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

With the SPDX tag, you can drop the license text.

> + */
> +
> +/dts-v1/;
> +#include "mt6765.dtsi"
> +
> +/ {
> +       model = "MediaTek MT6765 EVB";
> +       compatible = "mediatek,mt6765-evb", "mediatek,mt6765";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x1e800000>;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:921600n8";
> +       };
> +};
> +
> +&uart0 {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt6765.dtsi b/arch/arm64/boot/dts/mediatek/mt6765.dtsi
> new file mode 100644
> index 0000000..7222a5e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6765.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

ditto

> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "mediatek,mt6765";
> +       interrupt-parent = <&sysirq>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       psci {
> +               compatible = "arm,psci-0.2";
> +               method = "smc";
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x000>;
> +               };
> +
> +               cpu1: cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x001>;
> +               };
> +
> +               cpu2: cpu@2 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x002>;
> +               };
> +
> +               cpu3: cpu@3 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x003>;
> +               };
> +
> +               cpu4: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x100>;
> +               };
> +
> +               cpu5: cpu@101 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x101>;
> +               };
> +
> +               cpu6: cpu@102 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x102>;
> +               };
> +
> +               cpu7: cpu@103 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a53";
> +                       enable-method = "psci";
> +                       reg = <0x103>;
> +               };
> +       };
> +
> +       uart_clk: dummy26m {
> +               compatible = "fixed-clock";
> +               clock-frequency = <26000000>;
> +               #clock-cells = <0>;
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 13
> +                            (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 14
> +                            (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 11
> +                            (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                            <GIC_PPI 10
> +                            (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +       };
> +
> +       sysirq: intpol-controller@10200a80 {

This and others with an address should go under a simple-bus node.

Node name should be 'interrupt-controller@...'

> +               compatible = "mediatek,mt6765-sysirq",
> +                            "mediatek,mt6577-sysirq";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               interrupt-parent = <&gic>;
> +               reg = <0 0x10200a80 0 0x50>;
> +       };
> +
> +       gic: interrupt-controller@0c000000 {

Drop the leading 0.

> +               compatible = "arm,gic-v3";
> +               #interrupt-cells = <3>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               #redistributor-regions = <1>;
> +               interrupt-parent = <&gic>;
> +               interrupt-controller;
> +               reg = <0 0x0c000000 0 0x40000>, // distributor
> +                     <0 0x0c100000 0 0x200000>; // redistributor
> +               interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       uart0: serial@11002000 {
> +               compatible = "mediatek,mt6765-uart",
> +                            "mediatek,mt6577-uart";
> +               reg = <0 0x11002000 0 0x400>;
> +               interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
> +
> +       uart1: serial@11003000 {
> +               compatible = "mediatek,mt6765-uart",
> +                            "mediatek,mt6577-uart";
> +               reg = <0 0x11003000 0 0x400>;
> +               interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
> +};
> --
> 1.7.9.5
>
