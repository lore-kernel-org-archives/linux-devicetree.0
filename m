From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: phy: Add support for QMP phy
Date: Fri, 10 Mar 2017 11:43:00 +0530
Message-ID: <3f6596d9-d1e3-324c-10fb-6c3e65ba724b@codeaurora.org>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-4-git-send-email-vivek.gautam@codeaurora.org>
 <20170309110733.GB53510@Bjorns-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170309110733.GB53510-iTMlPVAvTYNoL7IsjepNBwq4bfNCki47rNQQ6b5fDX0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 03/09/2017 04:37 PM, Bjorn Andersson wrote:
> On Thu 09 Mar 10:07 CET 2017, Vivek Gautam wrote:
>
> [..]
>> +	phy@34000 {
>> +		compatible = "qcom,msm8996-qmp-pcie-phy";
>> +		reg = <0x034000 0x488>;
> Drop the leading 0 from the address.

Okay, will drop it.

>
>> +		#clock-cells = <1>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
>> +			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
>> +			<&gcc GCC_PCIE_CLKREF_CLK>;
>> +		clock-names = "aux", "cfg_ahb", "ref";
>> +
>> +		vdda-phy-supply = <&pm8994_l28>;
>> +		vdda-pll-supply = <&pm8994_l12>;
>> +
>> +		resets = <&gcc GCC_PCIE_PHY_BCR>,
>> +			<&gcc GCC_PCIE_PHY_COM_BCR>,
>> +			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
>> +		reset-names = "phy", "common", "cfg";
>> +
>> +		pciephy_0: lane@0 {
> The "@xyz" part should match the first value in "reg", i.e. 35000 here.

Right, i think this came from my older version of patches. Will correct it.

Regards
Vivek
>
>> +			reg = <0x035000 0x130>,
>> +				<0x035200 0x200>,
>> +				<0x035400 0x1dc>;
>> +			#phy-cells = <0>;
>> +
>> +			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
>> +			clock-names = "pipe0";
>> +			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
>> +			reset-names = "lane0";
>> +		};
>> +
>> +		pciephy_1: lane@1 {
>> +		...
>> +		...
>> +	};
> Regards,
> Bjorn

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
