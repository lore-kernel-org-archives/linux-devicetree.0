From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip points to cpufreq
Date: Thu, 10 Jan 2019 05:30:56 +0530
Message-ID: <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1547078153.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1547078153.git.amit.kucheria@linaro.org>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Since the big and little cpus are in the same frequency domain, use all
of them for mitigation in the cooling-map. At the lower trip points we
restrict ourselves to throttling only a few OPPs. At higher trip
temperatures, allow ourselves to be throttled to any extent.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 145 +++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 29e823b0caf4..cd6402a9aa64 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -99,6 +100,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
 			L2_0: l2-cache {
 				compatible = "cache";
@@ -114,6 +116,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_100>;
 			L2_100: l2-cache {
 				compatible = "cache";
@@ -126,6 +129,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_200>;
 			L2_200: l2-cache {
 				compatible = "cache";
@@ -138,6 +142,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_300>;
 			L2_300: l2-cache {
 				compatible = "cache";
@@ -150,6 +155,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_400>;
 			L2_400: l2-cache {
 				compatible = "cache";
@@ -162,6 +168,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_500>;
 			L2_500: l2-cache {
 				compatible = "cache";
@@ -174,6 +181,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_600>;
 			L2_600: l2-cache {
 				compatible = "cache";
@@ -186,6 +194,7 @@
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 			next-level-cache = <&L2_700>;
 			L2_700: l2-cache {
 				compatible = "cache";
@@ -1703,6 +1712,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
+							 <&CPU1 THERMAL_NO_LIMIT 4>,
+							 <&CPU2 THERMAL_NO_LIMIT 4>,
+							 <&CPU3 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -1724,6 +1750,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
+							 <&CPU1 THERMAL_NO_LIMIT 4>,
+							 <&CPU2 THERMAL_NO_LIMIT 4>,
+							 <&CPU3 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -1745,6 +1788,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert2>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
+							 <&CPU1 THERMAL_NO_LIMIT 4>,
+							 <&CPU2 THERMAL_NO_LIMIT 4>,
+							 <&CPU3 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit2>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -1766,6 +1826,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert3>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
+							 <&CPU1 THERMAL_NO_LIMIT 4>,
+							 <&CPU2 THERMAL_NO_LIMIT 4>,
+							 <&CPU3 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit3>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu4-thermal {
@@ -1787,6 +1864,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert4>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT 4>,
+							 <&CPU5 THERMAL_NO_LIMIT 4>,
+							 <&CPU6 THERMAL_NO_LIMIT 4>,
+							 <&CPU7 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit4>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu5-thermal {
@@ -1808,6 +1902,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert5>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT 4>,
+							 <&CPU5 THERMAL_NO_LIMIT 4>,
+							 <&CPU6 THERMAL_NO_LIMIT 4>,
+							 <&CPU7 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit5>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu6-thermal {
@@ -1829,6 +1940,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert6>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT 4>,
+							 <&CPU5 THERMAL_NO_LIMIT 4>,
+							 <&CPU6 THERMAL_NO_LIMIT 4>,
+							 <&CPU7 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit6>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu7-thermal {
@@ -1850,6 +1978,23 @@
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert7>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT 4>,
+							 <&CPU5 THERMAL_NO_LIMIT 4>,
+							 <&CPU6 THERMAL_NO_LIMIT 4>,
+							 <&CPU7 THERMAL_NO_LIMIT 4>;
+				};
+				map1 {
+					trip = <&cpu_crit7>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.17.1
