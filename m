From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: add Broadcom STB Level-2 interrupt controller binding
Date: Thu, 22 May 2014 09:36:46 -0700
Message-ID: <1400776606-22427-3-git-send-email-f.fainelli@gmail.com>
References: <1400776606-22427-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400776606-22427-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the Device Tree binding document for the Broadcom
Set-top-box Level 2 interrupt controller hardware.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes in v2:
- respin

 .../bindings/interrupt-controller/brcm,l2-intc.txt | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
new file mode 100644
index 000000000000..448273a30a11
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
@@ -0,0 +1,29 @@
+Broadcom Generic Level 2 Interrupt Controller
+
+Required properties:
+
+- compatible: should be "brcm,l2-intc"
+- reg: specifies the base physical address and size of the registers
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: specifies the number of cells needed to encode an
+  interrupt source. Should be 1.
+- interrupt-parent: specifies the phandle to the parent interrupt controller
+  this controller is cacaded from
+- interrupts: specifies the interrupt line in the interrupt-parent irq space
+  to be used for cascading
+
+Optional properties:
+
+- brcm,irq-can-wake: If present, this means the L2 controller can be used as a
+  wakeup source for system suspend/resume.
+
+Example:
+
+hif_intr2_intc: interrupt-controller@f0441000 {
+	compatible = "brcm,l2-intc";
+	reg = <0xf0441000 0x30>;
+	interrupt-controller;
+	#interrupt-cells = <1>;
+	interrupt-parent = <&intc>;
+	interrupts = <0x0 0x20 0x0>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
