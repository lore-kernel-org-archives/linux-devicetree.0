From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V6 4/4] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Thu, 15 Aug 2019 20:38:45 -0400
Message-ID: <1565915925-21009-4-git-send-email-Anson.Huang@nxp.com>
References: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, jun.li@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Enable i.MX8MM cpu-idle using generic ARM cpu-idle driver, 2 states
are supported, details as below:

root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name
WFI
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/usage
3973
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name
cpu-pd-wait
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
6647

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V5:
	- improve state1 idle name to better match PSCI doc;
	- remove wakeup-latency-us property as it is NOT necessary when entry-latency-us/exit-latency-us
	  exist.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 94433c53..9b2dc12 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -44,6 +44,19 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			cpu_pd_wait: cpu-pd-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+			};
+		};
+
 		A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
@@ -56,6 +69,7 @@
 			nvmem-cells = <&cpu_speed_grade>;
 			nvmem-cell-names = "speed_grade";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_1: cpu@1 {
@@ -68,6 +82,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_2: cpu@2 {
@@ -80,6 +95,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_3: cpu@3 {
@@ -92,6 +108,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_L2: l2-cache0 {
-- 
2.7.4
