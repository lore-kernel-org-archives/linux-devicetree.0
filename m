From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: phy-qcom-usb2: Update bindings for
 sdm845
Date: Sun, 18 Mar 2018 07:52:52 -0500
Message-ID: <20180318033421.bicewbj3s5wenuis@rob-hp-laptop>
References: <1521193500-4696-1-git-send-email-mgautam@codeaurora.org>
 <1521193500-4696-6-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521193500-4696-6-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 16, 2018 at 03:14:58PM +0530, Manu Gautam wrote:
> Update compatible strings for USB2 PHYs on sdm845.
> There are two QUSB2 PHYs present on sdm845. Few PHY registers
> programming is different for these PHYs related to electrical
> parameters, otherwise both are same.

Register locations are different or tuning values are different? For the 
latter, is that something that could be DT properties?

> 
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 42c9742..20deaeb 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,7 +6,9 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>  	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> -	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
> +	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY,
> +	       "qcom,sdm845-1-qusb2-phy" for primary PHY on sdm845,
> +	       "qcom,sdm845-2-qusb2-phy" for secondary PHY on sdm845.
>  
>   - reg: offset and length of the PHY register set.
>   - #phy-cells: must be 0.
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
