From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: add an explanation for internal phy-mode
Date: Sat, 20 Apr 2019 18:14:33 +0000
Message-ID: <1555784073-21679-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

When working on the Allwinner internal PHY, the first work was to use
the "internal" mode, but some answer was made my mail on what are really
internal mean for PHY.

This patch write that in the doc.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/net/ethernet.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index cfc376bc977a..78b098d2d4e9 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -18,7 +18,8 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   Specification).
 - phy-mode: string, operation mode of the PHY interface. This is now a de-facto
   standard property; supported values are:
-  * "internal"
+  * "internal" (Internal means there is not a standard bus between the MAC and
+     the PHY, something proprietary is being used to embed the PHY in the MAC.)
   * "mii"
   * "gmii"
   * "sgmii"
-- 
2.21.0
