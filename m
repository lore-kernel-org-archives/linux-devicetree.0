From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3 v2] rtc: gemini: Augment DT bindings for Faraday
Date: Tue, 30 May 2017 09:53:31 +0200
Message-ID: <20170530075332.3740-2-linus.walleij@linaro.org>
References: <20170530075332.3740-1-linus.walleij@linaro.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <rtc-linux+bncBDE6RCFOWIARBFGKWTEQKGQEZHEPHTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170530075332.3740-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Gemini RTC is actually a standard IP block from Faraday
Technology called FTRTC010. Rename the bindings, add the
generic compatible string and add definitions for the two
available clocks.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v1->v2:
- Add Rob's ACK.
---
 .../devicetree/bindings/rtc/cortina,gemini.txt     | 14 -----------
 .../devicetree/bindings/rtc/faraday,ftrtc010.txt   | 28 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/cortina,gemini.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt

diff --git a/Documentation/devicetree/bindings/rtc/cortina,gemini.txt b/Documentation/devicetree/bindings/rtc/cortina,gemini.txt
deleted file mode 100644
index 4ce4e794ddbb..000000000000
--- a/Documentation/devicetree/bindings/rtc/cortina,gemini.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* Cortina Systems Gemini RTC
-
-Gemini SoC real-time clock.
-
-Required properties:
-- compatible : Should be "cortina,gemini-rtc"
-
-Examples:
-
-rtc@45000000 {
-	compatible = "cortina,gemini-rtc";
-	reg = <0x45000000 0x100>;
-	interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
new file mode 100644
index 000000000000..e3938f5e0b6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
@@ -0,0 +1,28 @@
+* Faraday Technology FTRTC010 Real Time Clock
+
+This RTC appears in for example the Storlink Gemini family of
+SoCs.
+
+Required properties:
+- compatible : Should be one of:
+  "faraday,ftrtc010"
+  "cortina,gemini-rtc", "faraday,ftrtc010"
+
+Optional properties:
+- clocks: when present should contain clock references to the
+  PCLK and EXTCLK clocks. Faraday calls the later CLK1HZ and
+  says the clock should be 1 Hz, but implementers actually seem
+  to choose different clocks here, like Cortina who chose
+  32768 Hz (a typical low-power clock).
+- clock-names: should name the clocks "PCLK" and "EXTCLK"
+  respectively.
+
+Examples:
+
+rtc@45000000 {
+	compatible = "cortina,gemini-rtc";
+	reg = <0x45000000 0x100>;
+	interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&foo 0>, <&foo 1>;
+	clock-names = "PCLK", "EXTCLK";
+};
-- 
2.9.4

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
