From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Thu, 22 Dec 2016 15:16:48 -0600
Message-ID: <20161222211633.ldk3ykqiat6peyw7@rob-hp-laptop>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482253431-23160-2-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2016 at 10:33:48PM +0530, Vivek Gautam wrote:
> Qualcomm chipsets have QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller.
> Adding dt binding information for the same.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> 
> Changes since v2:
>  - Removed binding for "ref_clk_src" since we don't request this
>    clock in the driver.
>  - Addressed s/vdda-phy-dpdm/vdda-phy-dpdm-supply.
>  - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
>  - Addressed s/tune2_hstx_trim_efuse/tune2_hstx_trim. Don't need to add
>    'efuse' suffix to nvmem cell.
>  - Addressed s/qusb2phy/phy for the node name.
> 
> Changes since v1:
>  - New patch, forked out of the original driver patch:
>    "phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips"
>  - Updated dt bindings to remove 'hstx-trim-bit-offset' and
>    'hstx-trim-bit-len' bindings.
> 
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> new file mode 100644
> index 000000000000..594f2dcd12dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -0,0 +1,53 @@
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
> + - resets: a list of phandles and reset controller specifier pairs,
> +	   one for each entry in reset-names.
> + - reset-names: must be "phy" for reset of phy block.

-names is pointless when only one.

> +
> +Optional properties:
> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
> +		tuning parameters for qusb2 phy, one for each entry
> +		in nvmem-cell-names.
> + - nvmem-cell-names: must be "tune2_hstx_trim" for cell containing
> +		     HS Tx trim value.

ditto.

With those dropped,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
