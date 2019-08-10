From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v5 10/18] dt-bindings: thermal: add binding document for h3 thermal controller
Date: Sat, 10 Aug 2019 05:28:21 +0000
Message-ID: <20190810052829.6032-11-tiny.windzz@gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190810052829.6032-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding document for allwinner h3 thermal controller.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../bindings/thermal/sun8i-thermal.yaml       | 81 ++++++++++++++++++-
 1 file changed, 78 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
index e0973199ba3c..6624cf6b1ce8 100644
--- a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
@@ -16,6 +16,7 @@ description: |-
 properties:
   compatible:
     enum:
+      - allwinner,sun8i-h3-ths
       - allwinner,sun50i-h6-ths
 
   reg:
@@ -28,13 +29,21 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: ths bus clock
+      - description: ths mod clock
 
   clock-names:
-    const: bus
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: bus
+      - const: mod
 
   "#thermal-sensor-cells":
-    const: 1
+    enum: [ 0, 1 ]
 
   nvmem-cells:
     description: ths calibrate data
@@ -51,9 +60,75 @@ required:
   - interrupts
   - "#thermal-sensor-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-ths
+
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+
+        clock-names:
+          minItems: 1
+          maxItems: 1
+
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-h3-ths
+
+    then:
+      properties:
+        "#thermal-sensor-cells":
+          const: 0
+
+    else:
+      properties:
+        "#thermal-sensor-cells":
+          const: 1
+
 additionalProperties: false
 
 examples:
+  - |
+    ths: ths@1c25000 {
+        compatible = "allwinner,sun8i-h3-ths";
+        reg = <0x01c25000 0x400>;
+        clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
+        clock-names = "bus", "mod";
+        resets = <&ccu RST_BUS_THS>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        nvmem-cells = <&tsen_calib>;
+        nvmem-cell-names = "calib";
+        #thermal-sensor-cells = <0>;
+    };
+
+    sid: sid@1c14000 {
+        compatible = "allwinner,sun8i-h3-sid";
+        reg = <0x1c14000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        tsen_calib: calib@34 {
+                reg = <0x34 2>;
+        };
+    };
+
   - |
     ths: ths@5070400 {
         compatible = "allwinner,sun50i-h6-ths";
-- 
2.17.1
