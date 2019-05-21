From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt-bindings: regulator: Convert gpio-regulator to json-schema
Date: Tue, 21 May 2019 16:20:30 -0500
Message-ID: <20190521212031.12982-2-robh@kernel.org>
References: <20190521212031.12982-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521212031.12982-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert the gpio-regulator binding to DT schema format using
json-schema.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/regulator/gpio-regulator.txt     |  57 ---------
 .../bindings/regulator/gpio-regulator.yaml    | 118 ++++++++++++++++++
 2 files changed, 118 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/gpio-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
deleted file mode 100644
index dd25e73b5d79..000000000000
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-GPIO controlled regulators
-
-Required properties:
-- compatible		: Must be "regulator-gpio".
-- regulator-name	: Defined in regulator.txt as optional, but required
-			  here.
-- gpios			: Array of one or more GPIO pins used to select the
-			  regulator voltage/current listed in "states".
-- states		: Selection of available voltages/currents provided by
-			  this regulator and matching GPIO configurations to
-			  achieve them. If there are no states in the "states"
-			  array, use a fixed regulator instead.
-
-Optional properties:
-- enable-gpios		: GPIO used to enable/disable the regulator.
-			  Warning, the GPIO phandle flags are ignored and the
-			  GPIO polarity is controlled solely by the presence
-			  of "enable-active-high" DT property. This is due to
-			  compatibility with old DTs.
-- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
-			  Default is active LOW.
-- gpios-states		: On operating systems, that don't support reading back
-			  gpio values in output mode (most notably linux), this
-			  array provides the state of GPIO pins set when
-			  requesting them from the gpio controller. Systems,
-			  that are capable of preserving state when requesting
-			  the lines, are free to ignore this property.
-			  0: LOW, 1: HIGH. Default is LOW if nothing else
-			  is specified.
-- startup-delay-us	: Startup time in microseconds.
-- regulator-type	: Specifies what is being regulated, must be either
-			  "voltage" or "current", defaults to voltage.
-
-Any property defined as part of the core regulator binding defined in
-regulator.txt can also be used.
-
-Example:
-
-	mmciv: gpio-regulator {
-		compatible = "regulator-gpio";
-
-		regulator-name = "mmci-gpio-supply";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <2600000>;
-		regulator-boot-on;
-
-		enable-gpios = <&gpio0 23 0x4>;
-		gpios = <&gpio0 24 0x4
-			 &gpio0 25 0x4>;
-		states = <1800000 0x3
-			  2200000 0x2
-			  2600000 0x1
-			  2900000 0x0>;
-
-		startup-delay-us = <100000>;
-		enable-active-high;
-	};
diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml b/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
new file mode 100644
index 000000000000..9d3b28417fb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO controlled regulators
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+  - Mark Brown <broonie@kernel.org>
+
+description:
+  Any property defined as part of the core regulator binding, defined in
+  regulator.txt, can also be used.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: regulator-gpio
+
+  regulator-name: true
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the regulator.
+      Warning, the GPIO phandle flags are ignored and the GPIO polarity is
+      controlled solely by the presence of "enable-active-high" DT property.
+      This is due to compatibility with old DTs.
+    maxItems: 1
+
+  gpios:
+    description: Array of one or more GPIO pins used to select the regulator
+      voltage/current listed in "states".
+    minItems: 1
+    maxItems: 8  # Should be enough...
+
+  gpios-states:
+    description: |
+      On operating systems, that don't support reading back gpio values in
+      output mode (most notably linux), this array provides the state of GPIO
+      pins set when requesting them from the gpio controller. Systems, that are
+      capable of preserving state when requesting the lines, are free to ignore
+      this property.
+        0: LOW
+        1: HIGH
+      Default is LOW if nothing else is specified.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - maxItems: 8
+        items:
+          enum: [ 0, 1 ]
+          default: 0
+
+  states:
+    description: Selection of available voltages/currents provided by this
+      regulator and matching GPIO configurations to achieve them. If there are
+      no states in the "states" array, use a fixed regulator instead.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      - maxItems: 8
+        items:
+          items:
+            - description: Voltage in microvolts
+            - description: GPIO group state value
+
+  startup-delay-us:
+    description: startup time in microseconds
+
+  enable-active-high:
+    description: Polarity of "enable-gpio" GPIO is active HIGH. Default is
+      active LOW.
+    type: boolean
+
+  gpio-open-drain:
+    description:
+      GPIO is open drain type. If this property is missing then default
+      assumption is false.
+    type: boolean
+
+  regulator-type:
+    description: Specifies what is being regulated.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+      - enum:
+          - voltage
+          - current
+        default: voltage
+
+required:
+  - compatible
+  - regulator-name
+  - gpios
+  - states
+
+examples:
+  - |
+    gpio-regulator {
+      compatible = "regulator-gpio";
+
+      regulator-name = "mmci-gpio-supply";
+      regulator-min-microvolt = <1800000>;
+      regulator-max-microvolt = <2600000>;
+      regulator-boot-on;
+
+      enable-gpios = <&gpio0 23 0x4>;
+      gpios = <&gpio0 24 0x4
+        &gpio0 25 0x4>;
+      states = <1800000 0x3>,
+        <2200000 0x2>,
+        <2600000 0x1>,
+        <2900000 0x0>;
+
+      startup-delay-us = <100000>;
+      enable-active-high;
+    };
+...
-- 
2.20.1
