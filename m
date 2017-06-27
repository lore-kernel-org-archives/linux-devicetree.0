From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/2] drivers/watchdog: Add optional ASPEED device tree properties
Date: Tue, 27 Jun 2017 16:17:33 -0500
Message-ID: <20170627211734.60477-2-cbostic@linux.vnet.ibm.com>
References: <20170627211734.60477-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627211734.60477-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe device tree optional properties:

  * aspeed,arm-reet - ARM CPU reset on signal
  * aspeed,soc-reset - SOC reset on signal
  * aspeed,sys-reset - System reset on signal
          Disabling system reset may be required in situations where
          one of the other watchdog engines in the system is responsible
          for this.
  * aspeed,interrupt - Interrupt CPU on signal
  * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
  * aspeed,alt-boot - Boot from alternate block on signal

Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
v2 - Add 'aspeed,' prefix to all optional properties
   - Add arm-reset, soc-reset, interrupt, alt-boot properties
---
 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5e74d7..555b8b4 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -8,9 +8,34 @@ Required properties:
  - reg: physical base address of the controller and length of memory mapped
    region
 
+Optional properties:
+   Signal behavior - Whenever a timeout occurs, the watchdog can be programmed
+   to generate 6 types of signals:
+
+ - aspeed,arm-reset:  If property is present then reset ARM CPU only.
+
+ - aspeed,soc-reset:  If property is present then reset SOC.
+
+ - aspeed,sys-reset:  If property is present then reset the entire chip.
+                      In cases where one of the other watchdog engines
+                      in the system is responsible for system reset it
+                      may be required to not specify this property.
+
+ - aspeed,interrupt:  If property is present then interrupt CPU.
+
+ - aspeed,external-signal: If property is present then signal is sent to
+                           external reset counter (only WDT1 and WDT2).
+ - aspeed,alt-boot:    If property is present then boot from alternate block.
+
 Example:
 
 	wdt1: watchdog@1e785000 {
 		compatible = "aspeed,ast2400-wdt";
 		reg = <0x1e785000 0x1c>;
+		aspeed,arm-reset;
+		aspeed,soc-reset;
+		aspeed,sys-reset;
+		aspeed,interrupt;
+		aspeed,external-signal;
+		aspeed,alt-boot;
 	};
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
