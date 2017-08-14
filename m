From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 01/10] arm64: dts: hi3660: enable idle states
Date: Mon, 14 Aug 2017 17:50:40 +0800
Message-ID: <20170814095049.27701-2-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Wang <jean.wangtao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

There are two clusters on the Hi3660, the first one is Cortex-A53 based
and the other one is Cortex-A73 based. These two clusters have different
idle states.

Thanks to Daniel Lezcano's recent changes, the generic ARM cpuidle
driver can now support several clusters with different idle states, thus
supporting the big.Little architecture.

In addition to the WFI idle state which is the default shallowest state
for all ARM cpus, the Hi3660 supports the following states:

 - CA53 CPUs:
        - CPU_SLEEP:       CPU power off state
        - CLUSTER_SLEEP_0: Cluster power off state

 - CA73 CPUs:
        - CPU_NAP:         CPU retention state
        - CPU_SLEEP:       CPU power off state
        - CLUSTER_SLEEP_1: Cluster power off state

This patch adds the idle states description for the Hi3660 to the device
tree.

Cc: Kevin Wang <jean.wangtao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index c6a1961..8921310 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -58,6 +58,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +66,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +74,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
 		cpu3: cpu@3 {
@@ -79,6 +82,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
 		cpu4: cpu@100 {
@@ -86,6 +90,11 @@
 			device_type = "cpu";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <
+					&CPU_NAP
+					&CPU_SLEEP
+					&CLUSTER_SLEEP_1
+			>;
 		};
 
 		cpu5: cpu@101 {
@@ -93,6 +102,11 @@
 			device_type = "cpu";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <
+					&CPU_NAP
+					&CPU_SLEEP
+					&CLUSTER_SLEEP_1
+			>;
 		};
 
 		cpu6: cpu@102 {
@@ -100,6 +114,11 @@
 			device_type = "cpu";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			cpu-idle-states = <
+					&CPU_NAP
+					&CPU_SLEEP
+					&CLUSTER_SLEEP_1
+			>;
 		};
 
 		cpu7: cpu@103 {
@@ -107,6 +126,50 @@
 			device_type = "cpu";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			cpu-idle-states = <
+					&CPU_NAP
+					&CPU_SLEEP
+					&CLUSTER_SLEEP_1
+			>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_NAP: cpu-nap {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0000001>;
+				entry-latency-us = <7>;
+				exit-latency-us = <2>;
+				min-residency-us = <15>;
+			};
+
+			CPU_SLEEP: cpu-sleep {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <40>;
+				exit-latency-us = <70>;
+				min-residency-us = <3000>;
+			};
+
+			CLUSTER_SLEEP_0: cluster-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x1010000>;
+				entry-latency-us = <500>;
+				exit-latency-us = <5000>;
+				min-residency-us = <20000>;
+			};
+
+			CLUSTER_SLEEP_1: cluster-sleep-1 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x1010000>;
+				entry-latency-us = <1000>;
+				exit-latency-us = <5000>;
+				min-residency-us = <20000>;
+			};
 		};
 	};
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
