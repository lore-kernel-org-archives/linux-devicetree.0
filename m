From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 5/6] PCI: rcar: document r8a7793 DT bindings
Date: Thu, 28 May 2015 17:17:04 +0200
Message-ID: <1432826225-6743-6-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1432826225-6743-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1432826225-6743-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: devicetree@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, linux-sh@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
index d8ef5bf..8b156fe 100644
--- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
+++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
@@ -8,6 +8,7 @@ OHCI and EHCI controllers.
 Required properties:
 - compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
 	      "renesas,pci-r8a7791" for the R8A7791 SoC.
+	      "renesas,pci-r8a7793" for the R8A7793 SoC.
 - reg:	A list of physical regions to access the device: the first is
 	the operational registers for the OHCI/EHCI controllers and the
 	second is for the bridge configuration and control registers.
-- 
2.3.5

