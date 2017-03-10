From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] ARM: shmobile: Document RZ/G1H SoC DT binding
Date: Fri, 10 Mar 2017 14:48:27 +0100
Message-ID: <1489153710-8159-2-git-send-email-geert+renesas@glider.be>
References: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document the RZ/G1H (r8a7742) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index c9502634316da3b1..b8155a209c58ef89 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -13,6 +13,8 @@ SoCs:
     compatible = "renesas,r8a73a4"
   - R-Mobile A1 (R8A77400)
     compatible = "renesas,r8a7740"
+  - RZ/G1H (R8A77420)
+    compatible = "renesas,r8a7742"
   - RZ/G1M (R8A77430)
     compatible = "renesas,r8a7743"
   - RZ/G1E (R8A77450)
-- 
2.7.4
