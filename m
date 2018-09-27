Return-Path: <SRS0=YKRD=MJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: dmaengine: usb-dmac: Add binding for r8a7744
Date: Thu, 27 Sep 2018 13:46:41 +0100
Message-Id: <1538052401-44249-1-git-send-email-biju.das@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds binding for r8a7744 (RZ/G1N).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
This patch is tested against linux-next next-20180927
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index 482e543..1743017 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -4,6 +4,7 @@ Required Properties:
 -compatible: "renesas,<soctype>-usb-dmac", "renesas,usb-dmac" as fallback.
 	Examples with soctypes are:
 	  - "renesas,r8a7743-usb-dmac" (RZ/G1M)
+	  - "renesas,r8a7744-usb-dmac" (RZ/G1N)
 	  - "renesas,r8a7745-usb-dmac" (RZ/G1E)
 	  - "renesas,r8a7790-usb-dmac" (R-Car H2)
 	  - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
-- 
2.7.4
