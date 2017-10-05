From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dmaengine: usb-dmac: Add compatible string for r8a7743/5
Date: Thu,  5 Oct 2017 16:19:31 +0100
Message-ID: <1507216771-8957-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a7743/5 SoC. The Renesas RZ/G1[ME]
(R8A7743/5) usbdmac engine is identical to the R-Car Gen2 family.

This doesn't change the driver, so it does nothing by itself.  But it does
mean that checkpatch won't complain about a future patch that adds
"renesas,r8a7743-usb-dmac" or "renesas,r8a7745-usb-dmac" to a DT,
which helps ensure that shipped DTs use documented compatibility strings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
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
