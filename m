From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Add clk-lse node's label on stm32f429
Date: Thu, 20 Sep 2018 09:14:15 +0200
Message-ID: <440caae7-3885-d858-f2e2-8840ca054d5d@st.com>
References: <1532007308-10861-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532007308-10861-1-git-send-email-patrice.chotard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: patrice.chotard@st.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mcoquelin.stm32@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Patrice

On 07/19/2018 03:35 PM, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> Add missing clk_lse label for node clk-lse.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>   arch/arm/boot/dts/stm32f429.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index ede77e0f1c41..64278e81bc08 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -58,7 +58,7 @@
>   			clock-frequency = <0>;
>   		};
>   
> -		clk-lse {
> +		clk_lse: clk-lse {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <32768>;
> 

Applied on stm32-next.

Thanks.
Alex
