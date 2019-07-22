From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 04/11] dt-bindings: timer: Convert Allwinner A13 HSTimer to a
 schema
Date: Mon, 22 Jul 2019 10:12:22 +0200
Message-ID: <20190722081229.22422-4-maxime.ripard@bootlin.com>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The newer Allwinner SoCs have a High Speed Timer supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../timer/allwinner,sun5i-a13-hstimer.txt     | 26 ------
 .../timer/allwinner,sun5i-a13-hstimer.yaml    | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
deleted file mode 100644
index 2c5c1be78360..000000000000
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Allwinner SoCs High Speed Timer Controller
-
-Required properties:
-
-- compatible :	should be "allwinner,sun5i-a13-hstimer" or
-		"allwinner,sun7i-a20-hstimer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts :	The interrupts of these timers (2 for the sun5i IP, 4 for the sun7i
-		one)
-- clocks: phandle to the source clock (usually the AHB clock)
-
-Optional properties:
-- resets: phandle to a reset controller asserting the timer
-
-Example:
-
-timer@1c60000 {
-	compatible = "allwinner,sun7i-a20-hstimer";
-	reg = <0x01c60000 0x1000>;
-	interrupts = <0 51 1>,
-		     <0 52 1>,
-		     <0 53 1>,
-		     <0 54 1>;
-	clocks = <&ahb1_gates 19>;
-	resets = <&ahb1rst 19>;
-};
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
new file mode 100644
index 000000000000..dfa0c41fd261
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/allwinner,sun5i-a13-hstimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A13 High-Speed Timer Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun5i-a13-hstimer
+      - const: allwinner,sun7i-a20-hstimer
+      - items:
+          - const: allwinner,sun6i-a31-hstimer
+          - const: allwinner,sun7i-a20-hstimer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: Timer 0 Interrupt
+      - description: Timer 1 Interrupt
+      - description: Timer 2 Interrupt
+      - description: Timer 3 Interrupt
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+if:
+  properties:
+    compatible:
+      items:
+        const: allwinner,sun5i-a13-hstimer
+
+then:
+  properties:
+    interrupts:
+      minItems: 2
+      maxItems: 2
+
+else:
+  properties:
+    interrupts:
+      minItems: 4
+      maxItems: 4
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1c60000 {
+        compatible = "allwinner,sun7i-a20-hstimer";
+        reg = <0x01c60000 0x1000>;
+        interrupts = <0 51 1>,
+                     <0 52 1>,
+                     <0 53 1>,
+                     <0 54 1>;
+        clocks = <&ahb1_gates 19>;
+        resets = <&ahb1rst 19>;
+    };
+
+...
-- 
2.21.0
