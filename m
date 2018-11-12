Return-Path: <robherring2@gmail.com>
Message-ID: <5bea0ed8.1c69fb81.8715.38b2@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108070449.23572-2-shawn.guo@linaro.org>
Date: Mon, 12 Nov 2018 13:24:51 -0600
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 08, 2018 at 03:04:48PM +0800, Shawn Guo wrote:
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

SoC specific compatible?

> +
> +- reg:
> +    Value type: <prop-encoded-array>
> +    Definition: USB PHY base address and length of the register map.
> +
> +- #phy-cells:
> +    Value type: <u32>
> +    Definition: Should be 0.
> +
> +- clocks:
> +    Value type: <prop-encoded-array>
> +    Definition: See clock-bindings.txt section "consumers". List of
> +		three clock specifiers for reference, phy core and
> +		sleep clocks.
> +
> +- clock-names:
> +    Value type: <string>
> +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
> +		property. Must contain "ref", "phy" and "sleep".
> +
> +- resets:
> +    Value type: <prop-encoded-array>
> +    Definition: See reset.txt section "consumers". PHY reset specifiers
> +		for phy core and POR resets.
> +
> +- reset-names:
> +    Value type: <string>
> +    Definition: Names of the resets in 1-1 correspondence with the "resets"
> +		property. Must contain "phy" and "por".
> +
> +- vdd-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the regulator VDD supply node.
> +
> +- vdda1p8-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the regulator 1.8V supply node.
> +
> +- vdda3p3-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the regulator 3.3V supply node.
> +
> +- qcom,vdd-voltage-level:
> +    Value type: <prop-array>
> +    Definition: This is a list of three integer values <no min max> where
> +		each value corresponding to voltage corner in uV.
> +
> +Optional properties:
> +
> +- extcon:
> +    Value type: <prop-encoded-array>
> +    Definition: Should contain the vbus extcon.

Don't use extcon for new bindings. Use usb-connector binding.

> +
> +- qcom,init-seq:
> +    Value type: <u32 array>
> +    Definition: Should contain a sequence of <offset value delay> tuples to
> +                program 'value' into phy register at 'offset' with 'delay'
> +		in us afterwards.

If we wanted this type of thing in DT, we'd have a generic binding (or 
forth). This should probably be split between SoC specific settings in 
the driver and board properties in DT.

Rob
