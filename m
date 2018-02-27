From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Add leds support to stm32f769 Discovery
 board
Date: Tue, 27 Feb 2018 16:54:22 +0100
Message-ID: <58d38d05-5b78-356a-b563-839e2844d1f5@st.com>
References: <20180117094005.20728-1-benjamin.gaignard@st.com>
 <20180117094005.20728-2-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117094005.20728-2-benjamin.gaignard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Hi

On 01/17/2018 10:40 AM, Benjamin Gaignard wrote:
> Add nodes for the two user leds.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   arch/arm/boot/dts/stm32f769-disco.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 4463ca13a740..25a4b71f0317 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -61,6 +61,16 @@
>   		serial0 = &usart1;
>   	};
>   
> +	leds {
> +		compatible = "gpio-leds";
> +		green {
> +			gpios = <&gpioj 5 0>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +		red {
> +			gpios = <&gpioj 13 0>;
> +		};
> +	};
>   };
>   
>   &cec {
> 

Applied on stm32-next.

thanks
alex
