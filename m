From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P)
 support
Date: Thu, 27 Oct 2016 17:06:56 -0700
Message-ID: <20161028000656.GH26139@codeaurora.org>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On 10/25, Jeremy McNicoll wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> new file mode 100644
> index 0000000..2fc68c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -0,0 +1,40 @@
> +/* Copyright (c) 2015, Huawei Inc. All rights reserved.
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
> +#include "msm8994-v2.0.dtsi"
> +
> +/ {
> +	model = "HUAWEI MSM8994 ANGLER rev-1.01";
> +	compatible = "qcom,msm8994";

Please replace this with something more specific for the actual
board. Preferably with the board manufacturer vendor prefix and
some sort of string for the board.

> +	/* required for bootloader to select correct board */
> +	qcom,board-id = <8026 0>;
> +
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
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi b/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
> new file mode 100644
> index 0000000..639781a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
> @@ -0,0 +1,32 @@
> +/* Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
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
> +/*
> + * As a general rule, only version-specific property overrides should be placed
> + * inside this file. Device definitions should be placed inside the msm8994.dtsi
> + * file.
> + */
> +
> +#include "msm8994.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8994v2.0";
> +	compatible = "qcom,msm8994";

This doesn't get -v2 appended?

> +	/* msm-id is required by bootloader for proper dt blob selection */
> +	qcom,msm-id = <207 0x20000>;
> +
> +};
> +
> +/* Clock driver overrides */
> +&clock_gcc {
> +	compatible = "qcom,gcc-8994v2";

I don't think gcc-8994v1 ever got into a product, so we should
write the clk driver to treat qcom,gcc-msm8994 as the only
compatible string. Then this override isn't needed.

> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> new file mode 100644
> index 0000000..7efc159
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -0,0 +1,218 @@
> +		msmgpio: pinctrl@fd510000 {
> +			compatible = "qcom,msm8994-pinctrl";
> +			reg = <0xfd510000 0x4000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		blsp1_uart2: serial@f991e000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0xf991e000 0x1000>;
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +			clock-names = "core", "iface";
> +			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
> +				 <&clock_gcc GCC_BLSP1_AHB_CLK>;
> +		};
> +
> +		tcsr_mutex_regs: syscon@fd484000 {
> +			compatible = "syscon";
> +			reg = <0xfd484000 0x2000>;
> +		};
> +
> +		tcsr_mutex: hwlock {

This doesn't have a reg property. It should go outside the soc
node.

> +			compatible = "qcom,tcsr-mutex";
> +			syscon = <&tcsr_mutex_regs 0 0x80>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		qcom,smem@6a00000 {

This doesn't have a reg property. It should go outside the soc
node.

> +			compatible = "qcom,smem";
> +			memory-region = <&smem_mem>;
> +			hwlocks = <&tcsr_mutex 3>;
> +		};
> +
> +		clock_gcc: qcom,gcc@fc400000 {

s/qcom,gcc/clock-controller/

> +			compatible = "qcom,gcc-8994";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0xfc400000 0x2000>;
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		// We expect the bootloader to fill in the reg
> +		reg = <0 0 0 0>;
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
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		smem_mem: smem_region@0x6a00000 {

Drop leading 0x in node names.

> +			reg = <0x0 0x6a00000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +
> +#include "msm8994-pins.dtsi"
> -- 
> 2.6.1
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
