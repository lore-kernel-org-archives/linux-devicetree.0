From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] rtc: gemini: Augment DT bindings for Faraday
Date: Thu, 18 May 2017 23:56:34 +0200
Message-ID: <20170518215635.13505-2-linus.walleij@linaro.org>
References: <20170518215635.13505-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170518215635.13505-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Gemini RTC is actually a standard IP block from Faraday
Technology called FTRTC010. Rename the bindings, add the
generic compatible string and add definitions for the two
available clocks.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
