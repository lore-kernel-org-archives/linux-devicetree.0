From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH v3 2/2] dt-bindings: PCI: altera: Add altr,pcie-root-port-2.0
Date: Wed,  2 Jan 2019 14:16:49 +0800
Message-ID: <1546409810-37630-3-git-send-email-ley.foon.tan@intel.com>
References: <1546409810-37630-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546409810-37630-1-git-send-email-ley.foon.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Add support for altr,pcie-root-port-2.0.

Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
---
 .../devicetree/bindings/pci/altera-pcie.txt        |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/altera-pcie.txt b/Documentation/devicetree/bindings/pci/altera-pcie.txt
index 6c396f1..816b244 100644
--- a/Documentation/devicetree/bindings/pci/altera-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/altera-pcie.txt
@@ -1,11 +1,13 @@
 * Altera PCIe controller
 
 Required properties:
-- compatible :	should contain "altr,pcie-root-port-1.0"
+- compatible :	should contain "altr,pcie-root-port-1.0" or "altr,pcie-root-port-2.0"
 - reg:		a list of physical base address and length for TXS and CRA.
+		For "altr,pcie-root-port-2.0", additional HIP base address and length.
 - reg-names:	must include the following entries:
 		"Txs": TX slave port region
 		"Cra": Control register access region
+		"Hip": Hard IP region (if "altr,pcie-root-port-2.0")
 - interrupts:	specifies the interrupt source of the parent interrupt
 		controller.  The format of the interrupt specifier depends
 		on the parent interrupt controller.
-- 
1.7.1
