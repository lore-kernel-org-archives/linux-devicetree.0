From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH 1/4] clocksource: Add brcm,bcm6345-timer device tree binding
Date: Sat, 21 Nov 2015 19:02:46 +0000
Message-ID: <5650BFD6.5030700@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM6345 timer. This is required for the
BCM6345 watchdog which needs to respond to one of the timer interrupts.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 .../bindings/timer/brcm,bcm6345-timer.txt          | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
new file mode 100644
index 0000000..2593907
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
@@ -0,0 +1,57 @@
+Broadcom BCM6345 Timer
+
+This block is a timer that is connected to one interrupt on the main interrupt
+controller and functions as a programmable interrupt controller for timer events.
+
+- 3 to 4 independent timers with their own maskable level interrupt bit (but not
+  per CPU because there is only one parent interrupt and the timers share it)
+
+- 1 watchdog timer with an unmaskable level interrupt
+
+- Contains one enable/status word pair
+
+- No atomic set/clear operations
+
+The lack of per CPU ability of timers makes them unusable as a set of
+clockevent devices, otherwise they could be attached to the remaining
+interrupts.
+
+The BCM6318 also has a separate interrupt for every timer except the watchdog.
+
+Required properties:
+
+- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6345-timer"
+- reg: specifies the base physical address and size of the registers, excluding
+  the watchdog registers
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: specifies the number of cells needed to encode an interrupt
+  source, should be 1.
+- interrupt-parent: specifies the phandle to the parent interrupt controller(s)
+  this one is cascaded from
+- interrupts: specifies the interrupt line(s) in the interrupt-parent controller
+  node for the main timer interrupt, followed by the individual timer interrupts
+  if present; valid values depend on the type of parent interrupt controller
+
+Example:
+
+timer: timer@0x10000080 {
+        compatible = "brcm,bcm63168-timer", "brcm,bcm6345-timer";
+        reg = <0x10000080 0x1c>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupt-parent = <&periph_intc>;
+        interrupts = <0>;
+};
+
+timer: timer@0x10000040 {
+        compatible = "brcm,bcm6318-timer", "brcm,bcm6345-timer";
+        reg = <0x10000040 0x28>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupt-parent = <&periph_intc>;
+        interrupts = <31>, <0>, <1>, <2>, <3>;
+};
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
