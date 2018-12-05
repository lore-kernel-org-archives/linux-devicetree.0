From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 22/25] dt-bindings: pci: Add NXP Layerscape SoCs PCIe
 Gen4 controller
Date: Wed, 5 Dec 2018 16:38:43 -0600
Message-ID: <20181205223843.GA2125@bogus>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-23-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120092615.11680-23-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 09:27:51AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add PCIe Gen4 controller DT bindings of NXP Layerscape SoCs.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - Change to use the layerscape-pci.txt for PCIe Gen4 controller
>    dt-bindings

Sorry someone suggested this, but it seems there's no point in having 
these in the same file. New IP block, do a new file.

> 
>  .../bindings/pci/layerscape-pci.txt           | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index 66df1e81e0b8..3ef8836b6e97 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -1,4 +1,6 @@
> +====================================
>  Freescale Layerscape PCIe controller
> +====================================
>  
>  This PCIe host controller is based on the Synopsys DesignWare PCIe IP
>  and thus inherits all the common properties defined in designware-pcie.txt.
> @@ -58,3 +60,58 @@ Example:
>  				<0000 0 0 3 &gic GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
>  				<0000 0 0 4 &gic GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> +
> +===================================
> +NXP Layerscape PCIe Gen4 controller
> +===================================
> +
> +This PCIe controller is based on the Mobiveil PCIe IP and thus inherits all
> +the common properties defined in mobiveil-pcie.txt.
> +
> +Required properties:
> +- compatible: should contain the platform identifier such as:
> +  "fsl,lx2160a-pcie"
> +- reg: base addresses and lengths of the PCIe controller register blocks.
> +  "config_axi_slave": PCIe controller registers
> +  "csr_axi_slave": Bridge config registers

Wouldn't 'config' and 'csr' be sufficient? And these should be listed 
under reg-names.

> +- interrupts: A list of interrupt outputs of the controller. Must contain an
> +  entry for each entry in the interrupt-names property.
> +- interrupt-names: It could include the following entries:
> +  "intr": The interrupt that is asserted for controller interrupts
> +  "aer": Asserted for aer interrupt when chip support the aer interrupt with
> +	 none MSI/MSI-X/INTx mode,but there is interrupt line for aer.
> +  "pme": Asserted for pme interrupt when chip support the pme interrupt with
> +	 none MSI/MSI-X/INTx mode,but there is interrupt line for pme.
> +- dma-coherent: Indicates that the hardware IP block can ensure the coherency
> +  of the data transferred from/to the IP block. This can avoid the software
> +  cache flush/invalid actions, and improve the performance significantly.
> +- msi-parent : See the generic MSI binding described in
> +  Documentation/devicetree/bindings/interrupt-controller/msi.txt.
> +
> +Example:
> +
> +	pcie@3400000 {
> +		compatible = "fsl,lx2160a-pcie";
> +		reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> +		       0x80 0x00000000 0x0 0x00001000>; /* configuration space */
> +		reg-names = "csr_axi_slave", "config_axi_slave";

The order should match what's defined above.

Also, normally the config space would be the bigger region unless config 
accesses are windowed.

> +		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +		interrupt-names = "aer", "pme", "intr";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		device_type = "pci";
> +		apio-wins = <8>;
> +		ppio-wins = <8>;

If these have specific values on your h/w, please specify above.

> +		dma-coherent;
> +		bus-range = <0x0 0xff>;
> +		msi-parent = <&its>;
> +		ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
> +		#interrupt-cells = <1>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +	};
