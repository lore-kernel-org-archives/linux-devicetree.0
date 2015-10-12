From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add MT8173 display PWM driver support
 node
Date: Mon, 12 Oct 2015 18:04:54 +0200
Message-ID: <561BDA26.5010203@gmail.com>
References: <1444117243-28391-1-git-send-email-yh.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444117243-28391-1-git-send-email-yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/10/15 09:40, YH Huang wrote:
> Add display PWM node in mt8173-evb.dts and mt8173.dtsi.
>
> Signed-off-by: YH Huang <yh.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts |   13 +++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi    |   22 ++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>

Applied, thanks.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 811cb76..1b3fabd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -92,6 +92,13 @@
>   };
>
>   &pio {
> +	disp_pwm0_pins: disp_pwm0_pins {
> +		pins1 {
> +			pinmux = <MT8173_PIN_87_DISP_PWM0__FUNC_DISP_PWM0>;
> +			output-low;
> +		};
> +	};
> +
>   	mmc0_pins_default: mmc0default {
>   		pins_cmd_dat {
>   			pinmux = <MT8173_PIN_57_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
> @@ -190,6 +197,12 @@
>   	};
>   };
>
> +&pwm0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&disp_pwm0_pins>;
> +	status = "okay";
> +};
> +
>   &pwrap {
>   	pmic: mt6397 {
>   		compatible = "mediatek,mt6397";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 4bce167..fd01134 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -500,6 +500,28 @@
>   			clock-names = "source", "hclk";
>   			status = "disabled";
>   		};
> +
> +		pwm0: pwm@1401e000 {
> +			compatible = "mediatek,mt8173-disp-pwm",
> +				     "mediatek,mt6595-disp-pwm";
> +			reg = <0 0x1401e000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM026M>,
> +				 <&mmsys CLK_MM_DISP_PWM0MM>;
> +			clock-names = "main", "mm";
> +			status = "disabled";
> +		};
> +
> +		pwm1: pwm@1401f000 {
> +			compatible = "mediatek,mt8173-disp-pwm",
> +				     "mediatek,mt6595-disp-pwm";
> +			reg = <0 0x1401f000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&mmsys CLK_MM_DISP_PWM126M>,
> +				 <&mmsys CLK_MM_DISP_PWM1MM>;
> +			clock-names = "main", "mm";
> +			status = "disabled";
> +		};
>   	};
>   };
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
