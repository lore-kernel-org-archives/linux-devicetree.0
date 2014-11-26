From: Naidu Tellapati <naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 2/2] DT: watchdog: Add ImgTec PDC Watchdog Timer binding documentation
Date: Wed, 26 Nov 2014 14:56:34 +0530
Message-ID: <1416993994-8456-3-git-send-email-Naidu.Tellapati@gmail.com>
References: <1416993994-8456-1-git-send-email-Naidu.Tellapati@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416993994-8456-1-git-send-email-Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Naidu Tellapati <Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jude Abraham <Jude.Abraham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the devicetree binding document for ImgTec PDC Watchdog Timer.

Signed-off-by: Naidu Tellapati <Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jude Abraham <Jude.Abraham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
No changes from v5.
---
 .../devicetree/bindings/watchdog/imgpdc-wdt.txt    |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt b/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
new file mode 100644
index 0000000..2f9ba77
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
@@ -0,0 +1,18 @@
+*ImgTec PowerDown Controller (PDC) Watchdog Timer (WDT)
+
+Required properties:
+- compatible : Should be "img,pdc-wdt"
+- reg : Should contain WDT registers location and length
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Should contain "wdt" and "sys"
+- interrupts : Should contain WDT interrupt
+
+Examples:
+
+wdt@18102100 {
+	compatible = "img,pdc-wdt";
+	reg = <0x18102100 0x100>;
+	clocks = <&pdc_wdt_clk>, <&sys_clk>;
+	clock-names = "wdt", "sys";
+	interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
