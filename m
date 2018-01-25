From: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: [PATCH v4 2/2] dt/bindings: Add bindings for Layerscape external irqs
Date: Thu, 25 Jan 2018 16:02:30 +0100
Message-ID: <20180125150230.7234-2-rasmus.villemoes@prevas.dk>
References: <20180122092133.23177-1-rasmus.villemoes@prevas.dk>
 <20180125150230.7234-1-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125150230.7234-1-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds Device Tree binding documentation for the external interrupt
lines with configurable polarity present on some Layerscape SOCs.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
---
Changes since v3: Add non-empty commit log.

.../interrupt-controller/fsl,ls-extirq.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
new file mode 100644
index 000000000000..a71ce2c3eeae
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
@@ -0,0 +1,44 @@
+* Freescale Layerscape external IRQs
+
+Some Layerscape SOCs (LS1021A, LS1043A, LS1046A) support inverting
+the polarity of certain external interrupt lines.
+
+The device node must be a child of the node representing the
+Supplemental Configuration Unit (SCFG).
+
+Required properties:
+- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
+- interrupt-controller: Identifies the node as an interrupt controller
+- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
+- interrupt-parent: phandle of GIC.
+- offset: offset to the Interrupt Polarity Control Register (INTPCR)
+  register in the SCFG.
+- interrupts: Specifies the mapping to interrupt numbers in the parent
+  interrupt controller. Interrupts are mapped one-to-one to parent
+  interrupts.
+
+Optional properties:
+- fsl,bit-reverse: This boolean property should be set on the LS1021A
+  if the SCFGREVCR register has been set to all-ones (which is usually
+  the case), meaning that all reads and writes of SCFG registers are
+  implicitly bit-reversed. Other compatible platforms do not have such
+  a register.
+
+Example:
+	scfg: scfg@1570000 {
+		compatible = "fsl,ls1021a-scfg", "syscon";
+		...
+		extirq: interrupt-controller {
+			compatible = "fsl,ls1021a-extirq";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			offset = <0x1ac>;
+			interrupts = <163 164 165 167 168 169>;
+			fsl,bit-reverse;
+		};
+	};
+
+
+	interrupts-extended = <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+			      <&extirq GIC_SPI 1 IRQ_TYPE_LEVEL_LOW>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
