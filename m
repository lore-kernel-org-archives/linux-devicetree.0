From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: apq8064: add support to pm8821
Date: Tue, 8 Nov 2016 11:13:43 -0800
Message-ID: <20161108191343.GP25787@tuxbot>
References: <1478622577-20699-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1478622577-20699-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478622577-20699-2-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue 08 Nov 08:29 PST 2016, Srinivas Kandagatla wrote:

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 1dbe697..fde006c 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -627,6 +627,34 @@
>  			clock-names = "core";
>  		};
>  
> +		qcom,ssbi@c00000 {

No "qcom," in the node name.

> +			compatible = "qcom,ssbi";
> +			reg = <0x00c00000 0x1000>;
> +			qcom,controller-type = "pmic-arbiter";
> +
> +			pmicintc2: pmic@1 {

I think we should follow Linus' lead and label this "pm8821".

> +				compatible = "qcom,pm8821";
> +				interrupt-parent = <&tlmm_pinmux>;
> +				interrupts = <76 8>;

Please spell out IRQ_TYPE_LEVEL_LOW.

And interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW> combines
the two lines nicely.

> +				#interrupt-cells = <2>;
> +				interrupt-controller;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				pm8821_mpps: mpps@50 {
> +

Extra newline.

> +					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
> +					reg = <0x50>;
> +
> +					interrupts = <24 1>, <25 1>, <26 1>,
> +						     <27 1>;

I think these should be IRQ_TYPE_NONE per the discussion on how to share
interrupts between the gpio/mpp driver and other clients.

On the other hand, per the pm8821 driver we only support LEVEL_LOW
(high?).

> +
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +		                };
> +			};
> +		};
> +

Regards,
Bjorn
