From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8998: Add USB-related nodes
Date: Tue, 15 Jan 2019 10:44:12 -0800
Message-ID: <20190115184412.GH28907@builder>
References: <1547483851-5519-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547483851-5519-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Jan 08:37 PST 2019, Jeffrey Hugo wrote:

> Add nodes for USB and related PHYs.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 22 ++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 92 +++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 50e9033..dc703fc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -257,3 +257,25 @@
>  	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
>  	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
>  };
> +
> +&usb1 {
> +	status = "okay";
> +};
> +
> +&usb1_dwc3 {
> +	dr_mode = "host"; /* Force to host until we have Type-C hooked up */
> +};
> +
> +&usb1_hsphy {
> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l12a_1p8>;
> +	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> +};
> +
> +&usb1_qmpphy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l2a_1p2>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 8d41b69..706b303 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -540,6 +540,11 @@
>  			reg = <0x780000 0x621c>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			qusb2_hstx_trim: hstx-trim@423a {
> +				reg = <0x423a 0x1>;
> +				bits = <0 4>;
> +			};
>  		};
>  
>  		gcc: clock-controller@100000 {
> @@ -607,6 +612,93 @@
>  			#mbox-cells = <1>;
>  		};
>  
> +		usb1: usb@a8f8800 {
> +			compatible = "qcom,msm8998-dwc3", "qcom,dwc3";
> +			reg = <0xa8f8800 0x400>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_AXI_CLK>,
> +				 <&gcc GCC_USB30_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE1_USB3_AXI_CLK>,
> +				 <&gcc GCC_USB30_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB30_SLEEP_CLK>;
> +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> +				      "sleep";
> +
> +			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <120000000>;
> +
> +			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq", "ss_phy_irq";
> +
> +			power-domains = <&gcc USB_30_GDSC>;
> +
> +			resets = <&gcc GCC_USB_30_BCR>;
> +
> +			usb1_dwc3: dwc3@a800000 {
> +				compatible = "snps,dwc3";
> +				reg = <0xa800000 0xcd00>;
> +				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				phys = <&usb1_hsphy>, <&usb1_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,has-lpm-erratum;
> +				snps,hird-threshold = /bits/ 8 <0x10>;
> +			};
> +		};
> +
> +		usb1_qmpphy: phy@c010000 {
> +			compatible = "qcom,msm8998-qmp-usb3-phy";
> +			reg = <0xc010000 0x18c>;
> +			status = "disabled";
> +			#clock-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
> +				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +				 <&gcc GCC_USB3_CLKREF_CLK>;
> +			clock-names = "aux", "cfg_ahb", "ref";
> +
> +			resets = <&gcc GCC_USB3_PHY_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			usb1_ssphy: lane@c010200 {
> +				reg = <0xc010200 0x128>,
> +				      <0xc010400 0x200>,
> +				      <0xc010c00 0x20c>,
> +				      <0xc010600 0x128>,
> +				      <0xc010800 0x200>;
> +				#phy-cells = <0>;
> +				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
> +				clock-names = "pipe0";
> +				clock-output-names = "usb3_phy_pipe_clk_src";
> +			};
> +		};
> +
> +		usb1_hsphy: phy@c012000 {
> +			compatible = "qcom,msm8998-qusb2-phy";
> +			reg = <0xc012000 0x2a8>;
> +			status = "disabled";
> +			#phy-cells = <0>;
> +
> +			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +				 <&gcc GCC_RX1_USB2_CLKREF_CLK>;
> +			clock-names = "cfg_ahb", "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			nvmem-cells = <&qusb2_hstx_trim>;
> +		};
> +
>  		sdhc2: sdhci@c0a4900 {
>  			compatible = "qcom,sdhci-msm-v4";
>  			reg = <0xc0a4900 0x314>, <0xc0a4000 0x800>;
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
