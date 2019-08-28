From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: Convert Arm Mali Utgard GPU to DT schema
Date: Wed, 28 Aug 2019 16:45:02 -0500
Message-ID: <20190828214502.12293-4-robh@kernel.org>
References: <20190828214502.12293-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828214502.12293-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Convert the Arm Utgard GPU binding to DT schema format.

'allwinner,sun8i-a23-mali' compatible was not documented, so add it.

The 'clocks' property is now required. This simplifies the schema as
effectively all the users require 'clocks' already and the upstream
driver requires clocks.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpu/arm,mali-utgard.txt          | 129 --------------
 .../bindings/gpu/arm,mali-utgard.yaml         | 168 ++++++++++++++++++
 2 files changed, 168 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
deleted file mode 100644
index ba895efe3039..000000000000
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ /dev/null
@@ -1,129 +0,0 @@
-ARM Mali Utgard GPU
-===================
-
-Required properties:
-  - compatible
-    * Must be one of the following:
-      + "arm,mali-300"
-      + "arm,mali-400"
-      + "arm,mali-450"
-    * And, optionally, one of the vendor specific compatible:
-      + allwinner,sun4i-a10-mali
-      + allwinner,sun7i-a20-mali
-      + allwinner,sun8i-h3-mali
-      + allwinner,sun50i-a64-mali
-      + allwinner,sun50i-h5-mali
-      + amlogic,meson8-mali
-      + amlogic,meson8b-mali
-      + amlogic,meson-gxbb-mali
-      + amlogic,meson-gxl-mali
-      + samsung,exynos4210-mali
-      + rockchip,rk3036-mali
-      + rockchip,rk3066-mali
-      + rockchip,rk3188-mali
-      + rockchip,rk3228-mali
-      + rockchip,rk3328-mali
-      + stericsson,db8500-mali
-      + hisilicon,hi6220-mali
-
-  - reg: Physical base address and length of the GPU registers
-
-  - interrupts: an entry for each entry in interrupt-names.
-    See ../interrupt-controller/interrupts.txt for details.
-
-  - interrupt-names:
-    * ppX: Pixel Processor X interrupt (X from 0 to 7)
-    * ppmmuX: Pixel Processor X MMU interrupt (X from 0 to 7)
-    * pp: Pixel Processor broadcast interrupt (mali-450 only)
-    * gp: Geometry Processor interrupt
-    * gpmmu: Geometry Processor MMU interrupt
-
-  - clocks: an entry for each entry in clock-names
-  - clock-names:
-    * bus: bus clock for the GPU
-    * core: clock driving the GPU itself
-
-Optional properties:
-  - interrupt-names and interrupts:
-    * pmu: Power Management Unit interrupt, if implemented in hardware
-
-  - memory-region:
-    Memory region to allocate from, as defined in
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-  - mali-supply:
-    Phandle to regulator for the Mali device, as defined in
-    Documentation/devicetree/bindings/regulator/regulator.txt for details.
-
-  - operating-points-v2:
-    Operating Points for the GPU, as defined in
-    Documentation/devicetree/bindings/opp/opp.txt
-
-  - power-domains:
-    A power domain consumer specifier as defined in
-    Documentation/devicetree/bindings/power/power_domain.txt
-
-Vendor-specific bindings
-------------------------
-
-The Mali GPU is integrated very differently from one SoC to
-another. In order to accomodate those differences, you have the option
-to specify one more vendor-specific compatible, among:
-
-  - allwinner,sun4i-a10-mali
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - allwinner,sun7i-a20-mali
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - allwinner,sun50i-a64-mali
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - allwinner,sun50i-h5-mali
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - amlogic,meson8-mali and amlogic,meson8b-mali
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - Rockchip variants:
-    Required properties:
-      * resets: phandle to the reset line for the GPU
-
-  - stericsson,db8500-mali
-    Required properties:
-      * interrupt-names and interrupts:
-        + combined: combined interrupt of all of the above lines
-
-  - hisilicon,hi6220-mali
-    Required properties:
-      * resets: phandles to the reset lines for the GPU
-
-Example:
-
-mali: gpu@1c40000 {
-	compatible = "allwinner,sun7i-a20-mali", "arm,mali-400";
-	reg = <0x01c40000 0x10000>;
-	interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "gp",
-			  "gpmmu",
-			  "pp0",
-			  "ppmmu0",
-			  "pp1",
-			  "ppmmu1",
-			  "pmu";
-	clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
-	clock-names = "bus", "core";
-	resets = <&ccu RST_BUS_GPU>;
-};
-
diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
new file mode 100644
index 000000000000..c5d93c5839d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Utgard GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+  - Maxime Ripard <maxime.ripard@free-electrons.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+  compatible:
+    oneOf:
+      - items:
+          - const: allwinner,sun8i-a23-mali
+          - const: allwinner,sun7i-a20-mali
+          - const: arm,mali-400
+      - items:
+          - enum:
+              - allwinner,sun4i-a10-mali
+              - allwinner,sun7i-a20-mali
+              - allwinner,sun8i-h3-mali
+              - allwinner,sun50i-a64-mali
+              - rockchip,rk3036-mali
+              - rockchip,rk3066-mali
+              - rockchip,rk3188-mali
+              - rockchip,rk3228-mali
+              - samsung,exynos4210-mali
+              - stericsson,db8500-mali
+          - const: arm,mali-400
+      - items:
+          - enum:
+              - allwinner,sun50i-h5-mali
+              - amlogic,meson8-mali
+              - amlogic,meson8b-mali
+              - amlogic,meson-gxbb-mali
+              - amlogic,meson-gxl-mali
+              - hisilicon,hi6220-mali
+              - rockchip,rk3328-mali
+          - const: arm,mali-450
+
+      # "arm,mali-300"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 4
+    maxItems: 20
+
+  interrupt-names:
+    allOf:
+      - additionalItems: true
+        minItems: 4
+        maxItems: 20
+        items:
+          # At least enforce the first 2 interrupts
+          - const: gp
+          - const: gpmmu
+      - items:
+          # Not ideal as any order and combination are allowed
+          enum:
+            - gp        # Geometry Processor interrupt
+            - gpmmu     # Geometry Processor MMU interrupt
+            - pp        # Pixel Processor broadcast interrupt (mali-450 only)
+            - pp0       # Pixel Processor X interrupt (X from 0 to 7)
+            - ppmmu0    # Pixel Processor X MMU interrupt (X from 0 to 7)
+            - pp1
+            - ppmmu1
+            - pp2
+            - ppmmu2
+            - pp3
+            - ppmmu3
+            - pp4
+            - ppmmu4
+            - pp5
+            - ppmmu5
+            - pp6
+            - ppmmu6
+            - pp7
+            - ppmmu7
+            - pmu       # Power Management Unit interrupt (optional)
+            - combined  # stericsson,db8500-mali only
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+
+  memory-region: true
+
+  mali-supply:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
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
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-mali
+              - allwinner,sun7i-a20-mali
+              - allwinner,sun50i-a64-mali
+              - allwinner,sun50i-h5-mali
+              - amlogic,meson8-mali
+              - amlogic,meson8b-mali
+              - hisilicon,hi6220-mali
+              - rockchip,rk3036-mali
+              - rockchip,rk3066-mali
+              - rockchip,rk3188-mali
+              - rockchip,rk3228-mali
+              - rockchip,rk3328-mali
+    then:
+      required:
+        - resets
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mali: gpu@1c40000 {
+      compatible = "allwinner,sun7i-a20-mali", "arm,mali-400";
+      reg = <0x01c40000 0x10000>;
+      interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "gp",
+            "gpmmu",
+            "pp0",
+            "ppmmu0",
+            "pp1",
+            "ppmmu1",
+            "pmu";
+      clocks = <&ccu 1>, <&ccu 2>;
+      clock-names = "bus", "core";
+      resets = <&ccu 1>;
+    };
+
+...
-- 
2.20.1
