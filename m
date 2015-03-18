From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip: renesas-intc-irqpin: Add optional functional clock to bindings
Date: Wed, 18 Mar 2015 17:37:24 +0100
Message-ID: <1426696644-25636-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

This clock is managed since commit 705bc96c2c15313c ("irqchip:
renesas-intc-irqpin: Add minimal runtime PM support").

Also add an example while we're at.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../interrupt-controller/renesas,intc-irqpin.txt   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
index 4f7946ae8adcdc04..e7cfcec056159b93 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
@@ -25,3 +25,32 @@ Optional properties:
   if different from the default 4 bits
 - control-parent: disable and enable interrupts on the parent interrupt
   controller, needed for some broken implementations
+- clocks: Must contain a reference to the functional clock.  The property is
+  mandatory if the hardware implements a controllable functional clock for
+  the irqpin controller instance.
+
+
+Example
+-------
+
+	irqpin1: irqpin@e6900004 {
+		compatible = "renesas,intc-irqpin-r8a7740",
+			     "renesas,intc-irqpin";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		reg = <0xe6900004 4>,
+			<0xe6900014 4>,
+			<0xe6900024 1>,
+			<0xe6900044 1>,
+			<0xe6900064 1>;
+		interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH
+			      0 149 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
+		power-domains = <&pd_a4s>;
+	};
-- 
1.9.1

