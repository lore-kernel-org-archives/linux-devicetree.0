From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: thermal: Convert stm32 thermal bindings to json-schema
Date: Wed, 2 Oct 2019 17:21:25 +0200
Message-ID: <20191002152125.16227-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, alexandre.torgue@st.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Convert the STM32 thermal binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/thermal/st,stm32-thermal.yaml         | 74 ++++++++++++++++++++++
 .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 ------------------
 2 files changed, 74 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
new file mode 100644
index 000000000000..be8e1c51c11e
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,stm32-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 digital thermal sensor (DTS) binding
+
+maintainers:
+  - David Hernandez Sanchez <david.hernandezsanchez@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    dts: thermal@50028000 {
+        compatible = "st,stm32-thermal";
+        reg = <0x50028000 0x100>;
+        clocks = <&rcc TMPSENS>;
+        clock-names = "pclk";
+        #thermal-sensor-cells = <0>;
+        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    thermal-zones {
+        cpu_thermal: cpu-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <0>;
+
+            thermal-sensors = <&dts>;
+            trips {
+                cpu_alert1: cpu-alert1 {
+                    temperature = <85000>;
+                    hysteresis = <0>;
+                    type = "passive";
+                };
+
+                cpu_crit: cpu-crit {
+                    temperature = <120000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
+
+            cooling-maps {
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/thermal/stm32-thermal.txt b/Documentation/devicetree/bindings/thermal/stm32-thermal.txt
deleted file mode 100644
index 8c0d5a4d8031..000000000000
--- a/Documentation/devicetree/bindings/thermal/stm32-thermal.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-Binding for Thermal Sensor for STMicroelectronics STM32 series of SoCs.
-
-On STM32 SoCs, the Digital Temperature Sensor (DTS) is in charge of managing an
-analog block which delivers a frequency depending on the internal SoC's
-temperature. By using a reference frequency, DTS is able to provide a sample
-number which can be translated into a temperature by the user.
-
-DTS provides interrupt notification mechanism by threshold. This mechanism
-offers two temperature trip points: passive and critical. The first is intended
-for passive cooling notification while the second is used for over-temperature
-reset.
-
-Required parameters:
--------------------
-
-compatible: 	Should be "st,stm32-thermal"
-reg: 		This should be the physical base address and length of the
-		sensor's registers.
-clocks: 	Phandle of the clock used by the thermal sensor.
-		  See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-clock-names: 	Should be "pclk" for register access clock and reference clock.
-		  See: Documentation/devicetree/bindings/resource-names.txt
-#thermal-sensor-cells: Should be 0. See ./thermal.txt for a description.
-interrupts:	Standard way to define interrupt number.
-
-Example:
-
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&thermal>;
-
-			trips {
-				cpu_alert1: cpu-alert1 {
-					temperature = <85000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				cpu-crit: cpu-crit {
-					temperature = <120000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-			};
-		};
-	};
-
-	thermal: thermal@50028000 {
-		compatible = "st,stm32-thermal";
-		reg = <0x50028000 0x100>;
-		clocks = <&rcc TMPSENS>;
-		clock-names = "pclk";
-		#thermal-sensor-cells = <0>;
-		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-	};
-- 
2.15.0
