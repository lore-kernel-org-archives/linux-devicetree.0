From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] PCI: rcar: Add device tree support for r8a7793
Date: Tue,  1 Dec 2015 16:24:32 +0900
Message-ID: <1448954672-27236-5-git-send-email-horms+renesas@verge.net.au>
References: <1448954672-27236-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1448954672-27236-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Simply document new compat strings.
As a previous patch adds a generic R-Car Gen2 compat string
there appears to be no need for a driver updates.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---
* The r8a7792 and r8a7794 are omitted from this change as the
  hardware in question does not appear to be present on those SoCs.
---
 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
index 872cea085be8..4548b9b54165 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -4,6 +4,7 @@ Required properties:
 compatible: "renesas,pcie-r8a7779" for the R8A7779 SoC;
 	    "renesas,pcie-r8a7790" for the R8A7790 SoC;
 	    "renesas,pcie-r8a7791" for the R8A7791 SoC;
+	    "renesas,pcie-r8a7793" for the R8A7793 SoC;
 	    "renesas,pcie-gen2" for a generic R-Car Gen2 compatible device.
 
 	    When compatible with the generic version, nodes must list the
-- 
2.1.4
