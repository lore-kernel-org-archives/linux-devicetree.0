From: Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: updated sata node on ls1012a dts
Date: Fri, 10 Mar 2017 16:12:13 +0800
Message-ID: <1489133533-39352-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On ls1012a soc, sata ecc should be disabled. So added sata ecc
register address so that driver can get this information.

Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 80 +++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index cffebb4..1870dde 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -43,6 +43,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "fsl,ls1012a";
@@ -126,6 +127,81 @@
 			#clock-cells = <2>;
 			clocks = <&sysclk>;
 		};
+		tmu: tmu@1f00000 {
+			compatible = "fsl,qoriq-tmu";
+			reg = <0x0 0x1f00000 0x0 0x10000>;
+			interrupts = <0 33 0x4>;
+			fsl,tmu-range = <0xb0000 0x9002a 0x6004c 0x30062>;
+			fsl,tmu-calibration = <0x00000000 0x00000026
+					       0x00000001 0x0000002d
+					       0x00000002 0x00000032
+					       0x00000003 0x00000039
+					       0x00000004 0x0000003f
+					       0x00000005 0x00000046
+					       0x00000006 0x0000004d
+					       0x00000007 0x00000054
+					       0x00000008 0x0000005a
+					       0x00000009 0x00000061
+					       0x0000000a 0x0000006a
+					       0x0000000b 0x00000071
+
+					       0x00010000 0x00000025
+					       0x00010001 0x0000002c
+					       0x00010002 0x00000035
+					       0x00010003 0x0000003d
+					       0x00010004 0x00000045
+					       0x00010005 0x0000004e
+					       0x00010006 0x00000057
+					       0x00010007 0x00000061
+					       0x00010008 0x0000006b
+					       0x00010009 0x00000076
+
+					       0x00020000 0x00000029
+					       0x00020001 0x00000033
+					       0x00020002 0x0000003d
+					       0x00020003 0x00000049
+					       0x00020004 0x00000056
+					       0x00020005 0x00000061
+					       0x00020006 0x0000006d
+
+					       0x00030000 0x00000021
+					       0x00030001 0x0000002a
+					       0x00030002 0x0000003c
+					       0x00030003 0x0000004e>;
+			big-endian;
+			#thermal-sensor-cells = <1>;
+		};
+
+		thermal-zones {
+			cpu_thermal: cpu-thermal {
+				polling-delay-passive = <1000>;
+				polling-delay = <5000>;
+
+				thermal-sensors = <&tmu 0>;
+
+				trips {
+					cpu_alert: cpu-alert {
+						temperature = <85000>;
+						hysteresis = <2000>;
+						type = "passive";
+					};
+					cpu_crit: cpu-crit {
+						temperature = <95000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+
+				cooling-maps {
+					map0 {
+						trip = <&cpu_alert>;
+						cooling-device =
+							<&cpu0 THERMAL_NO_LIMIT
+							THERMAL_NO_LIMIT>;
+					};
+				};
+			};
+		};
 
 		i2c0: i2c@2180000 {
 			compatible = "fsl,vf610-i2c";
@@ -238,7 +314,9 @@
 
 		sata: sata@3200000 {
 			compatible = "fsl,ls1012a-ahci", "fsl,ls1043a-ahci";
-			reg = <0x0 0x3200000 0x0 0x10000>;
+			reg = <0x0 0x3200000 0x0 0x10000>,
+				<0x0 0x20140520 0x0 0x4>;
+			reg-names = "ahci", "sata-ecc";
 			interrupts = <0 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 0>;
 			status = "disabled";
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
