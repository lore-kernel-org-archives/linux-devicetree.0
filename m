From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH v3 2/2] DT: watchdog: add Alphascale asm9260 watchdog binding documentation.
Date: Tue, 24 Nov 2015 22:40:33 +0100
Message-ID: <1448401233-1064-3-git-send-email-linux@rempel-privat.de>
References: <5652BFA5.9010101@roeck-us.net>
 <1448401233-1064-1-git-send-email-linux@rempel-privat.de>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448401233-1064-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 .../bindings/watchdog/alphascale-asm9260.txt       | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt

diff --git a/Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt b/Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt
new file mode 100644
index 0000000..75b265a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt
@@ -0,0 +1,35 @@
+Alphascale asm9260 Watchdog timer
+
+Required properties:
+
+- compatible : should be "alphascale,asm9260-wdt".
+- reg : Specifies base physical address and size of the registers.
+- clocks : the clocks feeding the watchdog timer. See clock-bindings.txt
+- clock-names : should be set to
+	"mod" - source for tick counter.
+	"ahb" - ahb gate.
+- resets : phandle pointing to the system reset controller with
+	line index for the watchdog.
+- reset-names : should be set to "wdt_rst".
+
+Optional properties:
+- timeout-sec : shall contain the default watchdog timeout in seconds,
+	if unset, the default timeout is 30 seconds.
+- alphascale,mode : three modes are supported
+	"hw" - hw reset (default).
+	"sw" - sw reset.
+	"debug" - no action is taken.
+
+Example:
+
+watchdog0: watchdog@80048000 {
+	compatible = "alphascale,asm9260-wdt";
+	reg = <0x80048000 0x10>;
+	clocks = <&acc CLKID_SYS_WDT>, <&acc CLKID_AHB_WDT>;
+	clock-names = "mod", "ahb";
+	interrupts = <55>;
+	resets = <&rst WDT_RESET>;
+	reset-names = "wdt_rst";
+	timeout-sec = <30>;
+	alphascale,mode = "hw";
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
