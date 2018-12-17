From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v3 1/2] dt-bindings: irq: add binding for Freescale IRQSTEER multiplexer
Date: Mon, 17 Dec 2018 15:01:19 +0100
Message-ID: <20181217140120.12009-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

This adds the DT binding for the Freescale IRQSTEER interrupt
multiplexer found in the i.MX8 familiy SoCs.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: clarify channel and irq-groups properties
v3: switch to onecell IRQ handle
---
 .../interrupt-controller/fsl,irqsteer.txt     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
new file mode 100644
index 000000000000..45790ce6f5b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
@@ -0,0 +1,34 @@
+Freescale IRQSTEER Interrupt multiplexer
+
+Required properties:
+
+- compatible: should be:
+	- "fsl,imx8m-irqsteer"
+	- "fsl,imx-irqsteer"
+- reg: Physical base address and size of registers.
+- interrupts: Should contain the parent interrupt line used to multiplex the
+  input interrupts.
+- clocks: Should contain one clock for entry in clock-names
+  see Documentation/devicetree/bindings/clock/clock-bindings.txt
+- clock-names:
+   - "ipg": main logic clock
+- interrupt-controller: Identifies the node as an interrupt controller.
+- #interrupt-cells: Specifies the number of cells needed to encode an
+  interrupt source. The value must be 1.
+- fsl,channel: The output channel that all input IRQs should be steered into.
+- fsl,irq-groups: Number of IRQ groups managed by this controller instance.
+  Each group manages 64 input interrupts.
+
+Example:
+
+	interrupt-controller@32e2d000 {
+		compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x32e2d000 0x1000>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,irq-groups = <1>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
2.19.1
