From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: thermal: add binding document for h6 thermal controller
Date: Sat, 25 May 2019 14:13:28 -0400
Message-ID: <20190525181329.18657-3-tiny.windzz@gmail.com>
References: <20190525181329.18657-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190525181329.18657-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, mchehab+samsung@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding document for allwinner h6 thermal controller.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../bindings/thermal/sun8i-thermal.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
new file mode 100644
index 000000000000..54cf1277870e
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/sun8i-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner SUN8I Thermal Controller Device Tree Bindings
+
+maintainers:
+  - Yangtao Li <tiny.windzz@gmail.com>
+
+description: |-
+  This describes the device tree binding for the Allwinner thermal
+  controller which measures the on-SoC temperatures.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h6-ths
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ths bus clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  "#thermal-sensor-cells":
+    enum: [ 0, 1 ]
+
+  nvmem-cells:
+    items:
+      - description: ths calibrate data
+
+  nvmem-cell-names:
+    items:
+      - const: calib
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    ths: ths@5070400 {
+         compatible = "allwinner,sun50i-h6-ths";
+         reg = <0x05070400 0x100>;
+         clocks = <&ccu CLK_BUS_THS>;
+         clock-names = "bus";
+         resets = <&ccu RST_BUS_THS>;
+         interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+         nvmem-cells = <&tsen_calib>;
+         nvmem-cell-names = "calib";
+         #thermal-sensor-cells = <1>;
+    };
+
+...
-- 
2.17.0
