From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: Convert max8660 binding to json-schema" to the regulator tree
Date: Thu, 23 May 2019 14:49:00 +0100 (BST)
Message-ID: <20190523134900.0E9021126D25@debutante.sirena.org.uk>
References: <20190521212031.12982-3-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521212031.12982-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Daniel Mack <zonque@gmail.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: Convert max8660 binding to json-schema

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 27b1b58fcfe72fd6b53a83b0dccb678e6b6faab8 Mon Sep 17 00:00:00 2001
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 May 2019 16:20:31 -0500
Subject: [PATCH] regulator: Convert max8660 binding to json-schema

Convert the max8660 binding to DT schema format using json-schema.

Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/max8660.txt | 47 -----------
 .../bindings/regulator/max8660.yaml           | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8660.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/max8660.yaml

diff --git a/Documentation/devicetree/bindings/regulator/max8660.txt b/Documentation/devicetree/bindings/regulator/max8660.txt
deleted file mode 100644
index 8ba994d8a142..000000000000
--- a/Documentation/devicetree/bindings/regulator/max8660.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-Maxim MAX8660 voltage regulator
-
-Required properties:
-- compatible: must be one of "maxim,max8660", "maxim,max8661"
-- reg: I2C slave address, usually 0x34
-- any required generic properties defined in regulator.txt
-
-Example:
-
-	i2c_master {
-		max8660@34 {
-			compatible = "maxim,max8660";
-			reg = <0x34>;
-
-			regulators {
-				regulator@0 {
-					regulator-compatible= "V3(DCDC)";
-					regulator-min-microvolt = <725000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				regulator@1 {
-					regulator-compatible= "V4(DCDC)";
-					regulator-min-microvolt = <725000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				regulator@2 {
-					regulator-compatible= "V5(LDO)";
-					regulator-min-microvolt = <1700000>;
-					regulator-max-microvolt = <2000000>;
-				};
-
-				regulator@3 {
-					regulator-compatible= "V6(LDO)";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <3300000>;
-				};
-
-				regulator@4 {
-					regulator-compatible= "V7(LDO)";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <3300000>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
new file mode 100644
index 000000000000..9c038698f880
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/max8660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX8660 voltage regulator
+
+maintainers:
+  - Daniel Mack <zonque@gmail.com>
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]{1,2}"
+  compatible:
+    enum:
+      - maxim,max8660
+      - maxim,max8661
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "regulator-.+":
+        $ref: "regulator.yaml#"
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@34 {
+        compatible = "maxim,max8660";
+        reg = <0x34>;
+
+        regulators {
+          regulator-V3 {
+            regulator-compatible= "V3(DCDC)";
+            regulator-min-microvolt = <725000>;
+            regulator-max-microvolt = <1800000>;
+          };
+
+          regulator-V4 {
+            regulator-compatible= "V4(DCDC)";
+            regulator-min-microvolt = <725000>;
+            regulator-max-microvolt = <1800000>;
+          };
+
+          regulator-V5 {
+            regulator-compatible= "V5(LDO)";
+            regulator-min-microvolt = <1700000>;
+            regulator-max-microvolt = <2000000>;
+          };
+
+          regulator-V6 {
+            regulator-compatible= "V6(LDO)";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3300000>;
+          };
+
+          regulator-V7 {
+            regulator-compatible= "V7(LDO)";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3300000>;
+          };
+        };
+      };
+    };
+...
-- 
2.20.1
