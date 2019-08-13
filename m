From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/5] dt-bindings: mfd: Convert Allwinner GPADC bindings to a schema
Date: Tue, 13 Aug 2019 14:47:40 +0200
Message-ID: <20190813124744.32614-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The Allwinner SoCs have an embedded GPADC that is doing thermal reading as
well, supported in Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../iio/adc/allwinner,sun8i-a33-ths.yaml      | 43 +++++++++++
 .../bindings/mfd/allwinner,sun4i-a10-ts.yaml  | 76 +++++++++++++++++++
 .../devicetree/bindings/mfd/sun4i-gpadc.txt   | 59 --------------
 3 files changed, 119 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
new file mode 100644
index 000000000000..d74962c0f5ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun8i-a33-ths.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A33 Thermal Sensor Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#io-channel-cells":
+    const: 0
+
+  "#thermal-sensor-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun8i-a33-ths
+
+  reg:
+    maxItems: 1
+
+required:
+  - "#io-channel-cells"
+  - "#thermal-sensor-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    ths: ths@1c25000 {
+        compatible = "allwinner,sun8i-a33-ths";
+        reg = <0x01c25000 0x100>;
+        #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
new file mode 100644
index 000000000000..4b1a09acb98b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/allwinner,sun4i-a10-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Resistive Touchscreen Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#thermal-sensor-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-ts
+      - allwinner,sun5i-a13-ts
+      - allwinner,sun6i-a31-ts
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  allwinner,ts-attached:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: A touchscreen is attached to the controller
+
+  allwinner,tp-sensitive-adjust:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 15
+        default: 15
+    description: Sensitivity of pen down detection
+
+  allwinner,filter-type:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 3
+        default: 1
+    description: |
+      Select median and averaging filter. Sample used for median /
+      averaging filter:
+        0: 4/2
+        1: 5/3
+        2: 8/4
+        3: 16/8
+
+required:
+  - "#thermal-sensor-cells"
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    rtp: rtp@1c25000 {
+        compatible = "allwinner,sun4i-a10-ts";
+        reg = <0x01c25000 0x100>;
+        interrupts = <29>;
+        allwinner,ts-attached;
+        #thermal-sensor-cells = <0>;
+        /* sensitive/noisy touch panel */
+        allwinner,tp-sensitive-adjust = <0>;
+        allwinner,filter-type = <3>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
deleted file mode 100644
index 86dd8191b04c..000000000000
--- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Allwinner SoCs' GPADC Device Tree bindings
-------------------------------------------
-The Allwinner SoCs all have an ADC that can also act as a thermal sensor
-and sometimes as a touchscreen controller.
-
-Required properties:
-  - compatible: "allwinner,sun8i-a33-ths",
-  - reg: mmio address range of the chip,
-  - #thermal-sensor-cells: shall be 0,
-  - #io-channel-cells: shall be 0,
-
-Example:
-	ths: ths@1c25000 {
-		compatible = "allwinner,sun8i-a33-ths";
-		reg = <0x01c25000 0x100>;
-		#thermal-sensor-cells = <0>;
-		#io-channel-cells = <0>;
-	};
-
-sun4i, sun5i and sun6i SoCs are also supported via the older binding:
-
-sun4i resistive touchscreen controller
---------------------------------------
-
-Required properties:
- - compatible: "allwinner,sun4i-a10-ts", "allwinner,sun5i-a13-ts" or
-   "allwinner,sun6i-a31-ts"
- - reg: mmio address range of the chip
- - interrupts: interrupt to which the chip is connected
- - #thermal-sensor-cells: shall be 0
-
-Optional properties:
- - allwinner,ts-attached	 : boolean indicating that an actual touchscreen
-				   is attached to the controller
- - allwinner,tp-sensitive-adjust : integer (4 bits)
-				   adjust sensitivity of pen down detection
-				   between 0 (least sensitive) and 15
-				   (defaults to 15)
- - allwinner,filter-type	 : integer (2 bits)
-				   select median and averaging filter
-				   samples used for median / averaging filter
-				   0: 4/2
-				   1: 5/3
-				   2: 8/4
-				   3: 16/8
-				   (defaults to 1)
-
-Example:
-
-	rtp: rtp@1c25000 {
-		compatible = "allwinner,sun4i-a10-ts";
-		reg = <0x01c25000 0x100>;
-		interrupts = <29>;
-		allwinner,ts-attached;
-		#thermal-sensor-cells = <0>;
-		/* sensitive/noisy touch panel */
-		allwinner,tp-sensitive-adjust = <0>;
-		allwinner,filter-type = <3>;
-	};
-- 
2.21.0
