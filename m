From: Rob Herring <robh@kernel.org>
Subject: [PATCH] regulator: dt-bindings: Convert fixed-regulator to json-schema
Date: Thu, 10 Jan 2019 16:19:03 -0600
Message-ID: <20190110221903.3990-6-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Convert the fixed-regulator binding to DT schema format using
json-schema.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/fixed-regulator.txt    | 35 ----------
 .../bindings/regulator/fixed-regulator.yaml   | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/fixed-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/fixed-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
deleted file mode 100644
index 0c2a6c8a1536..000000000000
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Fixed Voltage regulators
-
-Required properties:
-- compatible: Must be "regulator-fixed";
-- regulator-name: Defined in regulator.txt as optional, but required here.
-
-Optional properties:
-- gpio: gpio to use for enable control
-- startup-delay-us: startup time in microseconds
-- enable-active-high: Polarity of GPIO is Active high
-If this property is missing, the default assumed is Active low.
-- gpio-open-drain: GPIO is open drain type.
-  If this property is missing then default assumption is false.
--vin-supply: Input supply name.
-
-Any property defined as part of the core regulator
-binding, defined in regulator.txt, can also be used.
-However a fixed voltage regulator is expected to have the
-regulator-min-microvolt and regulator-max-microvolt
-to be the same.
-
-Example:
-
-	abc: fixedregulator@0 {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-supply";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 16 0>;
-		startup-delay-us = <70000>;
-		enable-active-high;
-		regulator-boot-on;
-		gpio-open-drain;
-		vin-supply = <&parent_reg>;
-	};
diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
new file mode 100644
index 000000000000..a7607b0baab7
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fixed Voltage regulators
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+  - Mark Brown <broonie@kernel.org>
+
+description:
+  Any property defined as part of the core regulator binding, defined in
+  regulator.txt, can also be used. However a fixed voltage regulator is
+  expected to have the regulator-min-microvolt and regulator-max-microvolt
+  to be the same.
+
+properties:
+  compatible:
+    const: regulator-fixed
+
+  regulator-name: true
+
+  gpio:
+    description: gpio to use for enable control
+    maxItems: 1
+
+  startup-delay-us:
+    description: startup time in microseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  enable-active-high:
+    description:
+      Polarity of GPIO is Active high. If this property is missing,
+      the default assumed is Active low.
+    type: boolean
+
+  gpio-open-drain:
+    description:
+      GPIO is open drain type. If this property is missing then default
+      assumption is false.
+    type: boolean
+
+  vin-supply:
+    description: Input supply phandle.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - regulator-name
+
+examples:
+  - |
+    abc: fixedregulator@0 {
+      compatible = "regulator-fixed";
+      regulator-name = "fixed-supply";
+      regulator-min-microvolt = <1800000>;
+      regulator-max-microvolt = <1800000>;
+      gpio = <&gpio1 16 0>;
+      startup-delay-us = <70000>;
+      enable-active-high;
+      regulator-boot-on;
+      gpio-open-drain;
+      vin-supply = <&parent_reg>;
+    };
+...
-- 
2.19.1
