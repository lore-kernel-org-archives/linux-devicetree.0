From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Add push button to stm32f469 Discovery
 board
Date: Tue, 27 Feb 2018 16:54:33 +0100
Message-ID: <05594721-12b9-e286-8494-031314c0662d@st.com>
References: <20180117094005.20728-1-benjamin.gaignard@st.com>
 <20180117094005.20728-3-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117094005.20728-3-benjamin.gaignard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

hi

On 01/17/2018 10:40 AM, Benjamin Gaignard wrote:
> Add node for user push button.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   arch/arm/boot/dts/stm32f469-disco.dts | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> index 5e9994840a24..c93d83d53bc8 100644
> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> @@ -86,6 +86,18 @@
>   			gpios = <&gpiok 3 1>;
>   	};
>   
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		autorepeat;
> +		button@0 {
> +			label = "User";
> +			linux,code = <KEY_WAKEUP>;
> +			gpios = <&gpioa 0 0>;
> +		};
> +	};
> +
>   	/* This turns on vbus for otg for host mode (dwc2) */
>   	vcc5v_otg: vcc5v-otg-regulator {
>   		compatible = "regulator-fixed";
> 


Applied on stm32-next.

thanks
alex
