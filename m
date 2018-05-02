From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Add vrefbuf support to stm32mp157c
Date: Wed, 2 May 2018 13:31:59 +0200
Message-ID: <664e594b-067d-9abb-ecd3-8240cce91449@st.com>
References: <1524037665-26178-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524037665-26178-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, robh+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice,

On 04/18/2018 09:47 AM, Fabrice Gasnier wrote:
> stm32mp157c has vrefbuf regulator that can provide analog reference
> voltage from 1500mV to 2500mV.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index bc3eddc..7df3c99 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -167,6 +167,15 @@
>   			#reset-cells = <1>;
>   		};
>   
> +		vrefbuf: vrefbuf@50025000 {
> +			compatible = "st,stm32-vrefbuf";
> +			reg = <0x50025000 0x8>;
> +			regulator-min-microvolt = <1500000>;
> +			regulator-max-microvolt = <2500000>;
> +			clocks = <&rcc VREF>;
> +			status = "disabled";
> +		};
> +
>   		usart1: serial@5c000000 {
>   			compatible = "st,stm32h7-uart";
>   			reg = <0x5c000000 0x400>;
> 

Applied on stm32-next.

Thanks.
Alex
