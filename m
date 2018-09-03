From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8996: Add a default compatible
 string
Date: Mon, 3 Sep 2018 12:27:28 -0700
Message-ID: <20180903192728.GF3456@tuxbook-pro>
References: <20180829125803.11227-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180829125803.11227-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 29 Aug 05:58 PDT 2018, Niklas Cassel wrote:

> Add a default compatible string.
> This compatible is defined in Documentation/devicetree/bindings/arm/qcom.txt
> and matches how it's done in arch/arm64/boot/dts/qcom/msm8916.dtsi
> 
> Usually the dts overrides this compatible property, however, if the dts
> doesn't specify a compatible, this compatible string will be used.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

I think we should just say that the board dts must specify a compatible.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index cd3865e7a270..354d3f900f72 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -17,6 +17,7 @@
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. MSM8996";
> +	compatible = "qcom,msm8996";
>  
>  	interrupt-parent = <&intc>;
>  
> -- 
> 2.17.1
> 
