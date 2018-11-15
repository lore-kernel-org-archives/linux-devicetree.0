Return-Path: <SRS0=V+0x=N2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH resend] dt-bindings: dmaengine: usb-dmac: Add binding for r8a774a1
Date: Thu, 15 Nov 2018 11:59:14 +0000
Message-Id: <1542283154-8385-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

This patch adds binding for r8a774a1 (RZ/G2M).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
index a1e7b814..5e2c7e8 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
@@ -7,6 +7,7 @@ Required Properties:
 	  - "renesas,r8a7744-usb-dmac" (RZ/G1N)
 	  - "renesas,r8a7745-usb-dmac" (RZ/G1E)
 	  - "renesas,r8a77470-usb-dmac" (RZ/G1C)
+	  - "renesas,r8a774a1-usb-dmac" (RZ/G2M)
 	  - "renesas,r8a7790-usb-dmac" (R-Car H2)
 	  - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
 	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
-- 
2.7.4
