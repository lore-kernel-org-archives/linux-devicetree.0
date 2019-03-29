From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 10/13] arm64: dts: msm8998: thermal: Make trip names consistent
Date: Fri, 29 Mar 2019 15:42:16 +0530
Message-ID: <ba15d6f24f555999fe14aa8bd370123f6a7ecd96.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1553853990.git.amit.kucheria@linaro.org>
References: <cover.1553853990.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Maintain naming consistency with what was landed for sdm845. Simplifies
parsing for test tools.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 +++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 26e476078cb6..998017d4d847 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -338,20 +338,20 @@
 	};
 
 	thermal-zones {
-		cpu-thermal0 {
+		cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
-				cpu_alert0: trip0 {
+				cpu0_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit0: trip1 {
+				cpu0_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -359,20 +359,20 @@
 			};
 		};
 
-		cpu-thermal1 {
+		cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
-				cpu_alert1: trip0 {
+				cpu1_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit1: trip1 {
+				cpu1_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -380,20 +380,20 @@
 			};
 		};
 
-		cpu-thermal2 {
+		cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
-				cpu_alert2: trip0 {
+				cpu2_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit2: trip1 {
+				cpu2_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -401,20 +401,20 @@
 			};
 		};
 
-		cpu-thermal3 {
+		cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
-				cpu_alert3: trip0 {
+				cpu3_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit3: trip1 {
+				cpu3_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -422,20 +422,20 @@
 			};
 		};
 
-		cpu-thermal4 {
+		cpu4-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				cpu_alert4: trip0 {
+				cpu4_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit4: trip1 {
+				cpu4_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -443,20 +443,20 @@
 			};
 		};
 
-		cpu-thermal5 {
+		cpu5-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				cpu_alert5: trip0 {
+				cpu5_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit5: trip1 {
+				cpu5_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -464,20 +464,20 @@
 			};
 		};
 
-		cpu-thermal6 {
+		cpu6-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				cpu_alert6: trip0 {
+				cpu6_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit6: trip1 {
+				cpu6_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -485,20 +485,20 @@
 			};
 		};
 
-		cpu-thermal7 {
+		cpu7-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				cpu_alert7: trip0 {
+				cpu7_alert0: trip-point@0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_crit7: trip1 {
+				cpu7_crit: cpu_crit {
 					temperature = <110000>;
 					hysteresis = <2000>;
 					type = "critical";
-- 
2.17.1
