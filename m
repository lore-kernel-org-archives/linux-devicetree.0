From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V3 1/2] dt: watchdog: Add DT binding documentation for jz4740 watchdog timer
Date: Tue, 3 Feb 2015 10:25:47 +0000
Message-ID: <1422959148-38075-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422959148-38075-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422959148-38075-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding for jz4740 watchdog timer. It is a simple watchdog timer.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

---
The jz4740 is platform only at the moment.

But DT support is being added

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

V3: Added Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

V2 Changes

Removed clock binding because of pending work in clock tree. Will add
binding later. Rather than introduce a bad binding now and change later.

Renamed to jz4740 instead of jz47xx.
---
 .../devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt      | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
new file mode 100644
index 0000000..e27763e
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt
@@ -0,0 +1,12 @@
+Ingenic Watchdog Timer (WDT) Controller for JZ4740
+
+Required properties:
+compatible: "ingenic,jz4740-watchdog"
+reg: Register address and length for watchdog registers
+
+Example:
+
+watchdog: jz4740-watchdog@0x10002000 {
+	compatible = "ingenic,jz4740-watchdog";
+	reg = <0x10002000 0x100>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
