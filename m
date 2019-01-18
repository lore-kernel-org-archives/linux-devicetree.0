From: guoren@kernel.org
Subject: [PATCH V2 2/2] dt-bindings: interrupt-controller: Update csky mpintc
Date: Sat, 19 Jan 2019 00:52:51 +0800
Message-ID: <1547830371-22122-2-git-send-email-guoren@kernel.org>
References: <1547830371-22122-1-git-send-email-guoren@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547830371-22122-1-git-send-email-guoren@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

From: Guo Ren <ren_guo@c-sky.com>

Add trigger type and priority setting for csky,mpintc.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 .../bindings/interrupt-controller/csky,mpintc.txt  | 33 +++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
index ab921f1..badbd38 100644
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
@@ -26,15 +33,33 @@ intc node bindings definition
 	- #interrupt-cells
 		Usage: required
 		Value type: <u32>
-		Definition: must be <1>
+		Definition: could be <1> or <2> or <3>
 	- interrupt-controller:
 		Usage: required
 
-Examples:
+Examples: ("interrupts = <irq IRQ_TYPE_XXX priority>")
 ---------
 
 	intc: interrupt-controller {
 		compatible = "csky,mpintc";
-		#interrupt-cells = <1>;
+		#interrupt-cells = <3>;
 		interrupt-controller;
 	};
+
+	0: device-example0 {
+		...
+		interrupts = <33>;
+		interrupt-parent = <&intc>;
+	};
+
+	1: device-example1 {
+		...
+		interrupts = <33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&intc>;
+	};
+
+	2: device-example2 {
+		...
+		interrupts = <34 IRQ_TYPE_EDGE_RISING 254>;
+		interrupt-parent = <&intc>;
+	};
-- 
2.7.4
