From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: pm8916: fix wcd_codec indentation
Date: Thu, 9 Nov 2017 08:49:41 -0800
Message-ID: <20171109164941.GZ28761@minitux>
References: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
 <20171101175335.22123-2-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101175335.22123-2-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 01 Nov 10:53 PDT 2017, Damien Riegel wrote:

> Indentation did not respect kernel standards, so fix that for the usual
> indent with tabs, align with spaces. While at it, remove some empty
> lines before and after the closing parenthesis of this block.
> 
> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 82 ++++++++++++++++++------------------
>  1 file changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 53deebf9f515..d19f4cb9a5f3 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -96,47 +96,45 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -                wcd_codec: codec@f000 {
> -                       compatible = "qcom,pm8916-wcd-analog-codec";
> -	               reg = <0xf000 0x200>;
> -	               reg-names = "pmic-codec-core";
> -	               clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
> -	               clock-names = "mclk";
> -	               interrupt-parent = <&spmi_bus>;
> -	               interrupts = <0x1 0xf0 0x0 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x1 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x2 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x3 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x4 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x5 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x6 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf0 0x7 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x0 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x1 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x2 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x3 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x4 IRQ_TYPE_NONE>,
> -	                            <0x1 0xf1 0x5 IRQ_TYPE_NONE>;
> -	               interrupt-names = "cdc_spk_cnp_int",
> -	                                 "cdc_spk_clip_int",
> -	                                 "cdc_spk_ocp_int",
> -	                                 "mbhc_ins_rem_det1",
> -	                                 "mbhc_but_rel_det",
> -	                                 "mbhc_but_press_det",
> -	                                 "mbhc_ins_rem_det",
> -	                                 "mbhc_switch_int",
> -	                                 "cdc_ear_ocp_int",
> -	                                 "cdc_hphr_ocp_int",
> -	                                 "cdc_hphl_ocp_det",
> -	                                 "cdc_ear_cnp_int",
> -	                                 "cdc_hphr_cnp_int",
> -	                                 "cdc_hphl_cnp_int";
> -	               vdd-cdc-io-supply = <&pm8916_l5>;
> -	               vdd-cdc-tx-rx-cx-supply = <&pm8916_l5>;
> -	               vdd-micbias-supply = <&pm8916_l13>;
> -	               #sound-dai-cells = <1>;
> -
> -                };
> -
> +		wcd_codec: codec@f000 {
> +			compatible = "qcom,pm8916-wcd-analog-codec";
> +			reg = <0xf000 0x200>;
> +			reg-names = "pmic-codec-core";
> +			clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
> +			clock-names = "mclk";
> +			interrupt-parent = <&spmi_bus>;
> +			interrupts = <0x1 0xf0 0x0 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x1 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x2 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x3 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x4 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x5 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x6 IRQ_TYPE_NONE>,
> +				     <0x1 0xf0 0x7 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x0 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x1 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x2 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x3 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x4 IRQ_TYPE_NONE>,
> +				     <0x1 0xf1 0x5 IRQ_TYPE_NONE>;
> +			interrupt-names = "cdc_spk_cnp_int",
> +					  "cdc_spk_clip_int",
> +					  "cdc_spk_ocp_int",
> +					  "mbhc_ins_rem_det1",
> +					  "mbhc_but_rel_det",
> +					  "mbhc_but_press_det",
> +					  "mbhc_ins_rem_det",
> +					  "mbhc_switch_int",
> +					  "cdc_ear_ocp_int",
> +					  "cdc_hphr_ocp_int",
> +					  "cdc_hphl_ocp_det",
> +					  "cdc_ear_cnp_int",
> +					  "cdc_hphr_cnp_int",
> +					  "cdc_hphl_cnp_int";
> +			vdd-cdc-io-supply = <&pm8916_l5>;
> +			vdd-cdc-tx-rx-cx-supply = <&pm8916_l5>;
> +			vdd-micbias-supply = <&pm8916_l13>;
> +			#sound-dai-cells = <1>;
> +		};
>  	};
>  };
> -- 
> 2.15.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
