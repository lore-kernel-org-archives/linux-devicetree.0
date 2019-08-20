From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: pm8150b: Add Base DTS file
Date: Tue, 20 Aug 2019 14:27:01 +0200
Message-ID: <20190820122701.GC31261@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-4-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:11PM +0530, Vinod Koul wrote:
> PMIC pm8150b is a slave pmic and this adds base DTS file for pm8150b
> with pon, adc, and gpio nodes

All of your other commit messages refers to it as power-on
instead of pon, be consistent.

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 84 +++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> new file mode 100644
> index 000000000000..dfb71fb8c90a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@2 {
> +		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
> +		reg = <0x2 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +
> +			status = "disabled";
> +		};
> +
> +		adc@3100 {
> +			compatible = "qcom,spmi-adc5";
> +			reg = <0x3100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +
> +			status = "disabled";
> +
> +			ref-gnd@0 {
> +				reg = <ADC5_REF_GND>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_gnd";
> +			};
> +
> +			vref-1p25@1 {
> +				reg = <ADC5_1P25VREF>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vref_1p25";
> +			};
> +
> +			die-temp@6 {
> +				reg = <ADC5_DIE_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "die_temp";
> +			};
> +
> +			chg-temp@9 {
> +				reg = <ADC5_CHG_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "chg_temp";
> +			};
> +		};
> +
> +		pm8150b_gpios: gpio@c000 {
> +			compatible = "qcom,pm8150b-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0x2 0xc0 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc1 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc2 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc3 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc4 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc5 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc6 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc7 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc8 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xc9 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xca 0 IRQ_TYPE_NONE>,
> +				     <0x2 0xcb 0 IRQ_TYPE_NONE>;
> +		};
> +	};
> +
> +	pmic@3 {
> +		compatible = "qcom,pm8150b", "qcom,spmi-pmic";
> +		reg = <0x3 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.20.1
> 
