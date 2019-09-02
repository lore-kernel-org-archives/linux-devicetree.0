From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] dt-bindings: power: syscon-reboot: Convert bindings to json-schema
Date: Mon,  2 Sep 2019 17:03:35 +0200
Message-ID: <20190902150336.3600-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Convert the Syscon reboot bindings to DT schema format using
json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/power/reset/syscon-reboot.txt    | 30 --------
 .../bindings/power/reset/syscon-reboot.yaml   | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
deleted file mode 100644
index e23dea8344f8..000000000000
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Generic SYSCON mapped register reset driver
-
-This is a generic reset driver using syscon to map the reset register.
-The reset is generally performed with a write to the reset register
-defined by the register map pointed by syscon reference plus the offset
-with the value and mask defined in the reboot node.
-
-Required properties:
-- compatible: should contain "syscon-reboot"
-- regmap: this is phandle to the register map node
-- offset: offset in the register map for the reboot register (in bytes)
-- value: the reset value written to the reboot register (32 bit access)
-
-Optional properties:
-- mask: update only the register bits defined by the mask (32 bit)
-
-Legacy usage:
-If a node doesn't contain a value property but contains a mask property, the
-mask property is used as the value.
-
-Default will be little endian mode, 32 bit access only.
-
-Examples:
-
-	reboot {
-	   compatible = "syscon-reboot";
-	   regmap = <&regmapnode>;
-	   offset = <0x0>;
-	   mask = <0x1>;
-	};
diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
new file mode 100644
index 000000000000..a583f3dc8ef4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic SYSCON mapped register reset driver
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description: |+
+  This is a generic reset driver using syscon to map the reset register.
+  The reset is generally performed with a write to the reset register
+  defined by the register map pointed by syscon reference plus the offset
+  with the value and mask defined in the reboot node.
+  Default will be little endian mode, 32 bit access only.
+
+properties:
+  compatible:
+    const: syscon-reboot
+
+  mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Update only the register bits defined by the mask (32 bit).
+    maxItems: 1
+
+  offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Offset in the register map for the reboot register (in bytes).
+    maxItems: 1
+
+  regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the register map node.
+    maxItems: 1
+
+  value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The reset value written to the reboot register (32 bit access).
+    maxItems: 1
+
+required:
+  - compatible
+  - regmap
+  - offset
+
+allOf:
+  - if:
+      properties:
+        value:
+          not:
+            type: array
+    then:
+      required:
+        - mask
+    else:
+      required:
+        - value
+
+examples:
+  - |
+    reboot {
+      compatible = "syscon-reboot";
+      regmap = <&regmapnode>;
+      offset = <0x0>;
+      mask = <0x1>;
+    };
-- 
2.17.1
