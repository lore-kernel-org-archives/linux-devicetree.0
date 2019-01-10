From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: clock: Convert fixed-factor-clock to json-schema
Date: Thu, 10 Jan 2019 16:19:02 -0600
Message-ID: <20190110221903.3990-5-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the fixed-factor-clock binding to DT schema format using
json-schema.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/fixed-factor-clock.txt     | 28 ----------
 .../bindings/clock/fixed-factor-clock.yaml    | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-factor-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
deleted file mode 100644
index 189467a7188a..000000000000
--- a/Documentation/devicetree/bindings/clock/fixed-factor-clock.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Binding for simple fixed factor rate clock sources.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "fixed-factor-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clock-div: fixed divider.
-- clock-mult: fixed multiplier.
-- clocks: parent clock.
-
-Optional properties:
-- clock-output-names : From common clock binding.
-
-Some clocks that require special treatments are also handled by that
-driver, with the compatibles:
-  - allwinner,sun4i-a10-pll3-2x-clk
-
-Example:
-	clock {
-		compatible = "fixed-factor-clock";
-		clocks = <&parentclk>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/fixed-factor-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-factor-clock.yaml
new file mode 100644
index 000000000000..e7cd4ebac456
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fixed-factor-clock.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for simple fixed factor rate clock sources.
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-pll3-2x-clk
+      - fixed-factor-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-div:
+    description: Fixed divider
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 1
+
+  clock-mult:
+    description: Fixed multiplier
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - "#clock-cells"
+  - clock-div
+  - clock-mult
+
+additionalProperties: false
+
+examples:
+  - |
+    clock {
+      compatible = "fixed-factor-clock";
+      clocks = <&parentclk>;
+      #clock-cells = <0>;
+      clock-div = <2>;
+      clock-mult = <1>;
+    };
+...
-- 
2.19.1
