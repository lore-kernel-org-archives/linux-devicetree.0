From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v2] arm64: dts: zx: support cpu-freq for zx296718
Date: Fri,  2 Dec 2016 13:52:36 +0800
Message-ID: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, jun.nie@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

This patch adds the CPU clock phandle in CPU's node
and uses operating-points-v2 to register operating points.

So it can be used by cpufreq-dt driver.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 arch/arm64/boot/dts/zte/zx296718.dtsi | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
index 7a1aed7..b44d1d1 100644
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
@@ -88,6 +91,8 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			clocks = <&topcrm A53_GATE>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -95,6 +100,8 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			clocks = <&topcrm A53_GATE>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +109,38 @@
 			compatible = "arm,cortex-a53","arm,armv8";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			clocks = <&topcrm A53_GATE>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+	};
+
+	cluster0_opp: opp-table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp@648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp@800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			clock-latency-ns = <500000>;
+		};
+
+		opp@1188000000 {
+			opp-hz = /bits/ 64 <1188000000>;
+			clock-latency-ns = <500000>;
 		};
 	};
 
-- 
2.7.4
