From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: meson: add DT bindings for Amlogic
 Meson PCIe Phy controller
Date: Tue, 14 Aug 2018 16:50:12 -0600
Message-ID: <20180814225012.GA19305@rob-hp-laptop>
References: <1534227134-151584-1-git-send-email-hanjie.lin@amlogic.com>
 <1534227134-151584-2-git-send-email-hanjie.lin@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534227134-151584-2-git-send-email-hanjie.lin@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hanjie Lin <hanjie.lin@amlogic.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@amlogic.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, shawn.lin@rock-chips.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 02:12:13AM -0400, Hanjie Lin wrote:
> From: Yue Wang <yue.wang@amlogic.com>

Subject should be "dt-bindings: phy: ..."

> The Meson-PCIE-PHY controller supports the 5-Gbps data rate
> of the PCI Express Gen 2 specification and is backwardcompatible

space                                                   ^

> with the 2.5-Gbps Gen 1.1 specification with only
> inferred idle detection supported on AMLOGIC SoCs.

AMLOGIC or Amlogic? 

> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-pcie-phy.txt        | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt b/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
> new file mode 100644
> index 0000000..db99085
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-pcie-phy.txt
> @@ -0,0 +1,31 @@
> +* Amlogic Meson AXG PCIE PHY binding
> +
> +Required properties:
> +- compatible:	Should be
> +	- "amlogic,axg-pcie-phy"
> +- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)

You don't need to distinguish port A and B?

> +- reg:		The base address and length of the registers
> +- resets:	phandle to the reset lines
> +- reset-names:	must contain "phy" and "peripheral"
> +	- "port_a" Port A reset
> +	- "port_b" Port B reset
> +	- "phy"	PHY reset
> +	- "apb"	APB reset
> +Optional properties:
> +- phy-supply:	see phy-bindings.txt in this directory
> +
> +Example:
> +	pcie_phy: pcie-phy@ff644000 {
> +		#phy-cells = <0>;
> +		compatible = "amlogic,axg-pcie-phy";
> +		reg = <0x0 0xff644000 0x0 0x2000>;
> +		resets = <&reset RESET_PCIE_A>,
> +				<&reset RESET_PCIE_B>,
> +				<&reset RESET_PCIE_PHY>,
> +				<&reset RESET_PCIE_APB>;
> +		reset-names =
> +				"port_a",
> +				"port_b",
> +				"phy",
> +				"apb";
> +	};
> -- 
> 2.7.4
> 
