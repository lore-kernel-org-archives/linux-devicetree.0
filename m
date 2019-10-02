From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: timer: Convert stm32 timer bindings to json-schema
Date: Wed, 2 Oct 2019 17:22:53 +0200
Message-ID: <20191002152253.16393-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Convert the STM32 timer binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 -----------
 .../devicetree/bindings/timer/st,stm32-timer.yaml  | 46 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/st,stm32-timer.txt b/Documentation/devicetree/bindings/timer/st,stm32-timer.txt
deleted file mode 100644
index 8ef28e70d6e8..000000000000
--- a/Documentation/devicetree/bindings/timer/st,stm32-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-. STMicroelectronics STM32 timer
-
-The STM32 MCUs family has several general-purpose 16 and 32 bits timers.
-
-Required properties:
-- compatible : Should be "st,stm32-timer"
-- reg : Address and length of the register set
-- clocks : Reference on the timer input clock
-- interrupts : Reference to the timer interrupt
-
-Optional properties:
-- resets: Reference to a reset controller asserting the timer
-
-Example:
-
-timer5: timer@40000c00 {
-	compatible = "st,stm32-timer";
-	reg = <0x40000c00 0x400>;
-	interrupts = <50>;
-	resets = <&rrc 259>;
-	clocks = <&clk_pmtr1>;
-};
diff --git a/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml b/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
new file mode 100644
index 000000000000..e128ac9a5391
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/st,stm32-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 general-purpose 16 and 32 bits timers bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-timer
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
+  resets:
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    timer: timer@40000c00 {
+        compatible = "st,stm32-timer";
+        reg = <0x40000c00 0x400>;
+        interrupts = <50>;
+        clocks = <&clk_pmtr1>;
+    };
+
+...
-- 
2.15.0
