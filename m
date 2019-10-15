From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH v2 2/6] dt-bindings: Add DT binding for PCIE GEN4 EP of the layerscape
Date: Tue, 15 Oct 2019 16:36:58 +0800
Message-ID: <20191015083702.21792-3-xiaowei.bao@nxp.com>
References: <20191015083702.21792-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015083702.21792-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiqiang.Hou@nxp.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, Minghuan.Lian@nxp.com, andrew.murray@arm.com, mingkai.hu@nxp.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the documentation for the Device Tree binding of the layerscape
PCIe GEN4 controller with EP mode.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2: 
 - remove the status entry in EP Example.

 .../bindings/pci/layerscape-pcie-gen4.txt          | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt b/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
index b40fb5d..06f9309 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
@@ -3,6 +3,8 @@ NXP Layerscape PCIe Gen4 controller
 This PCIe controller is based on the Mobiveil PCIe IP and thus inherits all
 the common properties defined in mobiveil-pcie.txt.
 
+HOST MODE
+=========
 Required properties:
 - compatible: should contain the platform identifier such as:
   "fsl,lx2160a-pcie"
@@ -23,7 +25,20 @@ Required properties:
 - msi-parent : See the generic MSI binding described in
   Documentation/devicetree/bindings/interrupt-controller/msi.txt.
 
-Example:
+DEVICE MODE
+=========
+Required properties:
+- compatible: should contain the platform identifier such as:
+  "fsl,lx2160a-pcie-ep"
+- reg: base addresses and lengths of the PCIe controller register blocks.
+  "regs": PCIe controller registers.
+  "addr_space" EP device CPU address.
+- apio-wins: number of requested apio outbound windows.
+
+Optional Property:
+- max-functions: Maximum number of functions that can be configured (default 1).
+
+RC Example:
 
 	pcie@3400000 {
 		compatible = "fsl,lx2160a-pcie";
@@ -50,3 +65,13 @@ Example:
 				<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
 				<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+EP Example:
+
+	pcie_ep@3400000 {
+		compatible = "fsl,lx2160a-pcie-ep";
+		reg = <0x00 0x03400000 0x0 0x00100000
+		       0x80 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		apio-wins = <8>;
+	};
-- 
2.9.5
