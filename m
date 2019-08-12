From: Wen He <wen.he_1@nxp.com>
Subject: [v1 2/3] dt/bindings: clk: Add DT bindings for LS1028A Display output interface
Date: Mon, 12 Aug 2019 18:02:16 +0800
Message-ID: <20190812100216.34459-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: leoyang.li@nxp.com, liviu.dudau@arm.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings documentmation for the Clock of the LS1028A Display
output interface.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 .../devicetree/bindings/clock/fsl,plldig.txt  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,plldig.txt

diff --git a/Documentation/devicetree/bindings/clock/fsl,plldig.txt b/Documentation/devicetree/bindings/clock/fsl,plldig.txt
new file mode 100644
index 000000000000..29c5a6117809
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,plldig.txt
@@ -0,0 +1,26 @@
+NXP QorIQ Layerscape LS1028A Display output interface Clock
+===========================================================
+
+Required properties:
+    - compatible: shall contain "fsl,ls1028a-plldig"
+    - reg: Physical base address and size of the block registers
+    - #clock-cells: shall contain 1.
+    - clocks: a phandle + clock-specifier pairs, here should be
+    specify the reference clock of the system
+
+
+Example:
+
+/ {
+        ...
+
+        dpclk: clock-controller@f1f0000 {
+                compatible = "fsl,ls1028a-plldig";
+                reg = <0x0 0xf1f0000 0x0 0xffff>;
+                #clock-cells = <1>;
+                clocks = <&osc_27m>;
+        };
+
+        ...
+};
+
-- 
2.17.1
