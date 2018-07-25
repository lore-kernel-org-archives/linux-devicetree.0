Return-Path: <robherring2@gmail.com>
Date: Wed, 25 Jul 2018 11:34:34 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 11/25] dt-bindings: PCI: qcom,ar7240: adds binding doc
Message-ID: <20180725173434.GA17215@rob-hp-laptop>
References: <20180720115842.8406-1-john@phrozen.org>
 <20180720115842.8406-12-john@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180720115842.8406-12-john@phrozen.org>
To: John Crispin <john@phrozen.org>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 20, 2018 at 01:58:28PM +0200, John Crispin wrote:
> With the driver being converted from platform_data to pure OF, we need to
> also add some docs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../devicetree/bindings/pci/qcom,ar7240-pci.txt    | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt
> new file mode 100644
> index 000000000000..5379affd4615
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt
> @@ -0,0 +1,42 @@
> +* Qualcomm Atheros AR724X PCI express root complex
> +
> +Required properties:
> +- compatible: should contain "qcom,ar7240-pci" to identify the core.
> +- reg: Should contain the register ranges as listed in the reg-names property.
> +- reg-names: Definition: Must include the following entries
> +	- "crp_base"	Configuration registers
> +	- "ctrl_base"	Control registers
> +	- "cfg_base"	IO Memory

'_base' is redundant.

Same question as v1 remains: IO or config space? IO space goes in ranges 
and config space goes in reg.

> +- #address-cells: set to <3>
> +- #size-cells: set to <2>
> +- ranges: ranges for the PCI memory and I/O regions
> +- interrupt-map-mask and interrupt-map: standard PCI
> +	properties to define the mapping of the PCIe interface to interrupt
> +	numbers.
> +- #interrupt-cells: set to <1>
> +- interrupt-parent: phandle to the MIPS IRQ controller

This property is implied (and could be in a parent node). Sergei pointed 
this out in v1 for the 7100.

> +
> +Optional properties:
> +- interrupt-controller: define to enable the builtin IRQ cascade.
> +
> +* Example for qca9557
> +	pcie-controller@180c0000 {

pcie@...

Also pointed out in v1...

> +		compatible = "qcom,ar7240-pci";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		bus-range = <0x0 0x0>;
> +		reg = <0x180c0000 0x1000>,
> +		      <0x180f0000 0x100>,
> +		      <0x14000000 0x1000>;
> +		reg-names = "crp_base", "ctrl_base", "cfg_base";
> +		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x04000000
> +			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
> +		interrupt-parent = <&intc2>;
> +		interrupts = <1>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-map-mask = <0 0 0 1>;
> +		interrupt-map = <0 0 0 0 &pcie0 0>;
> +	};
> -- 
> 2.11.0
> 
