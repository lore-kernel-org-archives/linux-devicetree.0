From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v8 2/5] dt-bindings: clock: renesas,r9a06g032-sysctrl: documentation
Date: Tue,  5 Jun 2018 09:29:58 +0100
Message-ID: <1528187462-47093-3-git-send-email-michel.pollet@bp.renesas.com>
References: <1528187462-47093-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528187462-47093-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Renesas R9A06G032 SYSCTRL node description.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
new file mode 100644
index 0000000..6aee360
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
@@ -0,0 +1,32 @@
+* Renesas R9A06G032 SYSCTRL
+
+Required Properties:
+
+  - compatible: Must be:
+    - "renesas,r9a06g032-sysctrl"
+  - reg: Base address and length of the SYSCTRL IO block.
+  - #clock-cells: Must be 1
+
+Examples
+--------
+
+  - SYSCTRL node:
+
+	sysctrl: system-controller@4000c000 {
+		compatible = "renesas,r9a06g032-sysctrl";
+		reg = <0x4000c000 0x1000>;
+		#clock-cells = <1>;
+	};
+
+  - Other nodes can use the clocks provided by SYSCTRL as in:
+
+	#include <dt-bindings/clock/r9a06g032-sysctrl.h>
+	uart0: serial@40060000 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0x40060000 0x400>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		clocks = <&sysctrl R9A06G032_CLK_UART0>;
+		clock-names = "baudclk";
+	};
-- 
2.7.4
