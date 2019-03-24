Return-Path: <SRS0=xKYj=R3=linaro.org=bjorn.andersson@kernel.org>
Date: Sun, 24 Mar 2019 09:57:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: pms405: add spmi regulators
Message-ID: <20190324165743.GI27005@builder>
References: <20190324163209.17312-1-vkoul@kernel.org>
 <20190324163209.17312-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190324163209.17312-6-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Sun 24 Mar 09:32 PDT 2019, Vinod Koul wrote:

> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> The PMS405 sports 5 SMPS and 13 LDO regulators.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index 1bb836d1e8aa..8da4dee1db9b 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -131,4 +131,24 @@
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
>  		};
>  	};
> +
> +	pms405_1: pms405@1 {
> +		compatible = "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		regulators {

Label the regulators node and keep the compatible here.  s3-supply and
pms405_s3 are board specific, so define these in the qcs404-evb.dtsi
instead.

Also double check the EVB schematics for the name of the line coming out
of S3; I would assume vdd_apc or something like that.

Regards,
Bjorn

> +			compatible = "qcom,pms405-regulators";
> +			vdd_s3-supply = <&pms405_s3>;
> +
> +			pms405_s3: s3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vdd_cpu";
> +				regulator-min-microvolt = <1048000>;
> +				regulator-max-microvolt = <1352000>;
> +			};
> +		};
> +	};
>  };
> -- 
> 2.20.1
> 
