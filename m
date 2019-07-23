From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: [PATCH 2/2] dt-bindings: IDU-intc: Add support for edge-triggered interrupts
Date: Tue, 23 Jul 2019 12:26:06 +0200
Message-ID: <20190723102606.309089-2-mischa.jonker@synopsys.com>
References: <20190723102606.309089-1-mischa.jonker@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723102606.309089-1-mischa.jonker@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com, kstewart@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mischa Jonker <Mischa.Jonker@synopsys.com>
List-Id: devicetree@vger.kernel.org

This updates the documentation for supporting  a optional extra interrupt
cell to specify edge vs level triggered.

Signed-off-by: Mischa Jonker <mischa.jonker@synopsys.com>
---
 .../interrupt-controller/snps,archs-idu-intc.txt   | 30 ++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
index 09fc02b..a5c1db9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
@@ -1,20 +1,30 @@
 * ARC-HS Interrupt Distribution Unit
 
-  This optional 2nd level interrupt controller can be used in SMP configurations for
-  dynamic IRQ routing, load balancing of common/external IRQs towards core intc.
+  This optional 2nd level interrupt controller can be used in SMP configurations
+  for dynamic IRQ routing, load balancing of common/external IRQs towards core
+  intc.
 
 Properties:
 
 - compatible: "snps,archs-idu-intc"
 - interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1>.
-
-  Value of the cell specifies the "common" IRQ from peripheral to IDU. Number N
-  of the particular interrupt line of IDU corresponds to the line N+24 of the
-  core interrupt controller.
-
-  intc accessed via the special ARC AUX register interface, hence "reg" property
-  is not specified.
+- #interrupt-cells: Must be <1> or <2>.
+
+  Value of the first cell specifies the "common" IRQ from peripheral to IDU.
+  Number N of the particular interrupt line of IDU corresponds to the line N+24
+  of the core interrupt controller.
+
+  The (optional) second cell specifies any of the following flags:
+    - bits[3:0] trigger type and level flags
+        1 = low-to-high edge triggered
+        2 = NOT SUPPORTED (high-to-low edge triggered)
+        4 = active high level-sensitive <<< DEFAULT
+        8 = NOT SUPPORTED (active low level-sensitive)
+  When no second cell is specified, the interrupt is assumed to be level
+  sensitive.
+
+  The interrupt controller is accessed via the special ARC AUX register
+  interface, hence "reg" property is not specified.
 
 Example:
 	core_intc: core-interrupt-controller {
-- 
2.8.3
