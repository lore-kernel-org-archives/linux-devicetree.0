From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Mon, 10 Jun 2019 21:15:22 +0530
Message-ID: <048a25c0-3a2c-3906-84d4-5eb67f3ce2ef@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
 <20190608034835.GH24059@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608034835.GH24059@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,


On 6/8/2019 9:18 AM, Bjorn Andersson wrote:
> On Wed 05 Jun 10:16 PDT 2019, Sricharan R wrote:
> 
>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>> CP01 evaluation board.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> 
> Please fix the order of these (or add a Co-developed-by).
> 

 ok

>> ---
>>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  35 ++++
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 231 +++++++++++++++++++++++++++
>>  3 files changed, 267 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 21d548f..ac22dbb 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -2,6 +2,7 @@
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
> 
> Sort order.
> 

 ok

>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> new file mode 100644
>> index 0000000..ac7cb22
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IPQ6018 CP01 board device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "ipq6018.dtsi"
>> +
>> +/ {
>> +	#address-cells = <0x2>;
>> +	#size-cells = <0x2>;
> 
> This is a count, write it in base 10..
> 

 ok

>> +	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
>> +	compatible = "qcom,ipq6018-cp01", "qcom,ipq6018";
>> +	interrupt-parent = <&intc>;
> 
> Changing #address-cells, #size-cells and interrupt-parent will break the
> dtsi, so I think you should specify them there.
> 

 ok, will move it to the dtsi.

>> +};
>> +
>> +&tlmm {
> 
> Please sort your nodes based on address, then node name, then label.
> 

 ok

>> +	uart_pins: uart_pins {
>> +		mux {
>> +			pins = "gpio44", "gpio45";
>> +			function = "blsp2_uart";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +	};
>> +};
>> +
>> +&blsp1_uart3 {
>> +	pinctrl-0 = <&uart_pins>;
>> +	pinctrl-names = "default";
>> +	status = "ok";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> new file mode 100644
>> index 0000000..79cccdd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -0,0 +1,231 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IPQ6018 SoC device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ6018";
>> +	compatible = "qcom,ipq6018";
> 
> No need for model and compatible in the dtsi, these should always be
> specified by the including file.
> 

 ok, will move it to the dts.

>> +
>> +	chosen {
>> +		bootargs = "console=ttyMSM0,115200,n8 rw init=/init";
> 
> Do you really need console? Can't you use stdout-path?
> 

 ok, will change.

> And there's no need to specify init=/init.
> 

 ok.

>> +		bootargs-append = " swiotlb=1 clk_ignore_unused";
> 
> I'm hoping that you will work on removing the need for
> clk_ignore_unused.
> 

 hmm, should not be required even now. will remove that.

>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		tz:tz@48500000 {
> 
> Space after :
> 

 ok.

>> +			no-map;
>> +			reg = <0x0 0x48500000 0x0 0x00200000>;
> 
> I would prefer to have the reg first in these nodes, then the region's
> properties.
> 

 ok.

>> +		};
>> +	};
>> +
>> +	soc: soc {
>> +		#address-cells = <0x1>;
>> +		#size-cells = <0x1>;
>> +		ranges = <0 0 0 0xffffffff>;
>> +		dma-ranges;
>> +		compatible = "simple-bus";
>> +
>> +		intc: interrupt-controller@b000000 {
> 
> As described above, please sort your nodes based on address, node name
> and lastly label name.
> 

 ok.

>> +			compatible = "qcom,msm-qgic2";
>> +			interrupt-controller;
>> +			#interrupt-cells = <0x3>;
>> +			reg = <0xb000000 0x1000>, <0xb002000 0x1000>;
>> +		};
>> +
>> +		timer {
>> +			compatible = "arm,armv8-timer";
>> +			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>> +		};
>> +
>> +		timer@b120000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges;
>> +			compatible = "arm,armv7-timer-mem";
>> +			reg = <0xb120000 0x1000>;
> 
> Please pad addresses in reg to 8 digits, to make them faster to compare.
> 

 ok.

>> +			clock-frequency = <19200000>;
>> +
>> +			frame@b120000 {
>> +				frame-number = <0>;
>> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb121000 0x1000>,
>> +				      <0xb122000 0x1000>;
>> +			};
>> +
>> +			frame@b123000 {
>> +				frame-number = <1>;
>> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb123000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +
>> +			frame@b124000 {
>> +				frame-number = <2>;
>> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb124000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +
>> +			frame@b125000 {
>> +				frame-number = <3>;
>> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb125000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +
>> +			frame@b126000 {
>> +				frame-number = <4>;
>> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb126000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +
>> +			frame@b127000 {
>> +				frame-number = <5>;
>> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb127000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +
>> +			frame@b128000 {
>> +				frame-number = <6>;
>> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>> +				reg = <0xb128000 0x1000>;
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>> +		gcc: gcc@1800000 {
>> +			compatible = "qcom,gcc-ipq6018";
>> +			reg = <0x1800000 0x80000>;
>> +			#clock-cells = <0x1>;
> 
> This is a count, use base 10.
> 

 ok.

>> +			#reset-cells = <0x1>;
>> +		};
>> +
>> +		blsp1_uart3: serial@78b1000 {
>> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>> +			reg = <0x78b1000 0x200>;
>> +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
>> +				<&gcc GCC_BLSP1_AHB_CLK>;
>> +			clock-names = "core", "iface";
>> +			status = "disabled";
>> +		};
>> +
>> +		tlmm: pinctrl@1000000 {
>> +			compatible = "qcom,ipq6018-pinctrl";
>> +			reg = <0x1000000 0x300000>;
>> +			interrupts = <GIC_SPI 0xd0 IRQ_TYPE_NONE>;
>> +			gpio-controller;
>> +			#gpio-cells = <0x2>;
> 
> gpio-ranges = <&tlmm 0 80>;
> 

 ok.

>> +			interrupt-controller;
>> +			#interrupt-cells = <0x2>;
>> +
>> +			uart_pins: uart_pins {
>> +				pins = "gpio44", "gpio45";
>> +				function = "blsp2_uart";
>> +				drive-strength = <8>;
>> +				bias-pull-down;
>> +			};
>> +		};
>> +	};
>> +
>> +	psci: psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
>> +	cpus: cpus {
>> +		#address-cells = <0x1>;
>> +		#size-cells = <0x0>;
>> +
>> +		CPU0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&L2_0>;
>> +		};
>> +
>> +		CPU1: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			enable-method = "psci";
>> +			reg = <0x1>;
>> +			next-level-cache = <&L2_0>;
>> +		};
>> +
>> +		CPU2: cpu@2 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			enable-method = "psci";
>> +			reg = <0x2>;
>> +			next-level-cache = <&L2_0>;
>> +		};
>> +
>> +		CPU3: cpu@3 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			enable-method = "psci";
>> +			reg = <0x3>;
>> +			next-level-cache = <&L2_0>;
>> +		};
>> +
>> +		L2_0: l2-cache {
>> +			compatible = "cache";
>> +			cache-level = <0x2>;
>> +		};
>> +	};
>> +
>> +	pmuv8: pmu {
>> +		compatible = "arm,armv8-pmuv3";
>> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
>> +					 IRQ_TYPE_LEVEL_HIGH)>;
>> +	};
>> +
>> +	clocks {
>> +		sleep_clk: sleep_clk {
> 
> Don't use _ in the node names.
> 

 ok.

>> +			compatible = "fixed-clock";
>> +			clock-frequency = <32000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		xo: xo {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <24000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bias_pll_cc_clk {
> 
> Please give this a label and reference it from the node that uses it
> (regardless of the implementation matching by clock name).
> 
 ok, in that case, so might have to remove these for now, till we add
 the corresponding users.

>> +			compatible = "fixed-clock";
>> +			clock-frequency = <300000000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		bias_pll_nss_noc_clk {
>> +			compatible = "fixed-clock";
>> +			clock-frequency = <416500000>;
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		usb3phy_0_cc_pipe_clk {
> 
> This should come from the PHY.

  ok, will remove it here and add it later when adding USB node

Regards,
 Sricharan  

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
