From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
Date: Tue, 26 Mar 2019 09:59:47 -0500
Message-ID: <20190326145947.GA21213@bogus>
References: <20190226065919.22218-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226065919.22218-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 10:59:19PM -0800, Bjorn Andersson wrote:
> qcom_qmp_phy_init() is extended to support the additional register
> writes needed in PCS MISC and the appropriate sequences and resources
> are defined for SDM845.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   7 +

Please split bindings.

>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 160 ++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |  12 ++
>  3 files changed, 179 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 5d181fc3cc18..dd2725a9d3f7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -11,6 +11,7 @@ Required properties:
>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>  	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
>  	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
> +	       "qcom,sdm845-qmp-pcie-phy" for PCIe phy on sdm845,
>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>  	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
>  	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> @@ -48,6 +49,10 @@ Required properties:
>  			"aux", "cfg_ahb", "ref".
>  		For "qcom,msm8998-qmp-ufs-phy" must contain:
>  			"ref", "ref_aux".
> +		For "qcom,sdm845-qmp-usb3-phy" must contain:
> +			"aux", "cfg_ahb", "ref", "refgen".
> +		For "qcom,sdm845-qmp-usb3-phy" must contain:
> +			"aux", "cfg_ahb", "ref", "com_aux".

Copy-n-paste error?

>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref", "com_aux".
>  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
> @@ -70,6 +75,8 @@ Required properties:
>  		For "qcom,msm8998-qmp-usb3-phy" must contain
>  			"phy", "common".
>  		For "qcom,msm8998-qmp-ufs-phy": no resets are listed.
> +		For "qcom,sdm845-qmp-pcie-phy" must contain:
> +			"phy".
>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>  			"phy", "common".
>  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
