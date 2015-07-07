From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/4] irqchip: Add documentation for the bcm2836 interrupt controller.
Date: Tue,  7 Jul 2015 14:13:36 -0700
Message-ID: <1436303617-17185-4-git-send-email-eric@anholt.net>
References: <1436303617-17185-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436303617-17185-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a new per-cpu root interrupt controller on the Raspberry Pi 2,
which will chain to the bcm2835 interrupt controller for peripheral
interrupts.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 .../interrupt-controller/brcm,bcm2836-l1-intc.txt  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt
new file mode 100644
index 0000000..f320dcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt
@@ -0,0 +1,37 @@
+BCM2836 per-CPU interrupt controller
+
+The BCM2836 has a per-cpu interrupt controller for the timer, PMU
+events, and SMP IPIs.  One of the CPUs may receive interrupts for the
+peripheral (GPU) events, which chain to the BCM2835-style interrupt
+controller.
+
+Required properties:
+
+- compatible:	 	Should be "brcm,bcm2836-l1-intc"
+- reg:			Specifies base physical address and size of the
+			  registers
+- interrupt-controller:	Identifies the node as an interrupt controller
+- #interrupt-cells:	Specifies the number of cells needed to encode an
+			  interrupt source. The value shall be 1
+
+Please refer to interrupts.txt in this directory for details of the common
+Interrupt Controllers bindings used by client devices.
+
+The interrupt sources are as follows:
+
+0: CNTPSIRQ
+1: CNTPNSIRQ
+2: CNTHPIRQ
+3: CNTVIRQ
+8: GPU_FAST
+9: PMU_FAST
+
+Example:
+
+local_intc: local_intc {
+	compatible = "brcm,bcm2836-l1-intc";
+	reg = <0x40000000 0x100>;
+	interrupt-controller;
+	#interrupt-cells = <1>;
+	interrupt-parent = <&local_intc>;
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
