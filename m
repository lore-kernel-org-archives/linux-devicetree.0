Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 16:05:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/25] dt-bindings: PCI: qcom,ar7100: adds binding doc
Message-ID: <20180703220549.GA16778@rob-hp-laptop>
References: <20180625171549.4618-1-john@phrozen.org>
 <20180625171549.4618-11-john@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625171549.4618-11-john@phrozen.org>
To: John Crispin <john@phrozen.org>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 25, 2018 at 07:15:34PM +0200, John Crispin wrote:
> With the driver being converted from platform_data to pure OF, we need to
> also add some docs.

No need to say "binding" twice in the subject.

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../devicetree/bindings/pci/qcom,ar7100-pci.txt    | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> new file mode 100644
> index 000000000000..97be7b0c4cf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> @@ -0,0 +1,36 @@
> +* Qualcomm Atheros AR7100 PCI express root complex
> +
> +Required properties:
> +- compatible: should contain "qcom,ar7100-pci" to identify the core.
> +- reg: Should contain the register ranges as listed in the reg-names property.
> +- reg-names: Definition: Must include the following entries
> +	- "cfg_base"	IO Memory
> +- #address-cells: set to <3>
> +- #size-cells: set to <2>
> +- ranges: ranges for the PCI memory and I/O regions
> +- interrupt-map-mask and interrupt-map: standard PCI
> +	properties to define the mapping of the PCIe interface to interrupt
> +	numbers.
> +- #interrupt-cells: set to <1>
> +- interrupt-parent: phandle to the MIPS IRQ controller

You can just omit this. As pointed out it can be inherited from the 
parent. 

> +- interrupt-controller: define to enable the builtin IRQ cascade.

This is mutually exclusive with interrupt-map. At least of_irq_parse_raw 
will never parse interrupt-map if it finds interrupt-controller.

> +
> +* Example for ar7100
> +	pcie0: pcie-controller@180c0000 {

pcie@...

Building your dtb with W=1 (or W=12) will tell you this.

> +		compatible = "qca,ar7100-pci";

qca or qcom as above?

> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		bus-range = <0x0 0x0>;
> +		reg = <0x17010000 0x100>;
> +		reg-names = "cfg_base";
> +		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x07000000
> +			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <2>;
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
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
