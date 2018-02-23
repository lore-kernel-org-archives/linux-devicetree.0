Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40102.outbound.protection.outlook.com ([40.107.4.102]:10720
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751843AbeBWVJW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 23 Feb 2018 16:09:22 -0500
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v5 2/2] dt/bindings: Add bindings for Layerscape external irqs
Date: Fri, 23 Feb 2018 22:09:00 +0100
Message-Id: <20180223210901.23480-3-rasmus.villemoes@prevas.dk>
In-Reply-To: <20180223210901.23480-1-rasmus.villemoes@prevas.dk>
References: <20180125150230.7234-1-rasmus.villemoes@prevas.dk>
 <20180223210901.23480-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Andy Tang <andy.tang@nxp.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds Device Tree binding documentation for the external interrupt
lines with configurable polarity present on some Layerscape SOCs.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 .../interrupt-controller/fsl,ls-extirq.txt         | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
new file mode 100644
index 000000000000..e510c715e8f6
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
+- #interrupt-cells: Must be 2. The first element is the index of the
+  external interrupt line. The second element is the trigger type.
+- interrupt-parent: phandle of GIC.
+- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in the SCFG.
+- fsl,extirq-map: Specifies the mapping to interrupt numbers in the parent
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
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			reg = <0x1ac>;
+			fsl,extirq-map = <163 164 165 167 168 169>;
+			fsl,bit-reverse;
+		};
+	};
+
+
+	interrupts-extended = <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+			      <&extirq 1 IRQ_TYPE_LEVEL_LOW>;
-- 
2.15.1

