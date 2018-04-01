From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: pm8941: Add vadc nodes needed to
 estimate an ocv
Date: Sun, 1 Apr 2018 15:13:40 -0700
Message-ID: <20180401221340.GF510@tuxbook-pro>
References: <20180330200408.12608-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180330200408.12608-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 30 Mar 13:04 PDT 2018, Craig Tatlor wrote:

> vbat_sns is needed to estimate a fairly accurate on chip voltage
> and bat_therm is needed to produce an accurate percentage
> from the estimated ocv.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 1d5ef55c7ee5..2515c5c217ac 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -139,6 +139,9 @@
>  			#size-cells = <0>;
>  			#io-channel-cells = <1>;
>  
> +			bat_temp {
> +				reg = <VADC_LR_MUX1_BAT_THERM>;
> +			};
>  			die_temp {
>  				reg = <VADC_DIE_TEMP>;
>  			};
> @@ -154,6 +157,9 @@
>  			ref_vdd {
>  				reg = <VADC_VDD_VADC>;
>  			};
> +			vbat_sns {
> +				reg = <VADC_VBAT_SNS>;
> +			};
>  		};
>  
>  		pm8941_iadc: iadc@3600 {
> -- 
> 2.16.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
