From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCHv3 RESEND 4/8] ARM: dts: stm32: Add RTC support for
 STM32F429 MCU
Date: Mon, 16 Jan 2017 15:39:34 +0100
Message-ID: <637d0251-0d22-766f-15ea-c87819468a90@st.com>
References: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
 <1484573388-590-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484573388-590-2-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/16/2017 02:29 PM, Amelie Delaunay wrote:
> This patch adds STM32 RTC bindings for STM32F429.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/arm/boot/dts/stm32f429.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index 557c1f4..f05a9d9 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -125,6 +125,20 @@
>  			status = "disabled";
>  		};
>
> +		rtc: rtc@40002800 {
> +			compatible = "st,stm32-rtc";
> +			reg = <0x40002800 0x400>;
> +			clocks = <&rcc 1 CLK_RTC>;
> +			clock-names = "ck_rtc";
> +			assigned-clocks = <&rcc 1 CLK_RTC>;
> +			assigned-clock-parents = <&rcc 1 CLK_LSE>;
> +			interrupt-parent = <&exti>;
> +			interrupts = <17 1>;
> +			interrupt-names = "alarm";
> +			st,syscfg = <&pwrcfg>;
> +			status = "disabled";
> +		};
> +
>  		usart2: serial@40004400 {
>  			compatible = "st,stm32-usart", "st,stm32-uart";
>  			reg = <0x40004400 0x400>;
>
Applied on stm32-dt-for-v4.11

Thanks
Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
