From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 3/9] doc: dt-bindings: Add doc for Ingenic TCU IRQ driver
Date: Wed, 10 Jan 2018 23:48:32 +0100
Message-ID: <20180110224838.16711-3-paul@crapouillou.net>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110224838.16711-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add documentation about how to properly use the Ingenic TCU
(Timer/Counter Unit) IRQ driver from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/interrupt-controller/ingenic,tcu.txt  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt

 v3: New patch in this series

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
new file mode 100644
index 000000000000..e3a7d2354172
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
@@ -0,0 +1,33 @@
+Ingenic SoCs Timer/Counter Unit Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,<socname>-tcu-intc". Valid strings are:
+  * ingenic,jz4740-tcu-intc
+  * ingenic,jz4770-tcu-intc
+  * ingenic,jz4780-tcu-intc
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent : phandle of the interrupt controller.
+- interrupts : Specifies the interrupt the controller is connected to.
+
+Example:
+
+/ {
+	mfd@10002000 {
+		compatible = "ingenic,tcu", "simple-mfd", "syscon";
+		reg = <0x10002000 0x1000>;
+
+		tcu_irq: interrupt-controller {
+			compatible = "ingenic,jz4740-tcu-intc";
+			reg = <0x10002020 0x20>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <15>;
+		};
+	};
+};
-- 
2.11.0
