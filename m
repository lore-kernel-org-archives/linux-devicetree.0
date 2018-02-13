From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] ARM: shmobile: Document Renesas H2-based Stout DT bindings
Date: Wed, 14 Feb 2018 00:29:16 +0100
Message-ID: <20180213232916.31470-1-marek.vasut+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

Document the Renesas H2 Stout (ADAS Starter Kit) device tree bindings,
listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to
the Stout board.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 41d3920aaa5e..bf9bb6eda4a6 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -94,6 +94,8 @@ Boards:
     compatible = "renesas,kzm9g", "renesas,sh73a0"
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
+  - Stout (Y-R-CAR-ADAS-SKH2-BOARD)
+    compatible = "renesas,stout", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
     compatible = "renesas,m3ulcb", "renesas,r8a7796"
   - Marzen (R0P7779A00010S)
-- 
2.15.1
