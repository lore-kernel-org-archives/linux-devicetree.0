Return-Path: <SRS0=S5jw=ME=gmail.com=marek.vasut@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] DT: pci: rcar-pci: document R8A77990 bindings
Date: Sat, 22 Sep 2018 17:02:52 +0200
Message-Id: <20180922150252.18754-1-marek.vasut+renesas@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-pci@vger.kernel.org, Tho Vu <tho.vu.wh@rvc.renesas.com>, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>, Rob Herring <robh@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Tho Vu <tho.vu.wh@rvc.renesas.com>

Document the R-Car E3 (R8A77990) SoC in the R-Car PCIe bindings.

Signed-off-by: Tho Vu <tho.vu.wh@rvc.renesas.com>
Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
index a5f7fc62d10e..5f2f9e380efb 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -9,6 +9,7 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
 	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
 	    "renesas,pcie-r8a7796" for the R8A7796 SoC;
 	    "renesas,pcie-r8a77980" for the R8A77980 SoC;
+	    "renesas,pcie-r8a77990" for the R8A77990 SoC;
 	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 or
 				     RZ/G1 compatible device.
 	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
-- 
2.18.0
