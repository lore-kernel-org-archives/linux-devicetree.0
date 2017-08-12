From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/11] watchdog: ftwdt010: Extend DT bindings to derivatives
Date: Sat, 12 Aug 2017 20:43:13 +0200
Message-ID: <20170812184318.10144-7-linus.walleij@linaro.org>
References: <20170812184318.10144-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170812184318.10144-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This extends the device tree bindings for the Faraday FTWDT010
block to cover:
- The "moxa,moxart-watchdog" compatible version
- The "aspeed,ast2400-wdt" and "aspeed,ast2500-wdt" versions
- clocks (PCLK non-optional, the Gemini also have this now)
- reset line (optional, exist on the Gemini)
- configuration to use the external clock (faraday,use-extclk)

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/watchdog/faraday,ftwdt010.txt    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
index 9ecdb502e605..016e353bb069 100644
--- a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
+++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
@@ -1,17 +1,27 @@
 Faraday Technology FTWDT010 watchdog
 
 This is an IP part from Faraday Technology found in the Gemini
-SoCs and others.
+and MOXA ART SoCs and others.
 
 Required properties:
 - compatible : must be one of
   "faraday,ftwdt010"
   "cortina,gemini-watchdog", "faraday,ftwdt010"
+  "moxa,moxart-watchdog", "faraday,ftwdt010"
+  "aspeed,ast2400-wdt", "faraday,ftwdt010"
+  "aspeed,ast2500-wdt", "faraday,ftwdt010"
 - reg : shall contain base register location and length
-- interrupts : shall contain the interrupt for the watchdog
+- clocks : the clock driving the IP block (PCLK) and optionally
+  an external clock (EXTCLK)
+- clock-names : should be "PCLK" for the IP block clock and
+  "EXTCLK" for the external clock if present
 
 Optional properties:
+- interrupts : the bark interrupt for the watchdog
+- resets : reset line for the IP block
 - timeout-sec : the default watchdog timeout in seconds.
+- faraday,use-extclk : if set, the "EXTCLK" provided in the clocks
+  property will be used to clock the watchdog
 
 Example:
 
@@ -19,4 +29,6 @@ watchdog@41000000 {
 	compatible = "faraday,ftwdt010";
 	reg = <0x41000000 0x1000>;
 	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pclk>;
+	clock-names = "PCLK";
 };
-- 
2.13.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
