From: jamestai.sky@gmail.com
Subject: [PATCH] dt-bindings: arm: Convert Realtek board/soc bindings to json-schema
Date: Thu,  5 Sep 2019 16:17:21 +0800
Message-ID: <20190905081721.1548-1-james.tai@realtek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

From: "james.tai" <james.tai@realtek.com>

Convert Realtek SoC bindings to DT schema format using json-schema.

Signed-off-by: james.tai <james.tai@realtek.com>
---
 .../devicetree/bindings/arm/realtek.txt       | 22 -------------------
 .../devicetree/bindings/arm/realtek.yaml      | 17 ++++++++++++++
 2 files changed, 17 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/realtek.txt
 create mode 100644 Documentation/devicetree/bindings/arm/realtek.yaml

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
deleted file mode 100644
index 95839e19ae92..000000000000
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Realtek platforms device tree bindings
---------------------------------------
-
-
-RTD1295 SoC
-===========
-
-Required root node properties:
-
- - compatible :  must contain "realtek,rtd1295"
-
-
-Root node property compatible must contain, depending on board:
-
- - MeLE V9: "mele,v9"
- - ProBox2 AVA: "probox2,ava"
- - Zidoo X9S: "zidoo,x9s"
-
-
-Example:
-
-    compatible = "zidoo,x9s", "realtek,rtd1295";
diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
new file mode 100644
index 000000000000..ad9b13bc42f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/realtek.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek platforms device tree bindings
+
+properties:
+  compatible:
+    oneOf:
+        items:
+          - enum:
+              - mele,v9
+              - probox2,ava
+              - zidoo,x9s
+          - const: realtek,rtd1295
-- 
2.17.1
