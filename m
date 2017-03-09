From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: phy: Add support for QMP phy
Date: Thu, 9 Mar 2017 12:07:33 +0100
Message-ID: <20170309110733.GB53510@Bjorns-MacBook-Pro-2.local>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-4-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489050441-3240-4-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 09 Mar 10:07 CET 2017, Vivek Gautam wrote:

[..]
> +	phy@34000 {
> +		compatible = "qcom,msm8996-qmp-pcie-phy";
> +		reg = <0x034000 0x488>;

Drop the leading 0 from the address.

> +		#clock-cells = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
> +			<&gcc GCC_PCIE_CLKREF_CLK>;
> +		clock-names = "aux", "cfg_ahb", "ref";
> +
> +		vdda-phy-supply = <&pm8994_l28>;
> +		vdda-pll-supply = <&pm8994_l12>;
> +
> +		resets = <&gcc GCC_PCIE_PHY_BCR>,
> +			<&gcc GCC_PCIE_PHY_COM_BCR>,
> +			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
> +		reset-names = "phy", "common", "cfg";
> +
> +		pciephy_0: lane@0 {

The "@xyz" part should match the first value in "reg", i.e. 35000 here.

> +			reg = <0x035000 0x130>,
> +				<0x035200 0x200>,
> +				<0x035400 0x1dc>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
> +			clock-names = "pipe0";
> +			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> +			reset-names = "lane0";
> +		};
> +
> +		pciephy_1: lane@1 {
> +		...
> +		...
> +	};

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
