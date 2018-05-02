From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Add LPtimer support to stm32mp157c
Date: Wed, 2 May 2018 14:09:58 +0200
Message-ID: <654c83fa-1aed-def1-63f0-1b432b27c10f@st.com>
References: <1524037433-25915-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524037433-25915-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, robh+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 04/18/2018 09:43 AM, Fabrice Gasnier wrote:
> Add LPtimer definitions, depending on features they provide:
> - lptimer1 & 2 can act as PWM, trigger and encoder/counter
> - lptimer3 can act as PWM and trigger
> - lptimer4 & 5 can act as PWM
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---

Applied on stm32-next.

I fixed out DTC warning:

/soc/timer@50023000: unnecessary #address-cells/#size-cells without 
"ranges" or child "reg" property
/soc/timer@50024000: unnecessary #address-cells/#size-cells without 
"ranges" or child "reg" property

Thanks.
Alex



>   arch/arm/boot/dts/stm32mp157c.dtsi | 108 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 108 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index bc3eddc..7e6301c 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -104,6 +104,33 @@
>   		interrupt-parent = <&intc>;
>   		ranges;
>   
> +		lptimer1: timer@40009000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x40009000 0x400>;
> +			clocks = <&rcc LPTIM1_K>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			trigger@0 {
> +				compatible = "st,stm32-lptimer-trigger";
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			counter {
> +				compatible = "st,stm32-lptimer-counter";
> +				status = "disabled";
> +			};
> +		};
> +
>   		usart2: serial@4000e000 {
>   			compatible = "st,stm32h7-uart";
>   			reg = <0x4000e000 0x400>;
> @@ -167,6 +194,87 @@
>   			#reset-cells = <1>;
>   		};
>   
> +		lptimer2: timer@50021000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x50021000 0x400>;
> +			clocks = <&rcc LPTIM2_K>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			trigger@1 {
> +				compatible = "st,stm32-lptimer-trigger";
> +				reg = <1>;
> +				status = "disabled";
> +			};
> +
> +			counter {
> +				compatible = "st,stm32-lptimer-counter";
> +				status = "disabled";
> +			};
> +		};
> +
> +		lptimer3: timer@50022000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x50022000 0x400>;
> +			clocks = <&rcc LPTIM3_K>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			trigger@2 {
> +				compatible = "st,stm32-lptimer-trigger";
> +				reg = <2>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		lptimer4: timer@50023000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x50023000 0x400>;
> +			clocks = <&rcc LPTIM4_K>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		lptimer5: timer@50024000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x50024000 0x400>;
> +			clocks = <&rcc LPTIM5_K>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +		};
> +
>   		usart1: serial@5c000000 {
>   			compatible = "st,stm32h7-uart";
>   			reg = <0x5c000000 0x400>;
> 
