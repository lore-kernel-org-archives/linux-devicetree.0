From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] arm64: dts: zx: add zx296718's topcrm node
Date: Wed, 30 Nov 2016 17:50:18 +0800
Message-ID: <1480499418-13905-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable topcrm clock node for zx296718, which is used for
CPU's frequency change.

Furthermore, this patch adds the CPU clock phandle in CPU's node
and uses operating-points-v2 to register operating points.

So it can be used by cpufreq-dt driver.

Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/zte/zx296718.dtsi | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
index 6b239a3..992158a 100644
--- a/arch/arm64/boot/dts/zte/zx296718.dtsi
+++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
@@ -44,6 +44,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/zx296718-clock.h>
 
 / {
 	compatible = "zte,zx296718";
@@ -81,6 +82,8 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&topcrm A53_GATE>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -88,6 +91,7 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -95,6 +99,7 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +107,38 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp>;
+		};
+	};
+
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <857000>;
+			clock-latency-ns = <500000>;
+		};
+		opp@648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			opp-microvolt = <857000>;
+			clock-latency-ns = <500000>;
+		};
+		opp@800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <882000>;
+			clock-latency-ns = <500000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <892000>;
+			clock-latency-ns = <500000>;
+		};
+		opp@1188000000 {
+			opp-hz = /bits/ 64 <1188000000>;
+			opp-microvolt = <1009000>;
+			clock-latency-ns = <500000>;
 		};
 	};
 
@@ -279,6 +316,12 @@
 			dma-requests = <32>;
 		};
 
+		topcrm: clock-controller@1461000 {
+			compatible = "zte,zx296718-topcrm";
+			reg = <0x01461000 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		sysctrl: sysctrl@1463000 {
 			compatible = "zte,zx296718-sysctrl", "syscon";
 			reg = <0x1463000 0x1000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
