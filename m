Return-Path: <SRS0=Dkm/=JL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nbd.name ([46.4.11.11]:34696 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755135AbeFYRYA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Jun 2018 13:24:00 -0400
From: John Crispin <john@phrozen.org>
Subject: [PATCH 12/25] dt-bindings: PCI: qcom,ar7240: adds binding doc
Date: Mon, 25 Jun 2018 19:15:36 +0200
Message-Id: <20180625171549.4618-13-john@phrozen.org>
In-Reply-To: <20180625171549.4618-1-john@phrozen.org>
References: <20180625171549.4618-1-john@phrozen.org>
Sender: devicetree-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, John Crispin <john@phrozen.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

With the driver being converted from platform_data to pure OF, we need to
also add some docs.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: John Crispin <john@phrozen.org>
---
 .../devicetree/bindings/pci/qcom,ar7240-pci.txt    | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt

diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt
new file mode 100644
index 000000000000..7f6ca8a0f859
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,ar7240-pci.txt
@@ -0,0 +1,40 @@
+* Qualcomm Atheros AR724X PCI express root complex
+
+Required properties:
+- compatible: should contain "qcom,ar7240-pci" to identify the core.
+- reg: Should contain the register ranges as listed in the reg-names property.
+- reg-names: Definition: Must include the following entries
+	- "crp_base"	Configuration registers
+	- "ctrl_base"	Control registers
+	- "cfg_base"	IO Memory
+- #address-cells: set to <3>
+- #size-cells: set to <2>
+- ranges: ranges for the PCI memory and I/O regions
+- interrupt-map-mask and interrupt-map: standard PCI
+	properties to define the mapping of the PCIe interface to interrupt
+	numbers.
+- #interrupt-cells: set to <1>
+- interrupt-parent: phandle to the MIPS IRQ controller
+- interrupt-controller: define to enable the builtin IRQ cascade.
+
+* Example for qca9557
+	pcie0: pcie-controller@180c0000 {
+		compatible = "qcom,ar7240-pci";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		bus-range = <0x0 0x0>;
+		reg = <0x180c0000 0x1000>,
+		      <0x180f0000 0x100>,
+		      <0x14000000 0x1000>;
+		reg-names = "crp_base", "ctrl_base", "cfg_base";
+		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x04000000
+			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
+		interrupt-parent = <&intc2>;
+		interrupts = <1>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-map-mask = <0 0 0 1>;
+		interrupt-map = <0 0 0 0 &pcie0 0>;
+	};
-- 
2.11.0

