From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Wed, 5 Jun 2019 18:26:15 +0100
Message-ID: <d313bec5-1115-0ef7-0241-83e20672d2f1@arm.com>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>, robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/06/2019 18:16, Sricharan R wrote:
> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> CP01 evaluation board.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  35 ++++
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 231 +++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 21d548f..ac22dbb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -2,6 +2,7 @@
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> new file mode 100644
> index 0000000..ac7cb22
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IPQ6018 CP01 board device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq6018.dtsi"
> +
> +/ {
> +	#address-cells = <0x2>;
> +	#size-cells = <0x2>;
> +	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
> +	compatible = "qcom,ipq6018-cp01", "qcom,ipq6018";
> +	interrupt-parent = <&intc>;
> +};
> +
> +&tlmm {
> +	uart_pins: uart_pins {
> +		mux {
> +			pins = "gpio44", "gpio45";
> +			function = "blsp2_uart";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +	};
> +};
> +
> +&blsp1_uart3 {
> +	pinctrl-0 = <&uart_pins>;
> +	pinctrl-names = "default";
> +	status = "ok";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> new file mode 100644
> index 0000000..79cccdd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IPQ6018 SoC device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ6018";
> +	compatible = "qcom,ipq6018";
> +
> +	chosen {
> +		bootargs = "console=ttyMSM0,115200,n8 rw init=/init";
> +		bootargs-append = " swiotlb=1 clk_ignore_unused";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tz:tz@48500000 {
> +			no-map;
> +			reg = <0x0 0x48500000 0x0 0x00200000>;
> +		};
> +	};
> +
> +	soc: soc {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		dma-ranges;
> +		compatible = "simple-bus";
> +
> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <0x3>;
> +			reg = <0xb000000 0x1000>, <0xb002000 0x1000>;

Where are the rest of the GICv2 MMIO regions, such as GICV and GICH? And
the maintenance interrupt?

> +		};
> +
> +		timer {
> +			compatible = "arm,armv8-timer";
> +			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;

The fact that you expose the EL2 timer interrupt would tend to confirm
the idea that this system supports virtualization... Hence my questions
above.

Thanks,

	M.

-- 
Jazz is not dead. It just smells funny...
