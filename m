From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stm32: Add lptimer definitions to stm32h743
Date: Fri, 6 Oct 2017 15:03:07 +0200
Message-ID: <87996cbe-9b3c-7bcc-d8c3-c13ded688b7b@st.com>
References: <1505740615-24920-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505740615-24920-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 09/18/2017 03:16 PM, Fabrice Gasnier wrote:
> Add lptimer definitions, depending on features they provide:
> - lptimer1 & 2 can act as PWM, trigger and encoder/counter
> - lptimer3 can act as PWM and trigger
> - lptimer4 & 5 can act as PWM
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---

Applied on stm32-dt-for-v4.15 branch.

Thanks
Alex

>   arch/arm/boot/dts/stm32h743.dtsi | 103 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 103 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 58ec227..de54123 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -66,6 +66,32 @@
>   			clocks = <&timer_clk>;
>   		};
>   
> +		lptimer1: timer@0x40002400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x40002400 0x400>;
> +			clocks = <&timer_clk>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
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
>   		usart2: serial@40004400 {
>   			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
>   			reg = <0x40004400 0x400>;
> @@ -172,6 +198,83 @@
>   			};
>   		};
>   
> +		lptimer2: timer@0x58002400 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x58002400 0x400>;
> +			clocks = <&timer_clk>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
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
> +		lptimer3: timer@0x58002800 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x58002800 0x400>;
> +			clocks = <&timer_clk>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
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
> +		lptimer4: timer@0x58002c00 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x58002c00 0x400>;
> +			clocks = <&timer_clk>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				status = "disabled";
> +			};
> +		};
> +
> +		lptimer5: timer@0x58003000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-lptimer";
> +			reg = <0x58003000 0x400>;
> +			clocks = <&timer_clk>;
> +			clock-names = "mux";
> +			status = "disabled";
> +
> +			pwm {
> +				compatible = "st,stm32-pwm-lp";
> +				status = "disabled";
> +			};
> +		};
> +
>   		adc_3: adc@58026000 {
>   			compatible = "st,stm32h7-adc-core";
>   			reg = <0x58026000 0x400>;
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
