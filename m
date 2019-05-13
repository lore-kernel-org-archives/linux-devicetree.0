From: guoren@kernel.org
Subject: [PATCH V3 1/2] dt-bindings: interrupt-controller: Update csky mpintc
Date: Mon, 13 May 2019 17:55:38 +0800
Message-ID: <1557741339-29331-1-git-send-email-guoren@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jason@lakedaemon.net, tglx@linutronix.de, guoren@kernel.org, ren_guo@c-sky.com
List-Id: devicetree@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add trigger type and priority setting for csky,mpintc. The driver also
could support #interrupt-cells <1> and it wouldn't invalidate existing
DTs. Here we only show the complete format.

Changes for V3:
 - Update commit msg about compatible

Changes for V2:
 - change #interrupt-cells to <3>

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 .../bindings/interrupt-controller/csky,mpintc.txt   | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
index ab921f1..dccd913 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
@@ -6,11 +6,18 @@ C-SKY Multi-processors Interrupt Controller is designed for ck807/ck810/ck860
 SMP soc, and it also could be used in non-SMP system.
 
 Interrupt number definition:
-
   0-15  : software irq, and we use 15 as our IPI_IRQ.
  16-31  : private  irq, and we use 16 as the co-processor timer.
  31-1024: common irq for soc ip.
 
+Interrupt triger mode:
+ IRQ_TYPE_LEVEL_HIGH (default)
+ IRQ_TYPE_LEVEL_LOW
+ IRQ_TYPE_EDGE_RISING
+ IRQ_TYPE_EDGE_FALLING
+
+Interrupt priority range: 0-255
+
 =============================
 intc node bindings definition
 =============================
@@ -26,15 +33,21 @@ intc node bindings definition
 	- #interrupt-cells
 		Usage: required
 		Value type: <u32>
-		Definition: must be <1>
+		Definition: <3>
 	- interrupt-controller:
 		Usage: required
 
-Examples:
+Examples: ("interrupts = <irq_num IRQ_TYPE_XXX priority>")
 ---------
 
 	intc: interrupt-controller {
 		compatible = "csky,mpintc";
-		#interrupt-cells = <1>;
+		#interrupt-cells = <3>;
 		interrupt-controller;
 	};
+
+	device: device-example {
+		...
+		interrupts = <34 IRQ_TYPE_EDGE_RISING 254>;
+		interrupt-parent = <&intc>;
+	};
-- 
2.7.4
