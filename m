From: Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH] arm64: dts: Add more serial port nodes in APM X-Gene device tree
Date: Wed, 26 Mar 2014 17:49:06 +0530
Message-ID: <1395836346-9350-1-git-send-email-vkale@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

APM X-Gene Storm SoC supports 4 serial ports. This patch adds device nodes
for serial ports 1 to 3 (a device node for serial port 0 is already present
in the dts file).
This patch also sets the compatible property of serial nodes to "ns16550a".

Signed-off-by: Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-mustang.dts |  4 ++++
 arch/arm64/boot/dts/apm-storm.dtsi  | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apm-mustang.dts b/arch/arm64/boot/dts/apm-mustang.dts
index 1247ca1..6541962 100644
--- a/arch/arm64/boot/dts/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm-mustang.dts
@@ -24,3 +24,7 @@
 		reg = < 0x1 0x00000000 0x0 0x80000000 >; /* Updated by bootloader */
 	};
 };
+
+&serial0 {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index d37d736..2277b5c 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -179,13 +179,47 @@
 		};
 
 		serial0: serial@1c020000 {
+			status = "disabled";
 			device_type = "serial";
-			compatible = "ns16550";
+			compatible = "ns16550a";
 			reg = <0 0x1c020000 0x0 0x1000>;
 			reg-shift = <2>;
 			clock-frequency = <10000000>; /* Updated by bootloader */
 			interrupt-parent = <&gic>;
 			interrupts = <0x0 0x4c 0x4>;
 		};
+
+		serial1: serial@1c021000 {
+			status = "disabled";
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1c021000 0x0 0x1000>;
+			reg-shift = <2>;
+			clock-frequency = <10000000>; /* Updated by bootloader */
+			interrupt-parent = <&gic>;
+			interrupts = <0x0 0x4d 0x4>;
+		};
+
+		serial2: serial@1c022000 {
+			status = "disabled";
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1c022000 0x0 0x1000>;
+			reg-shift = <2>;
+			clock-frequency = <10000000>; /* Updated by bootloader */
+			interrupt-parent = <&gic>;
+			interrupts = <0x0 0x4e 0x4>;
+		};
+
+		serial3: serial@1c023000 {
+			status = "disabled";
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1c023000 0x0 0x1000>;
+			reg-shift = <2>;
+			clock-frequency = <10000000>; /* Updated by bootloader */
+			interrupt-parent = <&gic>;
+			interrupts = <0x0 0x4f 0x4>;
+		};
 	};
 };
-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
