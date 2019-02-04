From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy-qcom-qmp: Add
 qcom,msm8998-qmp-ufs-phy
Date: Mon, 4 Feb 2019 11:08:35 -0700
Message-ID: <5c18d9c4-a65c-1dbb-dc19-34db9717a33a@codeaurora.org>
References: <e3c82a49-c601-effc-348f-f768656c659f@free.fr>
 <73f65f2d-2137-1d2b-be19-eae77773ccc1@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73f65f2d-2137-1d2b-be19-eae77773ccc1@free.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, MSM <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, DT <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2/4/2019 10:38 AM, Marc Gonzalez wrote:
> Add compatible string for QMP UFS phy on msm8998.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>   Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 41a1074228ba..6ec278f5af86 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -9,6 +9,7 @@ Required properties:
>   	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>   	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>   	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
> +	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
>   	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>   	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
>   	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> 

I think this needs to be based on phy-next, otherwise I forsee a merge 
conflict.

Also, I would expect changes to the rest of the file as well (what 
clocks are required, etc).

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
