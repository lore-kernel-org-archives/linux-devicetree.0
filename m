From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 2/4] PCI: rcar-gen2: add device tree support for r8a7793
Date: Mon, 18 Jan 2016 14:09:43 +0900
Message-ID: <1453093785-21067-3-git-send-email-horms+renesas@verge.net.au>
References: <1453093785-21067-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1453093785-21067-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Simply document new compatibility string.
As a previous patch adds a generic R-Car Gen2 compatibility string
there appears to be no need for a driver updates.

By documenting this compat sting it may be used in DTSs shipped, for
example as part of ROMs. It must be used in conjunction with the Gen2
fallback compat string. At this time there are no known differences between
the r8a7793 IP block and that implemented by the driver for the Gen2
fallback compat string. Thus there is no need to update the driver as the
use of the Gen2 fallback compat string will activate the correct code in
the current driver while leaving the option for r8a7793-specific driver
code to be activated in an updated driver should the need arise.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Rob Herring <robh@kernel.org>

---
* The r8a7792 is omitted from this change as the hardware in question
  does not appear to be present on that SoC.

v3
* Enhance changelog to explain why this is useful
---
 Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
index 7f3d383e605f..82e49cfa97a1 100644
--- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
+++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
@@ -8,6 +8,7 @@ OHCI and EHCI controllers.
 Required properties:
 - compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
 	      "renesas,pci-r8a7791" for the R8A7791 SoC;
+	      "renesas,pci-r8a7793" for the R8A7793 SoC;
 	      "renesas,pci-r8a7794" for the R8A7794 SoC;
 	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 compatible device.
 
-- 
2.1.4
