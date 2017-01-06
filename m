From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [RESEND PATCH v1] ARM: dts: stm32f429: Add missing USART3 pin
 config to STM32F469I-DISCO board
Date: Fri, 6 Jan 2017 17:34:29 +0100
Message-ID: <97600913-7d3e-8096-3bfa-431c70a949dc@st.com>
References: <20161118151033.30592-1-bmh@certi.org.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161118151033.30592-1-bmh@certi.org.br>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Meirelles Herrera <bruherrera@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bruno,

On 11/18/2016 04:10 PM, Bruno Meirelles Herrera wrote:
> Including new STM32 maintainer. Rebased at stm32-dt-for-v4.10-1 and
> stm32-dt-for-v4.10-2 branches. It fix the port/pin initialization in
> case boot-loader does not configure/initialize the pins.
> Fixing line wrapping from last patch
>
> This patch adds USART3 pin configuration on PB10/PA11 pins
> for STM32F469I-DISCO board.
>
> Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
> ---
>  arch/arm/boot/dts/stm32f429.dtsi      | 13 +++++++++++++
>  arch/arm/boot/dts/stm32f469-disco.dts |  2 ++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index e4dae0e..1b8b105 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -316,6 +316,19 @@
>  				};
>  			};
>
> +			usart3_pins_a: usart3@0 {
> +				pins1 {
> +					pinmux = <STM32F429_PB10_FUNC_USART3_TX>;
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32F429_PB11_FUNC_USART3_RX>;
> +					bias-disable;
> +				};
> +			};
> +
>  			usbotg_hs_pins_a: usbotg_hs@0 {
>  				pins {
>  					pinmux = <STM32F429_PH4_FUNC_OTG_HS_ULPI_NXT>,
> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> index 8877c00..75f4303 100644
> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> @@ -79,5 +79,7 @@
>  };
>
>  &usart3 {
> +	pinctrl-0 = <&usart3_pins_a>;
> +	pinctrl-names = "default";
>  	status = "okay";
>  };
>
After a little cosmetic change in commit header:

Applied on stm32-dt-for-v4.11-1

Thanks!
Alex
