From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: msm8996: Drop model
Date: Thu, 6 Sep 2018 08:56:14 -0700
Message-ID: <20180906155614.GC3286@tuxbook-pro>
References: <20180905183517.9390-1-niklas.cassel@linaro.org>
 <20180905183517.9390-4-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905183517.9390-4-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 05 Sep 11:35 PDT 2018, Niklas Cassel wrote:

> DTS board files should always specify model and compatible.
> 
> All DTS board files that includes msm8996.dtsi
> already specifies model and compatible, and will thus
> override the model and compatible in msm8996.dtsi.
> 
> Drop model from msm8916.dtsi, since it is only a source of confusion.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index cd3865e7a270..b4d635bb81ac 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -16,8 +16,6 @@
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  
>  / {
> -	model = "Qualcomm Technologies, Inc. MSM8996";
> -
>  	interrupt-parent = <&intc>;
>  
>  	#address-cells = <2>;
> -- 
> 2.17.1
> 
