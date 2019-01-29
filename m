From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY
 bindings
Date: Tue, 29 Jan 2019 12:38:45 -0800
Message-ID: <20190129203845.GB3036@builder>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548761715-4004-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548761715-4004-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org, shawn.guo@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 29 Jan 03:35 PST 2019, Jorge Ramirez-Ortiz wrote:

> Binding description for Qualcomm's Synopsys 1.0.0 super-speed PHY

SuperSpeed

> controller embedded in QCS404.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> definitions.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../devicetree/bindings/usb/qcom,usb-ssphy.txt     | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> new file mode 100644
> index 0000000..8ef6e39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> @@ -0,0 +1,73 @@
> +Qualcomm Synopsys 1.0.0 SS phy controller
> +===========================================
> +
> +Synopsys 1.0.0 ss phy controller supports SS usb connectivity on Qualcomm
> +chipsets

It's based on Synopsys IP, but it's Qualcomm's version, and isn't the
1.0.0 Qualcomm's version number for this block?

Also I think it "provides SuperSpeed USB connectivity on some Qualcomm
platforms".

> +
> +Required properties:
> +
> +- compatible:
> +    Value type: <string>
> +    Definition: Should contain "qcom,usb-ssphy".
> +
> +- reg:
> +    Value type: <prop-encoded-array>
> +    Definition: USB PHY base address and length of the register map.
> +
> +- #phy-cells:
> +    Value type: <u32>
> +    Definition: Should be 0. See phy/phy-bindings.txt for details.
> +
> +- clocks:
> +    Value type: <prop-encoded-array>
> +    Definition: See clock-bindings.txt section "consumers". List of
> +		 three clock specifiers for reference, phy core and
> +		 pipe clocks.
> +
> +- clock-names:
> +    Value type: <string>
> +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
> +		 property. Must contain "ref", "phy" and "pipe".
> +
> +- vdd-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the regulator VDD supply node.
> +
> +- vdda1p8-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the regulator 1.8V supply node.
> +
> +
> +Optional child nodes:
> +
> +- vbus-supply:
> +    Value type: <phandle>
> +    Definition: phandle to the VBUS supply node.
> +
> +- resets:
> +    Value type: <prop-encoded-array>
> +    Definition: See reset.txt section "consumers". PHY reset specifiers
> +		 for phy core and COR resets.
> +
> +- reset-names:
> +    Value type: <string>
> +    Definition: Names of the resets in 1-1 correspondence with the "resets"
> +		 property. Must contain "com" and "phy".

Perhaps "Must contain both com and phy, if property is specified", to
clarify that it's all or nothing.


Looks good otherwise.

Regards,
Bjorn
