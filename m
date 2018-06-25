Return-Path: <SRS0=Dkm/=JL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nbd.name ([46.4.11.11]:34704 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755135AbeFYRYC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Jun 2018 13:24:02 -0400
From: John Crispin <john@phrozen.org>
Subject: [PATCH 10/25] dt-bindings: PCI: qcom,ar7100: adds binding doc
Date: Mon, 25 Jun 2018 19:15:34 +0200
Message-Id: <20180625171549.4618-11-john@phrozen.org>
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
 .../devicetree/bindings/pci/qcom,ar7100-pci.txt    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt

diff --git a/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
new file mode 100644
index 000000000000..97be7b0c4cf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,ar7100-pci.txt
@@ -0,0 +1,36 @@
+* Qualcomm Atheros AR7100 PCI express root complex
+
+Required properties:
+- compatible: should contain "qcom,ar7100-pci" to identify the core.
+- reg: Should contain the register ranges as listed in the reg-names property.
+- reg-names: Definition: Must include the following entries
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
+* Example for ar7100
+	pcie0: pcie-controller@180c0000 {
+		compatible = "qca,ar7100-pci";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		bus-range = <0x0 0x0>;
+		reg = <0x17010000 0x100>;
+		reg-names = "cfg_base";
+		ranges = <0x2000000 0 0x10000000 0x10000000 0 0x07000000
+			  0x1000000 0 0x00000000 0x00000000 0 0x00000001>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-map-mask = <0 0 0 1>;
+		interrupt-map = <0 0 0 0 &pcie0 0>;
+	};
-- 
2.11.0

