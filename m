From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: fix l3 min voltage
Date: Fri, 26 Apr 2019 21:53:11 -0700
Message-ID: <20190427045311.GF3137@builder>
References: <20190425123402.18167-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425123402.18167-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 25 Apr 05:34 PDT 2019, Niklas Cassel wrote:

> The current l3 min voltage level is not supported by
> the regulator (the voltage is not a multiple of the regulator step size),
> so a driver requesting this exact voltage would fail, see discussion in:
> https://patchwork.kernel.org/comment/22461199/
> 
> It was agreed upon to set a min voltage level that is a multiple of the
> regulator step size.
> 
> There was actually a patch sent that did this:
> https://patchwork.kernel.org/patch/10819313/
> 
> However, the commit 331ab98f8c4a ("arm64: dts: qcom: qcs404:
> Fix voltages l3") that was applied is not identical to that patch.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Thanks for spotting and sorting this out, picked up.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 6910fc663fe1..9a7d930dcd23 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -118,7 +118,7 @@
>  		};
>  
>  		vreg_l3_1p05: l3 {
> -			regulator-min-microvolt = <1050000>;
> +			regulator-min-microvolt = <1048000>;
>  			regulator-max-microvolt = <1160000>;
>  		};
>  
> -- 
> 2.20.1
> 
