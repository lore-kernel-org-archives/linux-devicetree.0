From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Fix HSE clock frequency for
 stm32h743i-disco board
Date: Tue, 27 Feb 2018 16:55:12 +0100
Message-ID: <08bbd782-7311-5d0a-a4c6-90700f26793a@st.com>
References: <1516983819-6567-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516983819-6567-1-git-send-email-patrice.chotard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: patrice.chotard@st.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Patrice,

On 01/26/2018 05:23 PM, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> The HSE oscillator frequency was wrongly set to 125MHz instead of 25MHz.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>   arch/arm/boot/dts/stm32h743i-disco.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
> index 79e841d94079..45e088c55741 100644
> --- a/arch/arm/boot/dts/stm32h743i-disco.dts
> +++ b/arch/arm/boot/dts/stm32h743i-disco.dts
> @@ -63,7 +63,7 @@
>   };
>   
>   &clk_hse {
> -	clock-frequency = <125000000>;
> +	clock-frequency = <25000000>;
>   };
>   
>   &usart2 {
> 

Applied on stm32-next.

thanks
alex
