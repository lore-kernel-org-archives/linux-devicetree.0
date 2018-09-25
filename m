From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: phy: Document cadence Sierra PHY
 bindings
Date: Tue, 25 Sep 2018 16:01:54 -0500
Message-ID: <20180925210154.GA21444@bogus>
References: <1536244949-25892-1-git-send-email-adouglas@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536244949-25892-1-git-send-email-adouglas@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Douglas <adouglas@cadence.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2018 at 03:42:29PM +0100, Alan Douglas wrote:
> Add DT binding documentation for Sierra PHY.  The PHY supports
> a number of different protocols, including PCIe and USB.
> 
> The PHY lanes may be configured as single or multi-lane links.
> Each link is treated as a separate subnode.  For example, if
> there are 4 lanes in total the first 2 may be configured as
> a multi-lane PCIe link while the other two are single lane
> USB links, and in this case there would be 3 subnodes.
> 
> There are two resets for the PHY block, and additional resets,
> one for each lane.  For multi-lane links, only the reset for
> the master lane is required, the resets on other lanes have no
> effect.
> 
> Signed-off-by: Alan Douglas <adouglas@cadence.com>
> ---
>  .../devicetree/bindings/phy/cdns-sierra-phy.txt    | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt b/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
> new file mode 100644
> index 0000000..94a8a7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
> @@ -0,0 +1,65 @@
> +Cadence Sierra PHY
> +-----------------------
> +
> +Required properties:
> +- compatible:	cdns,sierra-phy-t0
> +- clocks:	Must contain an entry in clock-names.
> +		See ../clocks/clock-bindings.txt for details.
> +- clock-names:	Must be "phy_clk"
> +- resets:	Must contain an entry for each in reset-names.
> +		See ../reset/reset.txt for details.
> +- reset-names:	Must include "sierra_reset" and "sierra_apb" and one for each
> +		sub-node.
> +		"sierra_reset" must control the reset line to the PHY.
> +		"sierra_apb" must control the reset line to the APB PHY
> +		interface.
> +		Resets for each subnode must control the master lane for the
> +		subnode lane group.

What are the names?

> +- reg:		register range for the PHY.
> +- reg-names:	Must be "reg".

Kind of pointless with only 1.

> +- #address-cells: Should be 1
> +- #size-cells:	Should be 0
> +
> +Optional properties:
> +- cdns,autoconf:	If present, indicates that the PHY registers will
> +			be configured by hardware.  If not present, all
> +			sub-node optional properties must be provided.

boolean?

> +
> +Sub-nodes:
> +  Each group of PHY lanes with a single master lane should be represented as
> +  a sub-node. Note that the actual configuration of each lane is determined by
> +  hardware strapping, and must match the configuration specified here.
> +
> +Sub-node required properties:
> +- #phy-cells:	Generic PHY binding; must be 0.
> +
> +Sub-node optional properties:
> +- reg:			The master lane number.
> +- cdns,num-lanes:	Number of lanes in this group.  From 1 to 4.
> +- cdns,phy-type:	Can be PHY_TYPE_PCIE or PHY_TYPE_USB3, depending on
> +			configuration of lanes.
> +
> +Example:
> +	pcie_phy4: pcie-phy4@fd240000 {

pcie-phy@fd240000

> +		compatible = "cdns,sierra-phy-t0";
> +		reg = <0x0 0xfd240000 0x0 0x40000>;
> +		reg-names = "reg";
> +		resets = <&phyrst 0>, <&phyrst 1>,<&phyrst 2>,<&phyrst 4>;
> +		reset-names = "sierra_reset","sierra_apb","pcie_phy0",pcie_phy1;

spaces and quotes missing.

> +		clocks = <&phyclock>;
> +		clock-names = "phy_clk";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pcie0_phy0: pcie-phy0@0 {

pcie-phy@0

> +				reg = <0>;
> +				cdns,num-lanes = <2>;
> +				#phy-cells = <0>;
> +				cdns,phy-type = <PHY_TYPE_PCIE>;
> +		};
> +		pcie0_phy1: pcie-phy1@0 {

pcie-phy@2

Or reg should be 1?

> +				reg = <2>;
> +				cdns,num-lanes = <1>;
> +				#phy-cells = <0>;
> +				cdns,phy-type = <PHY_TYPE_PCIE>;
> +		};
> +
> -- 
> 1.9.0
> 
