From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv3 22/23] arm64: dts: qcom: qcs404: Add thermal zones for each sensor
Date: Wed, 20 Mar 2019 18:48:02 +0530
Message-ID: <a9819b3b2e2736c1f97b7d1e00decfdd83e2eb07.1553086065.git.amit.kucheria@linaro.org>
References: <cover.1553086065.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553086065.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553086065.git.amit.kucheria@linaro.org>
References: <cover.1553086065.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Daniel Lezcano <daniel.lezcano@linaro.org>, David Brown <david.brown@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

qcs404 has 10 sensors connected to the single TSENS IP. Define a thermal
zone for each of those sensors to expose the temperature of each zone.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 252 +++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 7881792980b8..2423c816b98d 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -31,6 +32,7 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			#cooling-cells= <2>;
 		};
 
 		CPU1: cpu@101 {
@@ -39,6 +41,7 @@
 			reg = <0x101>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			#cooling-cells= <2>;
 		};
 
 		CPU2: cpu@102 {
@@ -47,6 +50,7 @@
 			reg = <0x102>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			#cooling-cells= <2>;
 		};
 
 		CPU3: cpu@103 {
@@ -55,6 +59,7 @@
 			reg = <0x103>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			#cooling-cells= <2>;
 		};
 
 		L2_0: l2-cache {
@@ -866,4 +871,251 @@
 			#interrupt-cells = <2>;
 		};
 	};
+
+	thermal-zones {
+		aoss-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				aoss_alert0: trip-point@0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		q6-hvx-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				q6_hvx_alert0: trip-point@0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		lpass-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				lpass_alert0: trip-point@0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		wlan-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				wlan_alert0: trip-point@0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cluster-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				cluster_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cluster_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cluster_crit: cluster_crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cluster_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				cpu0_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu0_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_crit: cpu_crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 6>;
+
+			trips {
+				cpu1_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu1_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu1_crit: cpu_crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				cpu2_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu2_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu2_crit: cpu_crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				cpu3_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+				cpu3_alert1: trip-point@1 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu3_crit: cpu_crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert1>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				gpu_alert0: trip-point@0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
-- 
2.17.1
