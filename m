Return-Path: <SRS0=afzC=Q2=renesas.com=phil.edworthy@kernel.org>
From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v4 1/2] dt-bindings/interrupt-controller: rzn1: Add RZ/N1 gpio irq mux binding
Date: Tue, 19 Feb 2019 15:55:10 +0000
Message-Id: <20190219155511.28507-2-phil.edworthy@renesas.com>
In-Reply-To: <20190219155511.28507-1-phil.edworthy@renesas.com>
References: <20190219155511.28507-1-phil.edworthy@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Marc Zyngier <marc.zyngier@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add device binding documentation for the Renesas RZ/N1 GPIO interrupt
multiplexer.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v4:
 - nits: hex mask and gpioirqmux@ ==> interrupt-controller@,
   gpio-controller@ ==> gpio@
v3:
 - Use 'interrupt-map' DT property correctly.
v2:
 - Use interrupt-map to allow the GPIO controller info to be specified
   as part of the irq.
 - Don't show status in binding examples.
 - Don't show the soc/board split in binding doc.
---
 .../interrupt-controller/renesas,rzn1-mux.txt | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
new file mode 100644
index 000000000000..6a17324eef65
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
@@ -0,0 +1,73 @@
+* Renesas RZ/N1 GPIO Interrupt Multiplexer
+
+On Renesas RZ/N1 devices, there are several GPIO Controllers each with a number
+of interrupt outputs. All of the interrupts from the GPIO Controllers are passed
+to the GPIO Interrupt Multiplexer, which selects a sub-set of the interrupts to
+pass onto the system interrupt controller.
+
+A single node in the device tree is used to describe the GPIO IRQ Muxer.
+
+Required properties:
+- compatible: SoC-specific compatible string "renesas,<soc-specific>-gpioirqmux"
+  followed by "renesas,rzn1-gpioirqmux" as fallback. The SoC-specific compatible
+  strings must be one of:
+	"renesas,r9a06g032-gpioirqmux" for RZ/N1D
+	"renesas,r9a06g033-gpioirqmux" for RZ/N1S
+- reg: Base address and size of GPIO IRQ Muxer registers.
+- interrupts: List of output interrupts.
+- #interrupt-cells: Numder of cells in the input interrupt specifier, must be 1.
+- #address-cells: Must be 0.
+- interrupt-map-mask: must be 127.
+- interrupt-map: Standard property detailing the maps between input irqs and the
+  corresponding output irq. This consist of a list of:
+	<input-irq-spec phandle-to-interrupt-controller output-irq-spec>
+  The input-irq-spec is from 0 to 95, corresponding to the outputs of the GPIO
+  Controllers.
+
+Example:
+
+	The following is an example for the RZ/N1D SoC.
+
+	gpioirqmux: interrupt-controller@51000480 {
+		compatible = "renesas,r9a06g032-gpioirqmux",
+				"renesas,rzn1-gpioirqmux";
+		reg = <0x51000480 0x20>;
+		interrupts =
+			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+
+		#interrupt-cells = <1>;
+		#address-cells = <0>;
+		interrupt-map-mask = <0x7f>;
+		interrupt-map =
+			/* gpio2a 24, pin 146: ETH Port 1 IRQ */
+			<88 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+			/* gpio2a 26, pin 148: TouchSCRN_IRQ */
+			<90 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpio2: gpio@5000d000 {
+		compatible = "snps,dw-apb-gpio";
+		reg = <0x5000d000 0x80>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-names = "bus";
+		clocks = <&sysctrl R9A06G032_HCLK_GPIO2>;
+
+		gpio2a: gpio@0 {
+			compatible = "snps,dw-apb-gpio-port";
+			bank-name = "gpio2a";
+			gpio-controller;
+			#gpio-cells = <2>;
+			snps,nr-gpios = <32>;
+			reg = <0>;
+
+			interrupt-controller;
+			interrupt-parent = <&gpioirqmux>;
+			interrupts =  < 64 65 66 67 68 69 70 71
+					72 73 74 75 76 77 78 79
+					80 81 82 83 84 85 86 87
+					88 89 90 91 92 93 94 95 >;
+			#interrupt-cells = <2>;
+		};
+	};
-- 
2.17.1
