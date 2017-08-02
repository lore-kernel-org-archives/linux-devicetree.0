From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: watchdog: aspeed: External reset signal properties
Date: Wed,  2 Aug 2017 14:15:28 +0930
Message-ID: <20170802044529.30032-2-andrew@aj.id.au>
References: <20170802044529.30032-1-andrew@aj.id.au>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802044529.30032-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of push-pull driving, active low or high.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index 2b34ce9b60b9..c5077a1f5cb3 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -33,10 +33,18 @@ Optional properties:
         - none: No reset is performed on timeout. Assumes another watchdog
                 engine is responsible for this.
 
+ - aspeed,alt-boot:    If property is present then boot from alternate block.
  - aspeed,external-signal: If property is present then signal is sent to
 			external reset counter (only WDT1 and WDT2). If not
 			specified no external signal is sent.
- - aspeed,alt-boot:    If property is present then boot from alternate block.
+ - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
+
+Optional properties for AST2500-compatible watchdogs:
+ - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
+			 drive type to push-pull. The default is open-drain.
+ - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
+			   is configured as push-pull, then set the pulse
+			   polarity to active-high. The default is active-low.
 
 Example:
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
