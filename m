From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 5/6] dt-bindings: phy-qcom-usb2: Update bindings for
 sdm845
Date: Tue, 20 Mar 2018 15:53:00 +0530
Message-ID: <229f884f-e349-9e2d-86fb-6f4d69608814@codeaurora.org>
References: <1521193500-4696-1-git-send-email-mgautam@codeaurora.org>
 <1521193500-4696-6-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521193500-4696-6-git-send-email-mgautam@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Manu,


On 3/16/2018 3:14 PM, Manu Gautam wrote:
> Update compatible strings for USB2 PHYs on sdm845.
> There are two QUSB2 PHYs present on sdm845. Few PHY registers
> programming is different for these PHYs related to electrical
> parameters, otherwise both are same.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 42c9742..20deaeb 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,7 +6,9 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>   Required properties:
>    - compatible: compatible list, contains
>   	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> -	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
> +	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY,
> +	       "qcom,sdm845-1-qusb2-phy" for primary PHY on sdm845,
> +	       "qcom,sdm845-2-qusb2-phy" for secondary PHY on sdm845.

Thanks for the patch.

"qcom,sdm845-1/2-qusb2-phy" gives an impression that it is different versions of SoC,
and not like two numbers of phy.
May be - "qcom,sdm845-qusb2-phy-1/2"

Regards
Vivek
  

>   
>    - reg: offset and length of the PHY register set.
>    - #phy-cells: must be 0.
