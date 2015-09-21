From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 12/14] ARM: dts: qs600: add pwrseq support to WLAN
Date: Mon, 21 Sep 2015 09:27:53 +0300
Message-ID: <55FFA369.9020206@compulab.co.il>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1442579525-20440-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1442579525-20440-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/18/15 15:32, Srinivas Kandagatla wrote:
> Add pwrseq support to sdcc4 which would enable a proper reset of WLAN
> without ugly hacks in the board support file.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks Srini!

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 32 +++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index 8aac3be..cc9d942 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -1,4 +1,6 @@
>  #include "qcom-apq8064-v2.0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
>  / {
>  	model = "CompuLab CM-QS600";
> @@ -12,6 +14,20 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	pwrseq {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +
> +		sdcc4_pwrseq: sdcc4_pwrseq {
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wlan_default_gpios>;
> +			compatible = "mmc-pwrseq-simple";
> +			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
>  	soc {
>  		rpm@108000 {
>  			regulators {
> @@ -154,6 +170,21 @@
>  			regulator-always-on;
>  		};
>  
> +		qcom,ssbi@500000 {
> +			pmic@0 {
> +				gpio@150 {
> +					wlan_default_gpios: wlan-gpios {
> +						pios {
> +							pins = "gpio43";
> +							function = "normal";
> +							bias-disable;
> +							power-source = <PM8921_GPIO_S4>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		amba {
>  			/* eMMC */
>  			sdcc1: sdcc@12400000 {
> @@ -172,6 +203,7 @@
>  				status = "okay";
>  				vmmc-supply = <&v3p3_fixed>;
>  				vqmmc-supply = <&v3p3_fixed>;
> +				mmc-pwrseq = <&sdcc4_pwrseq>;
>  			};
>  		};
>  	};
> 

-- 
Regards,
Igor.
