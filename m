From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/22] irqchip: DT bindings for Cortina Gemini irqchip
Date: Sun, 22 Jan 2017 13:16:09 +0100
Message-ID: <20170122121609.10098-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Cortina Gemini interrupt
controller. They are pretty standard.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
irqchip maintainers: please just apply this when you feel pleased
with it. These portions are functionally orthogonal to the series,
it is just in a series for context.
---
 .../cortina,gemini-interrupt-controller.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cortina,gemini-interrupt-controller.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cortina,gemini-interrupt-controller.txt b/Documentation/devicetree/bindings/interrupt-controller/cortina,gemini-interrupt-controller.txt
new file mode 100644
index 000000000000..97c1167fa533
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cortina,gemini-interrupt-controller.txt
@@ -0,0 +1,22 @@
+* Cortina Systems Gemini interrupt controller
+
+This interrupt controller is found on the Gemini SoCs.
+
+Required properties:
+- compatible: must be "cortina,gemini-interrupt-controller"
+- reg: The register bank for the interrupt controller.
+- interrupt-controller: Identifies the node as an interrupt controller
+- #interrupt-cells: The number of cells to define the interrupts.
+  Must be 2 as the controller can specify level or rising edge
+  IRQs. The bindings follows the standard binding for controllers
+  with two cells specified in
+  interrupt-controller/interrupts.txt
+
+Example:
+
+interrupt-controller@48000000 {
+	compatible = "cortina,gemini-interrupt-controller";
+	reg = <0x48000000 0x1000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
