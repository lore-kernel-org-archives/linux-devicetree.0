From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH] dt-bindings: PCI: Add PCI EP DT binding documentation for AM654
Date: Fri, 26 Apr 2019 18:16:20 +0530
Message-ID: <20190426124620.28881-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Add devicetree binding documentation for PCIe in EP mode present in
AM654 SoC.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../devicetree/bindings/pci/pci-keystone.txt  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-keystone.txt b/Documentation/devicetree/bindings/pci/pci-keystone.txt
index 5c60e911b8b1..358f9adf95ad 100644
--- a/Documentation/devicetree/bindings/pci/pci-keystone.txt
+++ b/Documentation/devicetree/bindings/pci/pci-keystone.txt
@@ -69,3 +69,47 @@ Optional properties:-
 DesignWare DT Properties not applicable for Keystone PCI
 
 1. pcie_bus clock-names not used.  Instead, a phandle to phys is used.
+
+AM654 PCIe Endpoint
+===================
+
+Required Properties:-
+
+compatibility: Should be "ti,am654-pcie-ep" for EP on AM654x SoC
+reg: Four register ranges as listed in the reg-names property
+reg-names: "dbics" for the DesignWare PCIe registers, "app" for the
+	   TI specific application registers, "atu" for the
+	   Address Translation Unit configuration registers and
+	   "addr_space" used to map remote RC address space
+num-ib-windows: As specified in
+		Documentation/devicetree/bindings/pci/designware-pcie.txt
+num-ob-windows: As specified in
+		Documentation/devicetree/bindings/pci/designware-pcie.txt
+num-lanes: As specified in
+	   Documentation/devicetree/bindings/pci/designware-pcie.txt
+power-domains: As documented by the generic PM domain bindings in
+	       Documentation/devicetree/bindings/power/power_domain.txt.
+ti,syscon-pcie-mode: phandle to the device control module required to configure
+		      PCI in either RC mode or EP mode.
+
+Optional properties:-
+
+phys: list of PHY specifiers (used by generic PHY framework)
+phy-names: must be "pcie-phy0", "pcie-phy1", "pcie-phyN".. based on the
+               number of lanes as specified in *num-lanes* property.
+("phys" and "phy-names" DT bindings are specified in
+Documentation/devicetree/bindings/phy/phy-bindings.txt)
+interrupts: platform interrupt for error interrupts.
+
+pcie-ep {
+	compatible = "ti,am654-pcie-ep";
+	reg =  <0x5500000 0x1000>, <0x5501000 0x1000>,
+	       <0x10000000 0x8000000>, <0x5506000 0x1000>;
+	reg-names = "app", "dbics", "addr_space", "atu";
+	power-domains = <&k3_pds 120>;
+	ti,syscon-pcie-mode = <&pcie0_mode>;
+	num-lanes = <1>;
+	num-ib-windows = <16>;
+	num-ob-windows = <16>;
+	interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
+};
-- 
2.17.1
