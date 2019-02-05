From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
Date: Tue, 5 Feb 2019 11:24:16 +0530
Message-ID: <20190205055416.GX4296@vkoul-mobl>
References: <20190125234509.26419-1-bjorn.andersson@linaro.org>
 <20190125234509.26419-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125234509.26419-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, David Brown <david.brown@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michael Turquette <mturquette@baylibre.com>, Niklas Cassel <niklas.cassel@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25-01-19, 15:45, Bjorn Andersson wrote:
> The Qualcomm PCIe2 PHY is a Synopsys based PCIe PHY found in a number of
> Qualcomm platforms, add a binding to describe this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/phy/qcom-pcie2-phy.txt           | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> new file mode 100644
> index 000000000000..7da02f9d78c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> @@ -0,0 +1,40 @@
> +Qualcomm PCIe2 PHY controller
> +=============================
> +
> +The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
> +platforms.
> +
> +Required properties:
> + - compatible: compatible list, should be:
> +	       "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy"
> +
> + - reg: offset and length of the PHY register set.
> + - #phy-cells: must be 0.
> +
> + - clocks: a clock-specifier pair for the "pipe" clock
> +
> + - vdda-vp-supply: phandle to low voltage regulator
> + - vdda-vph-supply: phandle to high voltage regulator
> +
> + - resets: reset-specifier pairs for the "phy" and "pipe" resets
> + - reset-names: list of resets, should contain:
> +		"phy" and "pipe"
> +
> + - clock-output-names: name of the outgoing clock signal from the PHY PLL

Should we specify the clk name here?

> +
> +Example:
> + phy@7786000 {
> +	compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
> +	reg = <0x07786000 0xb8>;
> +
> +	clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
> +	resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
> +	         <&gcc GCC_PCIE_0_PIPE_ARES>;
> +	reset-names = "phy", "pipe";
> +
> +	vdda-vp-supply = <&vreg_l3_1p05>;
> +	vdda-vph-supply = <&vreg_l5_1p8>;
> +
> +	clock-output-names = "pcie_0_pipe_clk";
> +	#phy-cells = <0>;
> + };
> -- 
> 2.18.0

-- 
~Vinod
