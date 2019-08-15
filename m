From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: Mark WCSS clocks protected
Date: Thu, 15 Aug 2019 14:45:37 +0200
Message-ID: <20190815124537.GA14491@centauri>
References: <20190814030942.2638-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814030942.2638-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 08:09:42PM -0700, Bjorn Andersson wrote:
> '7d0c76bdf227 ("clk: qcom: Add WCSS gcc clock control for QCS404")'
> introduces two new clocks to gcc. These are not used before
> clk_disable_unused() and as such the clock framework tries to disable
> them.
> 
> But on the EVB these registers are only accessible through TrustZone, so
> these clocks must be marked as "protected" to prevent the clock code
> from touching them.
> 
> Numerical values are used as the constants are not yet available in a
> common tree.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 2289b01ee9f0..501a7330dbc8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -61,7 +61,9 @@
>  	protected-clocks = <GCC_BIMC_CDSP_CLK>,
>  			   <GCC_CDSP_CFG_AHB_CLK>,
>  			   <GCC_CDSP_BIMC_CLK_SRC>,
> -			   <GCC_CDSP_TBU_CLK>;
> +			   <GCC_CDSP_TBU_CLK>,
> +			   <141>, /* GCC_WCSS_Q6_AHB_CLK */
> +			   <142>; /* GCC_WCSS_Q6_AXIM_CLK */
>  };
>  
>  &pms405_spmi_regulators {
> -- 
> 2.18.0
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
