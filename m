From: Anson.Huang@nxp.com
Subject: [PATCH V5 5/5] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Wed, 10 Jul 2019 14:30:56 +0800
Message-ID: <20190710063056.35689-5-Anson.Huang@nxp.com>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710063056.35689-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Enable i.MX8MM cpu-idle using generic ARM cpu-idle driver, 2 states
are supported, details as below:

root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/name
WFI
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state0/usage
3973
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/name
cpu-sleep-wait
root@imx8mmevk:~# cat /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
6647

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch, as this patch is based on other patches in this series, so I include it.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 8cf7f34..8f3ed39 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -44,6 +44,20 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_wait: cpu-sleep-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
 		A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
@@ -56,6 +70,7 @@
 			nvmem-cells = <&cpu_speed_grade>;
 			nvmem-cell-names = "speed_grade";
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_sleep_wait>;
 		};
 
 		A53_1: cpu@1 {
@@ -68,6 +83,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_sleep_wait>;
 		};
 
 		A53_2: cpu@2 {
@@ -80,6 +96,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_sleep_wait>;
 		};
 
 		A53_3: cpu@3 {
@@ -92,6 +109,7 @@
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_sleep_wait>;
 		};
 
 		A53_L2: l2-cache0 {
-- 
2.7.4
