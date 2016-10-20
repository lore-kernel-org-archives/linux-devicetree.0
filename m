From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: msm8996: Add SMEM DT nodes
Date: Thu, 20 Oct 2016 12:56:29 -0700
Message-ID: <20161020195629.GM7509@tuxbot>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
 <1476989765-7524-3-git-send-email-spjoshi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476989765-7524-3-git-send-email-spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 20 Oct 11:56 PDT 2016, Sarangdhar Joshi wrote:

> From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Add SMEM and TCSR DT nodes on MSM8996.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 949b096..0a810f5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -169,12 +169,31 @@
>  		method = "smc";
>  	};
>  
> +	smem {
> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_mem>;
> +
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
>  		compatible = "simple-bus";
>  
> +		tcsr_mutex_regs: syscon@740000 {
> +			compatible = "syscon";
> +			reg = <0x740000 0x20000>;
> +		};
> +
> +		tcsr_mutex: hwlock {
> +			compatible = "qcom,tcsr-mutex";
> +			syscon = <&tcsr_mutex_regs 0 0x1000>;
> +			#hwlock-cells = <1>;
> +		};

Sorry, I got this in the wrong place, the hwlock node should sit outside
of soc {} - looks like we got this wrong in msm8916 as well.

Regards,
Bjorn

> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "arm,gic-v3";
>  			#interrupt-cells = <3>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
