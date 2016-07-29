From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Add sdhci1 node
Date: Fri, 29 Jul 2016 09:27:53 -0700
Message-ID: <20160729162753.GY13516@tuxbot>
References: <20160720062610.20822-1-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160720062610.20822-1-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 19 Jul 23:26 PDT 2016, Bhushan Shah wrote:

> This introduces the eMMC sdhci node and its pinctrl state
> 
> Signed-off-by: Bhushan Shah <bshah@kde.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index 68f071f..947bd7f 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -233,6 +233,35 @@
>  		status = "ok";
>  	};
>  
> +	pinctrl@fd510000 {
> +		sdhc1_pin_a: sdhc1-pin-active {
> +			clk {
> +				pins = "sdc1_clk";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			cmd-data {
> +				pins = "sdc1_cmd", "sdc1_data";
> +				drive-strength = <10>;
> +				bias-pull-up;
> +			};
> +		};
> +	};
> +
> +	sdhci@f9824900 {
> +		status = "ok";
> +
> +		vmmc-supply = <&pm8941_l20>;
> +		vqmmc-supply = <&pm8941_s3>;
> +
> +		bus-width = <8>;
> +		non-removable;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdhc1_pin_a>;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		input-name = "gpio-keys";
> -- 
> 2.9.0
> 
