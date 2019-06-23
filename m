From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v4 10/11] dt-bindings: thermal: add binding document for h3 thermal controller
Date: Sun, 23 Jun 2019 12:42:05 -0400
Message-ID: <20190623164206.7467-11-tiny.windzz@gmail.com>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623164206.7467-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding document for allwinner h3 thermal controller.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../bindings/thermal/sun8i-thermal.yaml       | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
index 2c5acc61ed03..1eaf68b5dd5a 100644
--- a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
@@ -16,6 +16,7 @@ description: |-
 properties:
   compatible:
     enum:
+      - allwinner,sun8i-h3-ths
       - allwinner,sun50i-h6-ths
 
   reg:
@@ -29,13 +30,22 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 1
+    maxItems: 2
 
   clock-names:
-    const: bus
+    items:
+      - const: bus
+      - const: ahb
 
   '#thermal-sensor-cells':
-    const: 1
+    enum: [ 0, 1 ]
+    description: |
+      Definition depends on soc version:
+
+      For "allwinner,sun8i-h3-ths",
+      value must be 0.
+      For "allwinner,sun50i-h6-ths",
+      value must be 1.
 
   nvmem-cells:
     items:
@@ -55,6 +65,19 @@ required:
   - '#thermal-sensor-cells'
 
 examples:
+  - |
+    ths: ths@1c25000 {
+         compatible = "allwinner,sun8i-h3-ths";
+         reg = <0x01c25000 0x400>;
+         clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
+         clock-names = "bus", "ahb";
+         resets = <&ccu RST_BUS_THS>;
+         interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+         nvmem-cells = <&tsen_calib>;
+         nvmem-cell-names = "calib";
+         #thermal-sensor-cells = <0>;
+    };
+
   - |
     ths: ths@5070400 {
          compatible = "allwinner,sun50i-h6-ths";
-- 
2.17.1
