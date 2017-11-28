From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 02/13] dt-bindings: interrupt-controller: Add binding for the Microsemi Ocelot interrupt controller
Date: Tue, 28 Nov 2017 16:26:32 +0100
Message-ID: <20171128152643.20463-3-alexandre.belloni@free-electrons.com>
References: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Add the Device Tree binding documentation for the Microsemi Ocelot
interrupt controller that is part of the ICPU. It is connected directly to
the MIPS core interrupt controller.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>

 .../interrupt-controller/mscc,ocelot-icpu-intr.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.txt
new file mode 100644
index 000000000000..b47a8a02b17b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.txt
@@ -0,0 +1,22 @@
+Microsemi Ocelot SoC ICPU Interrupt Controller
+
+Required properties:
+
+- compatible : should be "mscc,ocelot-icpu-intr"
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent : phandle of the CPU interrupt controller.
+- interrupts : Specifies the CPU interrupt the controller is connected to.
+
+Example:
+
+		intc: interrupt-controller@70000070 {
+			compatible = "mscc,ocelot-icpu-intr";
+			reg = <0x70000070 0x70>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+		};
-- 
2.15.0
