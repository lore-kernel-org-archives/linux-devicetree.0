From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/22] clocksource: add DT bindings for Cortina Gemini
Date: Sun, 22 Jan 2017 13:17:07 +0100
Message-ID: <20170122121707.10200-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Cortina Systems Gemini
timer block used in these SoCs.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
clocksource maintainers: please just apply this when you feel
pleased with it. These portions are functionally orthogonal to
the series, it is just in a series for context.
---
 .../bindings/timer/cortina,gemini-timer.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt b/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
new file mode 100644
index 000000000000..16ea1d3b2e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
@@ -0,0 +1,22 @@
+Cortina Systems Gemini timer
+
+This timer is embedded in the Cortina Systems Gemini SoCs.
+
+Required properties:
+
+- compatible : Must be "cortina,gemini-timer"
+- reg : Should contain registers location and length
+- interrupts : Should contain the three timer interrupts with
+  flags for rising edge
+- syscon : a phandle to the global Gemini system controller
+
+Example:
+
+timer@43000000 {
+	compatible = "cortina,gemini-timer";
+	reg = <0x43000000 0x1000>;
+	interrupts = <14 IRQ_TYPE_EDGE_RISING>, /* Timer 1 */
+		   <15 IRQ_TYPE_EDGE_RISING>, /* Timer 2 */
+		   <16 IRQ_TYPE_EDGE_RISING>; /* Timer 3 */
+	syscon = <&syscon>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
