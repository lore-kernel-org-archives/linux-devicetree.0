From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm: dts: qcom: Fix 'interrupts = <>' property to use
 proper  macros
Date: Wed, 4 Jul 2018 12:02:16 -0700
Message-ID: <20180704190216.GA16463@builder>
References: <1529486619-443-1-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529486619-443-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 20 Jun 02:23 PDT 2018, Sricharan R wrote:

> Fix all nodes to use proper GIC_* macros for the interrupt type and the
> interrupt trigger settings to avoid the boot warnings.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 41 ++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 1e0a3b4..70790ac 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -5,6 +5,7 @@
>  #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
>  #include <dt-bindings/clock/qcom,lcc-ipq806x.h>
>  #include <dt-bindings/soc/qcom,gsbi.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>  / {
>  	model = "Qualcomm IPQ8064";
> @@ -43,7 +44,8 @@
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <1 10 0x304>;
> +		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> +					  IRQ_TYPE_LEVEL_HIGH)>;
>  	};
>  
>  	reserved-memory {
> @@ -97,7 +99,7 @@
>  			clock-names = "ahbix-clk",
>  					"mi2s-osr-clk",
>  					"mi2s-bit-clk";
> -			interrupts = <0 85 1>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "lpass-irq-lpaif";
>  			reg = <0x28100000 0x10000>;
>  			reg-names = "lpass-lpaif";
> @@ -111,7 +113,7 @@
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			interrupts = <0 16 0x4>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		intc: interrupt-controller@2000000 {
> @@ -125,11 +127,16 @@
>  		timer@200a000 {
>  			compatible = "qcom,kpss-timer",
>  				     "qcom,kpss-wdt-ipq8064", "qcom,msm-timer";
> -			interrupts = <1 1 0x301>,
> -				     <1 2 0x301>,
> -				     <1 3 0x301>,
> -				     <1 4 0x301>,
> -				     <1 5 0x301>;
> +			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) |
> +						 IRQ_TYPE_EDGE_RISING)>,
> +				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) |
> +						 IRQ_TYPE_EDGE_RISING)>,
> +				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) |
> +						 IRQ_TYPE_EDGE_RISING)>,
> +				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(2) |
> +						 IRQ_TYPE_EDGE_RISING)>,
> +				     <GIC_PPI 5 (GIC_CPU_MASK_SIMPLE(2) |
> +						 IRQ_TYPE_EDGE_RISING)>;
>  			reg = <0x0200a000 0x100>;
>  			clock-frequency = <25000000>,
>  					  <32768>;
> @@ -177,7 +184,7 @@
>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
>  				reg = <0x12490000 0x1000>,
>  				      <0x12480000 0x1000>;
> -				interrupts = <0 195 0x0>;
> +				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&gcc GSBI2_UART_CLK>, <&gcc GSBI2_H_CLK>;
>  				clock-names = "core", "iface";
>  				status = "disabled";
> @@ -186,7 +193,7 @@
>  			i2c@124a0000 {
>  				compatible = "qcom,i2c-qup-v1.1.1";
>  				reg = <0x124a0000 0x1000>;
> -				interrupts = <0 196 0>;
> +				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
>  
>  				clocks = <&gcc GSBI2_QUP_CLK>, <&gcc GSBI2_H_CLK>;
>  				clock-names = "core", "iface";
> @@ -215,7 +222,7 @@
>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
>  				reg = <0x16340000 0x1000>,
>  				      <0x16300000 0x1000>;
> -				interrupts = <0 152 0x0>;
> +				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&gcc GSBI4_UART_CLK>, <&gcc GSBI4_H_CLK>;
>  				clock-names = "core", "iface";
>  				status = "disabled";
> @@ -224,7 +231,7 @@
>  			i2c@16380000 {
>  				compatible = "qcom,i2c-qup-v1.1.1";
>  				reg = <0x16380000 0x1000>;
> -				interrupts = <0 153 0>;
> +				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  
>  				clocks = <&gcc GSBI4_QUP_CLK>, <&gcc GSBI4_H_CLK>;
>  				clock-names = "core", "iface";
> @@ -252,7 +259,7 @@
>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
>  				reg = <0x1a240000 0x1000>,
>  				      <0x1a200000 0x1000>;
> -				interrupts = <0 154 0x0>;
> +				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&gcc GSBI5_UART_CLK>, <&gcc GSBI5_H_CLK>;
>  				clock-names = "core", "iface";
>  				status = "disabled";
> @@ -261,7 +268,7 @@
>  			i2c@1a280000 {
>  				compatible = "qcom,i2c-qup-v1.1.1";
>  				reg = <0x1a280000 0x1000>;
> -				interrupts = <0 155 0>;
> +				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>  
>  				clocks = <&gcc GSBI5_QUP_CLK>, <&gcc GSBI5_H_CLK>;
>  				clock-names = "core", "iface";
> @@ -274,7 +281,7 @@
>  			spi@1a280000 {
>  				compatible = "qcom,spi-qup-v1.1.1";
>  				reg = <0x1a280000 0x1000>;
> -				interrupts = <0 155 0>;
> +				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>  
>  				clocks = <&gcc GSBI5_QUP_CLK>, <&gcc GSBI5_H_CLK>;
>  				clock-names = "core", "iface";
> @@ -301,7 +308,7 @@
>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
>  				reg = <0x16640000 0x1000>,
>  				      <0x16600000 0x1000>;
> -				interrupts = <0 158 0x0>;
> +				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&gcc GSBI7_UART_CLK>, <&gcc GSBI7_H_CLK>;
>  				clock-names = "core", "iface";
>  				status = "disabled";
> @@ -323,7 +330,7 @@
>  			compatible = "qcom,ipq806x-ahci", "generic-ahci";
>  			reg = <0x29000000 0x180>;
>  
> -			interrupts = <0 209 0x0>;
> +			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
>  
>  			clocks = <&gcc SFAB_SATA_S_H_CLK>,
>  				 <&gcc SATA_H_CLK>,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
> is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
