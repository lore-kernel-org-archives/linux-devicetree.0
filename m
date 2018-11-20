From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 22/25] dt-bindings: pci: Add NXP Layerscape SoCs PCIe
 Gen4 controller
Date: Tue, 20 Nov 2018 11:31:38 +0000
Message-ID: <HE1PR0401MB223529A482909A952F38352CE8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-23-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-23-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>

> -----Original Message-----
> From: Z.q. Hou
> Sent: Tuesday, November 20, 2018 5:28 PM
> To: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> l.subrahmanya@mobiveil.co.in; shawnguo@kernel.org; Leo Li
> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.com;
> catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Mingkai Hu <mingkai.hu@nxp.com>; M.h. Lian
> <minghuan.lian@nxp.com>; Xiaowei Bao <xiaowei.bao@nxp.com>; Z.q. Hou
> <zhiqiang.hou@nxp.com>
> Subject: [PATCHv2 22/25] dt-bindings: pci: Add NXP Layerscape SoCs PCIe
> Gen4 controller
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> Add PCIe Gen4 controller DT bindings of NXP Layerscape SoCs.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - Change to use the layerscape-pci.txt for PCIe Gen4 controller
>    dt-bindings
>=20
>  .../bindings/pci/layerscape-pci.txt           | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 65 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index 66df1e81e0b8..3ef8836b6e97 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -1,4 +1,6 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Freescale Layerscape PCIe controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  This PCIe host controller is based on the Synopsys DesignWare PCIe IP  a=
nd
> thus inherits all the common properties defined in designware-pcie.txt.
> @@ -58,3 +60,58 @@ Example:
>  				<0000 0 0 3 &gic GIC_SPI 190
> IRQ_TYPE_LEVEL_HIGH>,
>  				<0000 0 0 4 &gic GIC_SPI 192
> IRQ_TYPE_LEVEL_HIGH>;
>  	};
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +NXP Layerscape PCIe Gen4 controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This PCIe controller is based on the Mobiveil PCIe IP and thus inherits
> +all the common properties defined in mobiveil-pcie.txt.
> +
> +Required properties:
> +- compatible: should contain the platform identifier such as:
> +  "fsl,lx2160a-pcie"
> +- reg: base addresses and lengths of the PCIe controller register blocks=
.
> +  "config_axi_slave": PCIe controller registers
> +  "csr_axi_slave": Bridge config registers
> +- interrupts: A list of interrupt outputs of the controller. Must
> +contain an
> +  entry for each entry in the interrupt-names property.
> +- interrupt-names: It could include the following entries:
> +  "intr": The interrupt that is asserted for controller interrupts
> +  "aer": Asserted for aer interrupt when chip support the aer interrupt =
with
> +	 none MSI/MSI-X/INTx mode,but there is interrupt line for aer.
> +  "pme": Asserted for pme interrupt when chip support the pme interrupt
> with
> +	 none MSI/MSI-X/INTx mode,but there is interrupt line for pme.
> +- dma-coherent: Indicates that the hardware IP block can ensure the
> +coherency
> +  of the data transferred from/to the IP block. This can avoid the
> +software
> +  cache flush/invalid actions, and improve the performance significantly=
.
> +- msi-parent : See the generic MSI binding described in
> +  Documentation/devicetree/bindings/interrupt-controller/msi.txt.
> +
> +Example:
> +
> +	pcie@3400000 {
> +		compatible =3D "fsl,lx2160a-pcie";
> +		reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller
> registers */
> +		       0x80 0x00000000 0x0 0x00001000>; /* configuration
> space */
> +		reg-names =3D "csr_axi_slave", "config_axi_slave";
> +		interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* AER
> interrupt */
> +			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME
> interrupt */
> +			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /*
> controller interrupt */
> +		interrupt-names =3D "aer", "pme", "intr";
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		device_type =3D "pci";
> +		apio-wins =3D <8>;
> +		ppio-wins =3D <8>;
> +		dma-coherent;
> +		bus-range =3D <0x0 0xff>;
> +		msi-parent =3D <&its>;
> +		ranges =3D <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0
> 0x40000000>;
> +		#interrupt-cells =3D <1>;
> +		interrupt-map-mask =3D <0 0 0 7>;
> +		interrupt-map =3D <0000 0 0 1 &gic 0 0 GIC_SPI 109
> IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 2 &gic 0 0 GIC_SPI 110
> IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 3 &gic 0 0 GIC_SPI 111
> IRQ_TYPE_LEVEL_HIGH>,
> +				<0000 0 0 4 &gic 0 0 GIC_SPI 112
> IRQ_TYPE_LEVEL_HIGH>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 084d225583e0..b59763e23392 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11405,6 +11405,14 @@ L:	linux-arm-kernel@lists.infradead.org
>  S:	Maintained
>  F:	drivers/pci/controller/dwc/*layerscape*
>=20
> +PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER
> +M:	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> +L:	linux-pci@vger.kernel.org
> +L:	linux-arm-kernel@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +F:	drivers/pci/controller/mobibeil/pci-layerscape-gen4.c
> +
>  PCI DRIVER FOR GENERIC OF HOSTS
>  M:	Will Deacon <will.deacon@arm.com>
>  L:	linux-pci@vger.kernel.org
> --
> 2.17.1
