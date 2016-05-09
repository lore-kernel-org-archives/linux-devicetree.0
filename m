From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 1/2] doc/devicetree: Add Aspeed watchdog timer bindings
Date: Mon,  9 May 2016 22:04:36 +0930
Message-ID: <1462797277-14969-2-git-send-email-joel@jms.id.au>
References: <1462797277-14969-1-git-send-email-joel@jms.id.au>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462797277-14969-1-git-send-email-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
new file mode 100644
index 000000000000..58184b161e0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -0,0 +1,14 @@
+Aspeed Watchdog Timer
+
+Required properties:
+ - compatible: must be "aspeed,wdt"
+ - reg: physical base address of the controller and length of memory mapped
+   region
+
+Example:
+
+	wdt1: wdt@1e785000 {
+		compatible = "aspeed,wdt";
+		reg = <0x1e785000 0x1c>;
+		interrupts = <27>;
+	};
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
