From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH V2 1/3] devicetree: add UniPhier WDT devicetree bindings documentation
Date: Tue,  6 Jun 2017 18:11:32 +0900
Message-ID: <1496740294-12653-2-git-send-email-hayashibara.keiji@socionext.com>
References: <1496740294-12653-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496740294-12653-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add uniphier-wdt bindings documentation.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 .../devicetree/bindings/watchdog/uniphier-wdt.txt    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
new file mode 100644
index 0000000..a59d1ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
@@ -0,0 +1,20 @@
+UniPhier watchdog timer controller
+
+This UniPhier watchdog timer controller must be under sysctrl compatible node.
+
+Required properties:
+- compatible: should be "socionext,uniphier-wdt"
+
+Example:
+
+	sysctrl@61840000 {
+		compatible = "socionext,uniphier-ld11-sysctrl",
+			     "simple-mfd", "syscon";
+		reg = <0x61840000 0x4000>;
+
+		sys_wdt: watchdog {
+			compatible = "socionext,uniphier-wdt";
+		}
+
+		other nodes ...
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
