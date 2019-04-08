From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: msm8998: Add rpmpd node
Date: Mon, 08 Apr 2019 13:42:49 +0530
Message-ID: <deadb7d1da072e4c351605c653181099@codeaurora.org>
References: <20190327123832.11566-1-sibis@codeaurora.org>
 <20190327123832.11566-10-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327123832.11566-10-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-03-27 18:08, Sibi Sankar wrote:
> Add the rpmpd node on the msm8998 and define the available levels.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3fd0769fe648..b7e3e0646b9b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8998.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/gpio/gpio.h>
> 
>  / {
> @@ -272,6 +273,56 @@
>  				compatible = "qcom,rpmcc-msm8998", "qcom,rpmcc";
>  				#clock-cells = <1>;
>  			};
> +
> +			rpmpd: power-controller {
> +				compatible = "qcom,msm8998-rpmpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmpd_opp_table>;
> +
> +				rpmpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmpd_opp_ret: opp1 {
> +						opp-level = <RPM_SMD_LEVEL_RETENTION>;
> +					};
> +
> +					rpmpd_opp_ret_plus: opp2 {
> +						opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
> +					};
> +
> +					rpmpd_opp_min_svs: opp3 {
> +						opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
> +					};
> +
> +					rpmpd_opp_low_svs: opp4 {
> +						opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
> +					};
> +


typo in opp5 - opp10 rpmhpd/rpmpd
will fix it in the next re-spin

> +					rpmhpd_opp_svs: opp5 {
> +						opp-level = <RPM_SMD_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_plus: opp6 {
> +						opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
> +					};
> +
> +					rpmhpd_opp_nom: opp7 {
> +						opp-level = <RPM_SMD_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_plus: opp8 {
> +						opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp9 {
> +						opp-level = <RPM_SMD_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_plus: opp10 {
> +						opp-level = <RPM_SMD_LEVEL_BINNING>;
> +					};
> +				};
> +			};
>  		};
>  	};

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
