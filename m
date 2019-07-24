From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: [PATCH v2 2/3] dt-bindings: IDU-intc: Clean up documentation
Date: Wed, 24 Jul 2019 14:04:35 +0200
Message-ID: <20190724120436.8537-2-mischa.jonker@synopsys.com>
References: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CYPR1201MB0120.namprd12.prod.outlook.com>
 <20190724120436.8537-1-mischa.jonker@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724120436.8537-1-mischa.jonker@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com, kstewart@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mischa Jonker <Mischa.Jonker@synopsys.com>
List-Id: devicetree@vger.kernel.org

* Some lines exceeded 80 characters.
* Clarified statement about AUX register interface

Signed-off-by: Mischa Jonker <mischa.jonker@synopsys.com>
---
 .../bindings/interrupt-controller/snps,archs-idu-intc.txt        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
index 09fc02b..c5a1c7b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
@@ -1,7 +1,8 @@
 * ARC-HS Interrupt Distribution Unit
 
-  This optional 2nd level interrupt controller can be used in SMP configurations for
-  dynamic IRQ routing, load balancing of common/external IRQs towards core intc.
+  This optional 2nd level interrupt controller can be used in SMP configurations
+  for dynamic IRQ routing, load balancing of common/external IRQs towards core
+  intc.
 
 Properties:
 
@@ -13,8 +14,8 @@ Properties:
   of the particular interrupt line of IDU corresponds to the line N+24 of the
   core interrupt controller.
 
-  intc accessed via the special ARC AUX register interface, hence "reg" property
-  is not specified.
+  The interrupt controller is accessed via the special ARC AUX register
+  interface, hence "reg" property is not specified.
 
 Example:
 	core_intc: core-interrupt-controller {
-- 
2.8.3
