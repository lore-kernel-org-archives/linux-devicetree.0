From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: phy-qcom-qmp: Add UFS phy compatible
 string for sdm845
Date: Mon, 9 Apr 2018 17:01:36 +0530
Message-ID: <5689c0f5-5b4f-bfff-1b22-3a76680423b0@codeaurora.org>
References: <20180327071838.11168-1-cang@codeaurora.org>
 <20180327071838.11168-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327071838.11168-3-cang@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>, subhashj@codeaurora.org, asutoshd@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 3/27/2018 12:48 PM, Can Guo wrote:
> Update the compatible string for UFS QMP PHY on SDM845.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>

Please keep all reviewed-by's, given by reviewers and maintainers, to 
your older
version of the patch unless there's a design change (major change).
I think you missed adding Rob H's reviewed-by tag.

Also,
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Thanks
Vivek
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
>   
>    - reg: offset and length of register set for PHY's common serdes block.
>   
