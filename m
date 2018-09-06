From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: msm8916: Drop model and compatible
Date: Thu, 6 Sep 2018 08:55:58 -0700
Message-ID: <20180906155558.GB3286@tuxbook-pro>
References: <20180905183517.9390-1-niklas.cassel@linaro.org>
 <20180905183517.9390-3-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905183517.9390-3-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 05 Sep 11:35 PDT 2018, Niklas Cassel wrote:

> DTS board files should always specify model and compatible.
> 
> All DTS board files that includes msm8916.dtsi
> already specifies model and compatible, and will thus
> override the model and compatible in msm8916.dtsi.
> 
> Drop model and compatible from msm8916.dtsi,
> since they are only a source of confusion.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 7b32b8990d62..726a45960742 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -18,9 +18,6 @@
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> -	model = "Qualcomm Technologies, Inc. MSM8916";
> -	compatible = "qcom,msm8916";
> -
>  	interrupt-parent = <&intc>;
>  
>  	#address-cells = <2>;
> -- 
> 2.17.1
> 
