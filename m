Return-Path: <SRS0=cIVi=VA=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 3/7] dt-bindings: net: mdio: Add child nodes
Date: Wed,  3 Jul 2019 11:55:09 +0200
Message-Id: <20190703095513.12340-3-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095513.12340-1-maxime.ripard@bootlin.com>
References: <20190703095513.12340-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The child nodes of a mdio bus are supposed to be ethernet PHYs, with a reg
property. Make sure that's validated as well.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/mdio.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
index 24d67074d494..5d08d2ffd4eb 100644
--- a/Documentation/devicetree/bindings/net/mdio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio.yaml
@@ -39,6 +39,20 @@ properties:
       and must therefore be appropriately determined based on all PHY
       requirements (maximum value of all per-PHY RESET pulse widths).
 
+patternProperties:
+  "^ethernet-phy@[0-9a-f]+$":
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 31
+        description:
+          The ID number for the PHY.
+
+    required:
+      - reg
+
 examples:
   - |
     davinci_mdio: mdio@5c030000 {
-- 
2.21.0
