From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8916: add bindings for i2c1,
 i2c3, i2c5
Date: Thu, 9 Nov 2017 09:00:16 -0800
Message-ID: <20171109170016.GC28761@minitux>
References: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
 <20171101175335.22123-5-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101175335.22123-5-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 01 Nov 10:53 PDT 2017, Damien Riegel wrote:

I think it's better to use the word "nodes" (add nodes...)

> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 72 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi      | 45 +++++++++++++++++++
>  2 files changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> index c67ad8ed8b60..1cec5b30ed6e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> @@ -270,6 +270,30 @@
>  		};
>  	};
>  
> +	i2c1_default: i2c1_default {
> +		pinmux {
> +			function = "blsp_i2c1";
> +			pins = "gpio2", "gpio3";
> +		};
> +		pinconf {
> +			pins = "gpio2", "gpio3";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};

pinconf is typically board specific, so please leave these out from the
base dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index de25bd6070f5..bdc4cb6f66d4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -455,6 +455,21 @@
>  			status = "disabled";
>  		};
>  
> +		blsp_i2c1: i2c@78b5000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b5000 0x600>;

Size is 0x500.

> +			interrupts = <GIC_SPI 95 0>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c1_default>;
> +			pinctrl-1 = <&i2c1_sleep>;

Please omit the pinctrl-* properties from the base dtsi (when it's not
hard coded things for the platform).

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp_i2c2: i2c@78b6000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x078b6000 0x600>;

Otherwise this looks good!

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
