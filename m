From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 14/17] arm64: dts: qcom: qcs404: add prng-ee node
Date: Mon, 5 Nov 2018 11:10:57 -0800
Message-ID: <20181105191057.GS2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-15-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-15-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> RNG hardware in QCS404 features (Execution Environment) EE for
> HLOS to use, add the node for prng-ee for QCS404.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index b560ab6e49ff..a37930639b8d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -282,6 +282,13 @@
>  			#mbox-cells = <1>;
>  		};
>  
> +		rng: rng@e3000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0x000e3000 0x1000>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,qcs404-pinctrl";
>  			reg = <0x01000000 0x200000>,
> -- 
> 2.14.4
> 
