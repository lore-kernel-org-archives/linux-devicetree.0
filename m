From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC V4 PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead
 (Nexus 5X) support
Date: Fri, 21 Oct 2016 12:21:47 -0700
Message-ID: <20161021192147.GM26139@codeaurora.org>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-2-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477048273-32451-2-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/21, Jeremy McNicoll wrote:
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5dd05de..abb366e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,6 +1,6 @@
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb apq8096-db820c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb

One line per dtb please.

>  
>  always		:= $(dtb-y)
>  subdir-y	:= $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> new file mode 100644
> index 0000000..63fa3b0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> @@ -0,0 +1,42 @@
> +/* Copyright (c) 2015, LGE Inc. All rights reserved.
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8992.dtsi"
> +
> +/ {
> +	model = "LGE MSM8992 BULLHEAD rev-1.01";
> +	compatible = "qcom,msm8992";
> +	/* required for bootloader to select correct board */
> +	qcom,board-id = <0xb64 0>;
> +};

Why do we end
> +
> +/ {

and then restart the root node? Just keep the same node all the
time please.

> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	soc {
> +		serial@f991e000 {
> +			status = "okay";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp1_uart2_default>;
> +			pinctrl-1 = <&blsp1_uart2_sleep>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> new file mode 100644
> index 0000000..5d69a6b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> @@ -0,0 +1,214 @@
> +/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8994.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8992";
> +	compatible = "qcom,msm8992";
> +	// msm-id and pmic-id are needed by bootloader for
> +	// selecting correct blob
> +	qcom,msm-id = <251 0>, <252 0>;
> +	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;

Can't these just be in the final dts file and not in the dtsi
file? Technically the pmic pairings are a board choice and not an
SoC choice so they shouldn't be here. The msm-id properties are
a little easier to justify, but then I thought we decided to only
put them in the boards that need them?

> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +			};
> +		};
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53", "arm,armv8";
> +			reg = <0x0 0x0>;
> +			next-level-cache = <&L2_0>;
> +			// The currents(uA) correspond to the frequencies in the
> +			// frequency table.
> +			current = < 18250 //384000 kHZ
> +				24330 //460800 kHZ
> +				26920 //600000 kHZ
> +				34600 //672000 kHz
> +				38150 //787200 kHZ
> +				46880 //864000 kHZ
> +				55940 //960000 kHZ
> +				81740 //1248000 kHZ
> +				105870>; //1440000 kHZ

I imagine these aren't used. Please remove them.

> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +		};
> +	};
> +
> +	soc: soc { };

Just put the soc stuff here instead of having an empty node we
fill later please. That matches other qcom dtsi files.

> +
> +	memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		device_type = "memory";
> +		reg = <0 0 0 0>; // bootloader will update
> +	};
> +
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};
> +};
> +
> +&soc {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0 0 0 0xffffffff>;
> +	compatible = "simple-bus";
> +
> +	intc: interrupt-controller@f9000000 {
> +		compatible = "qcom,msm-qgic2";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = <0xf9000000 0x1000>,
> +			<0xf9002000 0x1000>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 2 0xf08>,
> +				<1 3 0xf08>,
> +				<1 4 0xf08>,
> +				<1 1 0xf08>;
> +		clock-frequency = <19200000>;

Please remove this property.

> +	};

This whole node should be outside of soc node.

> +
> +	timer@f9020000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "arm,armv7-timer-mem";
> +		reg = <0xf9020000 0x1000>;
> +		clock-frequency = <19200000>;

Please remove this property.

> +
> +		frame@f9021000 {
> +			frame-number = <0>;
> +			interrupts = <0 9 0x4>,
> +					<0 8 0x4>;
> +			reg = <0xf9021000 0x1000>,
> +				<0xf9022000 0x1000>;
> +		};
> +
> +		frame@f9023000 {
> +			frame-number = <1>;
> +			interrupts = <0 10 0x4>;
> +			reg = <0xf9023000 0x1000>;
> +			status = "disabled";
> +		};
> +
> +		frame@f9024000 {
> +			frame-number = <2>;
> +			interrupts = <0 11 0x4>;
> +			reg = <0xf9024000 0x1000>;
> +			status = "disabled";
> +		};
> +
> +		frame@f9025000 {
> +			frame-number = <3>;
> +			interrupts = <0 12 0x4>;
> +			reg = <0xf9025000 0x1000>;
> +			status = "disabled";
> +		};
> +
> +		frame@f9026000 {
> +			frame-number = <4>;
> +			interrupts = <0 13 0x4>;
> +			reg = <0xf9026000 0x1000>;
> +			status = "disabled";
> +		};
> +
> +		frame@f9027000 {
> +			frame-number = <5>;
> +			interrupts = <0 14 0x4>;
> +			reg = <0xf9027000 0x1000>;
> +			status = "disabled";
> +		};
> +
> +		frame@f9028000 {
> +			frame-number = <6>;
> +			interrupts = <0 15 0x4>;
> +			reg = <0xf9028000 0x1000>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	restart@fc4ab000 {
> +		compatible = "qcom,pshold";
> +		reg = <0xfc4ab000 0x4>;
> +	};
> +
> +	msmgpio: pinctrl@fd510000 {
> +		compatible = "qcom,msm8994-pinctrl", "qcom,msm8974-pinctrl";
> +		reg = <0xfd510000 0x4000>;
> +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	blsp1_uart2: serial@f991e000 {
> +		compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +		reg = <0xf991e000 0x1000>;
> +		interrupts = <0 108 0>;

Please add a trigger type and use the GIC_SPI/IRQ_TYPE_* macros.

> +		status = "disabled";
> +		clock-names = "core", "iface";
> +		clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
> +			<&clock_gcc GCC_BLSP1_AHB_CLK>;
> +	};
> +
> +	clock_gcc: qcom,gcc@fc400000 {
> +		compatible = "qcom,gcc-8994";
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +		#power-domain-cells = <1>;
> +		reg = <0xfc400000 0x2000>;
> +		clock-names = "xo", "xo_a_clk";

What is this for? Please remove.

> +	};
> +
> +	clock_rpm: qcom,rpmcc@fc401880 {
> +		compatible = "qcom,rpmcc";

What is this node? Please remove.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
