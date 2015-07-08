From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6795 support
Date: Wed, 8 Jul 2015 11:23:43 +0100
Message-ID: <20150708102343.GC7025@leverpostej>
References: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
 <1436350480-17276-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436350480-17276-3-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 08, 2015 at 11:14:40AM +0100, Mars Cheng wrote:
> This adds basic chip support for MT6795 SoC
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt6795-evb.dts |  34 ++++++
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi    | 164 ++++++++++++++++++++++++++++
>  3 files changed, 199 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 3ce2462..e0a4bff 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -1,3 +1,4 @@
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
>  
>  always		:= $(dtb-y)
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-evb.dts b/arch/arm64/boot/dts/mediatek/mt6795-evb.dts
> new file mode 100644
> index 0000000..3a43c860
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-evb.dts
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
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
> + */
> +
> +/dts-v1/;
> +#include "mt6795.dtsi"
> +
> +/ {
> +	model = "MediaTek MT6795 Evaluation Board";
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x1e800000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,921600n8 earlyprintk";

PLease get rid of bootargs here; earlyprintk doesn't do anything on
arm64 (it's earlycon these days), and you can specify the serial
configuration in stdout-path, so please use that instead.

> +		stdout-path = &uart0;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> new file mode 100644
> index 0000000..832be20
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -0,0 +1,164 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "mediatek,mt6795";
> +	interrupt-parent = <&sysirq>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x000>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x001>;
> +		};

No enable-method? Does your FW patch that in?

> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x002>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x003>;
> +		};
> +
> +		cpu4: cpu@4 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x100>;
> +		};

The unit-address should match the reg (e.g. this should be cpu@100).

> +
> +		cpu5: cpu@5 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x101>;
> +		};
> +
> +		cpu6: cpu@6 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x102>;
> +		};
> +
> +		cpu7: cpu@7 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x103>;
> +		};
> +	};
> +
> +	clocks {
> +		system_clk: dummy13m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <13000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		rtc_clk: dummy32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		uart_clk: dummy26m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <26000000>;
> +			#clock-cells = <0>;
> +		};
> +	};

Get rid of the clocks node and place these directly under the root node.

> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13
> +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10
> +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};

The mask is wrong.

Thanks,
Mark.
