From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcs404: evb: Fix voltage for l3
Date: Mon, 4 Mar 2019 20:40:45 +0100
Message-ID: <20190304194045.GA14044@centauri.lan>
References: <20190219063222.15656-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219063222.15656-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 18, 2019 at 10:32:22PM -0800, Bjorn Andersson wrote:
> PMS405 L3 is outside the acceptable range, causing PCIe to fail. Fix
> this.
> 
> Fixes: 0b363f5b871c ("arm64: dts: qcom: qcs404: Add PMS405 RPM regulators")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Rebased upon https://lore.kernel.org/lkml/20181213183200.3204-1-bjorn.andersson@linaro.org/
> 
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 3a7f0d42e35a..6146f3577961 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -87,7 +87,7 @@
>  		};
>  
>  		vreg_l3_1p05: l3 {
> -			regulator-min-microvolt = <976000>;
> +			regulator-min-microvolt = <1048000>;
>  			regulator-max-microvolt = <1160000>;
>  		};
>  
> -- 
> 2.18.0
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
