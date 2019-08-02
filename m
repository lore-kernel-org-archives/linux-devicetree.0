From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add DFSDM pins to stm32mp157c
Date: Fri, 2 Aug 2019 10:09:46 +0200
Message-ID: <a95e5d74-c8e3-42f9-cabf-f42623aee255@st.com>
References: <1564645567-13156-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564645567-13156-1-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Olivier Moysan <olivier.moysan@st.com>, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Olivier

On 8/1/19 9:46 AM, Olivier Moysan wrote:
> Add DFSDM pins to stm32mp157c.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 39 +++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 9eaec9bf8cb8..f96a928cbc49 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -230,6 +230,45 @@
>   				};
>   			};
>   

I use to only take pinconfig which are used in board. So please resend 
with the "board patch".

regards
Alex


> +			dfsdm_clkout_pins_a: dfsdm-clkout-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('B', 13, AF3)>; /* DFSDM_CKOUT */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +			};
> +
> +			dfsdm_clkout_sleep_pins_a: dfsdm-clkout-sleep-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* DFSDM_CKOUT */
> +				};
> +			};
> +
> +			dfsdm_data1_pins_a: dfsdm-data1-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 3, AF3)>; /* DFSDM_DATA1 */
> +				};
> +			};
> +
> +			dfsdm_data1_sleep_pins_a: dfsdm-data1-sleep-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 3, ANALOG)>; /* DFSDM_DATA1 */
> +				};
> +			};
> +
> +			dfsdm_data3_pins_a: dfsdm-data3-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('F', 13, AF6)>; /* DFSDM_DATA3 */
> +				};
> +			};
> +
> +			dfsdm_data3_sleep_pins_a: dfsdm-data3-sleep-pins-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('F', 13, ANALOG)>; /* DFSDM_DATA3 */
> +				};
> +			};
> +
>   			ethernet0_rgmii_pins_a: rgmii-0 {
>   				pins1 {
>   					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
> 
