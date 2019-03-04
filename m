From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix regulator supply names
Date: Mon, 4 Mar 2019 20:23:55 +0100
Message-ID: <20190304192355.GA13754@centauri.lan>
References: <20181213183200.3204-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213183200.3204-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 13, 2018 at 10:32:00AM -0800, Bjorn Andersson wrote:
> The regulator definition got their supply names cleaned up during
> upstreaming, so they no longer match the driver defined names. Update
> the supply names.
> 
> Also fill out the missing voltage of SMPS 5.
> 
> Fixes: 0b363f5b871c ("arm64: dts: qcom: qcs404: Add PMS405 RPM regulators")
> Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 28 ++++++++++++------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index a39924efebe4..d6cc3a96530e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -37,18 +37,18 @@
>  	pms405-regulators {
>  		compatible = "qcom,rpm-pms405-regulators";
>  
> -		vdd-s1-supply = <&vph_pwr>;
> -		vdd-s2-supply = <&vph_pwr>;
> -		vdd-s3-supply = <&vph_pwr>;
> -		vdd-s4-supply = <&vph_pwr>;
> -		vdd-s5-supply = <&vph_pwr>;
> -		vdd-l1-l2-supply = <&vreg_s5_1p35>;
> -		vdd-l3-l8-supply = <&vreg_s5_1p35>;
> -		vdd-l4-supply = <&vreg_s5_1p35>;
> -		vdd-l5-l6-supply = <&vreg_s4_1p8>;
> -		vdd-l7-supply = <&vph_pwr>;
> -		vdd-l9-supply = <&vreg_s5_1p35>;
> -		vdd-l10-l11-l12-l13-supply = <&vph_pwr>;
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_l1_l2-supply = <&vreg_s5_1p35>;
> +		vdd_l3_l8-supply = <&vreg_s5_1p35>;
> +		vdd_l4-supply = <&vreg_s5_1p35>;
> +		vdd_l5_l6-supply = <&vreg_s4_1p8>;
> +		vdd_l7-supply = <&vph_pwr>;
> +		vdd_l9-supply = <&vreg_s5_1p35>;
> +		vdd_l10_l11_l12_l13-supply = <&vph_pwr>;
>  
>  		vreg_s4_1p8: s4 {
>  			regulator-min-microvolt = <1728000>;
> @@ -56,8 +56,8 @@
>  		};
>  
>  		vreg_s5_1p35: s5 {
> -			regulator-min-microvolt = <>;
> -			regulator-max-microvolt = <>;
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
>  		};
>  
>  		vreg_l1_1p3: l1 {
> -- 
> 2.18.0
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
