From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Tue, 4 Apr 2017 11:28:39 -0700
Message-ID: <20170404182839.GE18246@codeaurora.org>
References: <1490018046-8549-1-git-send-email-vivek.gautam@codeaurora.org>
 <1490018046-8549-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490018046-8549-2-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/20, Vivek Gautam wrote:
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> new file mode 100644
> index 000000000000..a6d19acde9e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -0,0 +1,45 @@
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
> +			"ref" for 19.2 MHz ref clk,
> +			"iface" for phy interface clock (Optional).
> +
> + - vdd-phy-supply: Phandle to a regulator supply to PHY core block.
> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> + - vdda-phy-dpdm-supply: Phandle to 3.1V regulator supply to Dp/Dm port signals.
> +
> + - resets: Phandle to reset to phy block.
> +
> +Optional properties:
> + - nvmem-cells: Phandle to nvmem cell that contains 'HS Tx trim'
> +		tuning parameter value for qusb2 phy.
> +
> + - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
> +
> +Example:
> +	hsusb_phy: phy@7411000 {
> +		compatible = "qcom,msm8996-qusb2-phy";
> +		reg = <0x7411000 0x180>;
> +		#phy-cells = <0>;
> +
> +		clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +			<&gcc GCC_RX1_USB2_CLKREF_CLK>,
> +		clock-names = "cfg_ahb", "ref";
> +
> +		vdd-phy-supply = <&pm8994_s2>;

pm8994_s2 is a "corner" regulator. I'm not sure how we're going
to have it listed here as something like a regulator supply in
the binding. We probably should leave it out for now and let the
power domain + pm_qos stuff for corners work out. From what I see
in the downstream driver the code is setting the corner to '4'
when active, and '1' when inactive.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
