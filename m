From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
Date: Fri,  6 Oct 2017 18:15:17 +0100
Message-ID: <1507310117-9436-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a7743/5 SoCs. The Renesas RZ/G1[ME]
(R8A7743/5) usbdmac engine is identical to the R-Car Gen2 family.

No driver change is needed due to the fallback compatible value
"renesas,r8a7743-usb-dmac".
Adding the SoC-specific compatible values here has two purposes:
  1. Document which SoCs have this hardware module,
  2. Allow checkpatch to validate compatible values.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1-->v2
   * updated the patch description
This patch is tested against Linux next tag next-20170929 

 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index 1be6941..f3d1f15 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -3,6 +3,8 @@
 Required Properties:
 -compatible: "renesas,<soctype>-usb-dmac", "renesas,usb-dmac" as fallback.
 	Examples with soctypes are:
+	  - "renesas,r8a7743-usb-dmac" (RZ/G1M)
+	  - "renesas,r8a7745-usb-dmac" (RZ/G1E)
 	  - "renesas,r8a7790-usb-dmac" (R-Car H2)
 	  - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
 	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
-- 
1.9.1
