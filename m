From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 11/12] arm64: dts: msm8916: thermal: Make trip names consistent
Date: Mon, 18 Feb 2019 18:05:25 +0530
Message-ID: <cdeed815f3bbb161e51befc5e3af92ee113f31b6.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Maintain naming consistency with what was landed for sdm845. Simplifies
parsing for test tools.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9e4a82e5e0b4..2002f5f91a83 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -180,19 +180,19 @@
 	};
 
 	thermal-zones {
-		cpu-thermal0 {
+		cpu0_1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 5>;
 
 			trips {
-				cpu_alert0: trip0 {
+				cpu0_1_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-				cpu_crit0: trip1 {
+				cpu0_1_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -201,7 +201,7 @@
 
 			cooling-maps {
 				map0 {
-					trip = <&cpu_alert0>;
+					trip = <&cpu0_1_alert0>;
 					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -210,19 +210,19 @@
 			};
 		};
 
-		cpu-thermal1 {
+		cpu2_3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 4>;
 
 			trips {
-				cpu_alert1: trip0 {
+				cpu2_3_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-				cpu_crit1: trip1 {
+				cpu2_3_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -231,7 +231,7 @@
 
 			cooling-maps {
 				map0 {
-					trip = <&cpu_alert1>;
+					trip = <&cpu2_3_alert0>;
 					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -247,12 +247,12 @@
 			thermal-sensors = <&tsens 2>;
 
 			trips {
-				gpu_alert: trip0 {
+				gpu_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-				gpu_crit: trip1 {
+				gpu_crit: gpu_crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -267,12 +267,12 @@
 			thermal-sensors = <&tsens 1>;
 
 			trips {
-				cam_alert: trip0 {
+				cam_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
-				cam_crit: trip1 {
+				cam_crit: cam_crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
-- 
2.17.1
