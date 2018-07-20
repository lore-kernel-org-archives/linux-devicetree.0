Return-Path: <SRS0=xiHA=KE=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH V2 11/25] dt-bindings: PCI: qcom,ar7240: adds binding doc
References: <20180720115842.8406-1-john@phrozen.org>
 <20180720115842.8406-12-john@phrozen.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <dddf28c5-f70f-871f-0072-ea9e09f3a410@cogentembedded.com>
Date: Fri, 20 Jul 2018 19:11:05 +0300
MIME-Version: 1.0
In-Reply-To: <20180720115842.8406-12-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: John Crispin <john@phrozen.org>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/20/2018 02:58 PM, John Crispin wrote:

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
> +- #address-cells: set to <3>
> +- #size-cells: set to <2>
> +- ranges: ranges for the PCI memory and I/O regions
> +- interrupt-map-mask and interrupt-map: standard PCI
> +	properties to define the mapping of the PCIe interface to interrupt
> +	numbers.
> +- #interrupt-cells: set to <1>
> +- interrupt-parent: phandle to the MIPS IRQ controller
> +
> +Optional properties:
> +- interrupt-controller: define to enable the builtin IRQ cascade.
> +
> +* Example for qca9557
> +	pcie-controller@180c0000 {

   Just "pcie@180c0000".

> +		compatible = "qcom,ar7240-pci";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		bus-range = <0x0 0x0>;

   Not described above.

> +		reg = <0x180c0000 0x1000>,
> +		      <0x180f0000 0x100>,
> +		      <0x14000000 0x1000>;
> +		reg-names = "crp_base", "ctrl_base", "cfg_base";
> +		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x04000000
> +			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
> +		interrupt-parent = <&intc2>;
> +		interrupts = <1>;

   Not described also.

[...]

MBR, Sergei
