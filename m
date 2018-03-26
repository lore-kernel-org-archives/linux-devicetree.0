From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: phy-qcom-qmp: Add UFS phy compitable
 string for sdm845
Date: Mon, 26 Mar 2018 20:30:35 +0530
Message-ID: <20dcdb46-deda-def5-76d1-0ed5efb40a7a@codeaurora.org>
References: <20180321053720.12780-1-cang@codeaurora.org>
 <20180321053720.12780-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321053720.12780-3-cang@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>, subhashj@codeaurora.org, asutoshd@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 3/21/2018 11:07 AM, Can Guo wrote:
> Update the compatible string for UFS QMP PHY on SDM845.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index cef8765..6e68a6d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -11,7 +11,8 @@ Required properties:
>   	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>   	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy,
>   	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
> -	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
> +	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
> +	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.

We also need an entry for 'ref_aux' clock in the clock names for this phy.
Please add that.
With that,
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Thanks
Vivek.

>   
>    - reg: offset and length of register set for PHY's common serdes block.
>   
