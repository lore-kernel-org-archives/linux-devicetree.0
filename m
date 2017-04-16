From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 27/29] clocksource: Augment bindings for Faraday timer
Date: Sun, 16 Apr 2017 22:27:17 +0200
Message-ID: <1492374441-23336-27-git-send-email-daniel.lezcano@linaro.org>
References: <20170416202542.GV2078@mai>
 <1492374441-23336-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492374441-23336-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

It turns out that the Cortina Gemini timer block is just a
standard IP block from Faraday Technology named FTTMR010.

In order to make things clear and understandable, we rename the
bindings with a Faraday compatible as primary and the Cortina
gemini as a more specific case.

For the plain Faraday timer we require two clock references,
while the Gemini can keep it's syscon lookup pattern.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/timer/cortina,gemini-timer.txt        | 22 ---------------
 .../devicetree/bindings/timer/faraday,fttmr010.txt | 33 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt

diff --git a/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt b/Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
deleted file mode 100644
index 16ea1d3..0000000
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
index 0000000..b73ca6c
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
2.7.4
