From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/3] ARM: dts: stm32: Add ADC support to stm32f429
Date: Mon, 9 Jan 2017 15:46:55 +0100
Message-ID: <cdfb7781-196a-ad78-45e0-53c47fe7b532@st.com>
References: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
 <1480687022-12851-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480687022-12851-3-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice GASNIER <fabrice.gasnier@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 12/02/2016 02:57 PM, Fabrice GASNIER wrote:
> Add ADC support & pinctrl analog phandle (adc3_in8) to stm32f429.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  arch/arm/boot/dts/stm32f429.dtsi | 49 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index 3dd47eb..be1d970 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -172,6 +172,49 @@
>  			status = "disabled";
>  		};
>
> +		adc: adc@40012000 {
> +			compatible = "st,stm32f4-adc-core";
> +			reg = <0x40012000 0x400>;
> +			interrupts = <18>;
> +			clocks = <&rcc 0 168>;
> +			clock-names = "adc";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			adc1: adc@0 {
> +				compatible = "st,stm32f4-adc";
> +				#io-channel-cells = <1>;
> +				reg = <0x0>;
> +				clocks = <&rcc 0 168>;
> +				interrupt-parent = <&adc>;
> +				interrupts = <0>;
> +				status = "disabled";
> +			};
> +
> +			adc2: adc@100 {
> +				compatible = "st,stm32f4-adc";
> +				#io-channel-cells = <1>;
> +				reg = <0x100>;
> +				clocks = <&rcc 0 169>;
> +				interrupt-parent = <&adc>;
> +				interrupts = <1>;
> +				status = "disabled";
> +			};
> +
> +			adc3: adc@200 {
> +				compatible = "st,stm32f4-adc";
> +				#io-channel-cells = <1>;
> +				reg = <0x200>;
> +				clocks = <&rcc 0 170>;
> +				interrupt-parent = <&adc>;
> +				interrupts = <2>;
> +				status = "disabled";
> +			};
> +		};
> +
>  		syscfg: system-config@40013800 {
>  			compatible = "syscon";
>  			reg = <0x40013800 0x400>;
> @@ -334,6 +377,12 @@
>  					slew-rate = <2>;
>  				};
>  			};
> +
> +			adc3_in8_pin: adc@200 {
> +				pins {
> +					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
> +				};
> +			};
>  		};
>
>  		rcc: rcc@40023810 {
>

Applied on stm32-dt-for-v4.11

Thanks
Alex
