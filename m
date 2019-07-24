From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: [PATCH v2 3/3] dt-bindings: IDU-intc: Add support for edge-triggered interrupts
Date: Wed, 24 Jul 2019 14:04:36 +0200
Message-ID: <20190724120436.8537-3-mischa.jonker@synopsys.com>
References: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CYPR1201MB0120.namprd12.prod.outlook.com>
 <20190724120436.8537-1-mischa.jonker@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724120436.8537-1-mischa.jonker@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com, kstewart@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mischa Jonker <Mischa.Jonker@synopsys.com>
List-Id: devicetree@vger.kernel.org

This updates the documentation for supporting an optional extra interrupt
cell to specify edge vs level triggered.

Signed-off-by: Mischa Jonker <mischa.jonker@synopsys.com>
---
 .../interrupt-controller/snps,archs-idu-intc.txt      | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
index c5a1c7b..a5c1db9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
@@ -8,11 +8,20 @@ Properties:
 
 - compatible: "snps,archs-idu-intc"
 - interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1>.
-
-  Value of the cell specifies the "common" IRQ from peripheral to IDU. Number N
-  of the particular interrupt line of IDU corresponds to the line N+24 of the
-  core interrupt controller.
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
 
   The interrupt controller is accessed via the special ARC AUX register
   interface, hence "reg" property is not specified.
-- 
2.8.3
