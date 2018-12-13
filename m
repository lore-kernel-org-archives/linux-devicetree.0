From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] [media] v4l: vsp1: Add RZ/G support
Date: Thu, 13 Dec 2018 20:20:24 +0000
Message-ID: <1544732424-6498-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Document RZ/G1 and RZ/G2 support.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
index 1642701..cd5a955 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
@@ -2,13 +2,13 @@
 
 The VSP is a video processing engine that supports up-/down-scaling, alpha
 blending, color space conversion and various other image processing features.
-It can be found in the Renesas R-Car second generation SoCs.
+It can be found in the Renesas R-Car Gen2, R-Car Gen3, RZ/G1, and RZ/G2 SoCs.
 
 Required properties:
 
   - compatible: Must contain one of the following values
-    - "renesas,vsp1" for the R-Car Gen2 VSP1
-    - "renesas,vsp2" for the R-Car Gen3 VSP2
+    - "renesas,vsp1" for the R-Car Gen2 and RZ/G1 VSP1
+    - "renesas,vsp2" for the R-Car Gen3 and RZ/G2 VSP2
 
   - reg: Base address and length of the registers block for the VSP.
   - interrupts: VSP interrupt specifier.
-- 
2.7.4
