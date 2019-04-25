Return-Path: <SRS0=K8Ad=S3=socionext.com=sugaya.taichi@kernel.org>
From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: milbeaut: add Milbeaut clock description
Date: Thu, 25 Apr 2019 19:41:00 +0900
Message-Id: <1556188862-22546-2-git-send-email-sugaya.taichi@socionext.com>
In-Reply-To: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Add DT bindings document for Milbeaut clock.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 .../devicetree/bindings/clock/milbeaut-clock.yaml  | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/milbeaut-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml b/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
new file mode 100644
index 0000000..5cf0b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/milbeaut-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut SoCs Clock Controller Binding
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+
+description: |
+  Milbeaut SoCs Clock controller is an integrated clock controller, which
+  generates and supplies to all modules.
+
+  This binding uses common clock bindings
+  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - socionext,milbeaut-m10v-ccu
+  clocks:
+    maxItems: 1
+    description: external clock
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+examples:
+  # Clock controller node:
+  - |
+    m10v-clk-ctrl@1d021000 {
+        compatible = "socionext,milbeaut-m10v-clk-ccu";
+        reg = <0x1d021000 0x4000>;
+        #clock-cells = <1>;
+        clocks = <&clki40mhz>;
+    };
+
+  # Required an external clock for Clock controller node:
+  - |
+    clocks {
+        clki40mhz: clki40mhz {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <40000000>;
+        };
+        /* other clocks */
+    };
+
+  # The clock consumer shall specify the desired clock-output of the clock
+  # controller as below by specifying output-id in its "clk" phandle cell.
+  # 2: uart
+  # 4: 32-bit timer
+  # 7: UHS-I/II
+  - |
+    serial@1e700010 {
+        compatible = "socionext,milbeaut-usio-uart";
+        reg = <0x1e700010 0x10>;
+        interrupts = <0 141 0x4>, <0 149 0x4>;
+        interrupt-names = "rx", "tx";
+        clocks = <&clk 2>;
+    };
+
+...
-- 
1.9.1
