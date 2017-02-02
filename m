From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v7 1/3] dt: bindings: add documentation for zx2967 family  watchdog controller
Date: Thu,  2 Feb 2017 17:03:46 +0800
Message-ID: <1486026228-21878-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds dt-binding documentation for zx2967 family
watchdog controller.

Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/watchdog/zte,zx2967-wdt.txt           | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
new file mode 100644
index 0000000..06ce677
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
@@ -0,0 +1,32 @@
+ZTE zx2967 Watchdog timer
+
+Required properties:
+
+- compatible : should be one of the following.
+       * zte,zx296718-wdt
+- reg : Specifies base physical address and size of the registers.
+- clocks : Pairs of phandle and specifier referencing the controller's clocks.
+- resets : Reference to the reset controller controlling the watchdog
+           controller.
+
+Optional properties:
+
+- timeout-sec : Contains the watchdog timeout in seconds.
+- zte,wdt-reset-sysctrl : Directs how to reset system by the watchdog.
+	if we don't want to restart system when watchdog been triggered,
+	it's not required, vice versa.
+	It should include following fields.
+	  * phandle of aon-sysctrl.
+	  * offset of register that be written, should be 0xb0.
+	  * configure value that be written to aon-sysctrl.
+	  * bit mask, corresponding bits will be affected.
+
+Example:
+
+wdt: watchdog@1465000 {
+	compatible = "zte,zx296718-wdt";
+	reg = <0x1465000 0x1000>;
+	clocks = <&topcrm WDT_WCLK>;
+	resets = <&toprst 35>;
+	zte,wdt-reset-sysctrl = <&aon_sysctrl 0xb0 1 0x115>;
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
