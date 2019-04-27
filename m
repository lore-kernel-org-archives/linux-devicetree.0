From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs404: Add turingcc node
Date: Sat, 27 Apr 2019 13:47:59 +0530
Message-ID: <20190427081759.GH28103@vkoul-mobl>
References: <20190324172016.1195-1-bjorn.andersson@linaro.org>
 <20190324172016.1195-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190324172016.1195-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 24-03-19, 10:20, Bjorn Andersson wrote:
> Add a node describing the Turing Clock Controller of the QCS404. Given
> the default access restriction the node is left disabled.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 298a6053c3e0..f62cd09d965e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +#include <dt-bindings/clock/qcom,turingcc-qcs404.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  
>  / {
> @@ -264,6 +265,17 @@
>  		ranges = <0 0 0 0xffffffff>;
>  		compatible = "simple-bus";
>  
> +		turingcc: clock-controller@800000 {
> +			compatible = "qcom,qcs404-turingcc";
> +			reg = <0x00800000 0x30000>;
> +			clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +
> +			status = "disabled";
> +		};
> +
>  		rpm_msg_ram: memory@60000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x00060000 0x6000>;
> -- 
> 2.18.0

-- 
~Vinod
