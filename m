From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RFC PATCH 25/40] dt-bindings: PCI: Add dt-binding to configure PCIe mode
Date: Fri, 21 Sep 2018 15:51:40 +0530
Message-ID: <20180921102155.22839-26-kishon@ti.com>
References: <20180921102155.22839-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102155.22839-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Gustavo.Pimentel@synopsys.com
Cc: Mark Rutland <mark.rutland@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add "ti,syscon-pcie-mode" dt-binding to hold phandle to the syscon
register that should be used to configure PCIe in RC mode or EP mode.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 Documentation/devicetree/bindings/pci/pci-keystone.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-keystone.txt b/Documentation/devicetree/bindings/pci/pci-keystone.txt
index 3a551687cfa2..8ee07197a063 100644
--- a/Documentation/devicetree/bindings/pci/pci-keystone.txt
+++ b/Documentation/devicetree/bindings/pci/pci-keystone.txt
@@ -23,6 +23,8 @@ pcie_msi_intc : Interrupt controller device node for MSI IRQ chip
 
 ti,syscon-pcie-id : phandle to the device control module required to set device
 		    id and vendor id.
+ti,syscon-pcie-mode : phandle to the device control module required to configure
+		      PCI in either RC mode or EP mode.
 
  Example:
 	pcie_msi_intc: msi-interrupt-controller {
-- 
2.17.1
