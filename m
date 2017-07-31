From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: phy: qmp: Add support for QMP phy in
 IPQ8074
Date: Mon, 31 Jul 2017 11:20:05 +0530
Message-ID: <55f7f87f-0302-c4a5-af9b-280c6c473943@codeaurora.org>
References: <1501479594-18285-1-git-send-email-varada@codeaurora.org>
 <1501479594-18285-3-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501479594-18285-3-git-send-email-varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/31/2017 11:09 AM, Varadarajan Narayanan wrote:
> IPQ8074 uses QMP phy controller that provides support to PCIe and
> USB. Adding dt binding information for the same.
>
> Signed-off-by: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---

Reviewed-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

>   Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 5d7a51f..802af1b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -6,6 +6,7 @@ controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>   
>   Required properties:
>    - compatible: compatible list, contains:
> +	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>   	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>   	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
>   
> @@ -38,6 +39,8 @@ Required properties:
>   		 "phy", "common", "cfg".
>   		For "qcom,msm8996-qmp-usb3-phy" must contain
>   		 "phy", "common".
> +		For "qcom,ipq8074-qmp-pcie-phy" must contain:
> +		 "phy", "common".
>   
>    - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>    - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> @@ -63,6 +66,11 @@ Required properties for child node:
>    - clock-output-names: Name of the phy clock that will be the parent for
>   		       the above pipe clock.
>   
> +	For "qcom,ipq8074-qmp-pcie-phy":
> +		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
> +			(or)
> +		  "pcie20_phy1_pipe_clk"
> +
>    - resets: a list of phandles and reset controller specifier pairs,
>   	   one for each entry in reset-names.
>    - reset-names: Must contain following for pcie qmp phys:

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
