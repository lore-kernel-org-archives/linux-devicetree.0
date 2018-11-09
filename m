From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Fri, 9 Nov 2018 10:38:19 +0530
Message-ID: <20181109050819.GK12092@vkoul-mobl>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-2-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108070449.23572-2-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08-11-18, 15:04, Shawn Guo wrote:
> From: Sriharsha Allenki <sallenki@codeaurora.org>
> 
> It adds bindings for Synopsys 28nm femto phy controller that supports
> LS/FS/HS usb connectivity on Qualcomm chipsets.
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> new file mode 100644
> index 000000000000..75e7a09dd558
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> @@ -0,0 +1,101 @@
> +Qualcomm Synopsys 28nm Femto phy controller
> +===========================================
> +
> +Synopsys 28nm femto phy controller supports LS/FS/HS usb connectivity on
> +Qualcomm chipsets.
> +
> +Required properties:
> +
> +- compatible:
> +    Value type: <string>
> +    Definition: Should contain "qcom,usb-snps-hsphy".
> +
> +- reg:
> +    Value type: <prop-encoded-array>
> +    Definition: USB PHY base address and length of the register map.
> +
> +- #phy-cells:
> +    Value type: <u32>
> +    Definition: Should be 0.

I dont quite understand the definition that it should be 0, maybe you
mean allowed value is 0, if so why have this property?

-- 
~Vinod
