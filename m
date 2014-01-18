From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/6] pci-rcar-gen2: add initial device tree documentation
Date: Sat, 18 Jan 2014 15:03:35 +0000
Message-ID: <1390057420-13226-2-git-send-email-ben.dooks@codethink.co.uk>
References: <1390057420-13226-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1390057420-13226-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: linux-sh@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree@vger.kernel.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Add initial documentation for the pci-rcar-gen2 driver device tree bindings.
This is not yet complete and needs work on the sub-nodes for the PCI bus.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: linux-sh@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: horms+renesas@verge.net.au
---
 Documentation/devicetree/bindings/pci/renessas,pci-r8a7790 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renessas,pci-r8a7790

diff --git a/Documentation/devicetree/bindings/pci/renessas,pci-r8a7790 b/Documentation/devicetree/bindings/pci/renessas,pci-r8a7790
new file mode 100644
index 0000000..65268d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/renessas,pci-r8a7790
@@ -0,0 +1,12 @@
+Renesas internal AHB to PCI bridge
+
+This is the bridge used internally to connect the USB controllers to the
+AHB.
+
+Required properties:
+ - compatible: "renesas,pci-r8a7790" for the R8A7790 SoC
+ - reg : A list of physical regions to access the device. The first is
+         the operational registers for the OHCI/EHCI controller and the
+	 second region is for the bridge configuration and control registers.
+ - interrupts : interrupt for the device
+ - clocks : The reference to the device clock
\ No newline at end of file
-- 
1.8.5.2

