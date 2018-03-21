From: cang@codeaurora.org
Subject: Re: [PATCH v1 2/2] dt-bindings: phy-qcom-qmp: Update UFS phy binding
 for sdm845
Date: Wed, 21 Mar 2018 10:39:01 +0800
Message-ID: <bf4a048c379d4e0dd6e4d99e49cb1a15@codeaurora.org>
References: <20180320113051.14444-1-cang@codeaurora.org>
 <20180320113051.14444-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320113051.14444-3-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-20 19:30, Can Guo wrote:
> Update the compatible string for UFS QMP PHY on SDM845.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index cef8765..6e68a6d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -11,7 +11,8 @@ Required properties:
>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>  	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy,
>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
> -	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on 
> sdm845.
> +	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on 
> sdm845,
> +	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> 
>   - reg: offset and length of register set for PHY's common serdes 
> block.
