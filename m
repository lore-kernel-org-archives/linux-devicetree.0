From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Mon, 28 Nov 2016 08:19:44 -0600
Message-ID: <20161128141944.4sfptmymh5kcpcwm@rob-hp-laptop>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479816163-5260-2-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: kishon@ti.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 05:32:40PM +0530, Vivek Gautam wrote:
> Qualcomm chipsets have QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller.
> Adding dt binding information for the same.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
> 
> Changes since v1:
>  - New patch, forked out of the original driver patch:
>    "phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips"
>  - Updated dt bindings to remove 'hstx-trim-bit-offset' and
>    'hstx-trim-bit-len' bindings.
> 
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> new file mode 100644
> index 0000000..38c8b30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -0,0 +1,55 @@
> +Qualcomm QUSB2 phy controller
> +=============================
> +
> +QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +Required properties:
> + - compatible: compatible list, contains "qcom,msm8996-qusb2-phy".
> + - reg: offset and length of the PHY register set.
> + - #phy-cells: must be 0.
> +
> + - clocks: a list of phandles and clock-specifier pairs,
> +	   one for each entry in clock-names.
> + - clock-names: must be "cfg_ahb" for phy config clock,
> +			"ref_clk" for 19.2 MHz ref clk,
> +			"ref_clk_src" reference clock source.
> +			"iface" for phy interface clock (Optional).
> +
> + - vdd-phy-supply: Phandle to a regulator supply to PHY core block.
> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> + - vdda-phy-dpdm: Phandle to 3.1V regulator supply to Dp/Dm port signals.

Needs '-supply'

> +
> + - resets: a list of phandles and reset controller specifier pairs,
> +	   one for each entry in reset-names.
> + - reset-names: must be "phy" for reset of phy block.
> +
> +Optional properties:
> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
> +		tuning parameters for qusb2 phy, one for each entry
> +		in nvmem-cell-names.
> + - nvmem-cell-names: must be "tune2_hstx_trim_efuse" for cell containing
> +		     HS Tx trim value.
> +
> + - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
> +
> +Example:
> +	hsphy: qusb2phy@7411000 {

usb-phy@...

> +		compatible = "qcom,msm8996-qusb2-phy";
> +		reg = <0x07411000 0x180>;
> +		#phy-cells = <0>;
> +
> +		clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +			<&gcc GCC_RX1_USB2_CLKREF_CLK>,
> +			<&rpmcc MSM8996_RPM_SMD_LN_BB_CLK>;
> +		clock-names = "cfg_ahb_clk", "ref_clk", "ref_clk_src";
> +
> +		vdd-phy-supply = <&pm8994_s2>;
> +		vdda-pll-supply = <&pm8994_l12>;
> +		vdda-phy-dpdm-supply = <&pm8994_l24>;
> +
> +		resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +		reset-names = "phy";
> +
> +		nvmem-cells = <&qusb2p_hstx_trim>;
> +		nvmem-cell-names = "tune2_hstx_trim_efuse";
> +        };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
