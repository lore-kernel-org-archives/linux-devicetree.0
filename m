From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/3] MIPS: OCTEON: add DTS for D-Link DSR-500N
Date: Sat,  3 Sep 2016 00:11:35 +0300
Message-ID: <20160902211136.8610-3-aaro.koskinen@iki.fi>
References: <20160902211136.8610-1-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160902211136.8610-1-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DTS for D-Link DSR-500N.

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---
 .../mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts

diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
new file mode 100644
index 0000000..6cacabb
--- /dev/null
+++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
@@ -0,0 +1,42 @@
+/*
+ * Device tree source for D-Link DSR-500N.
+ *
+ * Written by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/include/ "dlink_dsr-500n-1000n.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "dlink,dsr-500n";
+	compatible = "dlink,dsr-500n", "cavium,octeon-3860";
+
+	soc@0 {
+		uart0: serial@1180000000800 {
+			clock-frequency = <300000000>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		usb {
+			label = "usb";
+			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		wps {
+			label = "wps";
+			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+		};
+
+		wireless {
+			label = "2.4g";
+			gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
