From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/5] dt: watchdog: Document compatibility with JZ4780
Date: Fri, 15 Sep 2017 21:20:40 +0200
Message-ID: <20170915192040.27768-1-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Suggested-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
Changes in v2:
* Document the new compatible string

 Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
index e27763ef0049..1a56061bfb06 100644
--- a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
@@ -1,7 +1,7 @@
-Ingenic Watchdog Timer (WDT) Controller for JZ4740
+Ingenic Watchdog Timer (WDT) Controller for JZ4740 & JZ4780
 
 Required properties:
-compatible: "ingenic,jz4740-watchdog"
+compatible: "ingenic,jz4740-watchdog" or "ingenic,jz4780-watchdog"
 reg: Register address and length for watchdog registers
 
 Example:
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
