Return-Path: <SRS0=n0G4=QW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:13593 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfBOQYs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Feb 2019 11:24:48 -0500
From: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: PCI: microsemi: Add DT Bindings for Microsemi PCIe host controller
Date: Fri, 15 Feb 2019 16:24:23 +0000
Message-ID: <20190215162424.564-3-daire.mcnamara@microchip.com>
In-Reply-To: <20190215162424.564-1-daire.mcnamara@microchip.com>
References: <20190215162424.564-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Cc: Daire McNamara <daire.mcnamara@microchip.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds documentation for the DT bindings for Microsemi/Microchip
PolarFire PCIe controller when configured in host (Root Complex) mode.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/pci/microsemi-pcie.txt           | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/microsemi-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/microsemi-pcie.txt b/Documentation/devicetree/bindings/pci/microsemi-pcie.txt
new file mode 100644
index 000000000000..a16e48806edc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/microsemi-pcie.txt
@@ -0,0 +1,65 @@
+* Microsemi AXI PCIe Root Port Bridge DT description
+
+Required properties:
+- #address-cells: Address representation for root ports, set to <3>
+- #size-cells: Size representation for root ports, set to <2>
+- #interrupt-cells: specifies the number of cells needed to encode an
+	interrupt source. The value must be 1.
+- compatible: Should contain "microsemi,ms-pf-axi-pcie-host"
+- reg: Should contain AXI PCIe registers location and length
+- device_type: must be "pci"
+- interrupts: Should contain AXI PCIe interrupt
+- interrupt-map-mask,
+  interrupt-map: standard PCI properties to define the mapping of the
+	PCI interface to interrupt numbers.
+- ranges: ranges for the PCI memory regions (I/O space region is not
+	supported by hardware)
+	Please refer to the standard PCI bus binding document for a more
+	detailed explanation
+
+Optional properties for PolarFire:
+- bus-range: PCI bus numbers covered
+
+Interrupt controller child node
++++++++++++++++++++++++++++++++
+Required properties:
+- interrupt-controller: identifies the node as an interrupt controller
+- #address-cells: specifies the number of cells needed to encode an
+	address. The value must be 0.
+- #interrupt-cells: specifies the number of cells needed to encode an
+	interrupt source. The value must be 1.
+
+NOTE:
+The core provides a single interrupt for both INTx/MSI messages. So,
+create an interrupt controller node to support 'interrupt-map' DT
+functionality.  The driver will create an IRQ domain for this map, decode
+the four INTx interrupts in ISR and route them to this domain.
+
+
+Example:
+++++++++
+AloeVera:
+
+	pcie: pcie@2030000000 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		compatible = "microsemi,ms-pf-axi-pcie-host";
+		device_type = "pci";
+		bus-range = <0x01 0x7f>;
+		interrupt-map = <0 0 0 1 &pcie_intc 1>,
+				<0 0 0 2 &pcie_intc 2>,
+				<0 0 0 3 &pcie_intc 3>,
+				<0 0 0 4 &pcie_intc 4>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-parent = <&L4>;
+		interrupts = <32>;
+		ranges = <0x3000000 0 0x40000000 0x0 0x40000000 0x0 0x20000000>;
+		reg = <0x20 0x30000000 0x0 0x4000000 0x20 0x0 0x0 0x100000>;
+		reg-names = "control", "apb";
+		pcie_intc: interrupt-controller {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+		};
+	};
-- 
2.17.0
