From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] ARM: shmobile: Document RZ/G1N SoC DT binding
Date: Fri, 10 Mar 2017 14:48:28 +0100
Message-ID: <1489153710-8159-3-git-send-email-geert+renesas@glider.be>
References: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document the RZ/G1N (r8a7744) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index b8155a209c58ef89..170fe0562c637eab 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -17,6 +17,8 @@ SoCs:
     compatible = "renesas,r8a7742"
   - RZ/G1M (R8A77430)
     compatible = "renesas,r8a7743"
+  - RZ/G1N (R8A77440)
+    compatible = "renesas,r8a7744"
   - RZ/G1E (R8A77450)
     compatible = "renesas,r8a7745"
   - R-Car M1A (R8A77781)
-- 
2.7.4
