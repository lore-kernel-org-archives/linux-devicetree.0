From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 03/20] dt-bindings: timer: Add missing compatibles
Date: Mon, 26 Aug 2019 22:43:50 +0200
Message-ID: <20190826204407.17759-3-daniel.lezcano@linaro.org>
References: <df27caba-d9f8-e64d-0563-609f8785ecb3@linaro.org>
 <20190826204407.17759-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826204407.17759-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Allwinner
        sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

Newer Allwinner SoCs have different number of interrupts, let's add
different compatibles for all of them to deal with this properly.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../timer/allwinner,sun4i-a10-timer.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
index 7292a424092c..20adc1c8e9cc 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
@@ -14,6 +14,8 @@ properties:
   compatible:
     enum:
       - allwinner,sun4i-a10-timer
+      - allwinner,sun8i-a23-timer
+      - allwinner,sun8i-v3s-timer
       - allwinner,suniv-f1c100s-timer
 
   reg:
@@ -39,6 +41,30 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          items:
+            const: allwinner,sun8i-a23-timer
+
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          items:
+            const: allwinner,sun8i-v3s-timer
+
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
   - if:
       properties:
         compatible:
-- 
2.17.1
