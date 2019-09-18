From: Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH] regulator: dt-bindings: Fix building error for dt_binding_check
Date: Wed, 18 Sep 2019 19:32:20 +0530
Message-ID: <1568815340-30401-1-git-send-email-pragnesh.patel@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Compatible property is not of type 'string' so replace enum
with items.

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 Documentation/devicetree/bindings/regulator/fixed-regulator.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a78150c..8d4a7b2 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -29,7 +29,7 @@ if:
 
 properties:
   compatible:
-    enum:
+    items:
       - const: regulator-fixed
       - const: regulator-fixed-clock
 
-- 
2.7.4
