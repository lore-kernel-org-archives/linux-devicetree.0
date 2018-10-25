Return-Path: <SRS0=SDjf=NF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: dmaengine: usb-dmac: Add binding for r8a77470
Date: Thu, 25 Oct 2018 15:53:37 +0100
Message-Id: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds usb high-speed dmac binding for r8a77470 (RZ/G1C) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch tested against linux-next.
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index 1743017..a1e7b814 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -6,6 +6,7 @@ Required Properties:
 	  - "renesas,r8a7743-usb-dmac" (RZ/G1M)
 	  - "renesas,r8a7744-usb-dmac" (RZ/G1N)
 	  - "renesas,r8a7745-usb-dmac" (RZ/G1E)
+	  - "renesas,r8a77470-usb-dmac" (RZ/G1C)
 	  - "renesas,r8a7790-usb-dmac" (R-Car H2)
 	  - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
 	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
-- 
2.7.4
