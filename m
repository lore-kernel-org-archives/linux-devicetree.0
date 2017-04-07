From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3 RESEND] clocksource: Augment bindings for Faraday timer
Date: Fri,  7 Apr 2017 23:55:13 +0200
Message-ID: <20170407215513.25706-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It turns out that the Cortina Gemini timer block is just a
standard IP block from Faraday Technology named FTTMR010.

In order to make things clear and understandable, we rename the
bindings with a Faraday compatible as primary and the Cortina
gemini as a more specific case.

For the plain Faraday timer we require two clock references,
while the Gemini can keep it's syscon lookup pattern.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/timer/cortina,gemini-timer.txt        | 22 ---------------
 .../devicetree/bindings/timer/faraday,fttmr010.txt | 33 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt

diff --git a/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt b/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
deleted file mode 100644
index 16ea1d3b2e9e..000000000000
--- a/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Cortina Systems Gemini timer
-
-This timer is embedded in the Cortina Systems Gemini SoCs.
-
-Required properties:
-
-- compatible : Must be "cortina,gemini-timer"
-- reg : Should contain registers location and length
-- interrupts : Should contain the three timer interrupts with
-  flags for rising edge
-- syscon : a phandle to the global Gemini system controller
-
-Example:
-
-timer@43000000 {
-	compatible = "cortina,gemini-timer";
-	reg = <0x43000000 0x1000>;
-	interrupts = <14 IRQ_TYPE_EDGE_RISING>, /* Timer 1 */
-		   <15 IRQ_TYPE_EDGE_RISING>, /* Timer 2 */
-		   <16 IRQ_TYPE_EDGE_RISING>; /* Timer 3 */
-	syscon = <&syscon>;
-};
diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
new file mode 100644
index 000000000000..b73ca6cd07f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
@@ -0,0 +1,33 @@
+Faraday Technology timer
+
+This timer is a generic IP block from Faraday Technology, embedded in the
+Cortina Systems Gemini SoCs and other designs.
+
+Required properties:
+
+- compatible : Must be one of
+  "faraday,fttmr010"
+  "cortina,gemini-timer"
+- reg : Should contain registers location and length
+- interrupts : Should contain the three timer interrupts usually with
+  flags for falling edge
+
+Optionally required properties:
+
+- clocks : a clock to provide the tick rate for "faraday,fttmr010"
+- clock-names : should be "EXTCLK" and "PCLK" for the external tick timer
+  and peripheral clock respectively, for "faraday,fttmr010"
+- syscon : a phandle to the global Gemini system controller if the compatible
+  type is "cortina,gemini-timer"
+
+Example:
+
+timer@43000000 {
+	compatible = "faraday,fttmr010";
+	reg = <0x43000000 0x1000>;
+	interrupts = <14 IRQ_TYPE_EDGE_FALLING>, /* Timer 1 */
+		   <15 IRQ_TYPE_EDGE_FALLING>, /* Timer 2 */
+		   <16 IRQ_TYPE_EDGE_FALLING>; /* Timer 3 */
+	clocks = <&extclk>, <&pclk>;
+	clock-names = "EXTCLK", "PCLK";
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
