From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 2/2] devicetree: document NXP LPC1850 PINT irq controller binding
Date: Sat,  2 Apr 2016 18:35:24 +0200
Message-ID: <1459614924-32670-3-git-send-email-manabian@gmail.com>
References: <1459614924-32670-1-git-send-email-manabian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459614924-32670-1-git-send-email-manabian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, robh+dt@kernel.org
Cc: Joachim Eastwood <manabian@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for NXP LPC1850 GPIO Pin Interrupt (PINT)
controller.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 .../interrupt-controller/nxp,lpc1850-gpio-pint.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
new file mode 100644
index 0000000..0d59d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
@@ -0,0 +1,26 @@
+NXP LPC18xx/43xx GPIO Pin Interrupt (PINT) controller
+
+Required properties:
+
+- compatible : should be "nxp,lpc1850-gpio-pint".
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 2.
+- interrupts : Must contain the interrupt numbers from the parent controller.
+	       This defines the mapping between the controllers where the first
+	       interrupt is mapped to pint hwirq 0 and so on. Which interrupts
+	       that are connected to where and the number of is device specific.
+	       For lpc1850 the mapping is 32 33 34 35 36 37 38 39 (8 in total).
+- clocks: Must contain a reference to the functional clock.
+
+Example:
+
+pint: interrupt-controller@40087000 {
+	compatible = "nxp,lpc1850-gpio-pint";
+	reg = <0x40087000 0x1000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	interrupts = <32 33 34 35 36 37 38 39>;
+	clocks = <&ccu1 CLK_CPU_GPIO>;
+};
-- 
2.8.0
