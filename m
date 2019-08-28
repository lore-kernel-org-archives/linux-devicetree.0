From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: Convert Arm Mali Bifrost GPU to DT schema
Date: Wed, 28 Aug 2019 16:45:01 -0500
Message-ID: <20190828214502.12293-3-robh@kernel.org>
References: <20190828214502.12293-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828214502.12293-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Convert the Arm Bifrost GPU binding to DT schema format.

The 'clocks' property is now required. This simplifies the schema as
effectively all the users require 'clocks' already and the upstream
driver requires at least one clock.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpu/arm,mali-bifrost.txt         |  92 --------------
 .../bindings/gpu/arm,mali-bifrost.yaml        | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
deleted file mode 100644
index b8be9dbc68b4..000000000000
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-ARM Mali Bifrost GPU
-====================
-
-Required properties:
-
-- compatible :
-  * Since Mali Bifrost GPU model/revision is fully discoverable by reading
-    some determined registers, must contain the following:
-    + "arm,mali-bifrost"
-  * which must be preceded by one of the following vendor specifics:
-    + "amlogic,meson-g12a-mali"
-
-- reg : Physical base address of the device and length of the register area.
-
-- interrupts : Contains the three IRQ lines required by Mali Bifrost devices,
-  in the following defined order.
-
-- interrupt-names : Contains the names of IRQ resources in this exact defined
-  order: "job", "mmu", "gpu".
-
-Optional properties:
-
-- clocks : Phandle to clock for the Mali Bifrost device.
-
-- mali-supply : Phandle to regulator for the Mali device. Refer to
-  Documentation/devicetree/bindings/regulator/regulator.txt for details.
-
-- operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
-  for details.
-
-- resets : Phandle of the GPU reset line.
-
-Vendor-specific bindings
-------------------------
-
-The Mali GPU is integrated very differently from one SoC to
-another. In order to accommodate those differences, you have the option
-to specify one more vendor-specific compatible, among:
-
-- "amlogic,meson-g12a-mali"
-  Required properties:
-  - resets : Should contain phandles of :
-    + GPU reset line
-    + GPU APB glue reset line
-
-Example for a Mali-G31:
-
-gpu@ffa30000 {
-	compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
-	reg = <0xffe40000 0x10000>;
-	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "job", "mmu", "gpu";
-	clocks = <&clk CLKID_MALI>;
-	mali-supply = <&vdd_gpu>;
-	operating-points-v2 = <&gpu_opp_table>;
-	resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
-};
-
-gpu_opp_table: opp_table0 {
-	compatible = "operating-points-v2";
-
-	opp@533000000 {
-		opp-hz = /bits/ 64 <533000000>;
-		opp-microvolt = <1250000>;
-	};
-	opp@450000000 {
-		opp-hz = /bits/ 64 <450000000>;
-		opp-microvolt = <1150000>;
-	};
-	opp@400000000 {
-		opp-hz = /bits/ 64 <400000000>;
-		opp-microvolt = <1125000>;
-	};
-	opp@350000000 {
-		opp-hz = /bits/ 64 <350000000>;
-		opp-microvolt = <1075000>;
-	};
-	opp@266000000 {
-		opp-hz = /bits/ 64 <266000000>;
-		opp-microvolt = <1025000>;
-	};
-	opp@160000000 {
-		opp-hz = /bits/ 64 <160000000>;
-		opp-microvolt = <925000>;
-	};
-	opp@100000000 {
-		opp-hz = /bits/ 64 <100000000>;
-		opp-microvolt = <912500>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
new file mode 100644
index 000000000000..5f1fd6d7ee0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Bifrost GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson-g12a-mali
+      - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Job interrupt
+      - description: MMU interrupt
+      - description: GPU interrupt
+
+  interrupt-names:
+    items:
+      - const: job
+      - const: mmu
+      - const: gpu
+
+  clocks:
+    maxItems: 1
+
+  mali-supply:
+    maxItems: 1
+
+  operating-points-v2: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,meson-g12a-mali
+    then:
+      properties:
+        resets:
+          minItems: 2
+      required:
+        - resets
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@ffe40000 {
+      compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+      reg = <0xffe40000 0x10000>;
+      interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "job", "mmu", "gpu";
+      clocks = <&clk 1>;
+      mali-supply = <&vdd_gpu>;
+      operating-points-v2 = <&gpu_opp_table>;
+      resets = <&reset 0>, <&reset 1>;
+    };
+
+    gpu_opp_table: opp_table0 {
+      compatible = "operating-points-v2";
+
+      opp@533000000 {
+        opp-hz = /bits/ 64 <533000000>;
+        opp-microvolt = <1250000>;
+      };
+      opp@450000000 {
+        opp-hz = /bits/ 64 <450000000>;
+        opp-microvolt = <1150000>;
+      };
+      opp@400000000 {
+        opp-hz = /bits/ 64 <400000000>;
+        opp-microvolt = <1125000>;
+      };
+      opp@350000000 {
+        opp-hz = /bits/ 64 <350000000>;
+        opp-microvolt = <1075000>;
+      };
+      opp@266000000 {
+        opp-hz = /bits/ 64 <266000000>;
+        opp-microvolt = <1025000>;
+      };
+      opp@160000000 {
+        opp-hz = /bits/ 64 <160000000>;
+        opp-microvolt = <925000>;
+      };
+      opp@100000000 {
+        opp-hz = /bits/ 64 <100000000>;
+        opp-microvolt = <912500>;
+      };
+    };
+
+...
-- 
2.20.1
