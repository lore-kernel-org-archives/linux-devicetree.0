From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: sd-600eval: add hdmi support
Date: Mon, 9 Jan 2017 14:22:55 +0530
Message-ID: <8d1d1c3d-2492-19e1-3c6a-912ba8ae57c2@codeaurora.org>
References: <1483536854-21389-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1483536854-21389-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483536854-21389-2-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/04/2017 07:04 PM, Srinivas Kandagatla wrote:
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Reviewed-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

> ---
>  .../arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
> index 39ae2bc..4e908af 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
> @@ -39,6 +39,17 @@
>
>  	};
>
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_out>;
> +			};
> +		};
> +	};
> +
>  	soc {
>  		rpm@108000 {
>  			regulators {
> @@ -347,5 +358,38 @@
>  				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_HIGH>;
>  			};
>  		};
> +
> +		hdmi-tx@4a00000 {
> +			status = "okay";
> +			core-vdda-supply = <&pm8921_hdmi_switch>;
> +			hdmi-mux-supply = <&vcc3v3>;
> +
> +			hpd-gpio = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
> +
> +			ports {
> +				port@1 {
> +					endpoint {
> +						remote-endpoint = <&hdmi_con>;
> +					};
> +				};
> +			};
> +		};
> +
> +		hdmi-phy@4a00400 {
> +			status = "okay";
> +			core-vdda-supply = <&pm8921_hdmi_switch>;
> +		};
> +
> +		mdp@5100000 {
> +			status = "okay";
> +
> +			ports {
> +				port@3 {
> +					endpoint {
> +						remote-endpoint = <&hdmi_in>;
> +					};
> +				};
> +			};
> +		};
>  	};
>  };
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
