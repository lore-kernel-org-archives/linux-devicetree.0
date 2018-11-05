From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 09/17] arm64: dts: qcom: qcs404: add spmi node
Date: Mon, 5 Nov 2018 11:04:13 -0800
Message-ID: <20181105190413.GO2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-10-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-10-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> PMS405 is used in QCS405-EVB so include that with SPMI nodes
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dts |  1 +
>  arch/arm64/boot/dts/qcom/qcs404.dtsi    | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dts b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
> index b79969153fba..10ad05ba5ca9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "qcs404.dtsi"
> +#include "pms405.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS404 EVB 1000";
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 970ca9a62530..4d47d5e11a5a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -242,6 +242,24 @@
>  			};
>  		};
>  
> +		spmi_bus: spmi@200f000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x200f000 0x001000>,
> +			      <0x2400000 0x800000>,
> +			      <0x2c00000 0x800000>,
> +			      <0x3800000 0x200000>,
> +			      <0x200a000 0x002100>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
>  		blsp1_uart2: serial@78b1000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0x78b1000 0x200>;
> -- 
> 2.14.4
> 
