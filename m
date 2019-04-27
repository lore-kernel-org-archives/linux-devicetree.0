From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Fully describe the CDSP
Date: Sat, 27 Apr 2019 13:49:30 +0530
Message-ID: <20190427081930.GI28103@vkoul-mobl>
References: <20190324172016.1195-1-bjorn.andersson@linaro.org>
 <20190324172016.1195-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190324172016.1195-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 24-03-19, 10:20, Bjorn Andersson wrote:

It would have been great to explain the change and why we are moving the
node :)

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 88 ++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index f62cd09d965e..c20425aa9ed9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -113,37 +113,6 @@
>  		};
>  	};
>  
> -	remoteproc_cdsp: remoteproc-cdsp {
> -		compatible = "qcom,qcs404-cdsp-pas";
> -
> -		interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
> -				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> -				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> -				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> -				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> -		interrupt-names = "wdog", "fatal", "ready",
> -				  "handover", "stop-ack";
> -
> -		clocks = <&xo_board>;
> -		clock-names = "xo";
> -
> -		memory-region = <&cdsp_fw_mem>;
> -
> -		qcom,smem-states = <&cdsp_smp2p_out 0>;
> -		qcom,smem-state-names = "stop";
> -
> -		status = "disabled";
> -
> -		glink-edge {
> -			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
> -
> -			qcom,remote-pid = <5>;
> -			mboxes = <&apcs_glb 12>;
> -
> -			label = "cdsp";
> -		};
> -	};
> -
>  	remoteproc_wcss: remoteproc-wcss {
>  		compatible = "qcom,qcs404-wcss-pas";
>  
> @@ -288,6 +257,57 @@
>  			clock-names = "core";
>  		};
>  
> +		remoteproc_cdsp: remoteproc@b00000 {
> +			compatible = "qcom,qcs404-cdsp-pas";
> +			reg = <0x00b00000 0x4040>;
> +
> +			interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&xo_board>,
> +				 <&gcc GCC_CDSP_CFG_AHB_CLK>,
> +				 <&gcc GCC_CDSP_TBU_CLK>,
> +				 <&gcc GCC_BIMC_CDSP_CLK>,
> +				 <&turingcc TURING_WRAPPER_AON_CLK>,
> +				 <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
> +				 <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
> +				 <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
> +			clock-names = "xo",
> +				      "sway",
> +				      "tbu",
> +				      "bimc",
> +				      "ahb_aon",
> +				      "q6ss_slave",
> +				      "q6ss_master",
> +				      "q6_axim";
> +
> +			resets = <&gcc GCC_CDSP_RESTART>;
> +			reset-names = "restart";
> +
> +			qcom,halt-regs = <&tcsr 0x19004>;
> +
> +			memory-region = <&cdsp_fw_mem>;
> +
> +			qcom,smem-states = <&cdsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
> +
> +				qcom,remote-pid = <5>;
> +				mboxes = <&apcs_glb 12>;
> +
> +				label = "cdsp";
> +			};
> +		};
> +
>  		usb3_phy: phy@78000 {
>  			compatible = "qcom,usb-ssphy";
>  			reg = <0x78000 0x400>;
> @@ -506,6 +526,7 @@
>  			compatible = "qcom,gcc-qcs404";
>  			reg = <0x01800000 0x80000>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;

Shouldn't this be a separate patch?

>  
>  			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
>  			assigned-clock-rates = <19200000>;
> @@ -516,6 +537,11 @@
>  			reg = <0x01905000 0x20000>;
>  		};
>  
> +		tcsr: syscon@1937000 {
> +			compatible = "syscon";
> +			reg = <0x01937000 0x25000>;
> +		};
> +

This too..

>  		spmi_bus: spmi@200f000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg = <0x0200f000 0x001000>,
> -- 
> 2.18.0

-- 
~Vinod
