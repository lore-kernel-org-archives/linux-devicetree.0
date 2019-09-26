From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RFC PATCH 01/21] dt-bindings: PCI: Endpoint: Add DT bindings for PCI EPF Bus
Date: Thu, 26 Sep 2019 16:59:13 +0530
Message-ID: <20190926112933.8922-2-kishon@ti.com>
References: <20190926112933.8922-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926112933.8922-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, kishon@ti.com, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-ntb@googlegroups.com
List-Id: devicetree@vger.kernel.org

Add device tree bindings for PCI endpoint function bus to which
endpoint function devices should be attached.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../bindings/pci/endpoint/pci-epf-bus.txt     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/endpoint/pci-epf-bus.txt

diff --git a/Documentation/devicetree/bindings/pci/endpoint/pci-epf-bus.txt b/Documentation/devicetree/bindings/pci/endpoint/pci-epf-bus.txt
new file mode 100644
index 000000000000..16727ddf01f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/endpoint/pci-epf-bus.txt
@@ -0,0 +1,27 @@
+PCI Endpoint Function Bus
+
+This describes the bindings for endpoint function bus to which endpoint
+function devices should be attached.
+
+Required Properties:
+ - compatible: Should be "pci-epf-bus"
+
+One or more subnodes representing PCIe endpoint function device exposed
+to the remote host.
+
+Example:
+Following is an example of NTB device exposed to the remote host.
+
+epf_bus {
+	compatible = "pci-epf-bus";
+
+	ntb {
+		compatible = "pci-epf-ntb";
+		epcs = <&pcie0_ep>, <&pcie1_ep>;
+		epc-names = "primary", "secondary";
+		vendor-id = /bits/ 16 <0x104c>;
+		device-id = /bits/ 16 <0xb00d>;
+		num-mws = <4>;
+		mws-size = <0x100000>, <0x100000>, <0x100000>, <0x100000>;
+	};
+};
-- 
2.17.1
