From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Wed, 26 Oct 2016 16:16:11 -0500
Message-ID: <20161026211611.3rl7mas75ju4x77w@rob-hp-laptop>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: kishon@ti.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 04:13:46PM +0530, Vivek Gautam wrote:
> PHY transceiver driver for QUSB2 phy controller that provides
> HighSpeed functionality for DWC3 controller present on
> Qualcomm chipsets.
> 
> This driver is based on phy-msm-qusb driver available in
> msm-4.4 kernel @codeaurora[1]
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  37 ++

It's preferred the bindings are a separate patch.

>  drivers/phy/Kconfig                                |  10 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-qcom-qusb2.c                       | 577 +++++++++++++++++++++
>  4 files changed, 625 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-qusb2.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> new file mode 100644
> index 0000000..97c9ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -0,0 +1,37 @@
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
> + - qcom,hstx-trim-bit-offset: bit offset within nvmem cell for
> +			      HS Tx trim value.
> + - qcom,hstx-trim-bit-len: bit length of HS Tx trim value within nvmem cell.

When does this change? Why is it not just a different nvmem cell?

> +
> + - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
> + - qcom,phy-clk-scheme: Offset to TCSR_PHY_CLK_SCHEME_SEL register.
