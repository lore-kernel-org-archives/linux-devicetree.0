From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2 pci/next] PCI: rcar: Add compatible string for r8a7796
Date: Wed, 21 Dec 2016 03:37:06 +0900
Message-ID: <1482259026-7180-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>

This patch adds support for r8a7796.

Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

This patch is based on the next branch of the pci tree.

v2 [Yoshihiro Kaneko]
* As suggested by Geert Uytterhoeven
  Dropped the update of the driver.

 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
index eee518d..34712d6 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -6,6 +6,7 @@ compatible: "renesas,pcie-r8a7779" for the R8A7779 SoC;
 	    "renesas,pcie-r8a7791" for the R8A7791 SoC;
 	    "renesas,pcie-r8a7793" for the R8A7793 SoC;
 	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
+	    "renesas,pcie-r8a7796" for the R8A7796 SoC;
 	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 compatible device.
 	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
 
-- 
1.9.1
