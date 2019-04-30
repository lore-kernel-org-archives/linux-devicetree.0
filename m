From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt Controller
Date: Tue, 30 Apr 2019 14:12:50 +0200
Message-ID: <20190430121254.3737-2-geert+renesas@glider.be>
References: <20190430121254.3737-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430121254.3737-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add DT bindings for the Renesas RZ/A1 Interrupt Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add "renesas,gic-spi-base",
  - Document RZ/A2M.
---
 .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
new file mode 100644
index 0000000000000000..ea8ddb6955338ccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
@@ -0,0 +1,30 @@
+DT bindings for the Renesas RZ/A1 Interrupt Controller
+
+The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
+RZ/A1 and RZ/A2 SoCs:
+  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
+    interrupts,
+  - NMI edge select.
+
+Required properties:
+  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
+		fallback.
+		Examples with soctypes are:
+		  - "renesas,r7s72100-irqc" (RZ/A1H)
+		  - "renesas,r7s9210-irqc" (RZ/A2M)
+  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
+				 in interrupts.txt in this directory)
+  - interrupt-controller: Marks the device as an interrupt controller
+  - reg: Base address and length of the memory resource used by the interrupt
+         controller
+  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.
+
+Example:
+
+	irqc: interrupt-controller@fcfef800 {
+		compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		reg = <0xfcfef800 0x6>;
+		renesas,gic-spi-base = <0>;
+	};
-- 
2.17.1
