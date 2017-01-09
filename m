From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 3/3] ARM: dts: stm32: enable ADC on stm32f429i-eval board
Date: Mon, 9 Jan 2017 15:48:42 +0100
Message-ID: <56abb501-7920-9b8a-2a82-35d43f40dc12@st.com>
References: <1480687022-12851-1-git-send-email-fabrice.gasnier@st.com>
 <1480687022-12851-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480687022-12851-4-git-send-email-fabrice.gasnier@st.com>
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
> Enable analog to digital converter on stm32f429i-eval board.
> It has on-board potentimeter wired to ADC3 in8 analog pin and
> uses fixed regulator to provide reference voltage.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  arch/arm/boot/dts/stm32429i-eval.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 13c7cd2..6be0a24 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -65,6 +65,20 @@
>  		serial0 = &usart1;
>  	};
>
> +	regulators {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reg_vref: regulator@0 {
> +			compatible = "regulator-fixed";
> +			reg = <0>;
> +			regulator-name = "vref";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		green {
> @@ -123,3 +137,14 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
> +
> +&adc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&adc3_in8_pin>;
> +	vref-supply = <&reg_vref>;
> +	status = "okay";
> +	adc3: adc@200 {
> +		st,adc-channels = <8>;
> +		status = "okay";
> +	};
> +};
>
After node reordering:

Applied on stm32-dt-for-v4.11

Thanks
Alex
