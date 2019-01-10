From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: clock: Convert fixed-clock binding to json-schema
Date: Thu, 10 Jan 2019 16:19:01 -0600
Message-ID: <20190110221903.3990-4-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the fixed-clock binding to DT schema format using json-schema.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/fixed-clock.txt | 23 ----------
 .../bindings/clock/fixed-clock.yaml           | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/fixed-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.txt b/Documentation/devicetree/bindings/clock/fixed-clock.txt
deleted file mode 100644
index 0641a663ad69..000000000000
--- a/Documentation/devicetree/bindings/clock/fixed-clock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Binding for simple fixed-rate clock sources.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "fixed-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clock-frequency : frequency of clock in Hz. Should be a single cell.
-
-Optional properties:
-- clock-accuracy : accuracy of clock in ppb (parts per billion).
-		   Should be a single cell.
-- clock-output-names : From common clock binding.
-
-Example:
-	clock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <1000000000>;
-		clock-accuracy = <100>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
new file mode 100644
index 000000000000..8b5628463b90
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for simple fixed-rate clock sources.
+
+maintainers:
+  - Michael Turquette <mturquette@baylibre.com>
+  - Stephen Boyd <sboyd@kernel.org>
+
+properties:
+  compatible:
+    const: fixed-clock
+
+  "#clock-cells":
+    const: 0
+
+  clock-frequency: true
+
+  clock-accuracy:
+    description: accuracy of clock in ppb (parts per billion).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    clock {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <1000000000>;
+      clock-accuracy = <100>;
+    };
+...
-- 
2.19.1
