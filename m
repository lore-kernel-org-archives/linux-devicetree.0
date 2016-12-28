From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: Add support for QMP phy
Date: Wed, 28 Dec 2016 15:04:12 -0800
Message-ID: <20161228230412.GC17126@codeaurora.org>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-4-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482253431-23160-4-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/20, Vivek Gautam wrote:
> +
> +Example:
> +	pcie_phy: phy@34000 {
> +		compatible = "qcom,msm8996-qmp-pcie-phy";
> +		reg = <0x034000 0x48f>,
> +			<0x035000 0x5bf>,
> +			<0x036000 0x5bf>,
> +			<0x037000 0x5bf>;
> +				/* tx, rx, pcs */
> +		lane-offsets = <0x0 0x200 0x400>;
> +		#phy-cells = <1>;
> +
> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
> +			<&gcc GCC_PCIE_CLKREF_CLK>,
> +			<&gcc GCC_PCIE_0_PIPE_CLK>,
> +			<&gcc GCC_PCIE_1_PIPE_CLK>,
> +			<&gcc GCC_PCIE_2_PIPE_CLK>;
> +		clock-names = "aux", "cfg_ahb", "ref",
> +				"pipe0", "pipe1", "pipe2";

Can we add a #clock-cells = <0> or <1> here given that this is a
clk provider? We may want to express the clk circular dependency
between this phy node and GCC via the clocks property at some
point instead of doing it implicitly via strings in C code.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
