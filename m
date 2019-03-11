From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH] arm64: dts: fsl: imx8mq: enable the thermal management unit (TMU)
Date: Mon, 11 Mar 2019 14:31:24 -0700
Message-ID: <20190311213124.29325-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>, abel.vesa@nxp.com, daniel.baluta@nxp.com, agx@sigxcpu.org, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

These are the TMU nodes from the NXP vendor kernel

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 9155bd4784eb..087620c6e17f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/power/imx8mq-power.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "imx8mq-pinfunc.h"
 
 / {
@@ -89,6 +90,7 @@
 			reg = <0x0>;
 			enable-method = "psci";
 			next-level-cache = <&A53_L2>;
+			#cooling-cells = <2>;
 		};
 
 		A53_1: cpu@1 {
@@ -210,6 +212,87 @@
 				#interrupt-cells = <2>;
 			};
 
+			tmu: tmu@30260000 {
+				compatible = "fsl,imx8mq-tmu";
+				reg = <0x30260000 0x10000>;
+				interrupt = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				little-endian;
+				fsl,tmu-range = <0xb0000 0xa0026 0x80048 0x70061>;
+				fsl,tmu-calibration = <0x00000000 0x00000023
+						       0x00000001 0x00000029
+						       0x00000002 0x0000002f
+						       0x00000003 0x00000035
+						       0x00000004 0x0000003d
+						       0x00000005 0x00000043
+						       0x00000006 0x0000004b
+						       0x00000007 0x00000051
+						       0x00000008 0x00000057
+						       0x00000009 0x0000005f
+						       0x0000000a 0x00000067
+						       0x0000000b 0x0000006f
+
+						       0x00010000 0x0000001b
+						       0x00010001 0x00000023
+						       0x00010002 0x0000002b
+						       0x00010003 0x00000033
+						       0x00010004 0x0000003b
+						       0x00010005 0x00000043
+						       0x00010006 0x0000004b
+						       0x00010007 0x00000055
+						       0x00010008 0x0000005d
+						       0x00010009 0x00000067
+						       0x0001000a 0x00000070
+
+						       0x00020000 0x00000017
+						       0x00020001 0x00000023
+						       0x00020002 0x0000002d
+						       0x00020003 0x00000037
+						       0x00020004 0x00000041
+						       0x00020005 0x0000004b
+						       0x00020006 0x00000057
+						       0x00020007 0x00000063
+						       0x00020008 0x0000006f
+
+						       0x00030000 0x00000015
+						       0x00030001 0x00000021
+						       0x00030002 0x0000002d
+						       0x00030003 0x00000039
+						       0x00030004 0x00000045
+						       0x00030005 0x00000053
+						       0x00030006 0x0000005f
+						       0x00030007 0x00000071>;
+				#thermal-sensor-cells =  <0>;
+			};
+
+			thermal-zones {
+				cpu-thermal {
+					polling-delay-passive = <250>;
+					polling-delay = <2000>;
+					thermal-sensors = <&tmu>;
+
+					trips {
+						cpu_alert0: trip0 {
+							temperature = <85000>;
+							hysteresis = <2000>;
+							type = "passive";
+						};
+
+						cpu_crit0: trip1 {
+							temperature = <95000>;
+							hysteresis = <2000>;
+							type = "critical";
+						};
+					};
+
+					cooling-maps {
+						map0 {
+							trip = <&cpu_alert0>;
+							cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						};
+					};
+				};
+			};
+
 			wdog1: watchdog@30280000 {
 				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
 				reg = <0x30280000 0x10000>;
-- 
2.17.1
