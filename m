From: Eric Long <eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v5 1/2] dt-bindings: watchdog: Add Spreadtrum watchdog documentation
Date: Fri, 3 Nov 2017 19:18:27 +0800
Message-ID: <e2910f77b936a2ece8fe2e0e467ade8d443e3fea.1509707598.git.eric.long@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the documentation for Spreadtrum watchdog driver.

Signed-off-by: Eric Long <eric.long-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v4:
- No updates.

Changes since v3:
- No updates.

Changes since v2:
- Add acked tag from Rob.

Changes since v1:
- No updates.
---
 .../devicetree/bindings/watchdog/sprd-wdt.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sprd-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt b/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt
new file mode 100644
index 0000000..aeaf3e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sprd-wdt.txt
@@ -0,0 +1,19 @@
+Spreadtrum SoCs Watchdog timer
+
+Required properties:
+- compatible : Should be "sprd,sp9860-wdt".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : Exactly one interrupt specifier.
+- timeout-sec : Contain the default watchdog timeout in seconds.
+- clock-names : Contain the input clock names.
+- clocks : Phandles to input clocks.
+
+Example:
+	watchdog: watchdog@40310000 {
+		compatible = "sprd,sp9860-wdt";
+		reg = <0 0x40310000 0 0x1000>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		timeout-sec = <12>;
+		clock-names = "enable", "rtc_enable";
+		clocks = <&clk_aon_apb_gates1 8>, <&clk_aon_apb_rtc_gates 9>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
