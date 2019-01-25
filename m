From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sdm845: Update PIL region
 memory map
Date: Fri, 25 Jan 2019 23:10:47 +0530
Message-ID: <d8bb5a09037835e07838ab6996eb01ed@codeaurora.org>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey Bjorn,

On 2019-01-22 11:21, Bjorn Andersson wrote:
> Update existing and add all missing PIL regions to the reserved memory
> map, as described in version 10.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - New patch
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0ec827394e92..cdcac3704c13 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -89,12 +89,47 @@
>  		};

Shouldn't we add hyp and xbl regions
as well?

> 
>  		memory@86200000 {
> -			reg = <0 0x86200000 0 0x2d00000>;
> +			reg = <0 0x86200000 0 0x100000>;
>  			no-map;
>  		};
> 
> -		wlan_msa_mem: memory@96700000 {
> -			reg = <0 0x96700000 0 0x100000>;
> +		memory@86300000 {
> +			reg = <0 0x86300000 0 0x4800000>;

from v10 I see we don't need to reserve the
last 28M it just needs to be

reg = <0 0x86300000 0 0x2c00000>;

> +			no-map;
> +		};
> +
> +		memory@8ab00000 {
> +			reg = <0 0x8ab00000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		memory@8bf00000 {
> +			reg = <0 0x8bf00000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@8c400000 {
> +			reg = <0 0x8c400000 0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@8c410000 {
> +			reg = <0 0x8c410000 0 0x5000>;
> +			no-map;
> +		};
> +
> +		memory@8c415000 {
> +			reg = <0 0x8c415000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8c500000 {
> +			reg = <0 0x8c500000 0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		wlan_msa_mem: memory@8df00000 {
> +			reg = <0 0x8df00000 0 0x100000>;
>  			no-map;
>  		};
> 
> @@ -103,10 +138,30 @@
>  			no-map;
>  		};
> 
> +		venus_mem: memory@95800000 {
> +			reg = <0 0x95800000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@95d00000 {
> +			reg = <0 0x95d00000 0 0x800000>;
> +			no-map;
> +		};
> +
>  		mba_region: memory@96500000 {

should we re-name mba_region/mpss_region
to mba_mem and mpss_mem for consistency.

>  			reg = <0 0x96500000 0 0x200000>;
>  			no-map;
>  		};
> +
> +		slpi_mem: memory@96700000 {
> +			reg = <0 0x96700000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@97b00000 {
> +			reg = <0 0x97b00000 0 0x100000>;
> +			no-map;
> +		};
>  	};
> 
>  	cpus {

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
