From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 7/7] dt-bindings: ufshcd-pltfrm: Add core reset string
Date: Thu, 27 Sep 2018 10:06:06 -0500
Message-ID: <20180927150606.GA20771@bogus>
References: <1537504081-29976-1-git-send-email-quic_cang@quicinc.com>
 <1537504081-29976-8-git-send-email-quic_cang@quicinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537504081-29976-8-git-send-email-quic_cang@quicinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <quic_cang@quicinc.com>
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, evgreen@chromium.org, rnayak@codeaurora.org, vinholikatti@gmail.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, Can Guo <cang@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Malaterre <malat@debian.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 20, 2018 at 09:28:00PM -0700, Can Guo wrote:
> From: Can Guo <cang@codeaurora.org>
> 
> Add core reset support string for UFS.
> 
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index c39dfef..6b697c4 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -11,6 +11,11 @@ Required properties:
>  					  "qcom,ufshc"
>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>  - reg               : <registers mapping>
> +- reset             : reset specifier pair consists of phandle for the reset provider
> +                      and reset lines used by this controller. It is mandatory for
> +		      QCOM SDM845 platform.
> +- reset-names       : reset signal name strings sorted in the same order as the
> +		      resets property. It is mandatory for QCOM SDM845 platform.

This already exists as of 4.19 under optional properties. (And you can't 
add new required properties anyways.)

>  
>  Optional properties:
>  - phys                  : phandle to UFS PHY node
> @@ -64,6 +69,8 @@ Example:
>  		clocks = <&core 0>, <&ref 0>, <&iface 0>;
>  		clock-names = "core_clk", "ref_clk", "iface_clk";
>  		freq-table-hz = <100000000 200000000>, <0 0>, <0 0>;
> +		resets = <clock_gcc GCC_UFS_BCR>;
> +		reset-names = "core_reset";

And the name should be "rst" (or omitted).

>  		phys = <&ufsphy1>;
>  		phy-names = "ufsphy";
>  	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
