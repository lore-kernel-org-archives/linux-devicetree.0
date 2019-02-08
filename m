From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v2 07/15] ndings: clock: milbeaut: add Milbeaut clock description
Date: Fri,  8 Feb 2019 21:27:03 +0900
Message-ID: <1549628823-31388-1-git-send-email-sugaya.taichi@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings document for Milbeaut clock.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 .../devicetree/bindings/clock/milbeaut-clock.txt   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/milbeaut-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/milbeaut-clock.txt b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
new file mode 100644
index 0000000..bcfc5df
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
@@ -0,0 +1,49 @@
+Milbeaut SoCs Clock Controller Binding
+----------------------------------------
+Milbeaut SoCs Clock controller is an integrated clock controller, which
+generates and supplies to all modules.
+
+This binding uses common clock bindings
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible: should be one of the following:
+    "socionext,milbeaut-m10v-ccu" - for M10V SoC
+- reg: shall contain base address and length of clock registers
+- #clock-cells: shall be 1
+- clocks: shall be an external clock
+
+Example: Clock controller node:
+
+	clk: m10v-clk-ctrl@1d021000 {
+		compatible = "socionext,milbeaut-m10v-clk-ccu";
+		reg = <0x1d021000 0x4000>;
+		#clock-cells = <1>
+		clocks = <&clki40mhz>
+	};
+
+Example: Required an external clock for Clock controller node:
+
+	clocks {
+		clki40mhz: clki40mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <40000000>;
+		};
+
+		/* other clocks */
+	};
+
+The clock consumer shall specify the desired clock-output of the clock
+controller as below by specifying output-id in its "clk" phandle cell.
+2: uart
+4: 32-bit timer
+
+Example: uart1 node:
+	uart1: serial@1e700010 {
+		compatible = "socionext,milbeaut-usio-uart";
+		reg = <0x1e700010 0x10>;
+		interrupts = <0 141 0x4>, <0 149 0x4>;
+		interrupt-names = "rx", "tx";
+		clocks = <&clk 2>;
+	};
-- 
1.9.1
