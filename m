From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] soc: renesas: rcar-sysc: Document r8a7796 support
Date: Wed,  4 May 2016 16:36:08 +0200
Message-ID: <1462372570-31979-2-git-send-email-geert+renesas@glider.be>
References: <1462372570-31979-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1462372570-31979-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index b74e4d4785ab2d60..0725fb37a973d8eb 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -14,6 +14,7 @@ Required properties:
       - "renesas,r8a7793-sysc" (R-Car M2-N)
       - "renesas,r8a7794-sysc" (R-Car E2)
       - "renesas,r8a7795-sysc" (R-Car H3)
+      - "renesas,r8a7796-sysc" (R-Car M3-W)
   - reg: Address start and address range for the device.
   - #power-domain-cells: Must be 1.
 
-- 
1.9.1
