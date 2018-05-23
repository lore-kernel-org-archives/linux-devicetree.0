Return-Path: <SRS0=XFhp=IK=codeaurora.org=rnayak@kernel.org>
Subject: Re: [PATCH v6 4/5] arm64: dts: sdm845: Add serial console support
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
 <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
Date: Wed, 23 May 2018 12:00:26 +0530
MIME-Version: 1.0
In-Reply-To: <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, dianders@chromium.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>



On 03/30/2018 10:38 PM, Karthikeyan Ramasubramanian wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Add the qup uart node and geni se instance needed to
> support the serial console on the MTP.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> ---

Andy, is it possible to pull this one in for 4.18?
Sorry, I only realized we somehow missed this after looking at your pull request.

This is the only patch that prevents linux-next from booting up my sdm845 MTP
to a minimal console shell.

Thanks,
Rajendra

>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 41 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 39 +++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 979ab49..17b2fb0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -12,4 +12,45 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SDM845 MTP";
>  	compatible = "qcom,sdm845-mtp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&soc {
> +	geniqup@ac0000 {
> +		status = "okay";
> +
> +		serial@a84000 {
> +			status = "okay";
> +		};
> +	};
> +
> +	pinctrl@3400000 {
> +		qup-uart2-default {
> +			pinconf_tx {
> +				pins = "gpio4";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			pinconf_rx {
> +				pins = "gpio5";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +		};
> +
> +		qup-uart2-sleep {
> +			pinconf {
> +				pins = "gpio4", "gpio5";
> +				bias-pull-down;
> +			};
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 32f8561..71801b9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -194,6 +195,20 @@
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +
> +			qup_uart2_default: qup-uart2-default {
> +				pinmux {
> +					function = "qup9";
> +					pins = "gpio4", "gpio5";
> +				};
> +			};
> +
> +			qup_uart2_sleep: qup-uart2-sleep {
> +				pinmux {
> +					function = "gpio";
> +					pins = "gpio4", "gpio5";
> +				};
> +			};
>  		};
>  
>  		timer@17c90000 {
> @@ -272,5 +287,29 @@
>  			#interrupt-cells = <4>;
>  			cell-index = <0>;
>  		};
> +
> +		geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0xac0000 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0xa84000 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +				pinctrl-names = "default", "sleep";
> +				pinctrl-0 = <&qup_uart2_default>;
> +				pinctrl-1 = <&qup_uart2_sleep>;
> +				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
>  	};
>  };
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
