From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/10] clocksource: add DT bindings for Cortina Gemini
Date: Thu,  9 Feb 2017 00:14:36 +0100
Message-ID: <1486595685-10232-2-git-send-email-daniel.lezcano@linaro.org>
References: <20170208231208.GB12695@mai>
 <1486595685-10232-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486595685-10232-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This adds device tree bindings for the Cortina Systems Gemini
timer block used in these SoCs.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/timer/cortina,gemini-timer.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt b/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
new file mode 100644
index 0000000..16ea1d3
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
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
