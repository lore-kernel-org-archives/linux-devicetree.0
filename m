From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH v3 1/2] watchdog: digicolor: document device tree binding
Date: Tue, 31 Mar 2015 09:14:58 +0300
Message-ID: <9995b9d0be8cda30103be7406a781cd79f347aeb.1427782499.git.baruch@tkos.co.il>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device tree binding documentation to the watchdog hardware block on the
Conexant CX92755 SoC. The CX92755 is from the Digicolor SoCs series. Other SoCs
in that series may share the same hardware block.

Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
v3:
   No change
v2:
   No change
---
 .../devicetree/bindings/watchdog/digicolor-wdt.txt | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/digicolor-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/digicolor-wdt.txt b/Documentation/devicetree/bindings/watchdog/digicolor-wdt.txt
new file mode 100644
index 000000000000..a882967e17d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/digicolor-wdt.txt
@@ -0,0 +1,25 @@
+Conexant Digicolor SoCs Watchdog timer
+
+The watchdog functionality in Conexant Digicolor SoCs relies on the so called
+"Agent Communication" block. This block includes the eight programmable system
+timer counters. The first timer (called "Timer A") is the only one that can be
+used as watchdog.
+
+Required properties:
+
+- compatible : Should be "cnxt,cx92755-wdt"
+- reg : Specifies base physical address and size of the registers
+- clocks : phandle; specifies the clock that drives the timer
+
+Optional properties:
+
+- timeout-sec : Contains the watchdog timeout in seconds
+
+Example:
+
+	watchdog@f0000fc0 {
+		compatible = "cnxt,cx92755-wdt";
+		reg = <0xf0000fc0 0x8>;
+		clocks = <&main_clk>;
+		timeout-sec = <15>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
