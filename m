From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RFC PATCH 03/21] dt-bindings: PCI: Endpoint: Add DT bindings for PCI EPF NTB Device
Date: Thu, 26 Sep 2019 16:59:15 +0530
Message-ID: <20190926112933.8922-4-kishon@ti.com>
References: <20190926112933.8922-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926112933.8922-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, kishon@ti.com, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-ntb@googlegroups.com
List-Id: devicetree@vger.kernel.org

Add device tree bindings for PCI endpoint NTB function device.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../bindings/pci/endpoint/pci-epf-ntb.txt     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/endpoint/pci-epf-ntb.txt

diff --git a/Documentation/devicetree/bindings/pci/endpoint/pci-epf-ntb.txt b/Documentation/devicetree/bindings/pci/endpoint/pci-epf-ntb.txt
new file mode 100644
index 000000000000..e7896932423e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/endpoint/pci-epf-ntb.txt
@@ -0,0 +1,31 @@
+PCI Endpoint NTB Function Device
+
+This describes the bindings to be used when a NTB device has to be
+exposed to the remote host over PCIe.
+
+Required Properties:
+ - compatible: Should be "pci-epf-ntb"
+ - epcs: As defined in generic pci-epf bindings defined in pci-epf.txt
+ - epc-names: As defined in generic pci-epf bindings defined in pci-epf.txt
+ - vendor-id: As defined in generic pci-epf bindings defined in pci-epf.txt
+ - device-id: As defined in generic pci-epf bindings defined in pci-epf.txt
+ - num-mws: Specify the number of memory windows. Should not be more than 4.
+ - mws-size: List of 'num-mws' entries containing size of each memory window.
+
+Optional Properties:
+ - spad-count: Specify the number of scratchpad registers to be supported
+ - db-count: Specify the number of doorbell interrupts to be supported. Must
+	     not be greater than 32.
+
+Example:
+Following is an example of NTB device exposed to the remote host.
+
+ntb {
+	compatible = "pci-epf-ntb";
+	epcs = <&pcie0_ep>, <&pcie1_ep>;
+	epc-names = "primary", "secondary";
+	vendor-id = /bits/ 16 <0x104c>;
+	device-id = /bits/ 16 <0xb00d>;
+	num-mws = <4>;
+	mws-size = <0x100000>, <0x100000>, <0x100000>, <0x100000>;
+};
-- 
2.17.1
