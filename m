From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] dt-bindings: arm,nvic: Binding for ARM NVIC interrupt controller on Cortex-M
Date: Mon,  3 Apr 2017 12:58:42 -0500
Message-ID: <20170403175842.17289-1-kumar.gala@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
* Dropped arm,nvic, fixed up example to match

 .../bindings/interrupt-controller/arm,nvic.txt     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
new file mode 100644
index 0000000..386ab37
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.txt
@@ -0,0 +1,36 @@
+* ARM Nested Vector Interrupt Controller (NVIC)
+
+The NVIC provides an interrupt controller that is tightly coupled to
+Cortex-M based processor cores.  The NVIC implemented on different SoCs
+vary in the number of interrupts and priority bits per interrupt.
+
+Main node required properties:
+
+- compatible : should be one of:
+	"arm,v6m-nvic"
+	"arm,v7m-nvic"
+	"arm,v8m-nvic"
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source.  The type shall be a <u32> and the value shall be 2.
+
+  The 1st cell contains the interrupt number for the interrupt type.
+
+  The 2nd cell is the priority of the interrupt.
+
+- reg : Specifies base physical address(s) and size of the NVIC registers.
+  This is at a fixed address (0xe000e100) and size (0xc00).
+
+- arm,num-irq-priority-bits: The number of priority bits implemented by the
+  given SoC
+
+Example:
+
+	intc: interrupt-controller@e000e100 {
+		compatible = "arm,v7m-nvic";
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		interrupt-controller;
+		reg = <0xe000e100 0xc00>;
+		arm,num-irq-priority-bits = <4>;
+	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
