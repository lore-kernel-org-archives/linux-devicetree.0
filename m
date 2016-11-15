From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: apq8064: add support to pm8821
Date: Mon, 14 Nov 2016 21:19:41 -0800
Message-ID: <20161115051941.GA28340@tuxbot>
References: <1479145933-9849-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1479145933-9849-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479145933-9849-2-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Nov 09:52 PST 2016, Srinivas Kandagatla wrote:

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Bjorn

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 268bd47..c61ba32 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -627,6 +627,33 @@
>  			clock-names = "core";
>  		};
>  
> +		ssbi@c00000 {
> +			compatible = "qcom,ssbi";
> +			reg = <0x00c00000 0x1000>;
> +			qcom,controller-type = "pmic-arbiter";
> +
> +			pm8821: pmic@1 {
> +				compatible = "qcom,pm8821";
> +				interrupt-parent = <&tlmm_pinmux>;
> +				interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				pm8821_mpps: mpps@50 {
> +					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
> +					reg = <0x50>;
> +					interrupts = <24 IRQ_TYPE_NONE>,
> +						     <25 IRQ_TYPE_NONE>,
> +						     <26 IRQ_TYPE_NONE>,
> +						     <27 IRQ_TYPE_NONE>;
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +		                };
> +			};
> +		};
> +
>  		qcom,ssbi@500000 {
>  			compatible = "qcom,ssbi";
>  			reg = <0x00500000 0x1000>;
> -- 
> 2.10.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
