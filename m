From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3] dt-bindings: arm: Convert Actions Semi bindings to jsonschema
Date: Fri, 17 May 2019 10:32:23 -0500
Message-ID: <20190517153223.7650-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert Actions Semi SoC bindings to DT schema format using json-schema.

Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
- update MAINTAINERS

 .../devicetree/bindings/arm/actions.txt       | 56 -------------------
 .../devicetree/bindings/arm/actions.yaml      | 38 +++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 39 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/actions.txt
 create mode 100644 Documentation/devicetree/bindings/arm/actions.yaml

diff --git a/Documentation/devicetree/bindings/arm/actions.txt b/Documentation/devicetree/bindings/arm/actions.txt
deleted file mode 100644
index d54f33c4e0da..000000000000
--- a/Documentation/devicetree/bindings/arm/actions.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Actions Semi platforms device tree bindings
--------------------------------------------
-
-
-S500 SoC
-========
-
-Required root node properties:
-
- - compatible :  must contain "actions,s500"
-
-
-Modules:
-
-Root node property compatible must contain, depending on module:
-
- - LeMaker Guitar: "lemaker,guitar"
-
-
-Boards:
-
-Root node property compatible must contain, depending on board:
-
- - Allo.com Sparky: "allo,sparky"
- - Cubietech CubieBoard6: "cubietech,cubieboard6"
- - LeMaker Guitar Base Board rev. B: "lemaker,guitar-bb-rev-b", "lemaker,guitar"
-
-
-S700 SoC
-========
-
-Required root node properties:
-
-- compatible :  must contain "actions,s700"
-
-
-Boards:
-
-Root node property compatible must contain, depending on board:
-
- - Cubietech CubieBoard7: "cubietech,cubieboard7"
-
-
-S900 SoC
-========
-
-Required root node properties:
-
-- compatible :  must contain "actions,s900"
-
-
-Boards:
-
-Root node property compatible must contain, depending on board:
-
- - uCRobotics Bubblegum-96: "ucrobotics,bubblegum-96"
diff --git a/Documentation/devicetree/bindings/arm/actions.yaml b/Documentation/devicetree/bindings/arm/actions.yaml
new file mode 100644
index 000000000000..60abd371e474
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/actions.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/actions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi platforms device tree bindings
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      # The Actions Semi S500 is a quad-core ARM Cortex-A9 SoC.
+      - items:
+          - enum:
+              - allo,sparky # Allo.com Sparky
+              - cubietech,cubieboard6 # Cubietech CubieBoard6
+          - const: actions,s500
+      - items:
+          - enum:
+              - lemaker,guitar-bb-rev-b # LeMaker Guitar Base Board rev. B
+          - const: lemaker,guitar
+          - const: actions,s500
+
+      # The Actions Semi S700 is a quad-core ARM Cortex-A53 SoC.
+      - items:
+          - enum:
+              - cubietech,cubieboard7 # Cubietech CubieBoard7
+          - const: actions,s700
+
+      # The Actions Semi S900 is a quad-core ARM Cortex-A53 SoC.
+      - items:
+          - enum:
+              - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
+          - const: actions,s900
diff --git a/MAINTAINERS b/MAINTAINERS
index 005902ea1450..be8c3564804c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1338,7 +1338,7 @@ F:	drivers/pinctrl/actions/*
 F:	drivers/soc/actions/
 F:	include/dt-bindings/power/owl-*
 F:	include/linux/soc/actions/
-F:	Documentation/devicetree/bindings/arm/actions.txt
+F:	Documentation/devicetree/bindings/arm/actions.yaml
 F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 F:	Documentation/devicetree/bindings/dma/owl-dma.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
-- 
2.20.1
