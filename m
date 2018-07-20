Return-Path: <SRS0=xiHA=KE=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH V2 09/25] dt-bindings: PCI: qcom,ar7100: adds binding doc
References: <20180720115842.8406-1-john@phrozen.org>
 <20180720115842.8406-10-john@phrozen.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f09ceb04-be84-a9ee-b383-d4314e4662d5@cogentembedded.com>
Date: Fri, 20 Jul 2018 18:51:40 +0300
MIME-Version: 1.0
In-Reply-To: <20180720115842.8406-10-john@phrozen.org>
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
>  .../devicetree/bindings/pci/qcom,ar7100-pci.txt    | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> new file mode 100644
> index 000000000000..10085dd1cd11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
> @@ -0,0 +1,38 @@
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
> +- interrupt-controller: define to enable the builtin IRQ cascade.
> +
> +Optional properties:
> +- interrupt-parent: phandle to the MIPS IRQ controller
> +
> +* Example for ar7100
> +	pcie-controller@180c0000 {
> +		compatible = "qca,ar7100-pci";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		bus-range = <0x0 0x0>;

   Not documented above.

> +		reg = <0x17010000 0x100>;
> +		reg-names = "cfg_base";
> +		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x07000000
> +			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <2>;

   Not documented above.

[...]

MBR, Sergei
