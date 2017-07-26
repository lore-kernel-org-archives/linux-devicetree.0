From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stm32: reorder stm32h743 nodes
Date: Wed, 26 Jul 2017 18:24:23 +0200
Message-ID: <8218cfb4-fede-9286-98f4-fd041a9429f5@st.com>
References: <1500560225-31872-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500560225-31872-1-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/20/2017 04:17 PM, Alexandre Torgue wrote:
> Reorder nodes to keep coherency with others platforms (stm32f4/stm32f7).
> Nodes are ordered following base address.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 36a99db..343bf4a 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -59,13 +59,11 @@
>   	};
>   
>   	soc {
> -		usart1: serial@40011000 {
> -			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
> -			reg = <0x40011000 0x400>;
> -			interrupts = <37>;
> -			status = "disabled";
> +		timer5: timer@40000c00 {
> +			compatible = "st,stm32-timer";
> +			reg = <0x40000c00 0x400>;
> +			interrupts = <50>;
>   			clocks = <&timer_clk>;
> -
>   		};
>   
>   		usart2: serial@40004400 {
> @@ -76,11 +74,13 @@
>   			clocks = <&timer_clk>;
>   		};
>   
> -		timer5: timer@40000c00 {
> -			compatible = "st,stm32-timer";
> -			reg = <0x40000c00 0x400>;
> -			interrupts = <50>;
> +		usart1: serial@40011000 {
> +			compatible = "st,stm32f7-usart", "st,stm32f7-uart";
> +			reg = <0x40011000 0x400>;
> +			interrupts = <37>;
> +			status = "disabled";
>   			clocks = <&timer_clk>;
> +
>   		};
>   	};
>   };
> 
Applied on stm32-dt-for-v4.14 branch.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
