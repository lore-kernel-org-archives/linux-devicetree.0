From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy-qcom: Add support for msm8998 usb
Date: Tue, 15 Jan 2019 10:08:39 -0800
Message-ID: <20190115180839.GC28907@builder>
References: <1547483771-5334-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547483771-5334-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Jan 08:36 PST 2019, Jeffrey Hugo wrote:

> USB on msm8998 utilizes the QUSB2 and QMP phys, similar to sdm845.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   | 5 +++++
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 41a1074..6061b6f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>  	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
> +	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>  	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
>  	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> @@ -42,6 +43,8 @@ Required properties:
>  			"aux", "cfg_ahb", "ref".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref".
> +		For "qcom,msm8998-qmp-usb3-phy" must contain:
> +			"aux", "cfg_ahb", "ref".
>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref", "com_aux".
>  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
> @@ -60,6 +63,8 @@ Required properties:
>  		For "qcom,msm8996-qmp-pcie-phy" must contain:
>  			"phy", "common", "cfg".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain
> +		 "phy", "common".

Odd indentation.


Apart from this, you have my

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		For "qcom,msm8998-qmp-usb3-phy" must contain
>  			"phy", "common".
>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"phy", "common".
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 03025d9..fe29f9e 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,6 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>  	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> +	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
>  	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
>  
>   - reg: offset and length of the PHY register set.
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
