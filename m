From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt Controller
Date: Mon, 27 May 2019 14:17:10 +0200
Message-ID: <20190527121711.5138-2-geert+renesas@glider.be>
References: <20190527121711.5138-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527121711.5138-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add DT bindings for the Renesas RZ/A1 Interrupt Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4:
  - Add Reviewed-by,

v3:
  - Use interrupt-map (+ #address-cells and interrupt-map-mask) instead
    of renesas,gic-spi-base,

v2:
  - Add "renesas,gic-spi-base",
  - Document RZ/A2M.
---
 .../renesas,rza1-irqc.txt                     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
new file mode 100644
index 0000000000000000..727b7e4cd6e01110
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
@@ -0,0 +1,43 @@
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
+  - #address-cells: Must be zero
+  - interrupt-controller: Marks the device as an interrupt controller
+  - reg: Base address and length of the memory resource used by the interrupt
+         controller
+  - interrupt-map: Specifies the mapping from external interrupts to GIC
+		   interrupts
+  - interrupt-map-mask: Must be <7 0>
+
+Example:
+
+	irqc: interrupt-controller@fcfef800 {
+		compatible = "renesas,r7s72100-irqc", "renesas,rza1-irqc";
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0xfcfef800 0x6>;
+		interrupt-map =
+			<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map-mask = <7 0>;
+	};
-- 
2.17.1
