From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: msm8996: Add SMP2P and APCS nodes
Date: Thu, 20 Oct 2016 13:03:04 -0700
Message-ID: <20161020200304.GP7509@tuxbot>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
 <1476989765-7524-4-git-send-email-spjoshi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476989765-7524-4-git-send-email-spjoshi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 20 Oct 11:56 PDT 2016, Sarangdhar Joshi wrote:

> Add SMP2P and APCS DT nodes required for Qualcomm ADSP
> Peripheral Image Loader.
> 

Nice, two (very) small nits below. But other than that

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0a810f5..3edb56b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -169,6 +169,31 @@
>  		method = "smc";
>  	};
>  
> +	smp2p-adsp {

Sorry for bikeshedding, but on msm8916 I named these {subsystem}-smp2p,
so I would prefer this was naemd adsp-smp2p...

> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +
> +		interrupt-parent = <&intc>;

I believe this node inherit intc as interrupt-parent from the root
already, is there are reason why you need to specify it.

> +		interrupts = <0 158 IRQ_TYPE_EDGE_RISING>;
> +
> +		qcom,ipc = <&apcs 16 10>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		adsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,state-cells = <1>;
> +		};
> +
> +		adsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	smem {
>  		compatible = "qcom,smem";
>  
> @@ -205,6 +230,11 @@
>  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		apcs: syscon@9820000 {
> +			compatible = "syscon";
> +			reg = <0x9820000 0x1000>;
> +		};
> +
>  		gcc: clock-controller@300000 {
>  			compatible = "qcom,gcc-msm8996";
>  			#clock-cells = <1>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
