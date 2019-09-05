From: jamestai.sky@gmail.com
Subject: [PATCH] dt-bindings: arm: Add bindings for Realtek RTD16XX SoC
Date: Thu,  5 Sep 2019 16:20:42 +0800
Message-ID: <20190905082042.1601-1-james.tai@realtek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

From: "james.tai" <james.tai@realtek.com>

This patch adds dt-binding documentation for Realtek RTD16XX platform.

Signed-off-by: james.tai <james.tai@realtek.com>
---
 Documentation/devicetree/bindings/arm/realtek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index ad9b13bc42f0..4d4ac23acab0 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -15,3 +15,5 @@ properties:
               - probox2,ava
               - zidoo,x9s
           - const: realtek,rtd1295
+        items:
+          - const: realtek,rtd1619
-- 
2.17.1
